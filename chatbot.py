from openai import OpenAI
import requests
import json
from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
import fitz  

client = OpenAI(
    api_key="AIzaSyBb1jtVltsncFYIWmA-wFeaAJZQnMD2bFQ",
    base_url="https://generativelanguage.googleapis.com/v1beta/openai/"
)

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

def read_pdf_prompt(pdf_path):
    doc = fitz.open(pdf_path)
    full_text = ""
    for page in doc:
        full_text += page.get_text()
    return full_text

def chat_with_gemini(messages):
    try:
        product_response = requests.get("http://localhost:8080/api/try-on/images")
        product_response.raise_for_status()

        content_json = product_response.json()
        for item in content_json:
            item.pop("image", None)
        content = json.dumps(content_json, indent=4)
    except requests.exceptions.RequestException as e:
        content = f"Không tìm thấy sản phẩm: {str(e)}"

    pdf_path = "D:\\code\\KLTN\\DownyShoes\\Prompt-web-e-chatbot.txt"
    prompt_template = read_pdf_prompt(pdf_path)

    formatted_prompt = prompt_template.replace("{content}", content)

    messages[0]['content'] = formatted_prompt

    # Gọi API Gemini
    try:
        response = client.chat.completions.create(
            model="gemini-2.0-flash",
            messages=messages,
            max_tokens=2048,
            temperature=0.2
        )
        response_content = response.choices[0].message.content
    except Exception as e:
        response_content = f"Lỗi khi gọi API Gemini: {str(e)}"

    return response_content

@app.post("/")
async def call_api(request: Request):
    try:
        body = await request.json()
        message = body['messages']
        response = chat_with_gemini(message)
        return {"response": response}
    except Exception as e:
        return {"error": str(e)}, 500