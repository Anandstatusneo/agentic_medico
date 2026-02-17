# 🚀 Agentic Medico - Full Setup Guide

Follow these steps to set up and run **Agentic Medico** on your local machine.

## 📋 Prerequisites

Before you begin, ensure you have the following installed:
- **Python 3.11+**
- **FFmpeg** (Required for voice/speech features)
- **Git**

---

## 1️⃣ Clone the Repository

```bash
git clone https://github.com/Anandstatusneo/agentic_medico.git
cd agentic_medico
```

## 2️⃣ Set Up Virtual Environment

It is highly recommended to use a virtual environment to avoid dependency conflicts.

### For Mac/Linux:
```bash
python -m venv venv
source venv/bin/activate
```

### For Windows:
```bash
python -m venv venv
venv\Scripts\activate
```

## 3️⃣ Install Dependencies

Install all required Python packages and the specific audio library for Python 3.13 support:

```bash
pip install -r requirements.txt
pip install audioop-lts  # Required for Python 3.13+
```

## 4️⃣ Configure Environment Variables

Create a `.env` file in the root directory and add your API keys. Use the template below:

```bash
# OpenAI Configuration
openai_api_key=your_openai_api_key_here
model_name=gpt-3.5-turbo  # Recommended for cost/rate limits

# Speech API (ElevenLabs)
ELEVEN_LABS_API_KEY=your_elevenlabs_key_here

# Web Search API (Tavily)
TAVILY_API_KEY=your_tavily_key_here

# HuggingFace (For RAG Reranking)
HUGGINGFACE_TOKEN=your_huggingface_token_here

# Qdrant (Optional for cloud, default is local)
QDRANT_URL=
QDRANT_API_KEY=
```

## 5️⃣ Ingest Medical Data (Optional - For RAG)

If you want the chatbot to use the provided medical documents for knowledge retrieval, run the ingestion script:

```bash
# This will process PDFs in data/raw/ and store them in the vector database
./ingest_data.sh
```

## 6️⃣ Run the Application

Now you can start the Agentic Medico server:

```bash
# Using the helper script
chmod +x run_app.sh
./run_app.sh

# OR running directly with python
python app.py
```

Open your browser and navigate to: **http://localhost:8000**

---

## 🛠️ Troubleshooting

### FFmpeg Installation
- **Mac:** `brew install ffmpeg`
- **Linux:** `sudo apt-get install ffmpeg`
- **Windows:** `winget install ffmpeg`

### Port 8000 Busy
If you see an error that the port is already in use:
```bash
lsof -i :8000  # Find the Process ID (PID)
kill -9 <PID>  # Replace <PID> with the number from the first command
```

### Rate Limit Errors (429)
If you hit OpenAI rate limits, wait a few minutes or add credits to your OpenAI account at [platform.openai.com](https://platform.openai.com).

---
**Author:** Anand Yadav
**Project:** Agentic Medico ⚕️
