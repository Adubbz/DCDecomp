#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 338

#include "common.h"

#include <libgraph.h>
#include <libpkt.h>
#include <libvu0.h>
#include <sifdev.h>

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "boxvu0.hpp"
#include "camera.hpp"
#include "character.hpp"
#include "clsmes.hpp"
#include "debugfont.hpp"
#include "dngstatusdata.hpp"
#include "edit.hpp"
#include "editground.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "gamepad.hpp"
#include "mapparts.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "objanime.hpp"
#include "rect.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "sound.hpp"
#include "texture.hpp"

/* Retail editetc.cpp: shared editor presentation, sound, menus and message helpers. */

static int AddStr(CDebugFont *font, char *str);
static void DrawBound(CFrame *frame);
static void DrawLine(int *from, int *to, u_char r, u_char g, u_char b, u_char a);

struct SOUND_SRC {
    int se;
    int num;
    float vol[16];
    float pan[16];
};

void DepthOfField(float *dist, int level, int alpha, int blur);

struct EPARTS_FUNC_DATA;

int InitEditEffect(CFrame *frame, EPARTS_FUNC_DATA *func, EDIT_EFFECT_INFO *info);

class CCamera;

int TransWepNo(int item);
int TransWepNoNewToOld(int item);
void ClearSystemMes();
void SetInteriorOutFlag(int flag);
void EdSaveFrameImage(CTexture texture);
void EditMenuInit(int *texture_block, int first);
int BattleMenuCursor();
void BattleMenuDraw();
void BattleMenuInit(int *texture_block, int mode);
int ShopNoInput(int *texture_block, int shop, int mode);
int CommonShopLoop();
void InitEventItemSelect(int texture_block, int *list, ITEM_PACK *pack, int x, int y, int mode,
                         int kind);
int EventItemSelectLoop(int *item);
void InitNameRegist(int chara, int texture_block, u_long128 *buffer);
int NameEnterKey();
void NameEnterDraw();
void InitMenuMove(int mode, int texture_block, u_long128 *buffer);
int MenuMoveKey();
void DrawMenuMove();
void InitFishingExchange(u_long128 *buffer, int *texture_block, int mode);
int FishingExchangeLoop();
void InitFishRecordView(u_long128 *buffer, int *texture_block, int mode);
int FishRecordViewLoop();

/* 28 bytes nothing reads other than a word at a time, so it is spelled as words rather than as a
   layout nothing supports. */
extern int EditMenuStatus[7];
extern u_int *read_buffer;

extern ClsMes EditSystemMes;
extern int MapNo;

void ClearSystemMes();
int SystemMesCheck();
void SystemMesStep();
void SystemMesDraw();
void ItemGetMes(int item, int count, int attach, int mode);
int GetAtraMsgNo(int map, int no);
void setbilinear(int on);

/* The map editor's own debug layer: a text overlay anything may append a line to, a free camera
   and a free character driven straight off the pad, and a wireframe box drawn through the GS by
   hand because nothing else in the game draws lines.
   Two switches gate all of it. Debug starts on and EdDDebug turns it off for good - the argument
   it is handed is not read - so a build reaches the overlay only until the first call. DebugFont
   is null until somebody hands one over, and every entry point checks it, because the overlay
   writes into that object's buffer rather than one of its own. */
static int Debug = 1;
static CDebugFont *DebugFont;

void EdDDebug(int on) {
    Debug = 0;
}

void EdDSetFont(CDebugFont *font) {
    DebugFont = font;
}

/* The frame counter is printed first, so it stands at the top of whatever the frame appended
   after it. With the overlay switched off the buffer is still emptied every frame, which is what
   keeps a switched-off build from overrunning it. */
void EdDDrawFont() {
    char work[112];
    static int count = 0;

    if (DebugFont == 0)
        return;

    sprintf(work, "%d\n", count++);
    EdDPrint(work);

    if (Debug == 0) {
        DebugFont->len = 0;
        return;
    }

    TexManager.ReloadTexture(GetVif1Packet(), 31);
    DebugFont->Draw();
}

/* The overflow guard for the frames nothing draws the overlay on: the buffer is 512 bytes and a
   line is short, so emptying it at 500 leaves room for whatever is already on its way in. */
void EdDCheck() {
    if (DebugFont == 0)
        return;
    if (DebugFont->len > 500)
        DebugFont->len = 0;
}

void EdOutPutFile() {
    int fd;

    if (Debug == 0)
        return;
    if (DebugFont == 0)
        return;

    fd = sceOpen("host0:debug.txt", SCE_WRONLY | SCE_CREAT | SCE_TRUNC);
    if (fd < 0)
        return;

    sceWrite(fd, DebugFont->text, DebugFont->len);
    sceClose(fd);
}

/* The append is length-counted on the way out, and the length it adds goes to whatever DebugFont
   points at now rather than to the object it was handed. */
static int AddStr(CDebugFont *font, char *str) {
    int len;

    len = strlen(str);
    strcpy(&font->text[font->len], str);
    DebugFont->len += len;
    return len;
}

void EdDPrintVector(char *name, float *vector) {
    char work[128];

    if (Debug == 0)
        return;
    if (DebugFont == 0)
        return;

    sprintf(work, "%s %7.2f,%7.2f,%7.2f\n", name, vector[0], vector[1], vector[2]);
    AddStr(DebugFont, work);
}

void EdDPrint(char *str) {
    if (Debug == 0)
        return;
    if (DebugFont == 0)
        return;

    AddStr(DebugFont, str);
}

/* The free camera: the sticks move the eye in the plane the eye already looks along, so pushing
   forward closes on whatever is being looked at whichever way the camera faces, and the shoulder
   buttons swing it around the reference point at a rate proportional to how far away it is.
   R1 drags the reference point along with the eye, which is what turns a swing into a pan, and
   the D-pad works the field of view. The box is drawn where the reference point is, so the point
   being orbited is visible. */
