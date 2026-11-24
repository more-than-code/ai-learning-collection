---
title: "Quiz: AI Agents and LLM Automation (Udemy skills assessment practice)"
date: 2026-11-09
topic: ai-agents-llm-automation
status: completed
score: 25/30 (83.3%)
next_review: 2026-11-12
---

# Quiz: AI Agents and LLM Automation

Practice record for the Udemy skills assessment "AI Agents and LLM Automation" (linked from the Complete Agentic AI Engineering course, part of the FDP – Data & AI ladder).

## Briefing

Source: the assessment's landing page (title, proficiency, tools, domain list). The explanations below come from general knowledge, not from the repo notes or the course.

- Proficiency: Advanced. Tools: OpenAI API, Langflow, n8n, Make, Hugging Face.
- Domains: LLM and agent foundations; prompt engineering and reasoning; no-code/low-code agent construction; agent building and deployment; workflow automation and LLM integration; advanced agent development and continuous deployment; advanced data techniques (e.g. RAG, memory).
- Workflow = predefined steps, LLM is one step. Agent = LLM chooses actions and tools in a loop.
- Token cost and context window are what memory affects; measure in tokens, not characters or time.

Questions are paraphrased, not copied from the assessment.

## Questions

### Q1 — No-code workflow: measuring memory overhead (domain: No-Code and Low-Code Agent Construction)
- **Question (paraphrase):** In a no-code automated workflow, which method best measures the token overhead added by including memory in each prompt?
- **Your answer:** Calculate the difference in token usage between consecutive prompt versions.
- **Grade:** Correct
- **Correct answer:** Compare token usage between prompt versions.
- **Explanation:** Overhead is a token cost, so measure tokens directly. Character count is only a rough proxy; latency and API speed measure time, not tokens.

### Q2 — Handling transient HTTP errors in LLM API workflows (domain: Workflow Automation and LLM Integration)
- **Question (paraphrase):** In an LLM-integrated workflow automation relying on API requests, what configuration enables effective HTTP error management via automatic retries with exponential backoff?
- **Your answer:** Implement a retry policy with exponential backoff for HTTP 5xx errors.
- **Grade:** Correct
- **Correct answer:** Implement a retry policy with exponential backoff for HTTP 5xx errors.
- **Explanation:** HTTP 5xx errors indicate transient server-side issues where backoff allows recovery without causing thundering herds. 4xx errors (client faults) should not be retried automatically.

### Q3 — Link-based API pagination in no-code workflows (domain: No-Code and Low-Code Agent Construction)
- **Question (paraphrase):** In a no-code workflow integrating a REST API that returns paginated data with a `next-page` URL, what approach best retrieves all pages until none remain?
- **Your answer:** Use a conditional loop to repeatedly call the API until the 'next-page' URL is null.
- **Grade:** Correct
- **Correct answer:** Use a conditional loop to repeatedly call the API until the 'next-page' URL is null.
- **Explanation:** Link/cursor pagination is sequential because each successive URL is only revealed in the current response. A conditional loop terminating when `next-page` is null safely and completely handles dynamic page counts.

### Q4 — JSON Schema validation using AJV (domain: Workflow Automation and LLM Integration)
- **Question (paraphrase):** In automated workflows, how is an AJV node best utilized to validate a JSON payload against a schema?
- **Your answer:** Pass JSON data through the AJV node with a defined schema to ensure it meets expected format rules.
- **Grade:** Correct
- **Correct answer:** Pass JSON data through the AJV node with a defined schema to ensure it meets expected format rules.
- **Explanation:** AJV ("Another JSON Schema Validator") is a dedicated validator that tests incoming payloads against a defined JSON schema to verify fields, types, and constraints. It does not perform transformations, serialization, or schema inference.

### Q5 — Publishing agent packages to private PyPI (domain: General Agent Building and Deployment)
- **Question (paraphrase):** Which steps are required to publish an automation package to an organization's private PyPI repository?
- **Your answer:** Configure the repository URL and credentials in a `.pypirc` file and use `twine upload` to push the distribution files.
- **Grade:** Correct
- **Correct answer:** Configure the repository URL and credentials in a `.pypirc` file and use `twine upload` to push the distribution files.
- **Explanation:** `twine` is Python's standard utility for uploading built wheels/sdists to repositories defined in `~/.pypirc`. `pip` only installs packages, and `git push` targets Git remotes, not package registries.

