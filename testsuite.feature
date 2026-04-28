Feature: Validation of text amount and display duration (Iteration 1)
  As a Quality Control Manager
  I want subtitles to be validated against basic text and timing rules
  In order to ensure high readability and technical standards

  # --- MaxLines ---
  Scenario: MaxLines - A subtitle exceeding the line limit should be rejected
    Given an internal "cue" contains 3 lines of text
    When the QC check "MaxLines" is run with a threshold of 2
    Then the result for the specific cue should be "Failed"

  Scenario: MaxLines - A subtitle within the line limit should be approved
    Given an internal "cue" contains 2 lines of text
    When the QC check "MaxLines" is run with a threshold of 2
    Then the result for the specific cue should be "Passed"

  # --- MaxCpl (Characters per line) ---
  Scenario: MaxCpl - A line that exceeds the maximum allowed length should be rejected
    Given an internal "cue" contains a line with 45 characters
    When the QC check "MaxCpl" is run with a threshold of 42
    Then the result for the specific cue should be "Failed"

  Scenario: MaxCpl - A line exactly at the maximum allowed length should be approved
    Given an internal "cue" contains a line with 42 characters
    When the QC check "MaxCpl" is run with a threshold of 42
    Then the result for the specific cue should be "Passed"

  Scenario: MaxCpl - A line well below the maximum allowed length should be approved
    Given an internal "cue" contains a line with 20 characters
    When the QC check "MaxCpl" is run with a threshold of 42
    Then the result for the specific cue should be "Passed"

  # --- MaxCps (Characters per second) ---
  Scenario: MaxCps - A subtitle with a high reading speed should be rejected
    Given an internal "cue" contains 60 characters
    And the display duration for the cue is 2.0 seconds
    When the QC check "MaxCps" is run with a threshold of 20 characters per second
    Then the result for the specific cue should be "Failed"

  Scenario: MaxCps - A subtitle with an acceptable reading speed should be approved
    Given an internal "cue" contains 40 characters
    And the display duration for the cue is 2.0 seconds
    When the QC check "MaxCps" is run with a threshold of 20 characters per second
    Then the result for the specific cue should be "Passed"

  # --- MinDuration ---
  Scenario: MinDuration - A subtitle with a very short display duration should be rejected
    Given an internal "cue" has a display duration of 0.5 seconds
    When the QC check "MinDuration" is run with a threshold of 1.0 seconds
    Then the result for the specific cue should be "Failed"

  Scenario: MinDuration - A subtitle meeting the exact minimum duration should be approved
    Given an internal "cue" has a display duration of 1.0 seconds
    When the QC check "MinDuration" is run with a threshold of 1.0 seconds
    Then the result for the specific cue should be "Passed"

  # --- OverlapCheck ---
  Scenario: OverlapCheck - Two subtitles whose time intervals overlap should be rejected
    Given cue A has an end time of 00:01:10.000
    And cue B has a start time of 00:01:09.500
    When the QC check "OverlapCheck" is run
    Then the result for cue B should be "Failed"

  Scenario: OverlapCheck - Two adjacent subtitles with no overlap should be approved
    Given cue A has an end time of 00:01:10.000
    And cue B has a start time of 00:01:10.000
    When the QC check "OverlapCheck" is run
    Then the result for cue B should be "Passed"

  # --- EmptyCueCheck ---
  Scenario: EmptyCueCheck - A subtitle without text content should be rejected
    Given an internal "cue" contains only spaces and line breaks
    When the QC check "EmptyCueCheck" is run
    Then the result for the specific cue should be "Failed"

  Scenario: EmptyCueCheck - A subtitle with valid text content should be approved
    Given an internal "cue" contains the text "Hello world"
    When the QC check "EmptyCueCheck" is run
    Then the result for the specific cue should be "Passed"





Feature: Validation against visual cuts / Shot changes (Iteration 3)
  As a Quality Control Manager
  I want subtitles to be adapted to the video's visual cuts
  In order to prevent the text from disrupting the viewing experience during scene changes

  # --- CrossShotBoundaryCheck ---
  Scenario: CrossShotBoundaryCheck - A subtitle that spans across a cut should be rejected
    Given an internal "cue" has a start time of 00:05:00.000 and an end time of 00:05:04.000
    And external shot change data indicates a cut at 00:05:02.000
    When the QC check "CrossShotBoundaryCheck" is run
    Then the result for the specific cue should be "Failed"

  Scenario: CrossShotBoundaryCheck - A subtitle that ends before a cut should be approved
    Given an internal "cue" has a start time of 00:05:00.000 and an end time of 00:05:01.500
    And external shot change data indicates a cut at 00:05:02.000
    When the QC check "CrossShotBoundaryCheck" is run
    Then the result for the specific cue should be "Passed"

  Scenario: CrossShotBoundaryCheck - A subtitle that starts strictly after a cut should be approved
    Given an internal "cue" has a start time of 00:05:02.500 and an end time of 00:05:04.000
    And external shot change data indicates a cut at 00:05:02.000
    When the QC check "CrossShotBoundaryCheck" is run
    Then the result for the specific cue should be "Passed"

  # --- MinFramesFromShotChange ---
  Scenario: MinFramesFromShotChange - A subtitle that starts too close to a cut should be rejected
    Given a cut (shot change) occurs at frame 1000
    And an internal "cue" starts at frame 1001
    When the QC check "MinFramesFromShotChange" is run with a threshold of 2 frames
    Then the result for the specific cue should be "Failed"

  Scenario: MinFramesFromShotChange - A subtitle that starts exactly at the required frame limit should be approved
    Given a cut (shot change) occurs at frame 1000
    And an internal "cue" starts at frame 1002
    When the QC check "MinFramesFromShotChange" is run with a threshold of 2 frames
    Then the result for the specific cue should be "Passed"

  Scenario: MinFramesFromShotChange - A subtitle that starts safely away from a cut should be approved
    Given a cut (shot change) occurs at frame 1000
    And an internal "cue" starts at frame 1010
    When the QC check "MinFramesFromShotChange" is run with a threshold of 2 frames
    Then the result for the specific cue should be "Passed"