void EdDMoveCamera(float *pos, float *ref) {
    sceVu0FVECTOR dir;
    sceVu0FVECTOR move;
    float dist;
    float angle;
    float x;
    float y;
    float z;
    float projection;
    int i;

    if (Debug == 0)
        return;

    sceVu0SubVector(dir, ref, pos);
    dist = sqrtf(dir[0] * dir[0] + dir[2] * dir[2]);
    angle = atan2f(dir[0], dir[2]);

    x = -GamePad.GetLXf();
    if (GamePad.On(8))
        x = 0.02f * dist;
    if (GamePad.On(4))
        x = 0.02f * -dist;
    y = -GamePad.GetRYf();
    z = -GamePad.GetLYf();

    move[0] = x * cosf(angle) + z * sinf(angle);
    move[1] = y;
    move[2] = z * cosf(angle) - x * sinf(angle);
    if (GamePad.On(64))
        sceVu0ScaleVector(move, move, 3.0f);

    sceVu0AddVector(pos, pos, move);
    if (GamePad.On(128) && !GamePad.On(12))
        sceVu0AddVector(ref, ref, move);

    projection = MGGetProjection();
    if (GamePad.On(8192))
        projection += 1.0f;
    if (GamePad.On(32768))
        projection -= 1.0f;
    if (projection < 100.0f)
        projection = 100.0f;
    if (projection > 2000.0f)
        projection = 2000.0f;
    MGSetProjection(projection);

    {
        CFrame frame;
        float unit[2] = {-1.0f, 1.0f};

        for (i = 0; i < 8; i++) {
            frame.corner[i][0] = unit[(i & 1) != 0];
            frame.corner[i][1] = unit[(i & 2) != 0];
            frame.corner[i][2] = unit[(i & 4) != 0];
            frame.corner[i][3] = 1.0f;
        }
        frame.SetPosition(ref);
        DrawBound(&frame);
    }
}

/* The same camera driven from the other end: the sticks move the reference point and R1 drags the
   eye after it, which is what lets the point being orbited be placed before it is orbited. */
void EdDMoveCameraRef(float *pos, float *ref) {
    sceVu0FVECTOR dir;
    sceVu0FVECTOR move;
    float dist;
    float angle;
    float x;
    float y;
    float z;
    int i;

    if (Debug == 0)
        return;

    sceVu0SubVector(dir, ref, pos);
    dist = sqrtf(dir[0] * dir[0] + dir[2] * dir[2]);
    angle = atan2f(dir[0], dir[2]);

    x = -GamePad.GetLXf();
    if (GamePad.On(8))
        x = 0.02f * -dist;
    if (GamePad.On(4))
        x = 0.02f * dist;
    y = GamePad.GetRYf();
    z = -GamePad.GetLYf();

    move[0] = x * cosf(angle) + z * sinf(angle);
    move[1] = y;
    move[2] = z * cosf(angle) - x * sinf(angle);

    sceVu0AddVector(ref, ref, move);
    if (GamePad.On(128) && !GamePad.On(12))
        sceVu0AddVector(pos, pos, move);

    {
        CFrame frame;
        float unit[2] = {-1.0f, 1.0f};

        for (i = 0; i < 8; i++) {
            frame.corner[i][0] = unit[(i & 1) != 0];
            frame.corner[i][1] = unit[(i & 2) != 0];
            frame.corner[i][2] = unit[(i & 4) != 0];
            frame.corner[i][3] = 1.0f;
        }
        frame.SetPosition(ref);
        DrawBound(&frame);
    }
}

/* The free character: the same plane-relative stick mapping as the camera, plus a facing the
   shoulder buttons turn and keep inside one revolution, and a uniform scale the face buttons
   work. Triangle re-aims the camera at the body rather than at the feet, which is why the height
   of the body is what the reference point is lifted by.
   The box is ten across and twenty tall - a stand-in for the body rather than the body's own
   size - and it is drawn with the character's own rotation so the facing can be seen. */
void EdDMoveChara(CCharacter *chara, CCamera *camera) {
    sceVu0FVECTOR pos;
    sceVu0FVECTOR camera_pos;
    sceVu0FVECTOR camera_ref;
    sceVu0FVECTOR rot;
    sceVu0FVECTOR dir;
    sceVu0FVECTOR move;
    float angle;
    float speed;
    float x;
    float y;
    float z;
    float scale;
    int i;

    if (chara == 0)
        return;

    chara->GetPosition(pos);
    chara->GetRotation(rot);
    camera->GetPos(camera_pos);
    camera->GetRef(camera_ref);

    sceVu0SubVector(dir, camera_ref, camera_pos);
    angle = atan2f(dir[0], dir[2]);
    speed = 0.5f;

    x = -GamePad.GetLXf();
    y = -GamePad.GetRYf();
    z = -GamePad.GetLYf();

    if (GamePad.On(8))
        rot[1] += -0.06f;
    if (GamePad.On(4))
        rot[1] += 0.06f;
    if (rot[1] > 3.141592f)
        rot[1] -= 6.283184f;
    if (rot[1] < -3.141592f)
        rot[1] += 6.283184f;

    move[0] = x * cosf(angle) + z * sinf(angle);
    move[1] = y;
    move[2] = z * cosf(angle) - x * sinf(angle);
    if (GamePad.On(128))
        speed = 1.0f;

    sceVu0ScaleVector(move, move, speed);
    sceVu0AddVector(pos, pos, move);
    chara->SetPosition(pos);
    chara->SetRotation(rot);

    if (GamePad.Down(16)) {
        sceVu0CopyVector(camera_ref, pos);
        camera_ref[1] += 0.7f * chara->body_height;
        camera->SetRef(camera_ref);
    }

    scale = chara->ambient_offset[0];
    if (GamePad.On(2))
        scale += 0.1f;
    if (GamePad.On(1))
        scale -= 0.1f;
    if (scale != chara->ambient_offset[0]) {
        chara->ambient_offset[0] = scale;
        chara->ambient_offset[1] = scale;
        chara->ambient_offset[2] = scale;
    }

    {
        CFrame frame;
        float ground[2] = {-5.0f, 5.0f};
        float height[2] = {0.0f, 20.0f};

        for (i = 0; i < 8; i++) {
            frame.corner[i][0] = ground[(i & 1) != 0];
            frame.corner[i][1] = height[(i & 2) != 0];
            frame.corner[i][2] = ground[(i & 4) != 0];
            frame.corner[i][3] = 1.0f;
        }
        frame.SetPosition(pos);
        frame.SetRotation(rot[0], rot[1], rot[2]);
        DrawBound(&frame);
    }
}

