<div align="center">

# ONE TASK
### One request. One script. One execution.

**A reusable ChatGPT skill for turning repetitive, multi-step workflows into executable, restartable automation.**

[![Platform](https://img.shields.io/badge/Windows-PowerShell%205.1-0078D4?style=flat-square&logo=windows)](#supported-environments)
[![Linux](https://img.shields.io/badge/Linux-Bash-FCC624?style=flat-square&logo=linux&logoColor=black)](#supported-environments)
[![Skill](https://img.shields.io/badge/ChatGPT-Skill-10A37F?style=flat-square)](#installation)
[![Status](https://img.shields.io/badge/Status-Initial%20release-orange?style=flat-square)](#project-status)

**Less back-and-forth. Fewer manual steps. Clear, verifiable outcomes.**

[Overview](#overview) · [Installation](#installation) · [Usage](#usage) · [Safety](#safety-and-control) · [Files](#repository-structure)

</div>

---

## Overview

**One Task** is an instruction skill that encourages ChatGPT to deliver a **single, usable script or launcher** rather than a long sequence of individually executed operations.

When a job requires many repetitive steps, One Task favors a consolidated automation workflow with:

- **One entry point:** a task-specific script or launcher when practical.
- **Repeatable execution:** safe re-runs and resumable operations where feasible.
- **Built-in checks:** prerequisites, validation and actual outcome reporting.
- **Clean reporting:** log files, changed/skipped/failed counts and meaningful errors.
- **Minimal dependencies:** native OS tools whenever possible.
- **Safety by default:** previews, explicit apply mode and recovery precautions for risky changes.

> **Principle:** Optimize for *verified results*, not merely the number of commands.

## How it works

```text
               USER REQUEST
                    |
                    v
           CHATGPT + ONE TASK
                    |
           Define scope & checks
                    |
                    v
             GENERATE SCRIPT
                    |
          Preview / verify / apply
                    |
                    v
              EXECUTE ONCE
                    |
                    v
           VALIDATE + LOG RESULT
```

One Task generates the automation; it does not magically obtain access to your computer or accounts. Run local scripts yourself or use an explicitly authorized connected execution environment.

## Installation

1. Download this repository as a ZIP, or clone it.
2. Package the skill files into a ZIP with `SKILL.md` at the skill directory root.
3. Upload the skill through ChatGPT's Skills interface, where custom skill upload is available.
4. Invoke it with **"One Task"**, **"make one script"**, **"one click"**, or another matching request.

This repository includes the skill definition at [SKILL.md](SKILL.md) and UI metadata at [agents/openai.yaml](agents/openai.yaml).

## Usage

### Example: PC cleanup

**Prompt**

```text
One Task: audit and organize my Downloads folder.
Protect system files and browsers.
Preview moves first, handle duplicate names, and log every action.
Generate one PowerShell 5.1 script.
```

**Expected output**

A task-specific PowerShell script, an exact command to run it, and a report location. Cleanup must not be described as completed until execution has been verified.

### Example: project maintenance

```text
One Task: build, test, package, and verify my project
with one restartable launcher.
```

### Example: file organization

```text
One Task: sort my project exports by file extension.
Preserve existing project structures unless explicitly approved.
Create an inventory and preview before applying changes.
```

## Windows script harness

The repository includes a **PowerShell 5.1-compatible starter harness** at [scripts/one-task.ps1](scripts/one-task.ps1).

It provides:

| Feature | Current implementation |
| :--- | :--- |
| Preview mode | Default |
| Apply switch | `-Apply` |
| Per-run log | `run.log` |
| JSON results | `result.json` |
| Failure exit code | Non-zero |
| Actual task logic | **Not yet configured**; generated for each request |

**Preview**

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\scripts\one-task.ps1"
```

**Apply, only after task actions are implemented and reviewed**

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\scripts\one-task.ps1" -Apply
```

> The bundled harness is a scaffold, **not** a preconfigured PC-cleaning utility. Its `Invoke-Task` function must be replaced with task-specific code. Running the unmodified harness makes no system changes.

## Supported environments

| Environment | Preferred delivery |
| :--- | :--- |
| Windows | PowerShell 5.1 (`.ps1`) |
| Linux | Bash (`.sh`) |
| macOS | Bash (`.sh`) |
| Cross-platform | Python when warranted and available |
| Windows one-click | Optional `.bat` launcher |

Windows has a sample harness in this release; Bash and Python are **generation targets**, not bundled starter scripts.

## Safety and control

For destructive or system-wide operations, the skill requires a sensible workflow:

1. Identify the exact scope, protected paths and failure risks.
2. Generate a preview or manifest before changing data.
3. Use collision handling, logs and backup/rollback measures where feasible.
4. Apply only actions that are authorized.
5. Verify the final state and report errors precisely.

**No invented privileges:** this project does not bypass operating-system protections, account permissions, PGP checks or API authentication.

## Repository structure

```text
One-Task-Ai/
├── SKILL.md                  # Skill triggers and execution policy
├── agents/
│   └── openai.yaml           # ChatGPT skill metadata
├── scripts/
│   └── one-task.ps1          # PowerShell starter harness
└── README.md                 # This page
```

## Project status

**Initial release.** The reusable skill instructions and Windows starter harness are published. The skill is designed to generate *task-specific* scripts; it is not a complete autonomous execution platform and does not guarantee cost reductions.

### Roadmap

- [ ] Tested task-specific Windows automation examples
- [ ] Bash starter harness
- [ ] Resume/checkpoint helper module
- [ ] Automated validation tests
- [ ] Signed release packages

---

<div align="center">

**ONE TASK** · Built for practical automation, clear accountability, and less busywork.

[Back to top](#one-task)

</div>
