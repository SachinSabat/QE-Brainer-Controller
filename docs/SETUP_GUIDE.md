
---

## 🧩 2️⃣ `docs/SETUP_GUIDE.md`

```markdown
# 🧰 QE Brain Controller — Developer Setup Guide

This guide helps you set up the environment, dependencies, and scripts for the **Phase-0 PoC (Logon Journey)**.

---

## 🧩 Additional Files to Include

### ✅ demo.sh
Runs the end-to-end PoC locally.

```bash
#!/bin/bash
echo "🚀 Starting QE Brain Controller PoC..."
docker-compose -f infra/docker-compose.yml up -d
sleep 10
curl -s -X POST http://localhost:5000/runs -d '{"release_notes":"Logon PoC"}' -H 'Content-Type: application/json'
echo "🧠 Generating tests..."
python orchestrator/main.py --generate-tests
echo "🧬 Seeding data..."
python agents/tdg/seed_data.py
echo "🧪 Running Playwright tests..."
npx playwright test
echo "📁 Uploading artifacts..."
cp -r results infra/artifacts/
docker-compose down
echo "✅ QE Brain Controller PoC Completed."