/* The box drawn as twelve edges of the frame's own corner list, taken to the screen in one go and
   drawn only if every corner survived: a box with one corner behind the eye would otherwise be
   drawn through a projected point that means nothing. */
static void DrawBound(CFrame *frame) {
    int screen[8][4];
    sceVu0FVECTOR world[8];
    sceVu0FMATRIX matrix;
    int i;
    int visible;

    if (frame == 0)
        return;

    frame->GetLWMatrix(matrix);
    visible = 1;
    ApplyMatrixN(world, matrix, frame->corner, 8);
    for (i = 0; i < 8; i++) {
        visible &= MGRotTransPers(screen[i], world[i], 0);
    }
    if (visible == 0)
        return;

    DrawLine(screen[0], screen[1], 128, 64, 64, 80);
    DrawLine(screen[1], screen[5], 128, 64, 64, 80);
    DrawLine(screen[5], screen[4], 128, 64, 64, 80);
    DrawLine(screen[4], screen[0], 128, 64, 64, 80);
    DrawLine(screen[2], screen[3], 128, 64, 64, 80);
    DrawLine(screen[3], screen[7], 128, 64, 64, 80);
    DrawLine(screen[7], screen[6], 128, 64, 64, 80);
    DrawLine(screen[6], screen[2], 128, 64, 64, 80);
    DrawLine(screen[0], screen[2], 128, 64, 64, 80);
    DrawLine(screen[4], screen[6], 128, 64, 64, 80);
    DrawLine(screen[5], screen[7], 128, 64, 64, 80);
    DrawLine(screen[1], screen[3], 128, 64, 64, 80);
}

/* One line straight into the frame's packet as an A+D list, which is the only way this game draws
   one at all. The depth test is left enabled with a comparison that never rejects, so the line
   comes out over whatever is already in front of it, and the two registers that costs are put back
   at the end of the same list, so whatever draws next finds the state this found. */
static void DrawLine(int *from, int *to, u_char r, u_char g, u_char b, u_char a) {
    sceVif1Packet *packet;
    sceGsTest test;
    sceGsZbuf zbuf;
    float q;

    q = 1.0f;
    packet = GetVif1Packet();

    test = mgPixelTest;
    test.bits.ate = 0;
    test.bits.aref = 0;
    test.bits.atst = SCE_GS_ALWAYS;
    test.bits.zte = 1;
    test.bits.ztst = SCE_GS_ALWAYS;

    zbuf = mgZBuffer;

    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);

    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &test);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &zbuf);
    sceVif1PkAddGsAD(packet, SCE_GS_PRIM,
                     SCE_GS_SET_PRIM(SCE_GS_PRIM_LINE, 0, 0, 0, 1, 0, 1, 0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_RGBAQ, SCE_GS_SET_RGBAQ(r, g, b, a, *(u_int *) &q));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(from[0], from[1], from[2], 0));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(to[0], to[1], to[2], 0));
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &mgZBuffer);

    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

INCLUDE_ASM("asm/nonmatchings/edit", EdSetBgmVol__Ff);
INCLUDE_ASM("asm/nonmatchings/edit", EdAmbientPlay__Ff);
INCLUDE_ASM("asm/nonmatchings/edit", EdSetAmbientVol__Ff);
/* The sound the map editor puts in the world: every effect a map part carries that names a sound
   is measured against the camera each frame, and what survives is entered into one of four
   sources. A source is one sound effect and the set of places it is coming from at once, so a
   fountain heard from two sides occupies one slot and arrives as a single volume and a single
   pan. */
static SOUND_SRC sound_src[4];
static int now_play_se[4];
static int now_play_se_flag[4];

static void init_sound_src() {
    int i;

    for (i = 0; i < 4; i++) {
        sound_src[i].se = -1;
        sound_src[i].num = 0;
    }
}

/* The slot a sound effect already occupies, or a free one, or nothing - which is what caps the
   world at four sounds at once. */
static SOUND_SRC *get_sound_src(int se) {
    int i;

    for (i = 0; i < 4; i++) {
        if (se == sound_src[i].se)
            return &sound_src[i];
    }
    for (i = 0; i < 4; i++) {
        if (sound_src[i].se < 0)
            return &sound_src[i];
    }
    return 0;
}

/* Whether the effect is already sounding, answered by claiming a channel for it when it is not:
   one for a sound that was playing, zero for one the caller now has to start, and -1 when every
   channel is spoken for. The flag beside the channel is what keeps this frame's sounds alive past
   the sweep at the end of the frame. */
static int check_se_play(int se) {
    int i;

    if (se < 0)
        return 0;
    for (i = 0; i < 4; i++) {
        if (se == now_play_se[i]) {
            now_play_se_flag[i] = 1;
            return 1;
        }
    }
    for (i = 0; i < 4; i++) {
        if (now_play_se[i] < 0) {
            now_play_se[i] = se;
            now_play_se_flag[i] = 1;
            return 0;
        }
    }
    return -1;
}

void EdInitSoundSrc() {
    int i;

    for (i = 0; i < 4; i++) {
        now_play_se[i] = -1;
        now_play_se_flag[i] = 0;
    }
    init_sound_src();
}

/* The frame's sources turned into commands. A sound gets one volume and one pan out of however
   many places it was entered from: the volumes add, and the pan is their average weighted by the
   same volumes, so the nearer place decides where the sound sits. Whatever was playing and was not
   entered this frame is stopped at the end, which is what a source leaving the camera behind comes
   to. */
