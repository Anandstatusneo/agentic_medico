# Configuration Update - Vision Model Fix

## Issue Fixed
Image uploads were failing with HTTP 400 errors because `gpt-3.5-turbo` doesn't support vision/image analysis.

## Changes Made

### 1. Added Vision Model Function
Created a new `get_vision_model()` function in `config.py` that uses:
- **gpt-4o-mini** for standard OpenAI (cheaper than gpt-4o, supports vision)
- **gpt-4o** for Azure OpenAI (if configured)

### 2. Updated MedicalCVConfig
Changed the medical image analysis configuration to use the vision model instead of the regular LLM.

## Model Configuration Summary

| Feature | Model Used | Cost |
|---------|-----------|------|
| Chat/Conversation | gpt-3.5-turbo | Lowest |
| Web Search | gpt-3.5-turbo | Lowest |
| RAG Agent | gpt-3.5-turbo | Lowest |
| **Image Analysis** | **gpt-4o-mini** | **Medium** |

## Why gpt-4o-mini?

- ✅ Supports vision (can analyze images)
- ✅ Much cheaper than gpt-4o
- ✅ Good performance for medical image classification
- ✅ Lower rate limits than gpt-3.5-turbo but acceptable

## Cost Comparison (per 1M tokens)

| Model | Input | Output |
|-------|-------|--------|
| gpt-3.5-turbo | $0.50 | $1.50 |
| gpt-4o-mini | $0.15 | $0.60 |
| gpt-4o | $2.50 | $10.00 |

**Note:** Image analysis uses gpt-4o-mini which is actually cheaper than gpt-3.5-turbo!

## Next Steps

**Restart the application** to apply these changes:

```bash
# Stop the current app (Ctrl+C in the terminal)
# Then restart:
./run_app.sh
```

After restarting, image uploads should work correctly!
