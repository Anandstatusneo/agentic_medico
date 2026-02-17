#!/bin/bash
# Set environment variable to use offline mode for HuggingFace
export HF_HUB_OFFLINE=0
export HF_HUB_DOWNLOAD_TIMEOUT=300

echo "Starting data ingestion with extended timeout..."
echo "This will download required models (one-time only)"
echo "Models being downloaded:"
echo "  - Document layout analysis models (~500MB)"
echo "  - OCR models"
echo "  - Reranker model"
echo ""
echo "This may take 10-30 minutes depending on your internet connection."
echo "The process will retry automatically if downloads timeout."
echo ""

./venv/bin/python ingest_rag_data.py --dir ./data/raw