### Q6 — Self-reflection vs. Chain-of-Thought (domain: Prompt Engineering and Reasoning)
- **Question (paraphrase):** What is the key advantage of the verification phase in self-reflection prompts compared to standard Chain-of-Thought (CoT)?
- **Your answer:** It provides an opportunity for the AI agent to re-evaluate its reasoning process before finalizing an answer.
- **Grade:** Correct
- **Correct answer:** It provides an opportunity for the AI agent to re-evaluate its reasoning process before finalizing an answer.
- **Explanation:** Standard CoT produces a linear forward pass where mistakes cascade uncorrected. Self-reflection introduces an intentional critique/verification phase allowing the agent to detect logical errors and revise its conclusion before finalizing.

### Q7 — Preventing duplicate email processing in n8n (domain: Workflow Automation and LLM Integration)
- **Question (paraphrase):** In an n8n email automation workflow, what action prevents incoming emails from being fetched and processed repeatedly?
- **Your answer:** Configure the IMAP Email Trigger node to mark emails as read upon receipt.
- **Grade:** Correct
- **Correct answer:** Configure the IMAP Email Trigger node to mark emails as read upon receipt.
- **Explanation:** n8n's IMAP trigger filters for unread messages. Setting the trigger node to mark emails as read upon receipt ensures they are excluded from subsequent polling cycles without requiring destructive inbox actions.

### Q8 — Prometheus metrics for agent observability (domain: Advanced Agent Development and Continuous Deployment)
- **Question (paraphrase):** In Prometheus monitoring for an automation agent, which metric types best capture request volume and latency?
- **Your answer:** Use Prometheus Counter to track total request count and Histogram for request latency.
- **Grade:** Correct
- **Correct answer:** Use Prometheus Counter to track total request count and Histogram for request latency.
- **Explanation:** Prometheus Counters are monotonically increasing counters ideal for calculating request rates via `rate()`, while Histograms partition request durations into configurable buckets, allowing accurate percentiles (e.g. p95, p99) to be aggregated across instances.

### Q9 — Packaging prompt templates as Python package data (domain: General Agent Building and Deployment)
- **Question (paraphrase):** How should reusable prompt templates be structured and configured in a Python project to be included as runtime package data in a pip-installable package?
- **Your answer:** Place templates in a `mypackage/templates/` directory within the package and configure `setup.cfg`'s `[options.package_data]` to include them.
- **Grade:** Correct
- **Correct answer:** Place templates in a `mypackage/templates/` directory within the package and configure `setup.cfg`'s `[options.package_data]` to include them.
- **Explanation:** Non-code assets required at runtime must reside within the package tree and be declared in `package_data` (e.g., in `setup.cfg` or `pyproject.toml`) to ensure they are packaged into wheels and installed to `site-packages`. `MANIFEST.in` only governs source distribution archives.

### Q10 — Analogical reasoning prompting (domain: Prompt Engineering and Reasoning)
- **Question (paraphrase):** Which prompt pairs distinct, unrelated conceptual domains to foster analogical reasoning in creative problem-solving?
- **Your answer:** Imagine how launching a startup is like cultivating a garden.
- **Grade:** Correct
- **Correct answer:** Imagine how launching a startup is like cultivating a garden.
- **Explanation:** Analogical prompting explicitly bridges two disparate domains (venture business and horticulture) to transfer structural insights and metaphors. The other options are intra-domain analyses, technical steps, or feature listings.

### Q11 — Nested JSON data extraction (domain: Workflow Automation and LLM Integration)
- **Question (paraphrase):** Given a response object with a top-level `analysis` dictionary containing `sentiment` and `confidence`, how do you access the sentiment value?
- **Your answer:** Access `response['analysis']['sentiment']`.
- **Grade:** Correct
- **Correct answer:** Access `response['analysis']['sentiment']`.
- **Explanation:** Nested JSON requires traversing through parent keys to child keys. The root contains `analysis`, which holds `sentiment`. Direct root access or non-existent keys result in key errors.

