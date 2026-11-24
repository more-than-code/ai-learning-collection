---
title: "LLM and agent evaluation tools: promptfoo and the 2026 landscape"
description: "promptfoo (YAML eval suites, model-graded assertions, automated red teaming; acquired by OpenAI in March 2026) and the wider set of eval tools: code-first frameworks, tracing and eval platforms, and cloud-native evals, with the trends and a learning path."
track: "Evaluation and quality"
tags: ["evaluation", "promptfoo", "red-teaming", "deepeval", "ragas", "langsmith", "langfuse", "arize-phoenix", "braintrust", "llm-as-judge"]
date: 2026-11-12
status: "completed"
weight: 1
---

# LLM and agent evaluation tools

Briefed 2026-11-12, from web research done that day. For what I've already used hands-on, see [ADK evaluation (path 4741, Lab 3)](../gemini-agent-development-cps-path-4741/NOTES.md), [Track 2 M5 scorecards](../gemini-workshop-track2-platform-builder/NOTES.md) and [RAGAS / LangSmith / Galileo](../ibm-yourlearning-genai-agentic-consultant-experienced/NOTES.md).

## promptfoo

**What it is:** an open-source command-line tool and library for testing and red-teaming LLM apps and agents. You describe the tests in one YAML file (`promptfooconfig.yaml`): the prompts, the providers (models) and the test cases with assertions. Then `npx promptfoo eval` runs them and shows a side-by-side matrix of models and prompts.

```yaml
prompts: ["Answer as a support agent: {{question}}"]
providers: [openai:<model-id>, anthropic:<model-id>]   # any providers to compare
tests:
  - vars: { question: "Can I get a refund after 40 days?" }
    assert:
      - type: contains            # deterministic check
        value: "30 days"
      - type: llm-rubric          # LLM-as-judge
        value: "Politely declines and cites the policy"
```

**It has two halves:**

1. **Evals**
   - Deterministic assertions: contains, regex, JSON schema, cost and latency limits.
   - Model-graded checks: `llm-rubric`, factuality, similarity.
   - RAG metrics.
   - It runs in CI, so a change to a prompt or model can be blocked when the tests fail.
2. **Red teaming (`promptfoo redteam`)**
   - It generates attacks automatically: prompt injection, jailbreaks, PII and data leaks, unauthorised tool use, agent hijacking.
   - The reports map findings to OWASP LLM Top 10 and NIST-style categories.

**2026 news:**
- On **2026-03-09**, OpenAI announced it would acquire promptfoo, to build security testing and red teaming into its Frontier agent platform.
- At that point promptfoo was in 127 Fortune 500 companies, with over 300,000 developers.
- The team committed to keeping the open-source eval and red-team suite and to keep supporting other model providers.

**Why it matters to me:**
- It covers the eval and guardrail content of the **OpenAI API Deployment Practitioner** badge ([OpenAI badges plan](../openai-badges-plan.md)).
- It answers the "evaluation gate in CI" question in the [Nov 19 Azure event prep](../events/2026-11-19-azure-genai-prototype-to-production.md).

## The landscape in late 2026

| Group | Tools | Notes |
|---|---|---|
| **Code-first test frameworks** (run in CI, no platform needed) | promptfoo, DeepEval (Confident AI), RAGAS | DeepEval is pytest-style, with agent metrics such as tool correctness and task completion. RAGAS is the standard for RAG metrics. |
| **Tracing, evaluation and observability platforms** (the most used in production) | LangSmith, Langfuse, Arize Phoenix / AX, Braintrust, W&B Weave, Comet Opik, MLflow (GenAI evals) | Langfuse, Phoenix, Opik and MLflow have open-source cores. Phoenix is built on OpenTelemetry. Braintrust leads on eval-driven development (traces → datasets → experiments → CI). |
| **Cloud-native** (on each vendor's own platform) | Google ADK eval / Vertex Gen AI Evaluation, Azure AI Foundry evaluations, OpenAI Evals, IBM watsonx.governance | I've used the Google one hands-on (path 4741, Lab 3). |

## Trends

- **Agent-level evals.** Tools now judge a whole run, not a single answer: tool-call correctness, the trajectory and each step (like `valid_transitions` in ADK), and multi-turn scenarios.
- **Red teaming is merging with evals.** The promptfoo acquisition is the clearest sign.
- **OpenTelemetry is becoming the standard trace format.** Production traces feed straight into offline eval datasets (the same OTel tracing I used in Track 2).
- **The vendors are consolidating.** Several eval and observability companies changed hands in 2025–26. Prefer tools with open-source cores so you aren't locked in.

## Learning path

1. **promptfoo:** quick to learn, covers red teaming, fits the OpenAI badge.
2. **DeepEval or RAGAS:** agent and RAG metrics.
3. **Langfuse or Phoenix:** tracing linked to evals; builds on the Track 2 observability work.

## Refresh questions

1. What are the two halves of promptfoo, and which command runs each?
2. What's the difference between a `contains` assertion and an `llm-rubric` assertion? When would you use each?
3. Name three attack types that `promptfoo redteam` generates.
4. Who acquired promptfoo, when, and why?
5. Name one tool from each group (code-first, platform, cloud-native). Which have open-source cores?
6. What does an agent-level eval check that a single-answer eval misses?
7. Why does OpenTelemetry matter for evaluation?

## Sources

- [promptfoo: joining OpenAI](https://promptfoo.dev/blog/promptfoo-joining-openai)
- [SecurityWeek: OpenAI to acquire Promptfoo](https://www.securityweek.com/openai-to-acquire-ai-security-startup-promptfoo/amp/)
- [Futurum: OpenAI acquires Promptfoo](https://futurumgroup.com/insights/openai-acquires-promptfoo-gaining-25-foothold-in-fortune-500-enterprises/)
- [Arize: 7 best AI agent evaluation platforms 2026](https://arize.com/resources/llm-and-agent-evaluation-platforms/)
- [Atlan: 13 best AI agent evaluation platforms 2026](https://atlan.com/know/ai-agent/ai-agent-evals/best-ai-agent-evaluation-platforms/)
- [FutureAGI: agent evaluation frameworks 2026](https://futureagi.com/blog/agent-evaluation-frameworks-2026)
- [LangWatch: top AI evaluation tools 2026](https://langwatch.ai/blog/top-5-ai-evaluation-tools-for-ai-agents-products-in-production-(2026))
