#include "map.hpp"

INCLUDE_ASM("asm/nonmatchings/map", SetObject__4CMapFiP9CFrameVu1ii);
INCLUDE_ASM("asm/nonmatchings/map", SetObject__4CMapFP9CFrameVu1ii);

CMapObject *CMap::GetObject(int index) {
    if (index >= 10 || index < 0) {
        return NULL;
    }
    return &object[index];
}

INCLUDE_ASM("asm/nonmatchings/map", Draw__4CMapFv);
INCLUDE_ASM("asm/nonmatchings/map", Initialize__4CMapFv);
