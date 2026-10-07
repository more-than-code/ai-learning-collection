---
title: "IBM Generative & Agentic AI Consultant — study notes"
description: "Concept notes from the IBM Your Learning plan (Generative & Agentic AI, Consultant/Business Analyst, Experienced): RAG architecture, advanced/agentic/graph RAG and evaluation; generative AI adoption for executives; custom GenAI reliability metrics; the AI Fluency 4D framework."
track: "IBM Your Learning — Generative & Agentic AI"
tags: ["rag", "vector-search", "agentic-rag", "graph-rag", "rag-evaluation", "ragas", "genai-strategy", "ai-fluency", "ibm"]
date: 2026-09-30
status: "in-progress"
weight: 4
---

# IBM Generative & Agentic AI — Consultant/Business Analyst (Experienced)

Study notes written from the readings in the plan's *Job Role Specific Learning* section. The notes are original summaries with links to the sources; the source pages aren't copied here. The IBM Your Learning screenshots were left out because they only show pages being marked complete.

## Plan structure (learning content only)
- **Common enablement for all roles:** IBM Consulting Generative AI Experienced Common Core Learning
- **Job role readings and courses:**
  - The CEO's guide to generative AI (IBM Institute for Business Value)
  - AI Fluency: Framework & Foundations (Anthropic Academy)
  - Introduction to Retrieval Augmented Generation (Weaviate)
  - Closing the Confidence Gap: How Custom Metrics Turn GenAI Reliability Into a Competitive Edge (Galileo)
  - Solve Challenging Problems using Advanced Prompt Engineering
  - Define an AI Transformation Opportunity for Your Client
  - Identify a target E2E workflow for an AI Transformation and write a value hypothesis statement
  - Identify relevant personas and create an AI & Data Governance persona map
- **Technology track:** watsonx, LLMs and IBM strategic-partner AI options

---

## 1. Retrieval-Augmented Generation (RAG)
Source: Weaviate, *Introduction to LLM RAG* — https://weaviate.io/blog/introduction-to-rag

**Why RAG exists**
- A generative LLM only has *parametric* knowledge (whatever it learned in training). It has a cutoff date, can't see private or proprietary data, and tends to guess (hallucinate) when it doesn't know.
- RAG adds *non-parametric* knowledge: at inference time it retrieves relevant external data and puts it in the prompt. Answers become more factual and can cite sources, and the model weights never change.

**Three components**
1. **External knowledge source:** internal DBs, documents, legal/medical/scientific text, web pages, personal data (email, chat, files). Usually embedded and stored in a vector database. In agentic systems this acts as the agent's long-term memory.
2. **Prompt template:** a standard prompt (instructions + query + context slot) that the retrieved context is inserted into. It's the bridge between the data and the model.
3. **Generative model:** combines the augmented prompt with its own knowledge to write the answer.

**Two stages**
- **Ingestion (offline):** clean and chunk the data, then *vectorise* it into embeddings with an embedding model and store them in a vector DB so they can be retrieved quickly.
- **Inference (online):**
  - **Retrieve:** embed the query into the same vector space and run similarity search (nearest by distance).
  - **Augment:** insert the top results into the template.
  - **Generate:** the LLM writes the answer.
- Gotcha: in production, retrieval quality depends heavily on the **chunking strategy** and on how content is indexed for search and filtering.

