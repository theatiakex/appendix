# Prompt list
#### These are the prompts given to the Cursor agent.

### Super
Read agents_super.md and superspec.md . Create a prototype based on these files.

### Iteration 1
Read agents_iterative.md and iteration_1.md . Create a prototype based on these files.

### Iteration 2
Read agents_iterative.md and iteration_2.md . Add onto the prototype based on these files.

### Iteration 3
Read agents_iterative.md and iteration_3.md . Add onto the prototype based on these files.

### Testsuite
I want to set up the complete unit test suite for my Subtitle QC system.

Please read the architectural requirements in `@superspec.md` (specifically Section 2.1 Internal Data Model and Section 2.3 Rule Engine) and `@agents_super.md`. Then, read ALL the detailed Gherkin scenarios in `@testsuite.feature`, including Iteration 1 and Iteration 3.

Write the C# unit tests for all scenarios using xUnit.

Strict Constraints:
1. Model Isolation: The QC rule tests must exclusively use the internal `Cue` model. Do NOT involve any file format parsers (SRT/VTT/TTML) in these specific tests. You are testing the rules, not the parsers.
2. No Implementation: Do NOT implement the actual logic or private dummy `Passes...` methods in the test class.
3. Design for Abstractions: Write the tests assuming the architecture defined in `@superspec.md` already exists (e.g., interact with a `RuleEngine` or specific `IQcRule` classes, and pass a manually constructed `Cue` object). For the Shot Change scenarios (Iteration 3), ensure the external data is mocked/injected appropriately according to the Dependency Inversion principle.
4. Accept Compilation Errors: It is 100% expected that these tests will have compilation errors right now because the production classes do not exist yet. Just write the clean Arrange-Act-Assert logic for each scenario.
5. File & Folder Structure: Place all generated test files inside a designated test folder named `SubtitleQc.Tests/`.