FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV SERVER_PORT=8000
ENV SERVER_HOST=0.0.0.0

EXPOSE 8000

# If using Flask or FastAPI, override CMD below
CMD ["python", "runserver.py"]
