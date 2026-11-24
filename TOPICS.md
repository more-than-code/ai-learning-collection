---
title: "Learning topics map"
description: "Every learning topic in this collection, grouped into 8 categories, with its status (learned, in progress, planned, briefed only) and where the notes, labs, plans or quizzes for it are."
track: "Catalogue"
tags: ["catalogue", "topics", "agents", "rag", "evaluation", "governance", "llmops", "consulting"]
date: 2026-11-18
status: "reference"
weight: 2
---

# Learning topics map

Status key: ✅ learned (notes, a lab or a quiz exist) · 🟡 in progress · ⏳ planned · 💬 briefed in a chat only, no note yet.
"Quiz" means there's a quiz record in [quizzes/](quizzes/README.md). Plans are listed at the end.

## 1. Agent development and frameworks

| Topic | Status | Where |
|---|---|---|
| Google ADK: building agents, callbacks, deploying to Agent Runtime | ✅ | [path 4741](gemini-agent-development-cps-path-4741/NOTES.md), Lab 2 |
| Antigravity CLI and agents (`agy`) | ✅ | [path 4741](gemini-agent-development-cps-path-4741/NOTES.md), Lab 1 · [Track 2](gemini-workshop-track2-platform-builder/NOTES.md) |
| Agent Designer and custom agents in Gemini Enterprise | ✅ | [path 4739](gemini-enterprise-deployment-cps-path-4739/NOTES.md), Lab 3 |
| Agentic AI engineering, agents and MCP (Ed Donner course) | ✅ | [FDP Data & AI](ibm-fdp-data-ai/NOTES.md), progress log 2026-11-06 |
| LangGraph agents | ⏳ | [FDP Data & AI](ibm-fdp-data-ai/NOTES.md) §1 |
| Model Context Protocol (MCP) | ⏳ | [FDP Data & AI](ibm-fdp-data-ai/NOTES.md) §2 |
| Multiple frameworks: Ollama, LangChain, CrewAI, Hugging Face | ⏳ | [FDP Data & AI](ibm-fdp-data-ai/NOTES.md) §3 |
| No-code and low-code agents: n8n, Langflow, workflow and agent hybrids | ✅ quiz (Langflow and hybrids are weak points) | [Quiz 2026-11-09](quizzes/2026-11-09-ai-agents-llm-automation.md) |
| Prompting and reasoning: chain of thought, self-reflection, analogical prompting | ✅ quiz | [Quiz 2026-11-09](quizzes/2026-11-09-ai-agents-llm-automation.md) |
| Agent skills, code execution, persistent memories, multi-agent systems on Google | ⏳ | [Google Agentic Architect plan](google-agentic-architect-plan.md), modules B and C |

## 2. RAG and data for agents

| Topic | Status | Where |
|---|---|---|
| RAG architecture, chunking, indexing | ✅ | [IBM GenAI notes](ibm-yourlearning-genai-agentic-consultant-experienced/NOTES.md) §1 |
| Advanced RAG: hybrid search, re-ranking, agentic RAG, graph RAG | ✅ | [IBM GenAI notes](ibm-yourlearning-genai-agentic-consultant-experienced/NOTES.md) §1 |
| Vector retrieval (top-k, ANN) and context-window chunking | ✅ quiz | [Quiz 2026-11-09](quizzes/2026-11-09-ai-agents-llm-automation.md), Q17–18 |
| Workspace and Drive data stores for Gemini Enterprise | ✅ | [path 4739](gemini-enterprise-deployment-cps-path-4739/NOTES.md), Lab 1 |
| Grounding on Azure: AI Search, pgvector | ⏳ (Nov 19 event) | [Azure event prep](events/2026-11-19-azure-genai-prototype-to-production.md) |

## 3. Evaluation and quality

| Topic | Status | Where |
|---|---|---|
| ADK evaluation: evalsets, `adk eval`, `valid_transitions` | ✅ | [path 4741](gemini-agent-development-cps-path-4741/NOTES.md), Lab 3 |
| Scenario-set scorecards ("Evaluate and Decide") | ✅ | [Track 2](gemini-workshop-track2-platform-builder/NOTES.md), M5 |
| RAG evaluation: RAGAS, LangSmith | ✅ | [IBM GenAI notes](ibm-yourlearning-genai-agentic-consultant-experienced/NOTES.md) §1 |
| Custom reliability metrics (Galileo) | ✅ | [IBM GenAI notes](ibm-yourlearning-genai-agentic-consultant-experienced/NOTES.md) §3 |
| BLEU and ROUGE for prompt scoring | ✅ quiz | [Quiz 2026-11-09](quizzes/2026-11-09-ai-agents-llm-automation.md), Q14 |
| promptfoo (evals and red teaming), and other eval tools: DeepEval, Langfuse, Phoenix, Braintrust | ✅ | [Eval tools note](llm-agent-eval-tools/NOTES.md) |
| Evaluating agents on Gemini, hill climbing | ⏳ | [Google Agentic Architect plan](google-agentic-architect-plan.md), module D |

## 4. Security, governance and responsible AI