**Use cases:** real-time information (e.g. web-search-backed chat, where retrieval isn't from a vector DB at all), recommendation systems, and personal assistants over your own data (Copilot, Notion AI).

**Frameworks:** LangChain (+ LangGraph for agentic RAG, LangSmith for evaluation), LlamaIndex (+ LlamaHub loaders/tools), DSPy (optimises LLM + retrieval-model pipelines).

**Beyond naive RAG**
- **Advanced RAG:**
  - *Pre-retrieval:* metadata filtering and chunking.
  - *Retrieval:* **hybrid search** (vector similarity + keyword/BM25).
  - *Post-retrieval:* **re-ranking** with a ranker model.
  - *Generation:* a domain fine-tuned generator.
- **Agentic RAG:** agents that rewrite the query, re-retrieve when results are weak, validate context, use tools, and handle multi-step questions (compare across documents, follow-ups).
- **Graph RAG:** an LLM builds a knowledge graph of entities and relationships that becomes another retrieval source. This makes "summarise or compare across the whole corpus" questions possible, which plain chunk retrieval can't answer (see Microsoft GraphRAG).

**Evaluating RAG**
- *Component level:*
  - Retriever: **accuracy** (precisely on-query) and **relevance** (fits the query's context and need).
  - Generator: **faithfulness** (consistent with the retrieved sources) and **correctness** (matches ground truth).
- *End to end:* **answer semantic similarity** between the generated answer and a ground-truth answer.
- **RAGAS:** a popular framework with retrieval-relevance, generation-quality and faithfulness metrics that doesn't need human labels.

**RAG vs fine-tuning:** fine-tuning suits teaching a style, tone or narrow task. RAG is usually the cheapest first move for accuracy, freshness and reducing hallucination because there's no retraining.

Further reading: the original RAG paper (Lewis et al., 2020) https://arxiv.org/abs/2005.11401 · RAG evaluation survey https://arxiv.org/abs/2405.07437 · https://weaviate.io/blog/advanced-rag · https://weaviate.io/blog/rag-evaluation · https://docs.ragas.io/

## 2. Generative AI adoption — the executive view
Source: IBM Institute for Business Value, *The CEO's guide to generative AI* (overview page; 2023 surveys of 200 US CEOs and 369 executives across several countries)

- **Tension:** leaders feel pressure to move fast (about two-thirds of the CEOs surveyed reported investor/lender pressure to accelerate adoption, and genAI investment was expected to grow roughly 4× in 2–3 years). But wrong bets bring privacy, legal and ethical exposure.
- **Start from strategy:** be clear on what the enterprise wants to achieve, tie genAI to that strategy, define what has to change, then look function by function for work to streamline or augment.
- **Risk:** familiar risks (privacy, accuracy, explainability, bias) plus new ones. They need proper oversight to identify, quantify and manage. A majority of organisations had no consistent enterprise-wide genAI approach yet.
- **Operating model:** success depends on experimentation and iteration. Restructure for cross-functional understanding of genAI and a streamlined deployment path, so benefits land across the organisation.
- **Value vs cost vs risk:** weigh the value genAI creates against the investment it needs and the risks it brings.
- The guide continues as chapters by function: talent & skills, customer service, app modernisation, customer/employee experience, platforms/data/governance, tech spend, cybersecurity, responsible AI & ethics, supply chain, open innovation, sustainability, marketing, finance, product engineering, process automation, procurement, IT automation, model optimisation, risk management, physical asset management, enterprise operating model, cost of compute.

## 3. Custom metrics for GenAI reliability
Source: Galileo, *Closing the Confidence Gap* — https://galileo.ai/blog/closing-the-confidence-gap-how-custom-metrics-turn-genai-reliability-into-a-competitive-edge

- Thesis (from the activity summary): generic benchmarks don't tell you whether *your* GenAI app is reliable. Custom metrics that encode your own goals, workflows and values are what turn cautious pilots into confident production deployments.
- Takeaway: define success criteria per use case (e.g. domain correctness, policy/brand compliance, workflow completion) and evaluate against them continuously. This links to the RAG metrics above and to the ADK eval work in the Google Cloud tracks (`eval_config.json`, evalsets).
- Only the summary was captured; the full article wasn't saved.

## 4. AI Fluency — the 4D framework
Source: Anthropic Academy, *AI Fluency: Framework & Foundations* — https://anthropic.skilljar.com/ai-fluency-framework-foundations

- Co-developed with academic experts. It's a framework for working effectively with any AI system, covering what AI can and can't do, evaluating outputs critically, and integrating AI responsibly into professional workflows. 12 lessons, about 70 minutes of video.
- **The 4Ds:**
  - **Delegation:** deciding what work to hand to AI vs keep human, and how to split it.
  - **Description:** communicating the task, context and desired output clearly to the AI.
  - **Discernment:** critically evaluating AI outputs (accuracy, quality, fit).
  - **Diligence:** responsible use, including transparency, accountability and checking before you rely on or share output.
- Only the course description was captured; the expansion of each D above is a short gloss of the framework names.
