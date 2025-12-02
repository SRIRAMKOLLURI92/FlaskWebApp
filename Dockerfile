# Use slim Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy and install dependencies first (cache-friendly)
COPY requirements.txt .
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY . .

# Set environment variables
ENV SERVER_PORT=8000
ENV SERVER_HOST=0.0.0.0

# Expose port
EXPOSE 8000

# Default command
# For FastAPI: uvicorn main:app --host 0.0.0.0 --port 8000
# For Flask: flask run --host=0.0.0.0 --port=8000
CMD ["python", "runserver.py"]
