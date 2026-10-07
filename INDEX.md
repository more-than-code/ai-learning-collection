---
title: "AI Learning Collection"
description: "Catalogue of Joe's AI learning material: Google Cloud Build with Gemini (ADK agent development, Gemini Enterprise deployment, the governance workshop) and IBM generative/agentic AI study notes, with lab code, evalsets, lab files and redacted screenshots."
track: "Catalogue"
tags: ["catalogue", "gemini", "adk", "gemini-enterprise", "rag", "ai-governance"]
date: 2026-10-08
status: "reference"
type: docs
cascade:
  type: docs
---

# AI Learning Collection

Joe's AI learning material only: notes on concepts, how-tos and gotchas, plus the lab code, configs, evalsets, lab input files and course-guide content that go with them. Screenshots are kept only when they show actual learning content (console configuration, Cloud Shell commands, agent output), and identifiers in them are redacted.

## Catalogue

| Folder | Files | Size | What it is |
|---|---:|---:|---|
| [gemini-agent-development-cps-path-4741](gemini-agent-development-cps-path-4741/) | 12 | 194 KB | Agent Development CPS path: Antigravity, ADK deploy to Agent Runtime, ADK evaluation. Includes the lab 3 starter agent + evalsets and the improved agent/eval config |
| [gemini-enterprise-deployment-cps-path-4739](gemini-enterprise-deployment-cps-path-4739/) | 12 | 935 KB | Gemini Enterprise deployment path: Workspace data stores + Model Armor, Agent Identity access, adding ADK/Agent Designer agents. Includes lab 1 input files and 9 config/agent screenshots |
| [gemini-workshop-track2-platform-builder](gemini-workshop-track2-platform-builder/) | 5 | 2.2 MB | Build with Gemini workshop Track 2 (NovaSmart AI governance missions). Includes the saved course guide, mission step definitions and 2 agent-session screenshots |
| [ibm-yourlearning-genai-agentic-consultant-experienced](ibm-yourlearning-genai-agentic-consultant-experienced/) | 1 | 9 KB | IBM generative/agentic AI plan study notes: RAG (architecture, advanced/agentic/graph, evaluation), the executive genAI adoption view, custom reliability metrics, the AI Fluency 4D framework |

## Items by track

### Agent Development (path 4741)
| Item | Type |
|---|---|
| `NOTES.md` | Lab notes, IAM/API gotchas |
| `lab2-deploy-adk-genai129/screenshots/01-lab2-adk-forever-paint-conversation.png` | Agent output (redacted) |
| `lab3-evaluate-adk-genai155/starter-bigquery_agent/` (8 files) | Starter ADK agent, callbacks, requirements, evalset, eval config, scenarios, session input |
| `lab3-evaluate-adk-genai155/improved/agent_new.py`, `eval_config.json` | Improved agent + eval config |

### Gemini Enterprise Deployment (path 4739)
| Item | Type |
|---|---|
| `NOTES.md` | Task-by-task config notes and gotchas |
| `lab1-…/lab-files/` (xlsx, docx) | Lab input files for the Drive data store |
| `lab1-…/screenshots/` (1), `lab2-…/screenshots/` (2), `lab3-…/screenshots/` (6) | Console/Cloud Shell/agent screenshots (redacted) |

### Workshop Track 2 (NovaSmart)
| Item | Type |
|---|---|
| `NOTES.md` | Mission map, how checks work, gotchas |
| `novasmart-guide-capture/novasmart-control-center.html` | Saved course guide (generic, no learner data) |
| `novasmart-guide-capture/mission-steps.txt` | Mission step definitions (prompts, checks) as text |
| `screenshots/` (2) | Remote agent session output |

### IBM Generative & Agentic AI
| Item | Type |
|---|---|
| `NOTES.md` | Concept notes with source links |

## Site and AI access
- Each `NOTES.md` is a section page; the other files in its folder are published next to it.
- `/llms.txt` indexes every note with links to its raw Markdown; `/llms-full.txt` holds all notes in one file; every page has a raw `index.md` with front matter (title, description, track, tags, date, status, source path).
- [TREE.txt](/ai-learning-collection/TREE.txt) lists every file; [layout.png](/ai-learning-collection/layout.png) is a one-page diagram of the layout.

## Not included
Out of scope for an AI-learning collection, or private: other people's material, non-AI guides, program chat/logistics, badge and certificate evidence, enrolment/provisioning/ToS/progress/score-only screenshots, progress-only learning-platform pages, and lab secrets (`.env`).