### Q12 — Conditional branching in n8n (domain: No-Code and Low-Code Agent Construction)
- **Question (paraphrase):** In n8n, which node is most appropriate for branching workflow execution paths based on a true/false condition?
- **Your answer:** Add an IF node to handle the branching.
- **Grade:** Correct
- **Correct answer:** Add an IF node to handle the branching.
- **Explanation:** The IF node provides distinct True and False output connectors to split workflow execution based on condition tests. Set and Function nodes transform data along a single path without branching.

### Q13 — Merging JSON arrays with collection nodes (domain: No-Code and Low-Code Agent Construction)
- **Question (paraphrase):** What is the best method to combine two JSON arrays in workflow automation using a collection node?
- **Your answer:** Utilize a collection node with a merge function specifically designed for arrays.
- **Grade:** Correct
- **Correct answer:** Utilize a collection node with a merge function specifically designed for arrays.
- **Explanation:** Native collection/array merge operations preserve data types and object hierarchies cleanly, avoiding syntax errors from string conversions and unnecessary operation cycles from manual element-by-element loops.

### Q14 — Automated prompt evaluation via BLEU and ROUGE (domain: Prompt Engineering and Reasoning)
- **Question (paraphrase):** Which method is best suited for scoring successive prompt iterations using automated evaluation metrics like BLEU and ROUGE?
- **Your answer:** Apply BLEU and ROUGE metrics to quantify changes in prompt efficiency.
- **Grade:** Correct
- **Correct answer:** Apply BLEU and ROUGE metrics to quantify changes in prompt efficiency.
- **Explanation:** BLEU (precision-oriented n-gram overlap) and ROUGE (recall-oriented n-gram overlap) provide objective, automated benchmark scoring against reference target outputs, unlike manual feedback or live A/B user engagement tests.

### Q15 — Containerizing Langflow agents with Docker Compose (domain: General Agent Building and Deployment)
- **Question (paraphrase):** What is the recommended approach to generate the necessary Docker Compose configuration to deploy a Langflow workflow agent to cloud containers?
- **Your answer:** Use the "Export as YAML" option from the project menu.
- **Grade:** Wrong
- **Correct answer:** Manually create a Dockerfile and docker-compose.yml following the Langflow deployment documentation.
- **Explanation:** Langflow's UI canvas does not feature automated Docker Compose or YAML export options. Flows are exported as JSON definitions, and containerized deployment requires creating a `docker-compose.yml` (and optional custom `Dockerfile`) according to Langflow deployment docs.

### Q16 — Strong encryption for agent memory at rest (domain: Advanced Data Techniques for Agents)
- **Question (paraphrase):** Which method should be used to encrypt sensitive agent memory records at rest adhering to a strong encryption standard?
- **Your answer:** Apply AES-128 encryption.
- **Grade:** Wrong
- **Correct answer:** Implement AES-256 encryption.
- **Explanation:** AES-256 is the universally recognized gold standard for protecting sensitive enterprise data at rest (recommended by NIST and cloud KMS providers). Base64 is non-cryptographic encoding, MD5 is an obsolete one-way hash, and AES-128 has a shorter key length.

### Q17 — Managing context window limits with chunking (domain: LLM and Agent Foundations)
- **Question (paraphrase):** How do you ensure transformed text data fits within a language model's context window without losing content?
- **Your answer:** Split the text data into multiple smaller parts for different model sessions.
- **Grade:** Correct
- **Correct answer:** Split the text data into multiple smaller parts for different model sessions.
- **Explanation:** Chunking text into smaller pieces processed across separate model invocations (e.g. map-reduce or sequential chains) guarantees compliance with context window limits while preserving all content. Truncating loses data, and compression algorithms produce binary streams that break tokenization.

### Q18 — Vector index retrieval with top-k queries (domain: Advanced Data Techniques for Agents)
- **Question (paraphrase):** What is the best method to retrieve the top 5 most similar documents from a vector index in an automation tool?
- **Your answer:** Implement a top-k query on the vector index to retrieve results.
- **Grade:** Correct
- **Correct answer:** Implement a top-k query on the vector index to retrieve results.
- **Explanation:** Vector similarity retrieval operates via k-nearest neighbors (k-NN / ANN) where setting $k=5$ in a top-$k$ query fetches the closest embedding vectors (by cosine distance or dot product). Date sorting and keyword searches ignore vector embeddings entirely.

