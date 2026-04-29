#!/bin/bash

  API_KEY="sk-23a7a1ed770d4dd98f8374a10e9ecbf1" 
  API_URL="https://api.deepseek.com/v1/chat/completions"

  echo "=========================================="
  echo "  AI Agent Demo - DeepSeek"
  echo "=========================================="

  INPUT_TEXT="${1:-"请用中文简要介绍你自己，不超过30字。"}"

  response=$(curl -s -X POST "$API_URL" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $API_KEY" \
    -d "{
      \"model\": \"deepseek-chat\",
      \"max_tokens\": 200,
      \"messages\": [{\"role\": \"user\", \"content\": \"$INPUT_TEXT\"}]
    }")

  # 提取 content 字段（纯 grep/sed，无需 Python）
  echo ""
  echo "$response" | grep -o '"content":"[^"]*"' | head -1 | sed 's/"content":"//;s/"//'
  echo ""
  echo "=========================================="
  echo "  Agent 执行完毕"
  echo "=========================================="