void EdPlaySoundSrc() {
    int i;
    int j;
    int se;
    int playing;
    float volume;
    float pan;

    for (i = 0; i < 4; i++) {
        now_play_se_flag[i] = 0;
    }
    for (i = 0; i < 4; i++) {
        se = sound_src[i].se;
        if (se < 0)
            continue;
        playing = check_se_play(se);
        if (playing < 0)
            continue;
        if (playing == 0)
            SndSePlay(se, 0, 0);
        volume = 0.0f;
        for (j = 0; j < sound_src[i].num; j++) {
            volume += sound_src[i].vol[j];
        }
        pan = 0.0f;
        for (j = 0; j < sound_src[i].num; j++) {
            pan += sound_src[i].pan[j] * sound_src[i].vol[j] / volume;
        }
        if (volume > 1.0f)
            volume = 1.0f;
        SndSetSeVolf(se, volume, 0);
        if (pan > 1.0f)
            pan = 1.0f;
        if (pan < -1.0f)
            pan = -1.0f;
        SndSetSePanf(se, pan, 0);
    }
    for (i = 0; i < 4; i++) {
        if (now_play_se_flag[i])
            continue;
        if (now_play_se[i] < 0)
            continue;
        SndSeStop(now_play_se[i], 0);
        now_play_se[i] = -1;
    }
}

void EdStopSoundSrc() {
    int i;

    for (i = 0; i < 4; i++) {
        if (now_play_se[i] < 0)
            continue;
        SndSeStop(now_play_se[i], 0);
        now_play_se[i] = -1;
    }
    SndSeStop(54, 0);
    SndSeStop(52, 0);
}

/* How far a point is from a segment, and where on the segment it is nearest to. The projection is
   taken first and answers both when it falls inside the segment; outside it, the nearer end is the
   answer and the distance is the distance to that end. */
static float GetDistLine(float *point, float *from, float *to, float *near_point) {
    sceVu0FVECTOR offset;
    sceVu0FVECTOR to_offset;
    sceVu0FVECTOR projection;
    sceVu0FVECTOR line;
    float length;
    float from_dist;
    float to_dist;
    float t;

    sceVu0SubVector(offset, from, point);
    sceVu0SubVector(to_offset, to, point);
    sceVu0SubVector(line, to_offset, offset);
    length = DistVector(line);
    length = length * length;
    t = -sceVu0InnerProduct(offset, line) / length;
    if (t < 0.0f || t > 1.0f) {
        from_dist = DistVector(point, from);
        to_dist = DistVector(point, to);
        if (from_dist < to_dist) {
            sceVu0CopyVector(near_point, from);
            return from_dist;
        }
        sceVu0CopyVector(near_point, to);
        return to_dist;
    }
    sceVu0ScaleVector(projection, line, t);
    sceVu0AddVector(projection, offset, projection);
    sceVu0AddVector(near_point, projection, point);
    return DistVector(projection);
}

/* Every effect of every part measured against the camera, and the sources rebuilt from scratch:
   nothing survives a frame, so a part that stopped being audible simply is not entered again. The
   part's own frame is moved first because the effects hang off it, and a door is the one source
   the part itself carries rather than one of its effects. */
void EdSetSoundSrcVol(float time, CMapParts **parts, int count, float *camera_pos,
                      float *camera_rot) {
    int i;
    int j;
    CFrame *frame;
    EDIT_EFFECT_INFO *info;
    int se;
    SOUND_SRC *src;
    SOUND_SRC *door_src;
    float dist;
    float far_dist;
    float near_dist;
    sceVu0FVECTOR position;
    sceVu0FVECTOR rotation;
    sceVu0FVECTOR from;
    sceVu0FVECTOR to;
    sceVu0FVECTOR line;
    float volume;
    float pan;
    float door_volume;
    float door_pan;

    SndSetCamera(camera_pos, camera_rot);
    init_sound_src();
    for (i = 0; i < count; i++) {
        if (parts[i] == 0)
            continue;
        frame = parts[i]->frame[0];
        if (frame == 0)
            continue;
        parts[i]->GetPosition(position);
        frame->SetPosition(position);
        parts[i]->GetRotation(rotation);
        frame->SetRotation(rotation[0], rotation[1], rotation[2]);
        for (j = 0; j < 24; j++) {
            info = parts[i]->effect[j];
            if (parts[i]->effect_on[j] == 0)
                continue;
            if (info == 0)
                continue;
            if (info->kind != 7 && info->kind != 1 && info->kind != 2)
                continue;
            if (info->frame == 0)
                continue;
            if (CheckEditEffect(info, time) == 0)
                continue;
            info->frame->GetWorldPosition(from, info->offset);
            if (info->colour[3] == 1.0f) {
                info->frame->GetWorldPosition(to, info->colour);
                sceVu0CopyVector(line, from);
                dist = GetDistLine(camera_pos, line, to, from);
            } else {
                dist = DistVector(camera_pos, from);
            }
            far_dist = info->far_distance;
            near_dist = info->near_distance;
            se = (int) info->sound_no;
            /* A torch and a fire are one sound at one range whatever the description says. */
            if (info->kind == 1 || info->kind == 2) {
                se = 54;
                near_dist = 20.0f;
                far_dist = 150.0f;
            }
            if (dist > far_dist)
                continue;
            src = get_sound_src(se);
            if (src == 0)
                continue;
            SndGetVolPan(&volume, &pan, from, near_dist, far_dist);
            src->se = se;
            if (src->num < 16) {
                src->vol[src->num] = volume;
                src->pan[src->num] = pan;
                src->num++;
            }
        }
        if (parts[i]->unk_118 != 2)
            continue;
        if (DistVector(camera_pos, position) >= 300.0f)
            continue;
        door_src = get_sound_src(52);
        if (door_src == 0)
            continue;
        SndGetVolPan(&door_volume, &door_pan, position, 100.0f, 300.0f);
        door_src->se = 52;
        if (door_src->num < 16) {
            door_src->vol[door_src->num] = door_volume;
            door_src->pan[door_src->num] = door_pan;
            door_src->num++;
        }
    }
    EdPlaySoundSrc();
}

INCLUDE_ASM("asm/nonmatchings/edit", EdDoorOpenSe__FiPf);
INCLUDE_ASM("asm/nonmatchings/edit", EdDoorCloseSe__FiPf);
INCLUDE_ASM("asm/nonmatchings/edit", EdGetDoorMotion__Fii);
/* The map editor's depth of field: one description at a time, taken from the map's own data or
   replaced by a default set, and handed every frame to the effect the rest of the game draws. */
static DEPTH_OF_FIELD_INFO dof;

