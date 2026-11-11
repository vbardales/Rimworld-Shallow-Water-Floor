# What only a running game can say about Shallow Water Floor Tile Renew.
#
# The mod is two TerrainDefs and no code. The original could never be built: both terrains asked
# for "HeavyLight", a surface no def declares, so the game's own placement check refused every
# tile. That refusal is exactly what this suite has to see gone, and only a colonist placing a
# real blueprint on real soil shows it. Static facts (fertility, path cost, affordances including
# Bridgeable) are not asserted here: the terrain-stats log below carries them and a reader checks
# that attachment against TESTING.md.
#
# Free 9 x 9 area of test-colony, origin (68, 83): docs/FIXTURES.md of PickleTools. The first
# step after loading sets the game speed, because the build step fails on a paused game.
# `the decor is removed` goes last: it puts the old terrain back.
@requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.screenshotstudio
Feature: both terrains can be built on soil

  Background:
    Given the save "test-colony" is loaded

  Scenario: the loaded terrains carry the values the mod set
    Given Nelim's Pickle Tools: the terrains of the mod "Shallow Water Floor Tile Renew (unofficial)" are logged
    Then no errors were logged

  @timeout:300
  Scenario: a colonist builds shallow water on soil
    Given game speed is ultrafast
    When Nelim's Pickle Tools: a colonist builds the floor "RuneWaterShallow" from (70, 85) to (71, 85)
    Then Nelim's Pickle Tools: the terrain of the cell (70, 85) is "RuneWaterShallow"
    And Nelim's Pickle Tools: the terrain of the cell (71, 85) is "RuneWaterShallow"
    And no errors were logged
    When Nelim's Pickle Tools: the decor is removed

  @timeout:300
  Scenario: a colonist builds fertile water on soil
    Given game speed is ultrafast
    When Nelim's Pickle Tools: a colonist builds the floor "RuneFertileWater" from (70, 87) to (71, 87)
    Then Nelim's Pickle Tools: the terrain of the cell (70, 87) is "RuneFertileWater"
    And Nelim's Pickle Tools: the terrain of the cell (71, 87) is "RuneFertileWater"
    And no errors were logged
    When Nelim's Pickle Tools: the decor is removed
