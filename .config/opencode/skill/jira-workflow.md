---
description: >-
  Skill for working with JIRA tasks. Provides workflow guidance for taking a
  JIRA task from start to MR. Use when starting work on a new JIRA task.
trigger: jira|task|ticket|PROJ-
---

# JIRA Task Workflow

This skill guides you through the complete workflow for implementing a JIRA task.

## Workflow Steps

```
┌─────────────────────────────────────────────────────────────────┐
│                     YOUR JIRA WORKFLOW                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  1. REQUIREMENTS    ──→  Clarify the JIRA task                 │
│     (Plan Mode)          @requirements-clarifier                │
│                                                                 │
│  2. ARCHITECTURE    ──→  Design discussion (if needed)         │
│     (Optional)           @architecture-designer                 │
│                                                                 │
│  3. IMPLEMENT       ──→  Write the code                        │
│                          @implementation-specialist             │
│                                                                 │
│  4. REFINE          ──→  You review and adjust                 │
│     (Human step)         (manual refinement)                   │
│                                                                 │
│  5. TEST            ──→  Write tests, verify passing           │
│                          @test-automation-engineer              │
│                                                                 │
│  6. CODE REVIEW     ──→  Review for quality/security           │
│     (Optional)           @code-reviewer                        │
│                                                                 │
│  7. QUALITY CHECK   ──→  Lint + all tests pass                 │
│                          @quality-checker                       │
│                                                                 │
│  8. CREATE MR       ──→  Push and create MR                    │
│                          @mr-creator                            │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## Quick Commands

### Starting a Task
```
"Here's my JIRA task: PROJ-123 - [paste description]"
```
→ Will clarify requirements and create implementation plan

### Need Architecture Discussion
```
"Before we implement PROJ-123, let's discuss the approach"
```
→ Will analyze options and recommend design

### Ready to Implement
```
"Implement the solution for PROJ-123 based on the requirements above"
```
→ Will write the code following requirements

### After Your Refinement
```
"Write tests for this implementation"
```
→ Will create tests and run them

### Pre-commit Check
```
"Run lint and tests"
```
→ Will run quality checks and report status

### Ready to Push
```
"Create MR for PROJ-123"
```
→ Will commit, push, and create MR with description

## Example Session

```
You: Here's my JIRA task: PROJ-123 - Add CSV export for users
AI: [Clarifies requirements, creates implementation checklist]

You: Should we use streaming for large exports?
AI: [Architecture discussion about streaming vs buffering]

You: Go ahead and implement it
AI: [Writes the code]

You: [Reviews and makes adjustments]
You: Now write tests

AI: [Creates tests, runs them, reports results]

You: Run lint and tests
AI: [Quality check - all passing]

You: Create the MR
AI: [Pushes and creates MR with description]
```

## Tips

1. **Always start with requirements** - Even if the JIRA seems clear, clarifying helps catch edge cases

2. **Architecture discussions are optional** - Skip for simple tasks, use for anything non-trivial

3. **Your refinement matters** - The AI implements, you refine to match your style/preferences

4. **Quality check before MR** - Always run lint + tests before creating MR

5. **Keep JIRA ID handy** - It's used for branch names and MR descriptions
