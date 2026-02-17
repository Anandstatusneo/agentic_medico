#!/bin/bash
echo "Starting data ingestion..."
./venv/bin/python ingest_rag_data.py --dir ./data/raw

if [ $? -eq 0 ]; then
    echo "Ingestion complete. Starting application..."
    ./venv/bin/python app.py
else
    echo "Ingestion failed. Please check logs."
    exit 1
fi
