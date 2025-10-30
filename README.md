# 🧠 QE Brain Controller — AI-powered Test Lifecycle Automation

### Transforming Jira stories into ready-to-run test cases with an AI-powered QE Brain.

---

## 🚀 Overview

**QE Brain Controller** is an Agentic AI-driven Quality Engineering framework that automates the entire test lifecycle:
- From **Jira story analysis** → **AI-driven test generation** → **synthetic data preparation** → **execution & triage**.
- Integrates **Playwright**, **Karate**, and **WebdriverIO** for cross-platform testing.
- Uses **MCP servers** for DB seeding, filesystem storage, and data export/import.

---

## 🧩 Core Concept

| Step | Description |
|------|--------------|
| 🧠 QE Brain Controller | Orchestrates all agents (Planner, Generator, Data, Review). |
| 📋 Test Planner Agent | Analyzes Jira stories & defines testing blueprints. |
| ⚙️ Test Case Generator | Creates Gherkin → Playwright/Karate tests via LLM or templates. |
| 🧬 Test Data Generator | Seeds synthetic data using MySQL MCP. |
| 👩‍💻 Human-in-Loop Review | QE validates AI-generated test cases before approval. |
| 🔗 Integration Layer | Pushes final tests into Jira Xray & CI repos. |

---

1️⃣ Clone & Open
bash
git clone https://github.com/SachinSabat/QE-Brainer-Controller.git
cd QE-Brainer-Controller
code .

2️⃣ Install Prerequisites

Python 3.10+

Node.js 18+

Docker & Docker Compose

VS Code Extensions: Python, Docker, YAML, GitLens

3️⃣ Start Infrastructurecd infra
cd infra
docker-compose up -d

4️⃣ Run the Demo
bash demo.sh



