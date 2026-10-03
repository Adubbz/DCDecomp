#include "title_port.hpp"

#include <memory>

#include "dataalloc.hpp"
#include "fireomni.hpp"
#include "map.hpp"
#include "mapobject.hpp"
#include "objanime.hpp"
#include "textureanime.hpp"
#include "title/op_a.hpp"
#include "title/op_b.hpp"
#include "title/op_c.hpp"
#include "title/rushmovi.hpp"
#include "water.hpp"

// The title units declare these with PS2 layouts of their own (op_a.cpp's 144-byte OBJ_ANIME_SEQ,
// rushmovi.cpp's 816-byte CWater and so on) and their static constructors still run, after the
// port's, over the port's host-sized objects: at the PS2 stride for the arrays, and through
// op_a.cpp's inline CMap constructor, which builds ten 240-byte map objects. Everything the title
// overlay reads goes through these definitions, so constructing them again before the overlay's
// first mode undoes that.

extern CFireOmni     CFire;
extern OBJ_ANIME_SEQ OP_AnimeSeq[32];
extern CMapObject    OP_NornMapObj[76];
extern CMapObject    OP_NornMapObj2[87];

void TitleOverlayConstruct() {
    for (CMap *map : {&OP_GroundMap, &OP_BuildingMap, &OP_BuildingMap2}) {
        std::construct_at(map);
        // op_a.cpp's CMap constructor initialises the map; map.hpp's leaves that to the caller.
        map->Initialize();
    }
    for (OBJ_ANIME_SEQ &sequence : OP_AnimeSeq) {
        std::construct_at(&sequence);
    }
    for (CMapObject &object : OP_NornMapObj) {
        std::construct_at(&object);
    }
    for (CMapObject &object : OP_NornMapObj2) {
        std::construct_at(&object);
    }
    std::construct_at(&CFire);
    std::construct_at(&CFire__4);
    std::construct_at(&Water);
    std::construct_at(&Water__2);
}
