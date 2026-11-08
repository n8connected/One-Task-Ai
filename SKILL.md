---
name: one-task
description: Convert repetitive, multi-step computer, development, maintenance, file organization, data, and deployment requests into one reusable script or launcher rather than many interactive ChatGPT tool calls. Trigger when the user says "one task", "onetask", "make a script", "one click", "automate all of it", "stop burning usage", or requests execution-efficient batch automation. Prefer a single locally executable, tested and restartable task with logging over repeated manual steps.
---

# One Task

Deliver the result in the fewest **necessary** calls and user steps. Favor a single runnable artifact, not an endless chain of commands or conversations. Optimize for successful execution, not merely few calls.

## Execution policy
1. Extract the objective, OS, paths, integrations and constraints already known. Never re-ask answered questions. Make conservative assumptions where possible.
2. Choose the smallest suitable implementation: `.ps1` for Windows PowerShell 5.1, `.sh` for Linux/macOS, Python only when it materially improves reliability or is already installed, and `.bat` only as a launcher. Prefer no dependencies and portable paths.
3. Generate **one main script** that performs all compatible steps in order: prereq checks, discovery, actions, verification, log, results. Bundle supporting files only when essential.
4. Make it repeatable and idempotent. Skip already-completed work; maintain an explicit state/checkpoint when useful; resume safely after interruption.
5. Add clear output and exit codes. Store machine-readable results and plain-text logs together. Return meaningful counts of changed, skipped, failed items and actual final state.
6. Test code syntax and representative behavior in the available environment. Where the host OS or user account is inaccessible, state precisely what was **not** executed. Never label an untested system change "completed".
7. Return a directly runnable script/file with the shortest exact launch command. Avoid verbose explanation and redundant intermediary artifacts.

## Actions and permission boundaries
- Never imply ChatGPT can operate on a user device without an available authorized connection or user-running the script.
- No global administrator, root, PGP or API permissions can be fabricated. Check them and fail clearly when missing.
- For deletions, moves, cleanup, registry edits, service configuration, installations, deployments or account-wide changes, identify risks and implement protection by default: dry-run or manifest preview, exclusions, backups/rollback where feasible, collision handling, verification, and explicit opt-in for destructive changes. When user has already expressly authorized the precise action, allow a deliberate apply mode, still keeping recovery safeguards.
- Never silently delete user data, bypass safeguards or edit protected OS/application files. Preserve user-specified exclusions.
- Treat remote API operations as distinct from local scripting. Use connected tools for access and authorization; a local script only replaces calls where credentials, endpoints and user permissions exist.
- Do not dump or embed passwords, private PGP keys, API secrets or tokens. Read environment or credential stores when necessary.

## Usage optimization
- Prefer one plan, one generation/patch pass, one validation pass, one artifact; batch compatible discovery and operations.
- Avoid round trips, verbose progress messages, repeated searches, dumping full logs or creating multiple versioned files without need.
- Do not claim guaranteed token, credit or billing savings: estimate reductions only if measured.
- If the requested action is straightforward and available directly through one tool call, use that instead of manufacturing a script.

## Default output contract
Present **file**, **single command**, **verified / unverified**, **results or expected results**, **safety mode**. For a task that cannot run here, deliver the ready-to-run script and describe the single user action needed.

## Windows template
Use `scripts/one-task.ps1` as the default Windows task harness. Replace its `Invoke-Task` function with the real objective. It starts in preview mode; use `-Apply` for actual changes after approval/inspection. Keep the script compatible with Windows PowerShell 5.1.
