# The two terrains must be offered to the player. A separate file so that a failure here (the
# step reads building defs; a terrain designator may not match it) does not hide the build proof
# of 01. The failure text says what the tab holds.
@requires:nelim.pickletools.colonistrace
Feature: both terrains are listed in the Floors tab

  Background:
    Given the save "test-colony" is loaded

  Scenario: the Floors tab lists both terrains
    When Nelim's Pickle Tools: I open the architect tab "Floors"
    Then Nelim's Pickle Tools: the architect tab "Floors" lists the def "RuneWaterShallow"
    And Nelim's Pickle Tools: the architect tab "Floors" lists the def "RuneFertileWater"
