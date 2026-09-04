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

/* The map editor: the debug overlay it draws over the game, the sound and the
   lighting it puts in that world, the town's menus as it reaches them, and the
   messages, treasure boxes and screen fades it owns outright. */

void EdDPrint(char *str);

static int AddStr(CDebugFont *font, char *str);
static void DrawBound(CFrame *frame);
static void DrawLine(int *from, int *to, u_char r, u_char g, u_char b, u_char a);

struct SOUND_SRC {
    int se;
    int num;
    float vol[16];
    float pan[16];
};

float ConvertTime(float hour);
void DepthOfField(float *dist, int level, int alpha, int blur);

struct EPARTS_FUNC_DATA;

int InitEditEffect(CFrame *frame, EPARTS_FUNC_DATA *func, EDIT_EFFECT_INFO *info);

class CCamera;

int TransWepNo(int item);
int TransWepNoNewToOld(int item);
void EdClearSystemMes();
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

void EdClearItemOverFlag();

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
        camera_ref[1] += 0.7f * chara->unk_0B4;
        camera->SetRef(camera_ref);
    }

    scale = chara->unk_CE0[0];
    if (GamePad.On(2))
        scale += 0.1f;
    if (GamePad.On(1))
        scale -= 0.1f;
    if (scale != chara->unk_CE0[0]) {
        chara->unk_CE0[0] = scale;
        chara->unk_CE0[1] = scale;
        chara->unk_CE0[2] = scale;
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

INCLUDE_RODATA("asm/nonmatchings/edit", LIT_435);

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

INCLUDE_RODATA("asm/nonmatchings/edit", LIT_257__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_258__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_259__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_260__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_261__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_262__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_263__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_264__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_265__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_266__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_267__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_268__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_269__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_270__5);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_271__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_272__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_273__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_274__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_275__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_276__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_277__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_278__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_279__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_280__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_281__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_282__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_283__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_284__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_285__4);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_286__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_287__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_288__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_289__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_290__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_291__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_292__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_293__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_294__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_295__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_296__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_297__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_298__4);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_299__4);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_300__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_301__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_302__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_303__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_304__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_305__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_306__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_307__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_308__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_309__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_310__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_311__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_312__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_314__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_315__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_316__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_317__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_318__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_319__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_320__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_321__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_322__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_323__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_324__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_325__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_326__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_327__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_328__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_329__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_330__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_331__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_332__4);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_333__4);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_334__4);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_335__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_336__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_337__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_338);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_339__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_340);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_341);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_342);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_343);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_344);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_345__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_346);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_347);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_348__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_349__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_350__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_351);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_352);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_353__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_354);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_355);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_356);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_357);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_358__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_359);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_360);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_361__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_362__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_363__4);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_364);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_365);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_366);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_367);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_368);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_369__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_370__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_371__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_372);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_373__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_374);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_377);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_478);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_482__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_501__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_589);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_590);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_591);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_592);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_593__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_594);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_595);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_596__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_734__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_822__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_871);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_873__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_875__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_876__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_877);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_878);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_879);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_880__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_881__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_882);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_883);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_884__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_885);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_907);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_908);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_414__5);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_442__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_443__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_444__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_714);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_715);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_716);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_717);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_718);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_719);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_720);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_721);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_722);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_723__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_724);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_725__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_726__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_727__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_730__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_731__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_732__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_733__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_734__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_735__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_736__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_827);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_828);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_1609);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_1610);

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

