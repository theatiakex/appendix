# System Specification - Iteration 2 (Format Expansion)

## 1. Task Definition
Your task is to expand the existing subtitle QC module to support **TTML (XML-based)** formats. 
The core QC engine and existing rules must remain untouched. 

## 2. Architectural Requirements

### 2.1 Parsers Expansion
Add a new parser that converts raw TTML data into the existing Internal Data Model.
* **TTML** (XML-based)

### 2.2 Preservation of Logic
* The existing QC Rules (MaxLines, MaxCpl, MaxCps, MinDuration, OverlapCheck, EmptyCueCheck) must now seamlessly validate TTML files via the unified data model.
* Ensure all existing tests pass without modifying the core Rule Engine logic.

---

## 3. Acceptance Criteria
* All Gherkin scenarios defined in Iteration 1 must now also pass when the system is fed a TTML file as input.