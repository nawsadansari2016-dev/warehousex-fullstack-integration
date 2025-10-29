# FullStackIntegrationProject

This is a sample full-stack integration project prepared for a Coursera peer-graded assignment.
It contains a simple Express backend, a minimal frontend, Dockerfiles, docker-compose, and a reflective summary about using Microsoft Copilot.

## Structure
- backend/: Node.js + Express example server and SQL queries
- frontend/: Minimal React-like frontend (vanilla JS to keep it simple)
- docker-compose.yml: to run both services together
- reflective_summary.txt: Copilot usage summary
- README.md: this file

## How to run locally (without Docker)
1. Backend:
   - cd backend
   - npm install
   - npm start
2. Frontend:
   - cd frontend
   - npm install
   - npm start

## With Docker (requires Docker & docker-compose)
- From project root:
  - docker-compose up --build

