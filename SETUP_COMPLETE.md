# Agentic Medico - Setup Complete! 🎉

## ✅ Successfully Installed

Your Agentic Medico is now set up and ready to use!

## 🚀 Quick Start

### Start the Application
```bash
./run_app.sh
```

The application will be available at: **http://localhost:8000**

### Stop the Application
Press `Ctrl+C` in the terminal where the app is running

## ⚠️ Important: OpenAI API Rate Limits

You're currently experiencing **rate limit errors** with your OpenAI API key. 

### Current Configuration
- **Model:** gpt-3.5-turbo (changed from gpt-4o for better rate limits)
- **API Key:** Your OpenAI key (showing rate limit errors)

### Solutions

#### Option 1: Wait and Retry
If you've hit the rate limit, wait 5-10 minutes and try again.

#### Option 2: Check Your OpenAI Account
1. Visit: https://platform.openai.com/usage
2. Check your:
   - Available credits
   - Rate limit tier
   - Usage quota
3. Add credits if needed

#### Option 3: Use a Different API Key
If you have another OpenAI account:
1. Edit `.env` file
2. Replace the `openai_api_key` value
3. Restart the application

#### Option 4: Upgrade Your OpenAI Plan
- Free tier: Very limited requests
- Tier 1: $5+ in credits = higher limits
- Tier 2+: Even higher limits

## 📋 Available Features

### ✅ Working Features
- **General Conversation** - Medical Q&A
- **Web Search** - Latest medical research (uses Tavily API)
- **Image Analysis:**
  - Chest X-ray COVID-19 detection
  - Skin lesion segmentation
- **Speech-to-Text & Text-to-Speech** (ElevenLabs)
- **Human-in-the-Loop Validation**

### ❌ Not Available Yet
- **RAG Agent** - Document-based Q&A
  - Requires data ingestion
  - Run `./ingest_data.sh` when you have stable internet

## 📁 Project Structure

```
agentic_medico/
├── app.py                 # Main FastAPI application
├── config.py              # Configuration (models, API keys)
├── .env                   # API keys and secrets
├── run_app.sh            # Start application script
├── ingest_data.sh        # Data ingestion script
├── agents/               # AI agents
│   ├── agent_decision.py
│   ├── rag_agent/
│   ├── web_search_processor_agent/
│   └── image_analysis_agent/
├── data/                 # Medical documents
│   └── raw/             # PDF files to ingest
├── sample_images/       # Test medical images
└── templates/           # Web UI templates
```

## 🔧 Configuration Files

### .env File
Contains all API keys:
- OpenAI API key
- ElevenLabs API key
- Tavily API key
- HuggingFace token
- Qdrant credentials

### config.py
Configures:
- LLM models and temperatures
- Embedding models
- Vector database settings
- Agent behaviors

## 📊 Testing the Application

### Test with Sample Images
Upload images from `sample_images/` folder:
- Chest X-rays for COVID detection
- Skin lesion images for segmentation

### Test Conversation
Ask medical questions like:
- "What are the symptoms of COVID-19?"
- "How does diabetes affect the body?"
- "What is hypertension?"

## 🐛 Troubleshooting

### Rate Limit Errors (429)
**Problem:** "Too Many Requests" errors  
**Solution:** 
- Wait 5-10 minutes
- Check OpenAI usage dashboard
- Add credits to your account
- Use gpt-3.5-turbo instead of gpt-4o (already configured)

### Port Already in Use
**Problem:** Port 8000 is busy  
**Solution:**
```bash
# Find process using port 8000
lsof -i :8000

# Kill the process
kill -9 <PID>
```

### Models Not Loading
**Problem:** Computer vision models not found  
**Solution:** Models download automatically on first run. Wait for downloads to complete.

### Data Ingestion Fails
**Problem:** HuggingFace download timeouts  
**Solution:** 
- Check internet connection
- Run `./ingest_data.sh` during off-peak hours
- Downloads will resume automatically

## 📝 Next Steps

1. **Fix Rate Limits:** Add credits to OpenAI account
2. **Test Features:** Try image analysis and conversations
3. **Ingest Data:** Run `./ingest_data.sh` for RAG features
4. **Customize:** Modify `config.py` for your needs

## 🆘 Need Help?

- **OpenAI API:** https://platform.openai.com/docs
- **Project Issues:** https://github.com/Anandstatusneo/agentic_medico/issues
- **Documentation:** See `README.md` and `agents/README.md`

---

**Note:** This is a medical AI assistant for educational and research purposes. Always consult qualified healthcare professionals for medical advice.