| Topic | Status | Where |
|---|---|---|
| Model Armor: screening input and output | ✅ | [path 4739](gemini-enterprise-deployment-cps-path-4739/NOTES.md), Lab 1 · [Track 2](gemini-workshop-track2-platform-builder/NOTES.md) |
| Agent Identity and least-privilege access | ✅ | [path 4739](gemini-enterprise-deployment-cps-path-4739/NOTES.md), Lab 2 · [Track 2](gemini-workshop-track2-platform-builder/NOTES.md) |
| Tracing and observability (OpenTelemetry spans across agents) | ✅ | [Track 2](gemini-workshop-track2-platform-builder/NOTES.md) |
| Agent security: encrypting memory at rest, rotating API keys | ✅ quiz (both are weak points) | [Quiz 2026-11-09](quizzes/2026-11-09-ai-agents-llm-automation.md), Q16 and Q20 |
| Agent Gateway and Registry | ⏳ | [Google Agentic Architect plan](google-agentic-architect-plan.md), module D |
| Prompt Shields and Foundry safety evaluations on Azure | ⏳ (Nov 19 event) | [Azure event prep](events/2026-11-19-azure-genai-prototype-to-production.md) |

## 5. Deployment and operations (LLMOps / AgentOps)

| Topic | Status | Where |
|---|---|---|
| Deploying Gemini Enterprise, adding agents to it | ✅ | [path 4739](gemini-enterprise-deployment-cps-path-4739/NOTES.md) |
| Packaging agents: private PyPI, prompt templates as package data, Docker Compose | ✅ quiz | [Quiz 2026-11-09](quizzes/2026-11-09-ai-agents-llm-automation.md), Q5, Q9, Q15 |
| Agent observability with Prometheus, CI triggers (GitHub Actions) | ✅ quiz (GitHub Actions triggers are a weak point) | [Quiz 2026-11-09](quizzes/2026-11-09-ai-agents-llm-automation.md) |
| AgentOps, enterprise databases, deploying on Gemini | ⏳ | [Google Agentic Architect plan](google-agentic-architect-plan.md), module C |
| API deployment: architecture, guardrails, observability (OpenAI) | ⏳ | [OpenAI badges plan](openai-badges-plan.md), badge 6 |
| Prototype to production on Azure: AI gateway, token limits | ⏳ (Nov 19 event) | [Azure event prep](events/2026-11-19-azure-genai-prototype-to-production.md) |

## 6. Engineering foundations (not AI-specific)

| Topic | Status | Where |
|---|---|---|
| GitHub App vs OAuth App, the state parameter, verifying the installer, per-job tokens | ✅ (quiz due 2026-11-19) | [GitHub App note](github-app-vs-oauth-app/NOTES.md) |
| Workflow and API plumbing: retrying transient HTTP errors, pagination, JSON Schema (AJV), parsing nested JSON | ✅ quiz | [Quiz 2026-11-09](quizzes/2026-11-09-ai-agents-llm-automation.md), Q2–4 and Q11 |

## 7. Business, strategy and consulting

| Topic | Status | Where |
|---|---|---|
| Generative AI adoption, the executive view | ✅ | [IBM GenAI notes](ibm-yourlearning-genai-agentic-consultant-experienced/NOTES.md) §2 |
| AI Fluency: the 4D framework | ✅ | [IBM GenAI notes](ibm-yourlearning-genai-agentic-consultant-experienced/NOTES.md) §4 |
| Comparing platforms with a weighted decision matrix | ✅ quiz | [Quiz 2026-11-09](quizzes/2026-11-09-ai-agents-llm-automation.md), Q22 |
| Consultative solutioning, qualifying ChatGPT and Codex opportunities | ⏳ | [OpenAI badges plan](openai-badges-plan.md), badges 3–5 |
| Architectural thinking, architecture decisions, project profiles | 🟡 | [Core badges plan](core-badges-plan.md), item 3 (Architect L1) |
| Human-centred design capstone (FDU HCD AIIS) | ⏳ | [FDE badge plan](fde-badge-plan.md), stage 3 |

## 8. Credential tracks (the plans that drive the topics above)

| Track | Status | Plan |
|---|---|---|
| Gemini Enterprise Agent Development and Deployment | ✅ certified 2026-10-05 (expires 2027-04-05) | [path 4741](gemini-agent-development-cps-path-4741/NOTES.md), [path 4739](gemini-enterprise-deployment-cps-path-4739/NOTES.md) |
| IBM GenAI Consultant/BA and Core Foundation badges | ✅ issued 2026-11-09 | [Core badges plan](core-badges-plan.md) |
| IBM FDP – Data & AI (Data Scientist ladder, capstone) | 🟡 | [FDE badge plan](fde-badge-plan.md), [FDP notes](ibm-fdp-data-ai/NOTES.md) |
| OpenAI Partner Network badges | ⏳ | [OpenAI badges plan](openai-badges-plan.md) |
| Google Professional Agentic Architect | ⏳ (exam by 2027-02-26) | [Google Agentic Architect plan](google-agentic-architect-plan.md) |
| IBM Architect Profession Certification L1 | 🟡 | [Core badges plan](core-badges-plan.md) |
| Community events | 🟡 | [Events tracker](events/README.md) |

## Gaps to close

- **Notes are empty:** the FDP course sections (LangGraph, MCP, multiple frameworks) are headings only so far.
- **Weak points from quizzes:** Langflow, AES-256 encryption at rest, key rotation, workflow and agent hybrid architecture, GitHub Actions triggers.
