# PAL prototype changelog

Changes in the European prototype of Dark Cloud (July 12, 2001), compared with
the North American release (NTSC 1.02). Everything here comes from the
decompiled code.

## Languages

### Added
- Five European languages: British English, French, German, Italian and Spanish.
  British English is the default.
- A language select screen when the game starts.
- Translated versions of the title screen, opening scenes, pause image, dungeon
  images, loading screens, menus, event text and town text. The game loads the
  file for the chosen language.
- An accented-letter keyboard on the name entry screen, with its own set of
  letters for each language.
- Extra special characters in the message font.

### Changed
- Menus, windows and help boxes change their widths and text positions to fit
  each language.
- The floor name shown when you enter a dungeon is centred for each language.

## Display

### Changed
- The game runs at 50 Hz with a 640×480 picture, up from 640×448. Menus,
  fades, backgrounds and screen effects are resized to fill the taller screen.
- The options menu has a new row for moving the picture. It moves up to 32
  pixels in each direction.

## Timing

The game runs 50 frames a second instead of 60, so timings are adjusted to take
the same real time.

### Changed
- Character animations play one fifth faster.
- Cutscenes in the opening and title sequence speed up fades, dances, moving
  scenery and effects. Their sound cues come earlier to match.
- Loading screen logos stay up for fewer frames.
- Some attack timing windows for Ruby and Jinn are slightly wider.
- Opening scene characters move their mouths at random instead of following a
  timer.

## Debug features

The prototype still has the developers' debug mode. On the second controller,
hold L1, L2, R1 and R2 while the game starts to turn it on. To switch it on or
off later, hold the same four buttons and press R3.

### Added
- **Start-up:** with debug mode on, the game skips the language select and
  starts at the developer menu.
- **Town editor:** L3 shows positions and camera data. R3 opens a debug menu
  that can:
  - move the camera
  - change parameters and characters
  - test messages and movement
  - run events
  - change the language
  - edit game flags
  - play music and sound effects
- **Leaving an area:** Select and Start together leave the town editor or the
  dungeon.
- **Doors:** Select opens any door in town.
- **Dungeons:** R3 opens a debug menu. When the party falls, it gets back up
  at full health instead of losing.
- **Floor select:** you can open every floor of a dungeon and change a floor's
  kill count.
- **Menus and shops:** second-controller shortcuts change health, water,
  defense, money, weapon level and stats, and party members. They also open an
  item list.
- **Georama board:** shortcuts fill, empty or complete a building's parts.
- **Fishing:** every fish notices the bait, and a hooked fish lands on its
  own. Shortcuts change fishing points and record catches.
- **Event scenes:** you can pause the scene and its music.
- **Save screen:** shortcuts jump between memory card steps.
- More messages are printed to the developer console.

### Changed
- The second controller stays active; the North American release turns it off.
  Holding Select on it makes the game act as if every button is held on the
  first controller, and holding Start on it counts as holding Start.

## Other changes

### Added
- A music on/off switch and a music pause. The debug menu uses them.

### Changed
- Saves go in a folder named for the European product code, SCES-50295.
- The game finds files on the disc with a simple list that ignores capital
  letters, instead of a name tree.
- The battle menu keeps its textures in six groups instead of five, and
  reloads them before drawing.
- Shop models are moved half a unit vertically.
- Treasure chest and Atla pickup scenes set the player's pose at a fixed
  moment.

### Removed
- The title screen no longer loads the trial version image.