### Q19 — Exporting workflows in Langflow (domain: No-Code and Low-Code Agent Construction)
- **Question (paraphrase):** In Langflow, how is a completed visual workflow design saved as a JSON file for subsequent importing?
- **Your answer:** Click the export button and choose "Export as JSON".
- **Grade:** Correct
- **Correct answer:** Click the export button and choose "Export as JSON".
- **Explanation:** Langflow serializes workflow graph schemas, component parameters, and connections directly into JSON format via the Export interface for seamless re-importing across instances.

### Q20 — API key rotation in workflow platforms (domain: Workflow Automation and LLM Integration)
- **Question (paraphrase):** When rotating an API key in a no-code automation platform, which step is most crucial to ensure dependent workflows continue functioning without runtime failures?
- **Your answer:** Backup the current API key and store it securely before rotating.
- **Grade:** Wrong
- **Correct answer:** Update the API key in the platform and run a test on all dependent workflows.
- **Explanation:** In centralized credential managers (e.g. n8n, Make), updating the key and validating/testing dependent workflows verifies that connectivity, permissions, and scopes are intact before production execution. Storing/backing up old credentials is a security risk and does not prevent runtime execution failures.

### Q21 — Hybrid architecture: workflow engines with agentic sub-tasks (domain: Workflow Automation and LLM Integration)
- **Question (paraphrase):** How does a hybrid architecture combine workflow engines with agentic sub-tasks to improve automated processes?
- **Your answer:** Agents initiate the workflows, allowing them to control the overall process without any pre-defined sequence.
- **Grade:** Wrong
- **Correct answer:** The workflow engine executes pre-defined tasks in sequence, while agents handle dynamic decision-making within the process.
- **Explanation:** In hybrid systems, the workflow engine acts as the deterministic control backbone running reliable sequential steps, while embedding autonomous agents for specific sub-tasks that require flexible reasoning or dynamic branching. Unconstrained processes without pre-defined sequences describe pure autonomous agents, not hybrid workflows.

### Q22 — Weighted matrix for platform evaluation (domain: No-Code and Low-Code Agent Construction)
- **Question (paraphrase):** When using a weighted matrix to evaluate and compare no-code platforms across multiple criteria, what step ensures effective scoring?
- **Your answer:** Prioritize each criterion based on business goals before scoring.
- **Grade:** Correct
- **Correct answer:** Prioritize each criterion based on business goals before scoring.
- **Explanation:** In a weighted decision matrix, the weights assigned to each criterion must be anchored to business priorities before evaluating platforms to establish an objective, mathematically sound composite score and avoid confirmation bias.

### Q23 — Automated sentiment threshold alerting (domain: Workflow Automation and LLM Integration)
- **Question (paraphrase):** When monitoring customer reviews with text analytics to send alert emails for negative sentiment exceeding a threshold, which workflow action accomplishes this?
- **Your answer:** Implement a sentiment analysis step and compare the negative score against the threshold.
- **Grade:** Correct
- **Correct answer:** Implement a sentiment analysis step and compare the negative score against the threshold.
- **Explanation:** The text analytics model computes a continuous sentiment score; evaluating that score against the defined threshold via a conditional node routes high-negative reviews directly to the email alerting service.

### Q24 — GitHub Actions deployment triggers (domain: Advanced Agent Development and Continuous Deployment)
- **Question (paraphrase):** Which GitHub Actions configuration best supports automatically deploying an agent when changes are pushed to the repository's main branch?
- **Your answer:** Use a pull_request trigger for automation on the main branch.
- **Grade:** Wrong
- **Correct answer:** Set up a workflow with a push trigger on the main branch.
- **Explanation:** CD deployment pipelines trigger on actual commits landed on `main` using `on: push: branches: [main]`. The `pull_request` trigger runs against proposed, unmerged code for pre-merge CI validation, not post-merge production deployment.

