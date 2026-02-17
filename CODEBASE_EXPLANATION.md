# Agentic Medico - Codebase Documentation ⚕️

## 📝 Overview
**Agentic Medico** is a sophisticated, multi-agentic AI system designed to assist with medical diagnosis, research, and patient interaction. It uses a combination of Large Language Models (LLMs), Computer Vision (CV) models, and Retrieval-Augmented Generation (RAG) to provide comprehensive medical assistance.

---

## 🤖 AI Models and System Components

### 1. Large Language Models (LLMs)
The system is designed to be model-agnostic but is currently configured for:
- **Conversation & Reasoning:** `gpt-3.5-turbo` (default for chat/RAG/search) - Selected for speed and cost-efficiency.
- **Medical Vision Classification:** `gpt-4o-mini` - Used to classify uploaded images into medical categories (Chest X-ray, Skin Lesion, Brain MRI, etc.).
- **Alternative:** Supports Azure OpenAI integration if environment variables are provided.

### 2. Specialized Computer Vision Agents
Agentic Medico uses dedicated local PyTorch models for specific medical tasks:
- **Chest X-ray Agent:** Detects COVID-19 and other abnormalities from X-ray images.
- **Skin Lesion Agent:** Performs semantic segmentation and classification of skin anomalies.
- **Brain Tumor Agent:** (In development/integration) For MRI analysis and tumor detection.

---

## ⚙️ How It Works (System Architecture)

### 1. Agent Orchestration (LangGraph)
The core of the system is a **State Graph** managed by LangGraph. This allows for complex, multi-step reasoning and dynamic routing:
- **Triage/Router Agent:** Analyzes user input and determines which specialized agent should handle the request.
- **Condition-Based Handoff:** If one agent (like RAG) has low confidence, it can hand off the task to another (like Web Search).

### 2. Retrieval-Augmented Generation (RAG)
For deep medical knowledge, the system uses an advanced RAG pipeline:
- **Docling Parser:** Extracts structured content (text, tables, images) from medical PDFs.
- **Semantic Chunking:** Breaks down documents based on medical context rather than just character counts.
- **Hybrid Search:** Combines keyword (BM25) and semantic (Vector) search for better accuracy.

### 3. Workflow Flow
1. **User Input:** Text or Image uploaded via the FastAPI web interface.
2. **Decision Engine:** Evaluates the input.
   - *If Text only:* Routes to Conversation, RAG, or Web Search agent.
   - *If Image:* Routes to the Medical Image Classifier.
3. **Task Execution:** The selected agent processes the input.
4. **Human-in-the-Loop:** For critical diagnoses (like CV analysis), the system requests verification from a human professional.
5. **Final Output:** Delivered via the UI, optionally with voice response.

---

## 📂 Data Storage and Management

### 1. Vector Database (Qdrant)
- **Role:** Stores embeddings of medical literature for the RAG agent.
- **Format:** Supports both local storage and cloud-based Qdrant instances.
- **Hybrid Search:** Enables both dense (vector) and sparse (keyword) retrieval.

### 2. Local Filesystem
- **`uploads/`:** Stores user-uploaded images and generated results (like segmentation plots).
- **`data/raw/`:** Contains original medical PDFs for ingestion.
- **`agents/.../models/`:** Stores local PyTorch model weights (`.pth` and `.pth.tar` files).

---

## 🛠️ Technology Stack
- **Backend:** FastAPI (Python)
- **Agent Framework:** LangGraph, LangChain
- **Vector DB:** Qdrant
- **Document Analysis:** Docling
- **Image Processing:** OpenCV, PyTorch, TorchVision
- **Speech Services:** ElevenLabs API (TTS)
- **Frontend:** HTML5, Bootstrap 5, JavaScript (Vanilla)

---

## 🚀 Key Scripts
- `app.py`: The main entry point for the FastAPI server.
- `ingest_rag_data.py`: Script to process PDFs and populate the Vector DB.
- `config.py`: Centralized configuration for models, API keys, and paths.
- `run_app.sh`: Helper script to start the application in the local environment.

---

**Note:** Agentic Medico is an AI-assisted tool meant for research and educational purposes. It should be used as a support system and not as a replacement for professional medical consultation.
