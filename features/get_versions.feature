Feature: Get versions

  Scenario: Running specs
    Given "specs ruby"
    Then the output has "ruby --version"

    Given "specs ruby"
    Then the output has "gem --version"

    Given "specs ruby"
    Then the output has "bundle --version"

    Given "specs rake"
    Then the output has "rake --version"

    Given "specs --version"
    Then the output has "https://github.com/mcandre/specs"

    Given "specs gem:specs"
    Then the output has "specs"
