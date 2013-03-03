Feature: Timeline
  
  Scenario: 5 entries in the timeline
    Given there are 5 timeline entries
    And a user visits the timeline page
    Then he should see 5 timeline blocks
  