INCLUDE_ASM("asm/nonmatchings/edit", CommandCD__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", test__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", InitInfo__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", LoadEditMapData__FP13EDIT_MAP_INFOPci);
INCLUDE_ASM("asm/nonmatchings/edit", CommandSCN__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandLIGHT_NO__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandAMBIENT__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandLIGHT_C__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandFOG__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandBG_COL__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandBG_COL2__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandDOF__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandIMGSub__FiiPc);
INCLUDE_ASM("asm/nonmatchings/edit", CommandGRD_IMG__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandBLD_IMG__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandSKY_IMG__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandSUN_IMG__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandWATER_IMG__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandFIRE_IMG__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandFLER_IMG__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandIMG__FPPv__2);
INCLUDE_ASM("asm/nonmatchings/edit", CommandSKY__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandSUN__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandGROUND__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandBUILD__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandWATER__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandWATER_SURFACE__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandWATER_SHAKE__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandEDITAREA__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", GenMdsName__FP14MAP_PARTS_INFOPc);
INCLUDE_ASM("asm/nonmatchings/edit", CommandBLD_PARTS__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandGRD_PARTS__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandPARTS_INFO__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandROAD_PARTS__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandROAD__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandRIVER_PARTS__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandRIVER__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandBRIDGE_PARTS__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandLAKE_PARTS__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandON_RIVER_PARTS__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandOBJ_ANIME__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandFIRE__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandFLAME__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandBRIGHT__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandOBJECT_TIMER__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandENTRANCE__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandMAPJUMP__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandPEOPLE__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandTIME_TABLE_NO__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandTIME_TABLE__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandTIME_STOP__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandSKY_FOLLOW__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandSHADOW_LEVEL__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandEDITAREA_RECT__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandBGM_NO__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandSOUND_SET__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandREVERBE__FPPv__2);
INCLUDE_ASM("asm/nonmatchings/edit", CommandMOTION_PARTS__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandPEOPLE2__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandSE_AMBIENT_OFF__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandWIND__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandTALK_EVENT__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandCHARA_AMBIENT__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandTALK_ROT__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandTALK_DIR__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", CommandPEOPLE_LIST__FPPv);
INCLUDE_ASM("asm/nonmatchings/edit", FishingDrawCheck__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdLoadFile__FPc);
INCLUDE_ASM("asm/nonmatchings/edit", CheckMotionTime__Ffff);
INCLUDE_ASM("asm/nonmatchings/edit", PlayAmbient__Ff);
INCLUDE_ASM("asm/nonmatchings/edit", StopAllSound__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdSetSoundOffCount__Fi);
INCLUDE_ASM("asm/nonmatchings/edit", GetLanguageName__FPc);
INCLUDE_ASM("asm/nonmatchings/edit", GetEditDataDir__FPc);
INCLUDE_ASM("asm/nonmatchings/edit", LoadScript__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", RunEvent__FiP7CCamera);
INCLUDE_ASM("asm/nonmatchings/edit", RunSystemEvent__FiP7CCamera);
INCLUDE_ASM("asm/nonmatchings/edit", FadeOutToEvent__Fii);
INCLUDE_ASM("asm/nonmatchings/edit", EditSave__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EditLoad__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EditExit__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", InitWorkBuffer__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", run_event_check__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", CheckKeyLock__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdSetFlag__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdGetMapFlag__Fi);
INCLUDE_ASM("asm/nonmatchings/edit", EdSetMapFlag__Fii);
INCLUDE_ASM("asm/nonmatchings/edit", PauseOffCheck__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdExitLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdDrawOffAll__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdDrawOnAll__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdGetClock__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdSetClock__Ff);
INCLUDE_ASM("asm/nonmatchings/edit", EdInitMesParam__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EditInit__FPv);
INCLUDE_ASM("asm/nonmatchings/edit", cat_end__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EditLoop__Fv);

INCLUDE_RODATA("asm/nonmatchings/edit", LIT_1837__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_1838__2);
INCLUDE_ASM("asm/nonmatchings/edit", MainDraw__Fv);

INCLUDE_RODATA("asm/nonmatchings/edit", LIT_1871);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_1872);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2122);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2151);
INCLUDE_ASM("asm/nonmatchings/edit", ParamDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdSetCharaCursor__Fi);
INCLUDE_ASM("asm/nonmatchings/edit", EdDrawSysCursor__FP14ED_EVENT_POINTi);
INCLUDE_ASM("asm/nonmatchings/edit", EdStartDrawDay__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdInitDrawDay__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", DrawDay__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", DrawSysGra__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdDrawClock__Fii);
INCLUDE_ASM("asm/nonmatchings/edit", MainMode__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", FrameOnOff__FP6CFramePci);
INCLUDE_ASM("asm/nonmatchings/edit", EditPartsObjectOnOff__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EditMode__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", MainEditMode__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", OpenDoorMode__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", TalkMode__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EventMode__Fv);

INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2362);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2363);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2364);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2389);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2390);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2488);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2533);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2737);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2738);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2739);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2740);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2741);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2742);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2747);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2748);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2749);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2750);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2751);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2752);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2753);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2754);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2755);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2756);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2803);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2804);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2805);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2806);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2807);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2808);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2809);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2810);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2811);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2812);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2813);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2814);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2815);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2816);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2817);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2818);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2819);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2820);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2821);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2822);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2850);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2851);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2852);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2853);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2999);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_3000);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_3001);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_3002);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_3003);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_3004);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_447__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_687);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_688);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_689);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_690__2);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_727__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_728__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_729__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_730__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_731__3);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_1026);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_1038);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_1673);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_1674);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_1675);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_1676);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_853);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_1424);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2236);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2237);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2246);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2288);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2289);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2449);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2450);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2451);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2604);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2605);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2606);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2607);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2608);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2609);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2610);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2611);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2612);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2613);
INCLUDE_RODATA("asm/nonmatchings/edit", LIT_2614);
INCLUDE_ASM("asm/nonmatchings/edit", GotoDungeon__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdDeleteE05RoboParts__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", GotoInterior__FPciiP14ED_EVENT_PARAMi);
INCLUDE_ASM("asm/nonmatchings/edit", MoveCamera__FP13CCameraFollow);
INCLUDE_ASM("asm/nonmatchings/edit", GetCollision__FP6CCPolyP7CBoxVu0);
INCLUDE_ASM("asm/nonmatchings/edit", MoveChara__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", VillagerCollision__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", CheckEditToWalk__FPf);
INCLUDE_ASM("asm/nonmatchings/edit", MoveEditCursor__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", LoadTexture__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdLoadMainChara__FPcPcP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/edit", LoadGroundData__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", LoadObjectParts__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", LoadPTS__FP9CMapPartsPUiP14MAP_PARTS_INFOP13OBJ_ANIME_SEQP16EDIT_EFFECT_INFOP17EDIT_OBJECT_TIMERP14ED_EVENT_POINTP9CMapParts);
INCLUDE_ASM("asm/nonmatchings/edit", LoadPTS__FP9CMapPartsP14MAP_PARTS_INFOP13OBJ_ANIME_SEQP16EDIT_EFFECT_INFOP17EDIT_OBJECT_TIMERP14ED_EVENT_POINT);
INCLUDE_ASM("asm/nonmatchings/edit", LoadMapObject__FP9CMapPartsPPc);
INCLUDE_ASM("asm/nonmatchings/edit", set2DSpriteRot__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_iifUc);
INCLUDE_ASM("asm/nonmatchings/edit", __ct__9C3DSpriteFv);
INCLUDE_ASM("asm/nonmatchings/edit", CopyCMapParts__FP9CMapPartsP9CMapPartsP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/edit", GetPosRot__FP10CMapObjectPfPf);
INCLUDE_ASM("asm/nonmatchings/edit", GetNewEventPoint__FP14ED_EVENT_POINTi);
INCLUDE_ASM("asm/nonmatchings/edit", CheckEventPoint__FP14ED_EVENT_POINTf);
INCLUDE_ASM("asm/nonmatchings/edit", GetNewEventPoint__FP9CMapPartsP16EPARTS_FUNC_DATAP14ED_EVENT_POINTi);
INCLUDE_ASM("asm/nonmatchings/edit", EdInitEventPoint__FP9CMapPartsPsP16EPARTS_FUNC_DATAiP14ED_EVENT_POINTi);
INCLUDE_ASM("asm/nonmatchings/edit", EdGetEvent__FP14ED_EVENT_POINTiP14ED_EVENT_PARAMPfPff);
INCLUDE_ASM("asm/nonmatchings/edit", EdEventPointDraw__FP14ED_EVENT_POINTif);
INCLUDE_ASM("asm/nonmatchings/edit", EdEventPointCpPoly__FPfP14ED_EVENT_POINTiP6CCPolyf);
INCLUDE_ASM("asm/nonmatchings/edit", EdSearchEvent__FP14ED_EVENT_PARAMPcif);
INCLUDE_ASM("asm/nonmatchings/edit", EdMapJump__FiPc);
INCLUDE_ASM("asm/nonmatchings/edit", EdPartsObjectOnOff__FP9CMapPartsP14EDITPARTS_INFOi);
INCLUDE_ASM("asm/nonmatchings/edit", EdInitVillagerControl__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdCreateVillagerTable__FP13EDIT_MAP_INFO);
INCLUDE_ASM("asm/nonmatchings/edit", EdInitVillagerTable__FfP13EDIT_MAP_INFO);
INCLUDE_ASM("asm/nonmatchings/edit", EdVillagerAppearOut__Fii);
INCLUDE_ASM("asm/nonmatchings/edit", EdVillagerAppearIn__Fii);
INCLUDE_ASM("asm/nonmatchings/edit", EdVillagerAppearOff__Fii);
INCLUDE_ASM("asm/nonmatchings/edit", EdVillagerAppearOn__Fii);
INCLUDE_ASM("asm/nonmatchings/edit", EdVillagerAppearMove__Fiii);
INCLUDE_ASM("asm/nonmatchings/edit", RestoreVillagerInfo__FP13VILLAGER_INFO);
INCLUDE_ASM("asm/nonmatchings/edit", EdSelectVillager__FP13VILLAGER_INFOfP13EDIT_MAP_INFO);
INCLUDE_ASM("asm/nonmatchings/edit", EdCheckVillagerIn__FiP13VILLAGER_INFO);
INCLUDE_ASM("asm/nonmatchings/edit", EdCheckVillager__FiP13VILLAGER_INFOP11CEditGround);
INCLUDE_ASM("asm/nonmatchings/edit", GetRandomVillager__FP13VILLAGER_INFO);
INCLUDE_ASM("asm/nonmatchings/edit", GetRandomMoveVillager__FP13VILLAGER_INFO);
INCLUDE_ASM("asm/nonmatchings/edit", EdInitVilager__FP13VILLAGER_INFOP11CEditGroundP1);
INCLUDE_ASM("asm/nonmatchings/edit", EdLoadVillager__FPUiPcP12CNPCharacterP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/edit", EdLoadVillager__FPcP12CNPCharacterP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/edit", EdInitVillagerOnOff__FP12CNPCharacterP13VILLAGER_INFOP11CEditGround);
INCLUDE_ASM("asm/nonmatchings/edit", EdInitVilagerPosition__FP12CNPCharacterP13VILLAGER_INFOP11CEditGroundPA4_f);
INCLUDE_ASM("asm/nonmatchings/edit", GetNearVill__FP7CCameraP10CCharacterP12CNPCharacterPiPf);
INCLUDE_ASM("asm/nonmatchings/edit", EdMoveVillager__FP13VILLAGER_INFO);
INCLUDE_ASM("asm/nonmatchings/edit", EdMoveVillagerSubMap__FP13VILLAGER_INFO);
INCLUDE_ASM("asm/nonmatchings/edit", EdSetVillagerNextPos__FP12CNPCharacterP13VILLAGER_INFOP11CEditGround);
INCLUDE_ASM("asm/nonmatchings/edit", EdCheckTime__Ffff);
INCLUDE_ASM("asm/nonmatchings/edit", EdGetTime__Ff);
INCLUDE_ASM("asm/nonmatchings/edit", EdLimitShadowLight__FPA4_ff);
INCLUDE_ASM("asm/nonmatchings/edit", EdDrawSky__FfPP9CFrameVu1PP6CFrameP9CFrameVu1P7CCameraPi);
INCLUDE_ASM("asm/nonmatchings/edit", EdDrawLensFlare__FfPP6CFrame);
INCLUDE_ASM("asm/nonmatchings/edit", EdSetLightParam__FfiP13EDIT_MAP_INFOP9CFrameVu1);
INCLUDE_ASM("asm/nonmatchings/edit", EdInitToEPInfo__FP14INIT_PARTSINFOP18EPARTS_INFO_HEADER);
/* The map editor's screen fade: a colour and an alpha the whole screen is covered with once a
   frame, stepped towards or away from opaque. The alpha runs 0 to 128 rather than 0 to 255,
   because that is the graphics synthesizer's own scale — 128 is the fully opaque end of it. */
static float fade_col[4];
static int fade_in_out;
static int fade_end;
static float fade_step;

void EdFadeInit() {
    fade_col[3] = 0.0f;
    fade_col[2] = 0.0f;
    fade_col[1] = 0.0f;
    fade_col[0] = 0.0f;
    fade_in_out = 0;
    fade_step = 0.0f;
    fade_end = 0;
}

/* A negative frame count means no step at all: the alpha is forced to the end this call starts
   from and stays there, which is how a colour is held over the screen rather than faded through. */
void EdFadeIn(int frames, float r, float g, float b) {
    if (fade_in_out == 0 || frames < 0)
        fade_col[3] = 128.0f;
    fade_in_out = 1;
    fade_end = 0;
    if (frames < 0)
        fade_step = 0.0f;
    else
        fade_step = 128.0f / (float) frames;
    fade_col[0] = r;
    fade_col[1] = g;
    fade_col[2] = b;
}

void EdFadeOut(int frames, float r, float g, float b) {
    if (fade_in_out == 0 || frames < 0)
        fade_col[3] = 0.0f;
    fade_in_out = -1;
    fade_end = 0;
    if (frames < 0)
        fade_step = 0.0f;
    else
        fade_step = 128.0f / (float) frames;
    fade_col[0] = r;
    fade_col[1] = g;
    fade_col[2] = b;
}

int EdFadeOutCheck() {
    return fade_end;
}

void EdGetFadeColor(float *col) {
    col[0] = fade_col[0];
    col[1] = fade_col[1];
    col[2] = fade_col[2];
    col[3] = fade_col[3];
}

/* The rectangle is in the sixteenths of a pixel the coordinate registers count in, which is what
   the multiplications are; why the cover is 70 boxes rather than one the code does not say. */
void EdFadeInOut() {
    int r;
    int g;
    int b;
    int a;
    int x;
    int y;
    CRect_i_ rect;

    if (fade_in_out == 0)
        return;
    r = (int) fade_col[0];
    g = (int) fade_col[1];
    b = (int) fade_col[2];
    a = (int) fade_col[3];
    if (fade_in_out > 0) {
        fade_col[3] -= fade_step;
        if (fade_col[3] <= 0.0f) {
            fade_col[3] = 0.0f;
            fade_in_out = 0;
            fade_end = 1;
        }
    } else {
        fade_col[3] += fade_step;
        if (fade_col[3] >= 128.0f) {
            fade_col[3] = 128.0f;
            fade_end = 1;
        }
    }
    for (x = 0; x < 640; x += 64) {
        for (y = 0; y < 224; y += 32) {
            rect.x = x * 16;
            rect.y = y * 16;
            rect.width = 1024;
            rect.height = 512;
            MGFillBox(rect, r, g, b, a);
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/edit", GetMaxHeightCursor__FPf);
INCLUDE_ASM("asm/nonmatchings/edit", LimitEditCursorPos__FPfPf);
INCLUDE_ASM("asm/nonmatchings/edit", EdSePlay__F11ED_SOUND_IDi);
INCLUDE_ASM("asm/nonmatchings/edit", GetSprite__Fi);
INCLUDE_ASM("asm/nonmatchings/edit", InitSprite__FP9ED_SPRITE);
INCLUDE_ASM("asm/nonmatchings/edit", GetObjAnime__Fi);
INCLUDE_ASM("asm/nonmatchings/edit", ClearObjAnime__Fi);
INCLUDE_ASM("asm/nonmatchings/edit", EdEventPause__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", SetWorkFlag__Fii);
INCLUDE_ASM("asm/nonmatchings/edit", GetWorkFlag__Fi);
INCLUDE_ASM("asm/nonmatchings/edit", GetStackInt__FP12RS_STACKDATA);
INCLUDE_ASM("asm/nonmatchings/edit", GetStackFloat__FP12RS_STACKDATA);
INCLUDE_ASM("asm/nonmatchings/edit", GetStackString__FP12RS_STACKDATA);
INCLUDE_ASM("asm/nonmatchings/edit", SetStack__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", SetStack__FP12RS_STACKDATAf);
INCLUDE_ASM("asm/nonmatchings/edit", PrintMemory__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", GetObjHandle__Fi);
INCLUDE_ASM("asm/nonmatchings/edit", SetObjHandle__FiP9CMapPartsPc);
INCLUDE_ASM("asm/nonmatchings/edit", SetObjHandle__FiP10CCharacterPc);
INCLUDE_ASM("asm/nonmatchings/edit", SetObjHandle__FiP6CFrame);
INCLUDE_ASM("asm/nonmatchings/edit", obj_draw__FP10OBJ_HANDLEi);
INCLUDE_ASM("asm/nonmatchings/edit", set_obj_pos__FP10OBJ_HANDLEPf);
INCLUDE_ASM("asm/nonmatchings/edit", get_obj_pos__FP10OBJ_HANDLEPf);
INCLUDE_ASM("asm/nonmatchings/edit", get_obj_world_pos__FP10OBJ_HANDLEPf);
INCLUDE_ASM("asm/nonmatchings/edit", set_obj_rot__FP10OBJ_HANDLEPf);
INCLUDE_ASM("asm/nonmatchings/edit", get_obj_rot__FP10OBJ_HANDLEPf);
INCLUDE_ASM("asm/nonmatchings/edit", set_obj_scale__FP10OBJ_HANDLEPf);
INCLUDE_ASM("asm/nonmatchings/edit", get_obj_scale__FP10OBJ_HANDLEPf);
INCLUDE_ASM("asm/nonmatchings/edit", init_obj_anime__FiiiiPfPfPf);
INCLUDE_ASM("asm/nonmatchings/edit", sync_obj_obj__FP10OBJ_HANDLEP10OBJ_HANDLE);
INCLUDE_ASM("asm/nonmatchings/edit", release_obj_obj__FP10OBJ_HANDLE);
INCLUDE_ASM("asm/nonmatchings/edit", set_attr_obj__FP10OBJ_HANDLER10CFrameAttrii);
INCLUDE_ASM("asm/nonmatchings/edit", GetActSeq__Fi);
INCLUDE_ASM("asm/nonmatchings/edit", turn_chara__FP10CCharacterPff);
INCLUDE_ASM("asm/nonmatchings/edit", GetScene__Fi);
INCLUDE_ASM("asm/nonmatchings/edit", GetNPC__Fi);
INCLUDE_ASM("asm/nonmatchings/edit", GetChara__Fi);
INCLUDE_ASM("asm/nonmatchings/edit", GetItemFrame__Fi);
INCLUDE_ASM("asm/nonmatchings/edit", DeleteItemFrame__Fi);
INCLUDE_ASM("asm/nonmatchings/edit", GetVillagerInfo__Fi);
INCLUDE_ASM("asm/nonmatchings/edit", SetWorldCoord__FPfPf);
INCLUDE_ASM("asm/nonmatchings/edit", GetWorldPos__FPfPf);
INCLUDE_ASM("asm/nonmatchings/edit", GetWorldRotY__Ff);
INCLUDE_ASM("asm/nonmatchings/edit", GetWorldRot__FPfPf);
INCLUDE_ASM("asm/nonmatchings/edit", GetLocalPos__FPfPf);
INCLUDE_ASM("asm/nonmatchings/edit", GetLocalRotY__Ff);
INCLUDE_ASM("asm/nonmatchings/edit", GetLocalRot__FPfPf);
INCLUDE_ASM("asm/nonmatchings/edit", GetPosition__FP12RS_STACKDATAPf);
INCLUDE_ASM("asm/nonmatchings/edit", SetPosition__FP12RS_STACKDATAPf);
INCLUDE_ASM("asm/nonmatchings/edit", GetRotation__FP12RS_STACKDATAPf);
INCLUDE_ASM("asm/nonmatchings/edit", SetRotation__FP12RS_STACKDATAPf);
INCLUDE_ASM("asm/nonmatchings/edit", GetFileName__FPcPc);
INCLUDE_ASM("asm/nonmatchings/edit", _TEST__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", exch_ok_cancel__Fi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_PADON__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_PADDOWN__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_PADUP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_APAD__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_RANDOM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_RETURN_CODE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _NEXT_EVENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GOTO_INTERIOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_WORLD_COORD__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _INITIALIZE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _EXIT_CODE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _DRAW_EXCLAMATION_MARK__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GOTO_USE_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _NAME_REGISTRY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _WORLD_MAP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SKIP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GOTO_OUTSIDE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _FINISH__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _MAP_JUMP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_OLD_MAPNO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_DUNGEON_FLOOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_DUNGEON_FLOOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _FADEOUT_TO_EVENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _MAP_JUMP_BGM_STOP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _MAP_JUMP_BGM_PLAY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GOTO_FP_CHANGE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GOTO_FISH_RANKING__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GOTO_CHANGE_ESA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_CURRENT_DIR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", get_pack_file__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", get_buffer__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", _ACTIVE_FILE_BUFFER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_CHR_FILE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_SYNC__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_CHARA_TEXTURE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_SPRITE_TEXTURE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_BG_SPRITE_TEXTURE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_TEXTURE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_IN_VILLAGER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_OUT_VILLAGER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_VILLAGER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _CHECK_IN_VILLAGER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _APPEAR_VILLAGER_ON__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _APPEAR_VILLAGER_OFF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _APPEAR_VILLAGER_OUT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _APPEAR_VILLAGER_IN__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _APPEAR_VILLAGER_MOVE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _DELETE_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _INIT_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _CLEAR_VILLAGER_BUFF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _CLEAR_EVENT_BUFF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _CLEAR_EVENT_EXBUFF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_SCENE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SYNC_SCENE_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SYNC_SCENE_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _RELEASE_SCENE_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _RELEASE_SCENE_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_SCENE_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_SCENE_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_ITEM_FILE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SYNC_CHARA_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _RELEASE_CHARA_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _DELETE_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SYNC_CHARA_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _RELEASE_CHARA_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_CHARA_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_CHARA_TALK_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_CHARA_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_CHARA_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_CHARA_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _TURN_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_NPC_TALK_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_NPC_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_NPC_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_NPC_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_NPC_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_NPC_SCALE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_NPC_SCALE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _NPC_POS_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_NPC_PARTS_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_NPC_MOTION__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_NPC_ANIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _TURN_NPC__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _NPC_DRAW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _NPC_DRAW_SHADOW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_NPC_FOOT_SOUND__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_NPC_FLOOR_ID__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _NPC_STEP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _NPC_COL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _NPC_STOP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _NPC_DRAW_BEFORE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _INIT_NPC_CLOTH__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _NPC_CLOTH_FLOOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _NPC_CLOTH_STEP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_NPC_AMBIENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_NPC_BODY_SIZE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_NPC_BODY_SIZE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _NPC_PLIGHT_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_NPC_PLIGHT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SGET_NPC_TALK_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SSET_NPC_TALK_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", GetMes__Fi);
INCLUDE_ASM("asm/nonmatchings/edit", _MES_MAKE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _MES_CLOSE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _MES_NEXTPAGE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_MES_AUTOSET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_MES_SHIPPO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_MES_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_MES_DRAWSPEED__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_MES_CURSOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_MES_OKURI__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_MES_WIN_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _CHECK_MES_COMPLETE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _CHECK_MES_WAIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _CHECK_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_MES_FUKIDASHI__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ITEM_GET_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _INIT_SYS_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SKILL_GET_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ADD_MAXITEM_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _CHECK_COMPLETE_PARTS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_EDIT_PARTS_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_NOW_TIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_CLOCK__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_CLOCK__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SGET_CMP_EVENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SSET_CMP_EVENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SCHECK_REQUEST__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _CHECK_PLACE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _CHECK_VILLAGER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _DELETE_ROBO_PARTS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _HOBJ_FIXPARTS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _HOBJ_EDITPARTS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _HOBJ_INTERIORPARTS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _HOBJ_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _HOBJ_BT_HOBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _HOBJ_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _OBJ_DRAW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_OBJ_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_OBJ_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_OBJ_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_OBJ_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_OBJ_SCALE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_OBJ_SCALE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SYNC_OBJ_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _RELEASE_OBJ_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_OBJ_FOG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_TALKNPC_INFO_ID__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_TALKNPC_ID__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_TALKNPC_STATUS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_TALK_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_TALK_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_TALK_SELECT_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _EVERY_TALK_EVENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", GetCamera__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_CAMERA_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_CAMERA_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_CAMERA_REF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_CAMERA_REF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_CAMERA_SPEED__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_FOLLOW_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ADD_CAMERA_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ADD_CAMERA_HEIGHT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ADD_CAMERA_DIST__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _CAMERA_STEP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_PROJECTION__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ITEM_GET_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_CAMERA_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_CAMERA_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_CAMERA_ROTATE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_CAMERA_ROTATE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _RESET_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _RESET_CAMERA_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SYNC_CAMERA_REF_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _RELEASE_CAMERA_REF_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SYNC_CAMERA_REF_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _RELEASE_CAMERA_REF_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SYNC_CAMERA_POS_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _RELEASE_CAMERA_POS_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_CAMERA_ROLL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_CAMERA_ROLL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _FADE_IN__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _FADE_OUT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _CHECK_FADE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _INIT_SPRITE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _DRAW_SPRITE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _DRAW_BG_SPRITE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _DRAW_BACK__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _DRAW_SHADOW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_CLIP_POINT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _DRAW_EDIT_WATER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _DRAW_WATER_SURFACE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SCREEN_FILTER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _DRAW_THUNDER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_LIGHT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_LIGHT_COLOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_AMBIENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SAVE_LIGHT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_LIGHT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_DOF_LEVEL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SP_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SP_SET_TEX__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SP_SET_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SP_SET_RGBA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SP_SET_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SP_SET_MOVE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SP_DRAW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _INIT_DRAW_DAY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _DRAW_DAY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _MAP_TITLE_OFF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_WIND__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_SYNC_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_SET_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_MOVE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_MOVE_STEP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_ROT_REF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_ROT_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_CLEAR_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_WAIT_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_ROT_MOVE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_SET_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_DELAY_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_MOTION_TRG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", asq_motion_play__FiP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_MOTION_PLAY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_MOTION_STOP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_MOTION_NEXT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_ANIME_TRG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_ANIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _ASQ_CHECK__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _OBJ_ANIME_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _OBJ_ANIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SSET_GAME_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SGET_GAME_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SSET_GAME_INT_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SGET_GAME_INT_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SITEM_GET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SSET_MAP_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SGET_MAP_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_WORK_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_WORK_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SITEM_CHECK__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SITEM_CHECK_ALL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SGET_DUNGEON_STATUS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SGET_PARTY_NUM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SSET_PARTY_NUM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SSET_REQUEST_EVENT_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SADD_VISIT_MAP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SSKILL_GET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SGET_EQUIP_WEAPON__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SADD_MAXITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SITEM_LOST__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SATRA_PARTS_GET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SATRA_CHIP_GET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SGET_REQUEST__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SGET_ATRA_PARTS_NUM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SGET_DAY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SSET_TIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SGET_TIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SADD_TIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SEQUIP_DEFAULT_WEAPON__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_SND_SYNC__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_SOUND_SET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_VOICE_SET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _DELETE_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _PLAY_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _STOP_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_BGM_VOL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_BGM_VOLF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_BGM_VOL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_BGM_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_OUT_BGM_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_OUT_BGM_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _BGM_FADE_IN__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _BGM_FADE_OUT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _CHECK_BGM_FADE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _PLAY_AMB_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _STOP_AMB_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_AMB_VOLF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _PLAY_SE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _STOP_SE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_SE_VOL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_SPECIAL_SE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _PLAY_SPECIAL_SE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _STOP_SPECIAL_SE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_SPECIAL_SE_VOL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SOUND_OFF_COUNT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_V_ARG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_I_ARG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GET_F_ARG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _EB_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _EB_SET_MOTION__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _EB_SET_KEY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _EB_LOOP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _EB_INTRO_START__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _EB_INTRO_LOOP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _EB_INTRO_END__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _EB_DEBUG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _EB_FINISH_SOUND__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_MAIN_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _LOAD_FISHING_DATA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _GOTO_FISHING__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _INIT_FISH__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _EXIT_FISHING__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", _SET_FISHING_ESA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/edit", EdSetEventScript__FPcPcP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/edit", EdInitEventParamSimple__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdInitEventParam__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdEventInit__FiP14CDataAlloc2_1_Pc);
INCLUDE_ASM("asm/nonmatchings/edit", RunEvent__FP10CRunScriptiP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/edit", EdRunEvent__FiP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/edit", EdResumeEvent__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdEventSkip__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdEventAllClear__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdEventFinish__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdEventMode__FP13CCameraFollowi);
INCLUDE_ASM("asm/nonmatchings/edit", EdEventNPCStep__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdEventSpriteDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdEventBackSpriteDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdSearchNearNPC__FP10CCharacterP12CNPCharacteri);
INCLUDE_ASM("asm/nonmatchings/edit", EdTalkModeInit__FP12CNPCharacteri);
INCLUDE_ASM("asm/nonmatchings/edit", EdNowTalkChara__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdNowTalkCharaInfoID__Fv);
INCLUDE_ASM("asm/nonmatchings/edit", EdTalkMode__FP10CCharacterP13CCameraFollowiPi);
INCLUDE_ASM("asm/nonmatchings/edit", __ct__9ED_SPRITEFv);
INCLUDE_ASM("asm/nonmatchings/edit", CheckPartsInfo__FP14EDITPARTS_INFO);
