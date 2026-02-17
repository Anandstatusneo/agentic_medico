#!/bin/bash
echo "Starting Agentic Medico..."
echo "Note: RAG features require data ingestion first"
echo "Run './venv/bin/python ingest_rag_data.py --dir ./data/raw' separately to enable RAG"
echo ""
echo "Starting application on http://localhost:8000"
./venv/bin/python app.py