void EdSetDOFLevel(int level) {
    dof.level = level;
    if (level == 0) {
        dof.start = ConvertTime(0.0f);
        dof.end = ConvertTime(24.0f);
        dof.distance[0] = 400.0f;
        dof.distance[1] = 1000.0f;
        dof.level = 2;
        dof.alpha = 64;
        dof.blur = 0;
    }
}

void EdSetDOF(DEPTH_OF_FIELD_INFO *info) {
    dof = *info;
    EdSetDOFLevel(info->level);
}

/* The argument is a cap rather than the level to draw at, so a configuration that asks for less
   than the map does gets less and one that asks for more does not get more. */
void EdDrawDOF(int level) {
    int lv;

    lv = dof.level;
    if (lv < 0)
        return;
    if (level < lv)
        lv = level;
    DepthOfField(dof.distance, lv, dof.alpha, dof.blur);
}

/* The lightning three of the game's towns get, which is a model node shown for a few frames and a
   flash added to the parallel lights rather than anything drawn over the frame. The node is named
   in the ground's own model, so a map without it is simply a map without lightning. */
static int thunder_count;
static int start_thunder;
static int next_thunder_cnt;
static sceVu0FMATRIX thd_light;
static sceVu0FMATRIX thd_color;

void EdInitThunderEffect() {
    thunder_count = 0;
    next_thunder_cnt = 60;
    start_thunder = 0;
}

void EdThunderEffect(int map, CEditGround *ground) {
    CFrame *frame;
    sceVu0FMATRIX color;
    sceVu0FMATRIX light;
    int i;
    int j;
    int light_no;
    int channel;

    if (map == 40 || map == 50 || map == 24) {
        frame = ground->frame;
        if (frame)
            frame = frame->SearchFrame("inazuma");
        if (frame == 0)
            return;
        /* The lights the map itself is lit by, kept from the first flash so that every later one
           decays back to them rather than to whatever the previous flash left. */
        if (start_thunder == 0)
            MGGetPLight(thd_light, thd_color);
        MGGetPLight(light, color);
        if (thunder_count > 0) {
            frame->attr.draw_on = 1;
        } else {
            thunder_count = 0;
            if (next_thunder_cnt == 0) {
                thunder_count = 4;
                for (light_no = 0; light_no < 2; light_no++) {
                    for (channel = 0; channel < 3; channel++) {
                        thd_color[light_no][channel] = 255.0f;
                    }
                }
                SndSePlay(rand() % 6 + 67, -1, 0);
                if (start_thunder == 0) {
                    SndSePlay(74, -1, 0);
                    start_thunder = 1;
                }
                next_thunder_cnt = rand() % 200 + 10;
            }
            frame->attr.draw_on = 2;
        }
        thunder_count--;
        next_thunder_cnt--;
        for (i = 0; i < 2; i++) {
            for (j = 0; j < 3; j++) {
                thd_color[i][j] -= 6.0f;
                if (thd_color[i][j] < color[i][j])
                    thd_color[i][j] = color[i][j];
            }
        }
        MGSetPLight(light, thd_color);
    }
}

INCLUDE_RODATA("asm/nonmatchings/edit", @435);

INCLUDE_ASM("asm/nonmatchings/edit", EdDrawCharacter__FP10CCharacteriiP12CNPCharacterPiiP13ED_EVENT_INFO);

/* Giving a map part one more effect: the description table is scanned from the front for an entry
   nothing has claimed, the effect is built on the part's own frame, and the part is told which
   entry it now owns. The part's slot table is what the sound and the drawing walk later, so an
   effect that is built and not registered here is an effect nothing ever reaches. */
void EnterPartsEffect(CMapParts *parts, EPARTS_FUNC_DATA *func, EDIT_EFFECT_INFO *info, int count) {
    int i;
    int j;

    /* The last entry is never handed out, so a full table refuses rather than overruns. */
    for (i = 1; i <= count; i++, info++) {
        if (i == count)
            return;
        if (info->kind <= 0)
            break;
    }
    if (InitEditEffect(parts->frame[0], func, info) == 0)
        return;
    for (j = 0; j < 24; j++) {
        if (parts->effect_on[j] == 0) {
            parts->effect_on[j] = 1;
            parts->effect[j] = info;
            return;
        }
    }
}

/* The map editor's gate in front of the menus the town runs: one mode word says which menu is up,
   and the same four calls — enter, finish entering, step, leave — reach whichever it is. The menus
   themselves live elsewhere and are only ever named from here.
   Entering takes four frames rather than one and nothing here says what the other three are for:
   the counter below is set by the first call and only the fourth reaches a menu. */
static int init_menu_cnt;
static int menu_mode;
static int use_item;
static int shop_no;
static int name_reg_chara;
static int use_item_list[32];

/* The item numbering the menus use is not the one the rest of the game passes around: weapons are
   renumbered on the way in and back again on the way out, so every item number crossing this gate
   goes through one of these two. */
static int ConvertItemNo(int item) {
    return TransWepNo(item);
}

static int InvertItemNo(int item) {
    return TransWepNoNewToOld(item);
}

void EdUseItemInit() {
    use_item_list[0] = 100;
    use_item_list[1] = -1;
    use_item = -1;
}

void EdSetUseItem(int *list) {
    int i;

    for (i = 0; i < 32; i++) {
        use_item_list[i] = ConvertItemNo(list[i]);
        if (use_item_list[i] < 0)
            break;
    }
}

int EdGetUseItem() {
    return InvertItemNo(use_item);
}

void EdSetNameRegChara(int chara) {
    name_reg_chara = chara;
}

void EdSetShopNo(int shop) {
    shop_no = shop;
}

int EdInitMenu(int mode) {
    menu_mode = mode;
    init_menu_cnt = 0;
    if (mode <= 0)
        return 0;
    MGFlipWaitVSync(1);
    EdClearSystemMes();
    ClearSystemMes();
    SetInteriorOutFlag(0);
    return 1;
}

/* The frame the menu is actually built on: the picture behind it is kept first, because the menus
   draw over a still of the last game frame rather than over the game. */
