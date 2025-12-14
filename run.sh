#!/bin/bash

BASE="agent-specs"

echo "📁 Creating categorized role folders..."

# -----------------------------
# 1. Engineering / Development
# -----------------------------
ENG_ROLES=(
  "fullstack"
  "mobile"
  "ios"
  "android"
  "client"
  "architecture"
  "platform"
  "system"
  "sdk"
)

mkdir -p $BASE/engineering

for role in "${ENG_ROLES[@]}"; do
  mkdir -p "$BASE/engineering/$role"
  touch "$BASE/engineering/$role/AGENTS.md"
done


# -----------------------------
# 2. QA / Testing
# -----------------------------
QA_ROLES=(
  "automation-qa"
  "performance-test"
  "security-test"
  "test-architect"
)

mkdir -p $BASE/qa

for role in "${QA_ROLES[@]}"; do
  mkdir -p "$BASE/qa/$role"
  touch "$BASE/qa/$role/AGENTS.md"
done


# -----------------------------
# 3. Product & PM
# -----------------------------
PRODUCT_ROLES=(
  "product-manager"
  "product-owner"
  "project-manager"
  "scrum-master"
)

mkdir -p $BASE/product

for role in "${PRODUCT_ROLES[@]}"; do
  mkdir -p "$BASE/product/$role"
  touch "$BASE/product/$role/AGENTS.md"
done


# -----------------------------
# 4. Design & UX
# -----------------------------
DESIGN_ROLES=(
  "ui-designer"
  "ux-designer"
  "interaction-designer"
  "design-system-engineer"
)

mkdir -p $BASE/design

for role in "${DESIGN_ROLES[@]}"; do
  mkdir -p "$BASE/design/$role"
  touch "$BASE/design/$role/AGENTS.md"
done


# -----------------------------
# 5. AI & LLM Era Roles
# -----------------------------
AI_ROLES=(
  "llm-engineer"
  "prompt-engineer"
  "agent-orchestrator"
  "ai-evaluator"
  "model-training-engineer"
)

mkdir -p $BASE/ai-advanced

for role in "${AI_ROLES[@]}"; do
  mkdir -p "$BASE/ai-advanced/$role"
  touch "$BASE/ai-advanced/$role/AGENTS.md"
done


# -----------------------------
# 6. Data Roles
# -----------------------------
DATA_ROLES=(
  "data-analyst"
  "data-scientist"
  "data-engineer"
  "data-platform-engineer"
  "mlops-engineer"
)

mkdir -p $BASE/data

for role in "${DATA_ROLES[@]}"; do
  mkdir -p "$BASE/data/$role"
  touch "$BASE/data/$role/AGENTS.md"
done


# -----------------------------
# 7. Infra / DevOps / Security
# -----------------------------
INFRA_ROLES=(
  "sre"
  "cloud-engineer"
  "network-engineer"
  "database-admin"
  "release-engineer"
  "ops-engineer"
)

mkdir -p $BASE/infra

for role in "${INFRA_ROLES[@]}"; do
  mkdir -p "$BASE/infra/$role"
  touch "$BASE/infra/$role/AGENTS.md"
done


# -----------------------------
# 8. Leadership Roles
# -----------------------------
LEADERSHIP_ROLES=(
  "tech-lead"
  "engineering-manager"
  "cto"
)

mkdir -p $BASE/leadership

for role in "${LEADERSHIP_ROLES[@]}"; do
  mkdir -p "$BASE/leadership/$role"
  touch "$BASE/leadership/$role/AGENTS.md"
done

echo "🎉 All role folders created successfully!"

