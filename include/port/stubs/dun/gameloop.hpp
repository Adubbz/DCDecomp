#pragma once

// editloop.cpp defines MainDraw() and MoveChara() too. The PS2 link renames this unit's copies
// (object_fixups.json); without that, the port's merge would keep one of each for both modes.
// src/port/dun/gameloop.cpp replaces DunMainDraw.
#define MainDraw DunMainDraw
#define MoveChara DunMoveChara
