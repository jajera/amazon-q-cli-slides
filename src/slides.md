---
marp: true
paginate: true
theme: default
class: lead
style: |
  @import url("https://fonts.googleapis.com/css2?family=Amazon+Ember:wght@400;500;700;900&display=swap");

  section {
    background-color: #232F3E;
    color: #ffffff;
    font-family: 'Amazon Ember', sans-serif;
    padding: 2em;
    font-size: 1.4em;
  }

  h1 {
    color: #FF9900 !important;
    font-weight: 900;
    font-size: 3em;
    font-family: 'Amazon Ember', sans-serif;
    margin-bottom: 0.5em;
  }

  h2, h3 {
    color: #ffffff;
    font-weight: 600;
    margin-bottom: 0.5em;
  }

  code, pre, .hljs {
    background-color: #1e2a32;
    color: #d4d4d4;
    border-radius: 8px;
    padding: 0.8em;
    font-size: 0.95em;
  }

  blockquote {
    color: #b3c0cc;
    font-style: italic;
    border-left: 4px solid #FF9900;
    padding-left: 1.5em;
    margin: 1em 0;
    background-color: rgba(255, 153, 0, 0.1);
    padding: 1em 1.5em;
    border-radius: 0 8px 8px 0;
  }

  ul, ol {
    font-size: 1.2em;
    line-height: 1.6;
  }

  .center {
    text-align: center;
  }

  .mermaid {
    background-color: #ffffff;
    border-radius: 8px;
    padding: 1em;
    margin: 1em 0;
  }
---

<link rel="icon" type="image/svg+xml" href="favicon.svg">
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link rel="shortcut icon" href="favicon.ico">

<script src="https://cdn.jsdelivr.net/npm/mermaid@10.6.1/dist/mermaid.min.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function() {
  mermaid.initialize({
    startOnLoad: true,
    theme: 'default',
    themeVariables: {
      primaryColor: '#FF9900',
      primaryTextColor: '#232F3E',
      primaryBorderColor: '#232F3E',
      lineColor: '#232F3E',
      sectionBkgColor: '#f0f0f0',
      altSectionBkgColor: '#ffffff',
      gridColor: '#cccccc',
      secondaryColor: '#ffffff',
      tertiaryColor: '#f9f9f9'
    }
  });
});
</script>

<!-- _class: lead -->

# Amazon Q

## Boost Productivity with Amazon Q for Development

---

## 1. History

> 🚀 *Key milestones in the evolution of Amazon Q*

<div class="mermaid">
gantt
    title Amazon Q Development Timeline
    dateFormat YYYY-MM-DD
    axisFormat %b %Y

    section .
    Amazon Q Announced                 :q_announce, 2023-11-28, 5d
    Developer GA (CLI & IDE Agent)     :q_ga, 2024-04-30, 5d
    GitHub Integration Preview         :q_github, 2025-05-05, 5d
</div>

---

## 2. Ways to Use

<div class="mermaid">
graph TD
  A["Amazon Q CLI"] --> B["Install on macOS / Linux / Windows"]
  A --> C["Use inside Dev Containers"]
  A --> D["Ask AWS questions from terminal"]
  A --> E["Generate, explain, and debug AWS CLI commands"]
</div>

---

## 3. Installing Amazon Q CLI

### 💻 Installation

Install Amazon Q CLI for your OS or environment:
🔗 [https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/command-line-installing.html](https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/command-line-installing.html)

### 🐳 Dev Container Support

