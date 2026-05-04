# Appendix

Filerna i detta appendix utgör agentic-filer vars syfte är att instruera AI-modeller om önskat beteende, specifikationsfiler &mdash; superspec och iterativa &mdash; som instruerar AI-modeller om önskad funktionalitet, samt en testsuite med Gherkin-scenarier som ligger till grund för enhetstesterna som också finns med i detta appendix.

## Agentic-filer

### agent_super.md
Intruktioner för önskad beteende vid prototypskapande tillsammans med **superspec.md**

### agent_iterative.md
Intruktioner för önskad beteende vid prototypskapande tillsammans med **iteration_1.md**, **iteration_2.md** och **iteration_3.md**.

## Specifikationsfiler

### superspec.md
Superspecifikationen som innehåller all önskad funktionalitet prototypen ska ha. Denna används tillsammans med **agent_super.md** för att AI-modellerna ska skapa en komplett prototyp.

### iteration_1.md
Iterativ specifikation 1 som innehåller all önskad funktionalitet prototypen ska ha avseende iteration 1. Denna används tillsammans med **agent_iterative.md** för att AI-modellerna ska skapa en första prototyp.

### iteration_2.md
Iterativ specifikation 2 som innehåller all önskad funktionalitet prototypen ska ha avseende iteration 2. Denna används tillsammans med **agent_iterative.md** för att AI-modellerna ska utöka prototypen från iteration 1.

### iteration_3.md
Iterativ specifikation 3 som innehåller all önskad funktionalitet prototypen ska ha avseende iteration 3. Denna används tillsammans med **agent_iterative.md** för att AI-modellerna ska utöka prototypen från iteration 1 och iteration 2.

## Tester

### testsuite.feature
Testscenarier i Gherkin-format som ligger till grund för projektets enhetstester.

### Iteration1BasicRulesTest.cs
Enhetstester tillhörande iteration 1.

### Iteration3ShotChangeRulesTests.cs
Enhetstester tillhörande iteration 3.
