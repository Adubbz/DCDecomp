#pragma once

// menu_save.cpp calls ExitSaveSelect, which this unit defines static: the PS2 link makes it global
// (object_fixups.json). It gets a global symbol under the name menu_save.cpp references.
static void ExitSaveSelect();

void PortExportExitSaveSelect() asm("_Z14ExitSaveSelectv");

void PortExportExitSaveSelect() {
    ExitSaveSelect();
}
