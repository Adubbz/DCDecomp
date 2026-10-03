#include "common.h"

#include <libgraph.h>

#include <cstdlib>

#include "mglib.hpp"
#include "texture.hpp"
#include "title/opening.hpp"
#include "title/script.hpp"

// The bodies are retail's, which pass string literals as char *.
#pragma clang diagnostic ignored "-Wwritable-strings"

template <class T>
class CRect {
public:
    T x;
    T y;
    T w;
    T h;

    CRect(T left, T top, T width, T height) {
        x = left;
        y = top;
        w = width;
        h = height;
    }
};

struct FACE_INFO {
    char *plate;
    char *strip;
    int   eye_bottom;
    int   eye_height;
    int   mouth_bottom;
    int   mouth_height;
    int   eye;
    int   mouth;
    int   strip_bottom;
    int   unk_24;
    int   unk_28;
};

void MoveImageTest(sceVif1Packet *packet, int sbp, int sbw, int spsm, const CRect<int> &rect, int dbp, int dbw,
                   int dpsm, int dsax, int dsay, int dir);

// op_d's FaceChange. The PS2 build renames the four title units' FaceChange apart and binds op_c's
// call to this one as FaceChangeD (config/pal/object_fixups.json); the port gives it that name.
// The texture-cache flushes around the transfers are gone: the copies are ordered on the renderer.
void FaceChangeD(int actor_no) {
    static FACE_INFO face[21] = {
        {0,        0,            42, 40, 87, 35, 0, 0, 256, 2, 0},
        {0,        0,            42, 40, 87, 35, 0, 0, 320, 2, 0},
        {0,        0,            32, 40, 84, 35, 0, 0, 448, 3, 0},
        {"c09a01", "c09a01an",   10, 40, 73, 35, 0, 0, 448, 2, 0},
        {0,        0,            42, 40, 87, 35, 0, 0, 320, 2, 0},
        {0,        0,            42, 40, 87, 35, 0, 0, 320, 2, 0},
        {0,        0,            8,  40, 76, 35, 0, 0, 256, 2, 0},
        {0,        0,            42, 40, 87, 35, 0, 0, 320, 2, 0},
        {0,        0,            42, 40, 87, 35, 0, 0, 320, 2, 0},
        {"p09a01", "p09a01an_3", 44, 40, 92, 32, 0, 0, 192, 2, 0},
        {0,        0,            42, 40, 87, 35, 0, 0, 320, 2, 0},
        {"c01d01", "c01d01an_3", 27, 48, 78, 44, 0, 0, 512, 3, 0},
        {0,        0,            42, 40, 87, 35, 0, 0, 320, 2, 0},
        {0,        0,            42, 40, 87, 35, 0, 0, 320, 2, 0},
        {0,        0,            42, 40, 87, 35, 0, 0, 320, 2, 0},
        {0,        0,            42, 40, 87, 35, 0, 0, 320, 2, 0},
        {0,        0,            42, 40, 87, 35, 0, 0, 320, 2, 0},
        {0,        0,            42, 40, 87, 35, 0, 0, 320, 2, 0},
        {0,        0,            42, 40, 87, 35, 0, 0, 320, 2, 0},
        {0,        0,            42, 40, 87, 35, 0, 0, 320, 2, 0},
        {0,        0,            42, 40, 87, 35, 0, 0, 320, 2, 0}
    };
    CTexture *plate;
    CTexture *strip;
    int       sbp;
    int       dbp;
    int       sbw;
    int       dbw;

    if (face[actor_no].plate == 0) {
        return;
    }

    plate = TexManager.GetTexture(face[actor_no].plate, -1);
    strip = TexManager.GetTexture(face[actor_no].strip, -1);

    if (plate == 0 || strip == 0) {
        return;
    }

    sbp = strip->tex0 & 0x3fff;
    dbp = plate->tex0 & 0x3fff;
    sbw = (strip->tex0 >> 14) & 0x3f;
    dbw = (plate->tex0 >> 14) & 0x3f;

    face[actor_no].eye = CScript__2.obj[actor_no].eye;

    CRect<int> eye(0, face[actor_no].strip_bottom - face[actor_no].eye_height * (face[actor_no].eye + 1), 128, face[actor_no].eye_height);

    MoveImageTest(Vif1Packet, sbp, sbw, SCE_GS_PSMT8, eye, dbp, dbw, SCE_GS_PSMT8, 0, 128 - face[actor_no].eye_height - face[actor_no].eye_bottom, 0);

    if (!Pause) {
        if (CScript__2.obj[actor_no].mouth_time >= CScript__2.motion_step) {
            CScript__2.obj[actor_no].mouth_time -= CScript__2.motion_step;

            if (CScript__2.obj[actor_no].talk) {
                if ((int) (100.0f * CScript__2.obj[actor_no].mouth_time) % 6 == 0) {
                    CScript__2.obj[actor_no].mouth = rand() % 4;
                }
            }
        } else {
            CScript__2.obj[actor_no].mouth = 0;
            CScript__2.obj[actor_no].talk = false;
        }
    }

    face[actor_no].mouth = CScript__2.obj[actor_no].mouth;

    CRect<int> mouth(128, face[actor_no].strip_bottom - face[actor_no].mouth_height * (face[actor_no].mouth + 1), 128, face[actor_no].mouth_height);

    MoveImageTest(Vif1Packet, sbp, sbw, SCE_GS_PSMT8, mouth, dbp, dbw, SCE_GS_PSMT8, 0, 128 - face[actor_no].mouth_height - face[actor_no].mouth_bottom, 0);
}