int EdInitModeFinish(CCamera *camera, CTexture *texture) {
    init_menu_cnt++;
    if (init_menu_cnt > 3)
        init_menu_cnt = 4;
    if (init_menu_cnt < 4)
        return 0;
    if (texture)
        EdSaveFrameImage(*texture);
    GamePad.MenuModeOn(120);

    int texture_block[5] = {16, 17, 18, 25, 32};

    switch (menu_mode) {
        case 1:
            EditMenuInit(texture_block, EditMenuStatus[0] == 0);
            return 6;
        case 2:
            BattleMenuInit(texture_block, 1);
            break;
        case 3:
        case 4:
            ShopNoInput(texture_block, shop_no, 1);
            break;
        case 5:
            InitEventItemSelect(16, use_item_list, &SaveData->GetDngStatus()->item_pack, 180, 210, 1,
                                0);
            break;
        case 9:
            InitEventItemSelect(16, use_item_list, &SaveData->GetDngStatus()->item_pack, 180, 210, 1,
                                1);
            break;
        case 6:
            InitNameRegist(name_reg_chara, 16, 0);
            break;
        case 7:
            InitMenuMove(5, 16, (u_long128 *) read_buffer);
            break;
        case 8:
            InitFishingExchange(0, texture_block, 0);
            break;
        case 10:
            InitFishRecordView(0, texture_block, 0);
            break;
    }
    return 8;
}

void EdExitMenu() {
    GamePad.AutoRepeatOff();
    GamePad.MenuModeOff();
    MGFlipWaitVSync(0);
}

int EdMenuMode() {
    int end;

    end = 0;
    switch (menu_mode) {
        case 2:
            end = !BattleMenuCursor();
            BattleMenuDraw();
            if (end)
                EdClearItemOverFlag();
            break;
        case 3:
        case 4:
            end = CommonShopLoop();
            break;
        case 5:
        case 9:
            end = EventItemSelectLoop(&use_item);
            break;
        case 6:
            end = NameEnterKey();
            NameEnterDraw();
            break;
        case 7:
            end = !MenuMoveKey();
            DrawMenuMove();
            break;
        case 8:
            end = FishingExchangeLoop();
            break;
        case 10:
            end = FishRecordViewLoop();
            break;
    }
    return end;
}

/* A count below zero means one, so a caller that has nothing to say about how many gets one. */
void EdGetItem(int item, int count, int attach) {
    CDngStatusData *status;
    int no;
    int i;

    if (count < 0)
        count = 1;
    status = SaveData->GetDngStatus();
    no = ConvertItemNo(item);
    if (no < 0)
        return;
    for (i = 0; i < count; i++) {
        if (attach > 0)
            status->GetItem(no, attach);
        else
            status->GetItem(no, 0);
    }
}

/* Growing the pack clears the slots it opens rather than leaving what was in them, because a slot
   is read up to the count and an old number inside the new range would be an item again. */
int EdAddMaxItem(int add) {
    ITEM_PACK *pack;
    int num;
    int i;

    pack = &SaveData->GetDngStatus()->item_pack;
    num = pack->num + add;
    if (num < 0)
        num = 0;
    if (num > 100)
        num = 100;
    for (i = pack->num; i < num; i++)
        pack->item[i] = -1;
    pack->num = (char) num;
    return num;
}

int EdCheckItemOver() {
    return SaveData->GetDngStatus()->overflow_flag;
}

void EdClearItemOverFlag() {
    SaveData->GetDngStatus()->overflow_flag = 0;
}

int EdCheckItem(int item) {
    CDngStatusData *status;
    int no;

    status = SaveData->GetDngStatus();
    no = ConvertItemNo(item);
    if (no >= 0)
        return status->SearchItemIndexNo(no);
    return -1;
}

int EdCheckGetItem(int item) {
    CDngStatusData *status;
    int no;

    status = SaveData->GetDngStatus();
    no = ConvertItemNo(item);
    if (no >= 0)
        return status->CheckItemGet(no);
    return 0;
}

INCLUDE_ASM("asm/nonmatchings/edit", EdGetItemFile__FiPcPc);
INCLUDE_ASM("asm/nonmatchings/edit", EdDrawItem__Fv);
/* The map editor's own system and help messages, in front of the ones the town runs: every call
   here reaches the town's message code first and then does the same thing again to a window of the
   editor's own, so both are up at once and the editor's is the one drawn last.
   A help message is a system message that has been handed over: it is built through
   EdSetSystemMes and its number and count are then moved into the pair below, which leaves the
   system slot free for the next real message. */
static int SystemMesNo = -1;
static int HelpMesNo = -1;
static int SystemMesCount;
static int SystemMesPosition;
static int SystemMesW;
static int SystemMesH;
static int SystemMesX;
static int SystemMesY;
static int SystemMesWait;
static int SystemMesInputKey;
static int HelpMesCount;
static int cnt1;
static int cnt2;

void EdSetSystemMes(int no, int count, int position, int input_key, int *arg, int number) {
    int i;

    SystemMesInputKey = input_key;
    SystemMesPosition = position;
    if (arg) {
        for (i = 0; i < 4; i++) {
            EditSystemMes.mes_no[i] = -1;
            if (*arg >= 0)
                EditSystemMes.mes_no[i] = *arg;
            arg++;
        }
    }
    if (number >= 0)
        EditSystemMes.value = number;
    EditSystemMes.MakeMesWin(no);
    SystemMesNo = no;
    SystemMesCount = count;
}

/* Message 120 is the only one that offers a choice, and its two positions are placed rather than
   authored: the first is indented by however much narrower than the window the laid-out text came
   out, and the second a fixed distance to the right of it. Every other message says there is no
   choice by putting both off screen. */
void EdSetHelpMes(int no, int count, int position, int *arg, int number) {
    int x;
    int y;
    int indent;

    if (no == 120) {
        indent = EditSystemMes.text_columns - 30;
        indent = 16 - indent;
        if (indent < 0)
            indent = 0;
        y = SystemMesY;
        x = SystemMesX + ((indent * EditSystemMes.char_width) >> 1);
        EditSystemMes.line_pos[0].x = x;
        EditSystemMes.line_pos[0].y = y;
        x = SystemMesX + 180;
        EditSystemMes.line_pos[1].x = x;
        EditSystemMes.line_pos[1].y = y;
    } else {
        EditSystemMes.line_pos[0].x = -1;
        EditSystemMes.line_pos[0].y = -1;
        EditSystemMes.line_pos[1].x = -1;
        EditSystemMes.line_pos[1].y = -1;
    }
    EditSystemMes.auto_pos = SystemMesPosition;
    EditSystemMes.text_x = SystemMesX;
    EditSystemMes.text_y = SystemMesY;
    EditSystemMes.stay_width = SystemMesW;
    EditSystemMes.stay_height = SystemMesH;
    EditSystemMes.auto_pos = SystemMesPosition;
    EdSetSystemMes(no, count, position, 0, arg, number);
    EditSystemMes.auto_pos = SystemMesPosition;
    HelpMesNo = SystemMesNo;
    HelpMesCount = SystemMesCount;
    SystemMesNo = -1;
    SystemMesCount = 0;
}