To use Amazon Q CLI inside a [Dev Container](https://containers.dev/), add this to your `devcontainer.json`:

    ```json
    {
      "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
      "features": {
        "ghcr.io/jajera/features/amazon-q-cli:1": {}
      }
    }
    ```

This installs Amazon Q CLI using a custom Dev Container Feature you can reuse across projects.

---

## 4. How to Use Amazon Q CLI

### 🧪 Try These Commands

    ```bash
    # Ask a question
    q ask "How do I enable versioning on an S3 bucket?"

    # Explain an error
    q explain "AccessDeniedException from Lambda"

    # Generate a script
    q generate "Bash script to create an EC2 instance with CLI"

    # Start an interactive chat session
    q chat
    ```

### 💡 Pro Tip

Use `q chat` for a persistent conversational session — like talking to a CLI-native dev assistant.

---

## 5. Good and Bad Habits

### ✅ Good Habits

- Be specific with your requests
- Iterate for accuracy
- Test in dev environment first
- Use Q as a **collaborator**, not a crutch

### ❌ Bad Habits

- Copy code blindly
- Ask vague questions
- Ignore official documentation
- Let Q **replace your own reasoning**

---

## 6. Watchouts

> ⚠️ **Q can accelerate your work — but it should never replace your understanding.**

### 🧠 Be aware of꞉

- 🪄 Learn how to prompt effectively → [promptingguide.ai](https://www.promptingguide.ai)
- 🔍 Always validate suggestions before using them
- 📅 Some outputs may be outdated (based on training data)
- 🌀 LLMs can hallucinate or invent APIs
- ✅ Trust, but always verify — especially before deploying

---

## 7. Best Usage Flow

<div class="mermaid">
flowchart TD
    A["🟦 Install Q CLI (core)"] --> B["🟦 Authenticate with AWS (core)"]
    B --> C["Ask a focused question"]
    C --> D["Review and test output"]
    D --> E["Iterate in CLI"]
    D --> F["🔄 Switch to VSCode or Console"]
</div>

---

## 8. Real-World CLI Prompts

<div class="mermaid">
flowchart TD
    A["Presigned URL for file sharing (e.g., SmugMug-like app)"] --> B["Q CLI → Bash + AWS CLI snippet"]
    C["Debug IAM 'NotAuthorized' in enterprise infra"] --> D["Q CLI → identifies missing roles/policies"]
    E["Paginate DynamoDB scans in data pipelines (e.g., Venmo-scale ops)"] --> F["Q CLI → looping shell script"]
</div>

### 🏢 Use Cases Behind the Prompts

**File-sharing apps like SmugMug** use presigned S3 URLs to grant temporary access
  🔗 [AWS Docs – Using presigned URLs](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-presigned-url.html)

**Enterprise teams (finance, operations, IT)** routinely debug IAM permission errors like "NotAuthorized"
  🔗 [AWS Docs – Testing IAM policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_testing-policies.html)

**High-scale services like Venmo** use DynamoDB at massive scale and require scan pagination
  🔗 [Venmo on AWS – Case Study](https://aws.amazon.com/solutions/case-studies/venmo-case-study/)

---

## 9. Live Demo

### 💻 Example Prompt

🔗 [Kiwi Maze Game Specification](https://github.com/jajera/q-kiwi-maze-game/blob/main/docs/kiwi-maze-spec.md)

### 🛠️ Using Amazon Q CLI

🔗[https://github.com/jajera/q-kiwi-memory-game/blob/main/docs/using-q-cli.md](https://github.com/jajera/q-kiwi-maze-game/blob/main/docs/using-q-cli.md)

### 📌 What to Expect

Your output may vary depending on:

- Output may vary depending on your AWS credentials, CLI version, or environment
- You may need to refine or clarify prompts mid-conversation
- Live debugging is normal — Q is flexible, not perfect

💡 Tip: Use `q chat` iteratively for the best results

---

## 10. Real Output Example

Here's a real-world output generated by Amazon Q CLI:

🎮 **Kiwi Memory Game** — a JavaScript-based browser game scaffolded entirely via `q chat`.

🔗 [github.com/jajera/q-kiwi-memory-game](https://github.com/jajera/q-kiwi-memory-game)

🎮 **Kiwi Maze Game** — a JavaScript-based browser game scaffolded entirely via `q chat`.

🔗 [github.com/jajera/q-kiwi-maze-game](https://github.com/jajera/q-kiwi-maze-game)

---

## Thank You﹗

### **Questions?**

---

## References

- [Amazon Q Announced (Nov 28, 2023)](https://aws.amazon.com/about-aws/whats-new/2023/11/aws-amazon-q-preview/)
- [Amazon Q Developer GA — IDE & CLI (Apr 30, 2024)](https://aws.amazon.com/blogs/aws/new-amazon-q-developer-agent-capabilities-include-generating-documentation-code-reviews-and-unit-tests/)
- [GitHub Integration Preview (May 5, 2025)](https://aws.amazon.com/about-aws/whats-new/2025/05/amazon-q-developer-integration-github-preview-available/)