### Q25 — Stable container autoscaling configuration (domain: General Agent Building and Deployment)
- **Question (paraphrase):** When deploying a no-code agent container to a cloud platform, what configuration is most critical for stable autoscaling?
- **Your answer:** Configure a minimum and maximum threshold for the number of running containers.
- **Grade:** Correct
- **Correct answer:** Configure a minimum and maximum threshold for the number of running containers.
- **Explanation:** Setting minimum instance limits prevents cold-start latency drops during traffic spikes, while maximum limits prevent uncontrolled runaway scaling costs and downstream resource exhaustion.

### Q26 — Centralized credential rotation across dependent nodes (domain: Workflow Automation and LLM Integration)
- **Question (paraphrase):** When rotating an API key in a no-code platform, which step ensures the update propagates across all dependent nodes without causing runtime failures?
- **Your answer:** Update the API key in the central configuration settings first.
- **Grade:** Correct
- **Correct answer:** Update the API key in the central configuration settings first.
- **Explanation:** Modern no-code engines manage API credentials in centralized configuration/connection managers. Updating the key at the central store automatically propagates the new authentication across all dependent nodes without tedious, error-prone node-level edits.

### Q27 — Automated unit testing in CI/CD pipelines (domain: Advanced Continuous Deployment)
- **Question (paraphrase):** In a CI/CD pipeline for an automation agent, how should unit tests with `pytest` be configured to run automatically after each push?
- **Your answer:** Configure a separate job to execute pytest in the test stage.
- **Grade:** Correct
- **Correct answer:** Configure a separate job to execute pytest in the test stage.
- **Explanation:** Standard CI/CD architectures isolate testing into a dedicated `test` stage/job between build and deploy, catching regressions early and gating release stages.

### Q28 — LLM summarization node in n8n (domain: Workflow Automation and LLM Integration)
- **Question (paraphrase):** In n8n, which node is placed after text extraction to summarize email text using OpenAI models?
- **Your answer:** OpenAI GPT node.
- **Grade:** Correct
- **Correct answer:** OpenAI GPT node.
- **Explanation:** n8n provides a dedicated OpenAI node designed for model inference, prompt completion, and structured summarization without requiring raw HTTP requests.

### Q29 — Vector similarity matching in RAG (domain: Advanced Data Techniques for Agents)
- **Question (paraphrase):** In a RAG architecture, which mathematical technique is most commonly used to match query embeddings against document chunk embeddings?
- **Your answer:** Cosine similarity.
- **Grade:** Correct
- **Correct answer:** Cosine similarity.
- **Explanation:** Cosine similarity calculates the cosine of the angle between query and document embedding vectors, providing a normalized metric of semantic relatedness across high-dimensional vector spaces.

### Q30 — Switching model provider nodes in workflows (domain: Workflow Automation and LLM Integration)
- **Question (paraphrase):** In a workflow automation tool, what action is required to switch from OpenAI to Anthropic for prompt processing?
- **Your answer:** Replace the OpenAI node with an Anthropic node in the workflow.
- **Grade:** Correct
- **Correct answer:** Replace the OpenAI node with an Anthropic node in the workflow.
- **Explanation:** Pre-built vendor nodes embed provider-specific endpoints, headers, and payload schemas. Switching from OpenAI to Anthropic requires replacing the node in the graph and attaching the corresponding credentials.

## Score
25/30 (83.3%).

## Weak points
- **Langflow container deployment:** Langflow lacks direct "Export to Docker Compose" or "Export as YAML" features in its UI. Flows export as JSON, while containerized deployment with Docker Compose must be configured manually via documentation templates.
- **Encryption standards at rest:** When choosing between symmetric ciphers for sensitive data at rest, AES-256 is the required strong standard over AES-128.
- **API key rotation procedures:** Ensuring dependent workflows avoid runtime failure requires updating credentials in the platform and testing all dependent workflows to verify permissions, rather than hoarding old key backups.
- **Hybrid orchestration architecture:** Hybrid architectures use the workflow engine as a deterministic, sequential control plane while delegating dynamic reasoning and judgment to embedded agentic sub-tasks.
- **CI/CD triggers in GitHub Actions:** Automated production deployments upon merging/pushing to `main` require a `push` trigger (`on: push: branches: [main]`), whereas `pull_request` triggers run pre-merge CI checks on unmerged branches.
