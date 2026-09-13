#include "map.hpp"

CMapObject *CMap::SetObject(int index, CFrameVu1 *frame, int category_no, int handle) {
    CMapObject *map_object;

    if (index >= 10 || index < 0) {
        return NULL;
    }
    object[index].unk_0E8 = handle;
    object[index].unk_0E4 = category_no;
    map_object = &object[index];
    map_object->SetFrame(frame, 0);
    return map_object;
}
INCLUDE_ASM("asm/nonmatchings/map", SetObject__4CMapFP9CFrameVu1ii);

CMapObject *CMap::GetObject(int index) {
    if (index >= 10 || index < 0) {
        return NULL;
    }
    return &object[index];
}

INCLUDE_ASM("asm/nonmatchings/map", Draw__4CMapFv);
INCLUDE_ASM("asm/nonmatchings/map", Initialize__4CMapFv);