void EdClearSystemMes() {
    ClearSystemMes();
    EditSystemMes.MakeMesWin(-1);
    SystemMesNo = -1;
    SystemMesCount = 0;
    SystemMesInputKey = 0;
    HelpMesNo = -1;
    HelpMesCount = 0;
    SystemMesWait = 0;
    SystemMesW = 0;
    SystemMesH = 0;
    SystemMesX = 0;
    SystemMesY = 0;
}

int EdSystemMesCheck() {
    return SystemMesCheck();
}

/* A message counts down to nothing and is cleared at one rather than at zero, so the frame that
   would have shown it empty is the frame it goes away on. A message that asked for a button holds
   at two until the button is pressed. */
void EdSystemMesStep() {
    if (SystemMesWait > 0) {
        SystemMesWait--;
        return;
    }
    SystemMesStep();
    if (SystemMesCount == 1 || HelpMesCount == 1)
        EdClearSystemMes();
    if (SystemMesNo > 0 || HelpMesCount >= 0)
        EditSystemMes.Step();
    if (SystemMesInputKey == 0 || SystemMesCount != 2 || GamePad.Down(64)) {
        if (SystemMesCount > 0)
            SystemMesCount--;
        if (HelpMesCount > 0)
            HelpMesCount--;
    }
}

/* The window's own textures are put back every frame it is drawn, because whatever the game drew
   in between is free to have taken the video memory they were in. */
void EdSystemMesDraw() {
    if (SystemMesWait > 0)
        return;
    SystemMesDraw();
    if (HelpMesNo <= 0)
        return;
    TexManager.ReloadTexture(Vif1Packet, EditSystemMes.tex_block);
    setbilinear(0);
    EditSystemMes.DrawMesWin();
}

/* The width the window will come to is not known before the text is laid out, so the messages
   below place it by hand: this one centres a forty-character line on the screen and the rest give
   a left edge outright. */
void EdEditMainHelpMes(int building) {
    SystemMesW = 0;
    SystemMesH = 0;
    SystemMesX = 320 - ((EditSystemMes.char_width * 40) >> 1);
    SystemMesY = 380;
    EdSetHelpMes(100 + (building != 0), 2, -1, 0, -1);
}

void EdWalkToEditMes(int wait) {
    SystemMesW = 0;
    SystemMesH = 0;
    SystemMesX = 40;
    SystemMesY = 380;
    SystemMesWait = wait;
    EdSetHelpMes(110, 120, -1, 0, -1);
}

/* The build and move prompts take turns: each counts down the other's delay before showing itself
   and then arms the other, so the two alternate rather than both being up. */
void EdEditBuildHelpMes(int parts) {
    if (parts < 0)
        return;
    if (cnt1 > 0) {
        cnt1--;
        return;
    }
    cnt1 = 0;
    cnt2 = 1;

    int arg[4] = {-1, -1, -1, -1};

    arg[0] = GetAtraMsgNo(MapNo, parts);
    SystemMesW = 560;
    SystemMesH = 50;
    SystemMesX = 40;
    SystemMesY = 380;
    EdSetHelpMes(120, 2, -1, arg, -1);
}

void EdEditMoveHelpMes() {
    if (cnt2 > 0) {
        cnt2--;
        return;
    }
    cnt2 = 0;
    cnt1 = 1;
    SystemMesW = 0;
    SystemMesH = 0;
    SystemMesX = 230;
    SystemMesY = 380;
    EdSetHelpMes(130, 2, -1, 0, -1);
}

/* Two messages a hundred apart for the same two states, since the argument names the fish and the
   message number says whether there is one. */
void EdFishingWalkHelpMes(int fish) {
    int no;

    SystemMesW = 0;
    SystemMesH = 0;

    int arg[4] = {-1, -1, -1, -1};

    arg[0] = fish + 100;
    no = 200;
    if (fish >= 0)
        no++;
    EdSetHelpMes(no, 2, 9, arg, -1);
}

void EdFishingAngleHelpMEs(int angle) {
}

void EdFishingLostEsaMes() {
    SystemMesW = 0;
    SystemMesH = 0;
    EdSetHelpMes(210, 180, 8, 0, -1);
}

/* The second argument is dropped rather than forwarded, so a caller that passes one is passing it
   to nothing. */
void EdItemGetMes(int item, int kind, int count, int attach) {
    ItemGetMes(item, count, attach, 1);
}

/* The treasure box the map editor opens in front of the player: one box at a time, placed where the
   caller says, with its lid turned by a count that runs down from 40 and the ambient light lifted
   over the last twenty of them. The lid is a node of the box's own model called `top`, so the
   opening is a rotation of one frame rather than anything the model file carries. */
static int ibox_open_flag;
static int ibox_open_close_flag;
static int ibox_open_cnt;
static CFrameVu1 *ibox_frame;
static CFrameVu1 *ibox_base_frame;
static sceVu0FVECTOR ibox_pos;
static sceVu0FVECTOR ibox_rot;

void EdInitOpenItemBox(CFrameVu1 *frame, CFrameVu1 *base) {
    ibox_open_close_flag = 0;
    ibox_open_flag = 0;
    ibox_open_cnt = 0;
    ibox_frame = frame;
    ibox_base_frame = base;
}

void EdSetOpenItemBox(float *position, float *rotation) {
    if (ibox_frame) {
        ibox_open_flag = 1;
        ibox_open_close_flag = 0;
        ibox_open_cnt = 40;
        sceVu0CopyVector(ibox_pos, position);
        sceVu0CopyVector(ibox_rot, rotation);
    }
}

