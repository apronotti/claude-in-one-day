---
name: explain-code
description: >
  Explain code with diagrams and analogies. Use when explaining
  how code works, teaching about a codebase, or when the user
  asks "how does this work?"
---

# Code Explanation

When explaining code, always include all four sections:

## 1. Start with an Analogy
Compare the code to something from everyday life. This grounds the explanation before diving into details.

Example: "This middleware chain works like a security checkpoint at an airport — each layer checks something specific, and if any check fails, you don't proceed to the gate."

## 2. Draw a Diagram
Use ASCII art to show the flow, structure, or relationships. Visual representation makes complex code accessible.

```
Request → [Auth Middleware] → [Validation] → [Route Handler]
                |                  |               |
                ↓                  ↓               ↓
           401 Unauthorized   400 Bad Request   Service Layer
                                                    |
                                                    ↓
                                               Repository
                                                    |
                                                    ↓
                                                Database
```

## 3. Walk Through the Code
Explain step-by-step what happens, following the actual execution path. Reference specific file and function names. Connect each step back to the diagram.

## 4. Highlight a Gotcha
What's a common mistake or misconception about this code? What would surprise someone reading it for the first time? What would break if someone changed the wrong thing?

Example: "The order of middleware matters — if you swap auth and validation, unauthenticated users can trigger validation errors that leak information about valid request formats."
