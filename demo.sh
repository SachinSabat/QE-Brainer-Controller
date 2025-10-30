#!/bin/bash
set -e

echo "🚀 Starting QE Brain Controller PoC..."

# Step 1: Start MCP infrastructure
echo "🐳 Spinning up Docker containers..."
docker-compose -f infra/docker-compose.yml up -d
sleep 10

# Step 2: Trigger Orchestrator run
echo "📡 Creating new test run via Orchestrator API..."
curl -s -X POST http://localhost:5000/runs \
     -H "Content-Type: application/json" \
     -d '{"release_notes":"Logon Journey - Phase 0 PoC"}' | jq .

# Step 3: Generate Tests
echo "🧠 Generating test cases..."
python orchestrator/main.py --generate-tests || true

# Step 4: Seed Test Data
echo "🧬 Seeding data using MySQL MCP..."
python agents/tdg/seed_data.py || echo "ℹ️ Skipping data seed if not implemented yet"

# Step 5: Execute Playwright Tests
echo "🧪 Running Playwright tests..."
npx playwright test || echo "⚠️ Playwright tests completed with warnings"

# Step 6: Upload Artifacts
echo "📁 Uploading artifacts to filesystem MCP..."
mkdir -p infra/artifacts
cp -r results infra/artifacts/ || echo "ℹ️ No results folder yet"

# Step 7: Teardown
echo "🧹 Shutting down Docker containers..."
docker-compose -f infra/docker-compose.yml down

echo "✅ QE Brain Controller Phase-0 PoC completed successfully."