void EdStepOpenItemBox() {
    CFrame *lid;
    float open_angle;
    float close_angle;

    if (ibox_open_flag == 0 && ibox_open_close_flag == 0)
        return;
    ibox_open_cnt--;
    if (ibox_open_cnt < 0) {
        ibox_open_flag = 0;
        ibox_open_close_flag = 0;
        return;
    }
    if (ibox_frame == 0)
        return;
    ibox_frame->SetPosition(ibox_pos);
    ibox_frame->SetRotation(ibox_rot[0], ibox_rot[1], ibox_rot[2]);
    lid = ibox_frame->SearchFrame("top");
    lid->SetRotType(2);
    if (ibox_open_flag) {
        /* The lid swings over the first half of the count and then stands open through the second,
           which is the half the ambient is faded over. */
        if (ibox_open_cnt <= 20)
            return;
        open_angle = -(1.5707964f - 1.5707964f * (float) (ibox_open_cnt - 20) / 20.0f);
        lid->SetRotation(open_angle, 0.0f, 0.0f);
    } else {
        if (ibox_open_cnt >= 6)
            close_angle = 1.5707964f - 1.5707964f * (float) (ibox_open_cnt - 5) / 5.0f;
        else
            close_angle = 1.5707964f * (float) ibox_open_cnt / 5.0f;
        lid->SetRotation(0.2f * -close_angle, 0.0f, 0.0f);
    }
}

INCLUDE_RODATA("asm/nonmatchings/edit", @257__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @258__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @259__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @260__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @261__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @262__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @263__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @264__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @265__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @266__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @267__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @268__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @269__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @270__5);
INCLUDE_RODATA("asm/nonmatchings/edit", @271__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @272__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @273__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @274__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @275__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @276__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @277__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @278__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @279__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @280__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @281__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @282__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @283__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @284__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @285__4);
INCLUDE_RODATA("asm/nonmatchings/edit", @286__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @287__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @288__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @289__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @290__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @291__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @292__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @293__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @294__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @295__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @296__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @297__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @298__4);
INCLUDE_RODATA("asm/nonmatchings/edit", @299__4);
INCLUDE_RODATA("asm/nonmatchings/edit", @300__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @301__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @302__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @303__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @304__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @305__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @306__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @307__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @308__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @309__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @310__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @311__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @312__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @314__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @315__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @316__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @317__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @318__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @319__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @320__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @321__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @322__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @323__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @324__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @325__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @326__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @327__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @328__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @329__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @330__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @331__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @332__4);
INCLUDE_RODATA("asm/nonmatchings/edit", @333__4);
INCLUDE_RODATA("asm/nonmatchings/edit", @334__4);
INCLUDE_RODATA("asm/nonmatchings/edit", @335__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @336__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @337__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @338);
INCLUDE_RODATA("asm/nonmatchings/edit", @339__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @340);
INCLUDE_RODATA("asm/nonmatchings/edit", @341);
INCLUDE_RODATA("asm/nonmatchings/edit", @342);
INCLUDE_RODATA("asm/nonmatchings/edit", @343);
INCLUDE_RODATA("asm/nonmatchings/edit", @344);
INCLUDE_RODATA("asm/nonmatchings/edit", @345__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @346);
INCLUDE_RODATA("asm/nonmatchings/edit", @347);
INCLUDE_RODATA("asm/nonmatchings/edit", @348__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @349__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @350__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @351);
INCLUDE_RODATA("asm/nonmatchings/edit", @352);
INCLUDE_RODATA("asm/nonmatchings/edit", @353__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @354);
INCLUDE_RODATA("asm/nonmatchings/edit", @355);
INCLUDE_RODATA("asm/nonmatchings/edit", @356);
INCLUDE_RODATA("asm/nonmatchings/edit", @357);
INCLUDE_RODATA("asm/nonmatchings/edit", @358__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @359);
INCLUDE_RODATA("asm/nonmatchings/edit", @360);
INCLUDE_RODATA("asm/nonmatchings/edit", @361__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @362__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @363__4);
INCLUDE_RODATA("asm/nonmatchings/edit", @364);
INCLUDE_RODATA("asm/nonmatchings/edit", @365);
INCLUDE_RODATA("asm/nonmatchings/edit", @366);
INCLUDE_RODATA("asm/nonmatchings/edit", @367);
INCLUDE_RODATA("asm/nonmatchings/edit", @368);
INCLUDE_RODATA("asm/nonmatchings/edit", @369__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @370__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @371__3);
INCLUDE_RODATA("asm/nonmatchings/edit", @372);
INCLUDE_RODATA("asm/nonmatchings/edit", @373__2);
INCLUDE_RODATA("asm/nonmatchings/edit", @374);
INCLUDE_RODATA("asm/nonmatchings/edit", @377);

void EdDrawOpenItemBox() {
    sceVu0FVECTOR ambient;
    sceVu0FVECTOR save;

    if (ibox_open_flag == 0 && ibox_open_close_flag == 0)
        return;
    if (ibox_frame) {
        ibox_frame->SetPosition(ibox_pos);
        ibox_frame->SetRotation(ibox_rot[0], ibox_rot[1], ibox_rot[2]);
    }
    MGGetAmbient(ambient);
    sceVu0CopyVector(save, ambient);
    if (ibox_open_cnt < 20)
        ambient[3] = 128.0f * (float) ibox_open_cnt / 20.0f;
    if (ibox_open_flag)
        MGSetAmbient(ambient);
    MGDraw(ibox_frame);
    MGSetAmbient(save);
}

INCLUDE_ASM("asm/nonmatchings/edit", EdSaveFrameImage__F8CTexture);
INCLUDE_ASM("asm/nonmatchings/edit", EdSaveFrameImageTask__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdSaveFrameImageInit__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdMenuLoop__FP6ClsMes);

float ConvertTime(float hour) {
    hour -= 10.0f;

    if (hour < 0.0f) {
        hour += 24.0f;
    }
    hour /= 2.0f;
    return hour;
}

float InvertTime(float time) {
    time *= 2.0f;
    time += 10.0f;

    if (time > 24.0f) {
        time -= 24.0f;
    }
    return time;
}
