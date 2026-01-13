#Demarrer le serveur:

```Python
from flask import Flask, jsonify
import uuid
from faker import Faker

app = Flask(__name__)
fake = Faker()

# Function to generate a mock user
def generate_mock_user():
    return {
        "id": str(uuid.uuid4()),
        "createdAt": fake.date_time(),
        "avatar": fake.image_url(),
        "username": fake.user_name(),
        "knownIps": [fake.ipv4() for _ in range(2)],
        "lastLoginAttempt": fake.date_time(),
        "lastLoginIp": fake.ipv4(),
        "department": fake.job(),
        "profile": {
            "firstName": fake.first_name(),
            "lastName": fake.last_name(),
            "email": fake.email()
        },
        "staticData": [fake.random_int(min=100, max=500) for _ in range(3)]
    }

# New route to retrieve a list of 20 users
@app.route('/users', methods=['GET'])
def get_users():
    users = [generate_mock_user() for _ in range(20)]  # Generate a list of 20 users
    return jsonify({"results": users})

if __name__ == '__main__':
    app.run(debug=True)

```

```Bash
python3 server.py
```

#Demarer le REST Api

```Bash
cd lib/services
dart run server.dart
```


#Demarer le Rag Api

```Python
from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from rag_core import answer
import requests
import psycopg2
from pgvector.psycopg2 import register_vector
from openai import OpenAI
import os
from dotenv import load_dotenv

load_dotenv()

app = FastAPI()

# Allow CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

# OpenAI client
openai = OpenAI(os.getenv("OPENAI_API_KEY"))
EMBED_MODEL = "text-embedding-3-small"

def embed_text(text: str):
    resp = openai.embeddings.create(model=EMBED_MODEL, input=text)
    return resp.data[0].embedding

def get_conn():
    conn = psycopg2.connect(
        host=os.getenv("PG_HOST"),
        port=os.getenv("PG_PORT"),
        dbname=os.getenv("PG_DB"),
        user=os.getenv("PG_USER"),
        password=os.getenv("PG_PASSWORD"),
    )
    register_vector(conn)
    return conn

def store_user(user: dict):
    text_repr = (
        f"Name: {user['profile']['firstName']} {user['profile']['lastName']}, "
        f"Username: {user['username']}, "
        f"Email: {user['profile']['email']}, "
        f"Department: {user['department']}, "
        f"Avatar: {user['avatar']}, "
        f"Known IPs: {', '.join(user['knownIps'])}, "
        f"Last Login: {user['lastLoginAttempt']} from {user['lastLoginIp']}, "
        f"Static Data: {user['staticData']}"
    )
    embedding = embed_text(text_repr)
    conn = get_conn()
    cur = conn.cursor()
    cur.execute(
        """
        INSERT INTO users (
            first_name, last_name, username, email, department, avatar, known_ips,
            last_login_attempt, last_login_ip, static_data, embedding
        ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """,
        (
            user['profile']['firstName'],
            user['profile']['lastName'],
            user['username'],
            user['profile']['email'],
            user['department'],
            user['avatar'],
            user['knownIps'],
            user['lastLoginAttempt'],
            user['lastLoginIp'],
            user['staticData'],
            embedding
        )
    )
    conn.commit()
    cur.close()
    conn.close()

def fetch_and_store_users():
    resp = requests.get("http://localhost:8080/users")
    users = resp.json()
    for user in users:
        store_user(user)

@app.on_event("startup")
def on_startup():
    # Automatically fetch and store users on app startup
    fetch_and_store_users()

@app.post("/rag-chat")
async def rag_chat(request: Request):
    body = await request.json()
    question = body.get("question", "")
    resp_text, _ = answer(question)
    return {"answer": resp_text}

```

```Bash
python3 api.py
```



