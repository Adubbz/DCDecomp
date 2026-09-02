#pragma helper_mask_gpr 0x30
#pragma constant_flag 0
#pragma constant_flag_ones 8,10,16,17,21,23,30,38,41,64
#pragma constant_flag_ones 65,66,69,71,73,77,81,82,84,85
#pragma constant_flag_ones 88,92,98,99,100,101,102

#include "camera.hpp"
#include "character.hpp"
#include "dataalloc.hpp"
#include "common.h"
#include "dataread.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include <libgraph.h>
#include <libpkt.h>
#include <libvu0.h>
#include "mathutil.hpp"
#include "mds.hpp"
#include "renderinfo.hpp"
#include "title/script.hpp"
#include "sound.hpp"
#include <cstdlib>
#include "texture.hpp"
#include "vector3.hpp"

#include <cmath>

extern CSound CSnd;

typedef MOTION_INFO tagMOTION_KEY;

extern tagMOTION_KEY noroi[10];
extern tagMOTION_KEY dancer[10];
extern int DanceCnt;
extern int DanceStart;

/* Spelled here rather than reached through a header because the image holds it only as an
   anonymous pooled constant, which is what a macro gives and a file-scope object does not. */
#define PI 3.14159265358979323846

/* The rectangle a texture transfer takes, declared here rather than reached through rect.h for
   the reason title.cpp declares its own: every rectangle this overlay builds is built by a
   constructor that assigns x, y, w and h in that order, and rect.h's assigns them in the other. */
template <class T>
class CRect
{
public:
    CRect() {}
    CRect(T x_, T y_, T w_, T h_)
    {
        x = x_;
        y = y_;
        w = w_;
        h = h_;
    }

    T x;
    T y;
    T w;
    T h;
} __attribute__((aligned(16)));

/* The three classes this scene places in the world, declared here rather than reached through
   headers of their own because each is another unit's to type. Only the members this file touches
   are named; the extents are the sizes the executable gives the objects below. */

/* A frame parented to an object, which is what lets the world transform drive a model. */
class CObjectFrame : public CObject
{
public:
    virtual void FrameObjectOnOff(char* name, int on);
    virtual void Draw();

    void SetFrame(CFrameVu1* frame, int unknown0);
};

/* One piece of scenery. The scene builds a table of them, hands each its model, and drives them
   through the object dispatch like anything else in the world. */
class CMapObject : public CObjectFrame
{
public:
    CMapObject();

    virtual void Draw();

    void Initialize();
    void DrawShadow(int unknown0);

    char unk_00[36];
    CFrameVu1* lod_model;
    char unk_28[8];
    float lod_distance;
    int unk_34;
    int draw_on;
    char unk_3C[4];
};

/* The scene's one fire, which is a light rather than a model. */
class CFireOmni
{
public:
    CFireOmni();

    void FireStep();
    void FireCreate();
    void DrawFire(int unknown0, int unknown1, CCamera* camera, float* eye, float scale,
                  int unknown2, float unknown3);

    char unk_00[32];
    sceVu0FVECTOR pos;
    char unk_30[16];
};

/* One looping object animation: a frame is found by name and then driven between two motion
   numbers at a rate, with a scale and a position offset of its own. */
class OBJ_ANIME_SEQ
{
public:
    OBJ_ANIME_SEQ();

    void Initialize();

    char name[16];
    int motion_start;
    int motion_end;
    char unk_18[8];
    sceVu0FVECTOR scale;
    sceVu0FVECTOR pos;
    float unk_40;
    float draw_on;
    float step;
    char unk_4C[60];
};

/* One actor's face, as this scene animates it. The eyes and the mouth are two strips of frames
   stacked bottom-up in one 256-wide texture — the eyes down the left half and the mouth down the
   right — and a tick copies the current frame of each over the plate the model draws with. The two
   offsets are measured from the bottom edge of the plate; the blink state is kept here because this
   scene blinks the cast on a clock of its own rather than from the script. */
struct FACE_INFO
{
    char* plate;
    char* strip;
    int eye_bottom;
    int eye_height;
    int mouth_bottom;
    int mouth_height;
    int eye;
    int mouth;
    int strip_bottom;
    int eye_max;
    int blink;
};

/* One piece of scenery as the scene was laid out: the model, the model its distant form is drawn
   from, where it stands in tenths of a world unit, and its heading in degrees. */
struct MAPOBJ_INFO
{
    char* name;
    char* lod_name;
    float pos[3];
    float rotation[3];
};

/* The one wind this scene runs, which is the cloth simulation's own class. */
class CWind
{
public:
    CWind();

    void SetDir(float* dir);
    void SetVelocity(float velocity);

    char unk_00[48];
};

void wait_now_loading_vsync();
void OPAnalyz(char* name);
void OPMdsLoad();
void OpPlayVolSE(int group, int no, int voice, float volume);
void OpPlayVolPanSE(float* position, float near_dist, float far_dist, int group, int no,
                    int voice);
void OpSetVolPanSE(float* position, float near_dist, float far_dist, int group, int no,
                   int voice);
int OpGetVolSQ(int no);
void OpBgmPlay();
void InitObjAnime(CFrame* frame, OBJ_ANIME_SEQ* sequence);
void ObjAnimePlay(OBJ_ANIME_SEQ* sequence);
void MoveImageTest(sceVif1Packet* packet, int sbp, int sbw, int spsm,
                   const CRect<int>& rect, int dbp, int dbw, int dpsm, int dsax,
                   int dsay, int dir);
void MGSetRenderInfo(float scale, float near_z, float far_z);
void MGBeginDrawShadow(sceGsTex0 tex);
void MGEndDrawShadow(u_char alpha);
sceVif1Packet* GetVif1Packet();
void DepthOfField(float* dist, int level, int alpha, int blur);

extern "C" char* strcpy(char* dst, const char* src);

extern sceVif1Packet* Vif1Packet;
extern sceGifTag GiftagAD;
extern u_int* read_buffer;
extern CCharacter Chara[23];
extern CCharacter Cam[4];
extern char CharaTex[23];
extern CDataAlloc2<1> CharaDataBuffer[7];
extern CDataAlloc2<1> MapDataBuffer;
extern int OpBgmSqPort;
static CFrameVu1* ToansHouse;
static CFrameVu1* DoransFuusya[2];
static int VolFade;
extern int OP_FireList;
extern sceVu0FVECTOR OP_FirePosition[96];
extern float OP_FireScale[96];
extern int OP_FireFlg[96];
extern CCamera OP_MainCamera;
extern CFrame* OP_CharaFrame;
extern RenderInfo mgRenderInfo;
extern int SceneNp;
extern int Pause;

static void setTexAnime();
void FaceChange(int no);
void FaceChangeC(int no);

CMapObject OP_NornMapObj[76];
CMapObject OP_NornMapObj2[87];

static CFireOmni CFire;
static CCharacter Komono;
static OBJ_ANIME_SEQ Door;
static OBJ_ANIME_SEQ Fuusya[2];
CWind Wind;
static CFrame* TaimatsuFrame[12];
static OBJ_ANIME_SEQ Taimatsu[12];
static CMapObject OP_ToanMapObj;

/* One actor's blinking and speaking. Four of the eight rows are never blinked because their actors
   are too far from the camera for it to read, and the two the script talks through carry a hand-off
   of their own: an eye number the script set is stepped on by one here once the line it belongs to
   has been on screen long enough, which is how a raised eyebrow outlasts the word that raised it.
   The mouth is driven from the script's own clock, a new frame picked at random every sixth
   hundredth of a second left on the line's timer while the actor is talking. */
void FaceChange(int no)
{
    sceGifTag giftag = { 0, 1, 0, 0, 0, 0, 1, SCE_GIF_PACKED_AD };
    static FACE_INFO face[8] = {
        { "c07a01", "c07a01an", 42, 40, 87, 35, 0, 0, 256, 2, 0 },
        { "c08a01", "c08a01an", 42, 40, 87, 35, 0, 0, 320, 2, 0 },
        { "c11a01", "c11a01an", 32, 40, 84, 35, 0, 0, 448, 3, 0 },
        { "c09a01", "c09a01an", 10, 40, 73, 35, 0, 0, 448, 2, 0 },
        { "c08a01", "c08a01an", 42, 40, 87, 35, 0, 0, 320, 2, 0 },
        { "c08a01", "c08a01an", 42, 40, 87, 35, 0, 0, 320, 2, 0 },
        { "p19a_03", "p19a_03an", 8, 40, 76, 35, 0, 0, 256, 2, 0 },
        { "p17a01", "p17a01an", 42, 40, 87, 35, 0, 0, 320, 2, 0 }
    };
    CTexture* plate;
    CTexture* strip;
    int sbp;
    int dbp;
    int sbw;
    int dbw;

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128*)&giftag);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);
    sceVif1PkTerminate(Vif1Packet);

    plate = TexManager.GetTexture(face[no].plate, -1);
    strip = TexManager.GetTexture(face[no].strip, -1);

    if (plate == 0 || strip == 0) {
        return;
    }

    sbp = strip->tex0 & 0x3fff;
    dbp = plate->tex0 & 0x3fff;
    sbw = (strip->tex0 >> 14) & 0x3f;
    dbw = (plate->tex0 >> 14) & 0x3f;

    if (no == 1) {
        return;
    }
    if (no == 4) {
        return;
    }
    if (no == 5) {
        return;
    }
    if (no == 7) {
        return;
    }

    if (!Pause) {
        if (CScript.obj[no].eye > face[no].eye_max) {
            face[no].blink = 0;
        }

        if (CScript.obj[no].eye_time >= CScript.motion_step) {
            CScript.obj[no].eye_time -= CScript.motion_step;

            switch (face[no].blink) {
            case 1:
                if (CScript.obj[no].eye < face[no].eye_max) {
                    CScript.obj[no].eye++;

                    if (CScript.obj[no].eye == face[no].eye_max) {
                        face[no].blink = 2;
                    }
                }
                break;
            case 2:
                if (CScript.obj[no].eye > 0) {
                    CScript.obj[no].eye--;
                }
                break;
            }
        } else if (rand() % 200 == 0) {
            if (CScript.obj[no].eye == 0) {
                face[no].blink = 1;
                CScript.obj[no].eye = 1;
                CScript.obj[no].eye_time = 15.0f * CScript.motion_step;
            }
        } else if (no == 2) {
            if (CScript.obj[2].eye == 5) {
                CScript.obj[2].eye = 4;
                CScript.obj[2].eye_time = CScript.motion_step;
            } else {
                CScript.obj[no].eye = 0;
                face[no].blink = 0;
            }
        } else {
            CScript.obj[no].eye = 0;
            face[no].blink = 0;
        }
    }

    face[no].eye = CScript.obj[no].eye;

    MoveImageTest(Vif1Packet, sbp, sbw, SCE_GS_PSMT8,
                  CRect<int>(0, face[no].strip_bottom - face[no].eye_height * (face[no].eye + 1),
                             128, face[no].eye_height),
                  dbp, dbw, SCE_GS_PSMT8, 0, 88 - face[no].eye_bottom, 0);

    if (!Pause) {
        if (CScript.obj[2].eye_time > 1.0f) {
            if (CScript.obj[2].eye == 4) {
                CScript.obj[2].eye = 5;
            }
            if (CScript.obj[2].eye == 6) {
                CScript.obj[2].eye = 7;
            }
        }

        if (CScript.obj[3].eye_time > 1.0f) {
            if (CScript.obj[3].eye == 3) {
                CScript.obj[3].eye = 4;
            }
        }
    }

    if (!Pause) {
        if (CScript.obj[no].mouth_time >= CScript.motion_step) {
            CScript.obj[no].mouth_time -= CScript.motion_step;

            if (CScript.obj[no].talk) {
                if ((int)(100.0f * CScript.obj[no].mouth_time) % 6 == 0) {
                    CScript.obj[no].mouth = rand() % 4;
                }
            }
        } else {
            CScript.obj[no].mouth = 0;
            CScript.obj[no].talk = 0;
        }
    }

    face[no].mouth = CScript.obj[no].mouth;

    MoveImageTest(Vif1Packet, sbp, sbw, SCE_GS_PSMT8,
                  CRect<int>(128,
                             face[no].strip_bottom - face[no].mouth_height * (face[no].mouth + 1),
                             128, face[no].mouth_height),
                  dbp, dbw, SCE_GS_PSMT8, 0, 88 - face[no].mouth_bottom, 0);

    if (!Pause) {
        if (CScript.obj[2].mouth == 4) {
            CScript.obj[2].mouth = 5;
        }
    }

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128*)&GiftagAD);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);
}
void LoadCharaData(int kind, int no)
{
    char* name[6][2] = {
        { "opdat/chara/01c07a.chr", "01c07a.cfg" },
        { "opdat/chara/01c08a.chr", "01c08a.cfg" },
        { "opdat/chara/01c11a.chr", "01c11a.cfg" },
        { "opdat/chara/01c09a.chr", "01c09a.cfg" },
        { "opdat/chara/01c08b.chr", "01c08b.cfg" },
        { "opdat/chara/01c08c.chr", "01c08c.cfg" }
    };

    switch (CScript.obj[no].load_motion) {
    case 0:
        LoadFileBG(name[no][0], (u_long128*)read_buffer, 0);
        CScript.obj[no].load_motion = 1;
        break;
    case 1:
        if (!ReadBGSync()) {
            CScript.obj[no].load_motion = 2;
        }
        break;
    case 2:
        Chara[no].Initialize();
        CharaDataBuffer[kind].used = 0;
        Chara[no].LoadPackData(read_buffer, name[no][1],
                               &CharaDataBuffer[kind], 0);
        Chara[no].motion_type.state.time = 10.0f;
        Chara[no].motion_type.state.unk_08 = 0.05f;
        Chara[no].motion_type.state.motion_no = 0;
        Chara[no].motion_type.state.playing_no = 0;
        CScript.obj[no].load = -1;
        CScript.obj[no].load_motion = -1;
        break;
    }
}

/* The couple's dance, which is ten motion files played end to end. A file is swapped in when the
   one running reaches its last key and the next pair is started in the background straight after,
   so the dance runs continuously off a buffer that only ever holds two steps. */
void LoadMotionData()
{
    char* motion[20][2] = {
        { "opdat/chara/01p19a1a.chr", "01p19a1a.cfg" },
        { "opdat/chara/01p19a1b.chr", "01p19a1b.cfg" },
        { "opdat/chara/01p19a2a.chr", "01p19a2a.cfg" },
        { "opdat/chara/01p19a2a.chr", "01p19a2a.cfg" },
        { "opdat/chara/01p19a2b.chr", "01p19a2b.cfg" },
        { "opdat/chara/01p19a3.chr", "01p19a3.cfg" },
        { "opdat/chara/01p19a3b.chr", "01p19a3b.cfg" },
        { "opdat/chara/01p19a4a.chr", "01p19a4a.cfg" },
        { "opdat/chara/01p19a4b.chr", "01p19a4b.cfg" },
        { "opdat/chara/01p19a5.chr", "01p19a5.cfg" },
        { "opdat/chara/01p17a1a.chr", "01p17a1a.cfg" },
        { "opdat/chara/01p17a1b.chr", "01p17a1b.cfg" },
        { "opdat/chara/01p17a2a.chr", "01p17a2a.cfg" },
        { "opdat/chara/01p17a2a.chr", "01p17a2a.cfg" },
        { "opdat/chara/01p17a2b.chr", "01p17a2b.cfg" },
        { "opdat/chara/01p17a3.chr", "01p17a3.cfg" },
        { "opdat/chara/01p17a3b.chr", "01p17a3b.cfg" },
        { "opdat/chara/01p17a4a.chr", "01p17a4a.cfg" },
        { "opdat/chara/01p17a4b.chr", "01p17a4b.cfg" },
        { "opdat/chara/01p17a5.chr", "01p17a5.cfg" }
    };

    if (DanceCnt < 10) {
        if (Chara[6].motion_type.state.time >
            (float)(Chara[6].motion_type.motion_info->end - 1)) {
            if (DanceCnt != 2) {
                CharaDataBuffer[6].used = 0;
                Chara[6].LoadPackData((u_int*)((char*)read_buffer + 0x10C900),
                                      motion[DanceCnt][1],
                                      &CharaDataBuffer[4],
                                      &CharaDataBuffer[6], 0);
                Chara[7].LoadPackData(read_buffer, motion[DanceCnt + 10][1],
                                      &CharaDataBuffer[4],
                                      &CharaDataBuffer[6], 0);
            }

            Chara[6].motion_type.motion_info->start = noroi[DanceCnt].start;
            Chara[6].motion_type.motion_info->end = noroi[DanceCnt].end;
            Chara[6].motion_type.state.time =
                (float)Chara[6].motion_type.motion_info->start;
            Chara[7].motion_type.motion_info->start = dancer[DanceCnt].start;
            Chara[7].motion_type.motion_info->end = dancer[DanceCnt].end;
            Chara[7].motion_type.state.time =
                (float)Chara[7].motion_type.motion_info->start;
            DanceCnt++;

            if (DanceCnt != 3 && DanceCnt < 10) {
                LoadFileBG(motion[DanceCnt][0],
                           (u_long128*)((char*)read_buffer + 0x10C900), 0);
                LoadFileBG(motion[DanceCnt + 10][0], (u_long128*)read_buffer, 0);
            }
        }

        Chara[6].motion_no = 0;
        Chara[6].flags = 0;
        Chara[6].motion_speed = -1.0f;

        if (Chara[6].motion_type.state.time > 225.0f) {
            DanceStart = 1;
        }

        if (DanceStart == 1) {
            Chara[7].motion_no = 0;
            Chara[7].flags = 0;
            Chara[7].motion_speed = -1.0f;
        } else {
            Chara[7].motion_no = 1;
            Chara[7].flags = 0;
            Chara[7].motion_speed = -1.0f;
        }
    }
}
void OpB_LoadDataBG()
{
    while (ReadBGSync()) ;
    LoadFileBG("opdat/norn/norn.pak", (u_long128*)read_buffer, 0);
    CScript.load_no = -1;
}

void OpB_LoadDataBG2()
{
    while (ReadBGSync()) ;
    LoadFileBG("opdat/toan/toan.pim", (u_long128*)read_buffer, 0);
    CScript.load_no = -1;
}

/* The village scene's set-up, and the shape every scene file's is a variation of. The textures come
   out of the pack the background load left in memory, so the manifest is built with its five fixed
   surfaces named and its eighteen scene images filled in by name afterwards. The two tables below
   are the scene as it was laid out: a model, the model its distant form is drawn from, a position in
   tenths of a world unit and a heading in degrees, one row per piece of scenery. The rows with no
   model of their own are further copies of the row above them, which is why the frame is only
   reloaded where a name is given. */
void OpB_InitProcess()
{
    LOADTEXTURE_INFO2 tex[] = {
        { "#blender#640#224#4", 0, 0 },
        { "#fontbase#512#256#1", 26, 0 },
        { "#fukidashibase#640#224#4", 26, 0 },
        { "#shadow_buff#640#224#4", 23, 0 },
        { "#frame_image#640#224#4", 21, 0 },
        { 0, 2, 0 },
        { 0, 10, 0 },
        { 0, 10, 0 },
        { 0, 10, 0 },
        { 0, 10, 0 },
        { 0, 11, 0 },
        { 0, 11, 0 },
        { 0, 11, 0 },
        { 0, 11, 0 },
        { 0, 11, 0 },
        { 0, 26, 0 },
        { 0, 26, 0 },
        { 0, 26, 0 },
        { 0, 0, 0 },
        { 0, 19, 0 },
        { 0, 19, 0 },
        { 0, 19, 0 },
        { 0, 2, 0 },
        { "", 0, 0 }
    };

    while (ReadBGSync()) ;

    tex[5].name = (char*)GetPackFile(read_buffer, "p09a01.img", 0);
    tex[6].name = (char*)GetPackFile(read_buffer, "e01b01.img", 0);
    tex[7].name = (char*)GetPackFile(read_buffer, "e01b02.img", 0);
    tex[8].name = (char*)GetPackFile(read_buffer, "e01b03.img", 0);
    tex[9].name = (char*)GetPackFile(read_buffer, "e01t01.img", 0);
    tex[10].name = (char*)GetPackFile(read_buffer, "t0003.img", 0);
    tex[11].name = (char*)GetPackFile(read_buffer, "e01s03.img", 0);
    tex[12].name = (char*)GetPackFile(read_buffer, "e01s06.img", 0);
    tex[13].name = (char*)GetPackFile(read_buffer, "t0001.img", 0);
    tex[14].name = (char*)GetPackFile(read_buffer, "t0002.img", 0);
    tex[15].name = (char*)GetPackFile(read_buffer, "gaiji.img", 0);
    tex[16].name = (char*)GetPackFile(read_buffer, "fuki256.img", 0);
    tex[17].name = (char*)GetPackFile(read_buffer, "syst04.img", 0);
    tex[18].name = (char*)GetPackFile(read_buffer, "fire.img", 0);
    tex[19].name = (char*)GetPackFile(read_buffer, "pause.img", 0);
    tex[20].name = (char*)GetPackFile(read_buffer, "pause_e.img", 0);
    tex[21].name = (char*)GetPackFile(read_buffer, "start2.img", 0);
    tex[22].name = (char*)GetPackFile(read_buffer, "p09a01an.img", 0);

    TexManager.Initialize(16352);
    TexManager.LoadTextureBlock(-1, tex);

    CharaTex[9] = 2;
    CharaTex[11] = 22;
    CharaTex[8] = 22;
    CharaTex[10] = 22;

    CSnd.SetReverb(0, 4, 30);
    CSnd.SetReverb(1, 4, 5);
    CSnd.LoadSoundFileFromPack("o02a.txt", read_buffer);
    CSnd.SetVol(15, 256);
    CSnd.SetVol(14, 256);
    CSnd.SetVol(13, 256);
    CSnd.SetVol(12, 256);
    OpBgmSqPort = 0;
    OpBgmPlay();
    CSnd.SQ_Play(1, 0);
    OpPlayVolSE(15, 16, 22, 0.6f);
    CSnd.Step();
    CSnd.SE_Play(15, 16, 21, 0);
    OP_FireList = 0;
    OPAnalyz("opdat/norn.cfg");
    OPMdsLoad();

    MAPOBJ_INFO norn[] = {
        { "opdat/norn/t0005.mds", 0, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } },
        { "opdat/norn/e01h01_0.mds", "opdat/norn/e01h01_s.mds", { -35.0f, 0.0f, -10.0f }, { 0.0f, 0.0f, 0.0f } },
        { "opdat/norn/e01h03_2.mds", "opdat/norn/e01h03_s.mds", { -15.0f, 0.0f, -50.0f }, { 0.0f, 0.0f, 0.0f } },
        { "opdat/norn/e01h10_2.mds", "opdat/norn/e01h10_s.mds", { 15.0f, 0.0f, -50.0f }, { 0.0f, 0.0f, 0.0f } },
        { "opdat/norn/e01h07_0.mds", "opdat/norn/e01h07_s.mds", { 5.0f, 0.0f, -10.0f }, { 0.0f, 0.0f, 0.0f } },
        { "opdat/norn/e01h08_2.mds", "opdat/norn/e01h08_s.mds", { -45.0f, 0.0f, -35.0f }, { 0.0f, 0.0f, 0.0f } },
        { "opdat/norn/t0002.mds", 0, { -35.0f, 0.0f, -55.0f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -55.0f, 0.0f, -45.0f }, { 0.0f, 0.0f, 0.0f } },
        { "opdat/norn/e01t01_0.mds", 0, { -5.0f, 0.1f, 5.0f }, { 0.0f, 0.0f, 0.0f } },
        { "opdat/norn/e01t01_1.mds", 0, { 15.0f, 0.1f, 5.0f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -55.0f, 0.1f, 15.0f }, { 0.0f, 0.0f, 0.0f } },
        { "opdat/norn/e01t01_2.mds", 0, { -45.0f, 0.1f, -55.0f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -55.0f, 0.1f, -65.0f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -45.0f, 0.1f, -65.0f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -35.0f, 0.1f, -65.0f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -5.0f, 0.1f, -75.0f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 5.0f, 0.1f, -75.0f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 15.0f, 0.1f, -65.0f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 25.0f, 0.1f, -65.0f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 35.0f, 0.1f, -55.0f }, { 0.0f, 0.0f, 0.0f } },
        { "opdat/norn/e01c01_0.mds", 0, { 25.0f, 0.0f, -35.0f }, { 0.0f, 180.0f, 0.0f } },
        { 0, 0, { -55.0f, 0.0f, -25.0f }, { 0.0f, 90.0f, 0.0f } },
        { 0, 0, { -55.0f, 0.0f, -25.0f }, { 0.0f, -90.0f, 0.0f } },
        { "opdat/norn/e01c02_0.mds", 0, { -25.0f, 0.0f, -35.0f }, { 0.0f, 90.0f, 0.0f } },
        { 0, 0, { -5.0f, 0.0f, -35.0f }, { 0.0f, 90.0f, 0.0f } },
        { 0, 0, { 5.0f, 0.0f, -35.0f }, { 0.0f, 90.0f, 0.0f } },
        { 0, 0, { 15.0f, 0.0f, -35.0f }, { 0.0f, 90.0f, 0.0f } },
        { 0, 0, { 25.0f, 0.0f, -15.0f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 25.0f, 0.0f, -5.0f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 25.0f, 0.0f, 5.0f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 15.0f, 0.0f, 15.0f }, { 0.0f, 90.0f, 0.0f } },
        { 0, 0, { -5.0f, 0.0f, 15.0f }, { 0.0f, 90.0f, 0.0f } },
        { 0, 0, { -15.0f, 0.0f, 15.0f }, { 0.0f, 90.0f, 0.0f } },
        { 0, 0, { -35.0f, 0.0f, 15.0f }, { 0.0f, 90.0f, 0.0f } },
        { 0, 0, { -45.0f, 0.0f, 25.0f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -45.0f, 0.0f, 35.0f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -45.0f, 0.0f, 45.0f }, { 0.0f, 0.0f, 0.0f } },
        { "opdat/norn/e01c06_0.mds", 0, { -35.0f, 0.0f, -35.0f }, { 0.0f, 90.0f, 0.0f } },
        { "opdat/norn/e01c07_0.mds", 0, { -15.0f, 0.0f, -35.0f }, { 0.0f, -90.0f, 0.0f } },
        { 0, 0, { 25.0f, 0.0f, -25.0f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 5.0f, 0.0f, 15.0f }, { 0.0f, 90.0f, 0.0f } },
        { 0, 0, { 0.0f, 0.0f, 15.0f }, { 0.0f, 90.0f, 0.0f } },
        { "opdat/norn/e01r01_0.mds", 0, { -55.0f, 0.05f, -35.0f }, { 0.0f, -90.0f, 0.0f } },
        { 0, 0, { -55.0f, 0.05f, -25.0f }, { 0.0f, 90.0f, 0.0f } },
        { "opdat/norn/e01r02_0.mds", 0, { -45.0f, 0.05f, -25.0f }, { 0.0f, 90.0f, 0.0f } },
        { 0, 0, { -35.0f, 0.05f, -25.0f }, { 0.0f, 90.0f, 0.0f } },
        { 0, 0, { -25.0f, 0.05f, -25.0f }, { 0.0f, 90.0f, 0.0f } },
        { 0, 0, { -5.0f, 0.05f, -25.0f }, { 0.0f, 90.0f, 0.0f } },
        { 0, 0, { 5.0f, 0.05f, -25.0f }, { 0.0f, 90.0f, 0.0f } },
        { 0, 0, { 15.0f, 0.05f, -25.0f }, { 0.0f, 90.0f, 0.0f } },
        { 0, 0, { -15.0f, 0.05f, -15.0f }, { 0.0f, 0.0f, 0.0f } },
        { "opdat/norn/e01r03_0.mds", 0, { -15.0f, 0.05f, -25.0f }, { 0.0f, 0.0f, 0.0f } },
        { "opdat/norn/e01r06_0.mds", 0, { -65.0f, 0.05f, -35.0f }, { 0.0f, 90.0f, 0.0f } },
        { 0, 0, { -15.0f, 0.05f, -5.0f }, { 0.0f, 180.0f, 0.0f } },
        { "opdat/norn/t0004.mds", 0, { -22.9331f, 0.05f, 9.8816f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -26.9302f, 0.05f, 9.8816f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -26.9302f, 0.05f, 20.2919f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -22.9331f, 0.05f, 20.2919f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 3.0797f, 0.05f, 20.2919f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 7.0849f, 0.05f, 20.2919f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 7.0849f, 0.05f, 9.8816f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 3.0797f, 0.05f, 9.8816f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 19.8785f, 0.05f, -22.8436f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 19.8785f, 0.05f, -27.0007f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -12.8131f, 0.05f, -28.8014f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -16.9416f, 0.05f, -28.8014f }, { 0.0f, 0.0f, 0.0f } },
        { "opdat/norn/e01g02_0.mds", 0, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } },
        { "opdat/norn/e01g03_0.mds", 0, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } }
    };
    CFrameAttr attr;
    CFrameVu1* frame;
    CMapObject* object;

    attr.unk_0C = 1;
    MapDataBuffer.used = 0;

    for (int i = 0; i < 68; i++) {
        if (norn[i].name) {
            LoadFile(norn[i].name, (void*)read_buffer, 0);
            frame = LoadMDSFile(read_buffer, &MapDataBuffer, 2, 0, 0);
        }

        if (i == 4) DoransFuusya[0] = frame;
        if (i == 5) DoransFuusya[1] = frame;
        if (i >= 54 && i < 66) TaimatsuFrame[i - 54] = frame;

        frame->SetAttr(attr, 1, 64);
        SetFrameAttr(frame, 1);

        object = &OP_NornMapObj[i];

        object->Initialize();
        object->SetFrame(frame, 0);
        OP_NornMapObj[i].draw_on = 0;
        OP_NornMapObj[i].unk_34 = 0;

        object->SetPosition(CVector3_f_(10.0f * norn[i].pos[0],
                                            10.0f * norn[i].pos[1],
                                            10.0f * norn[i].pos[2]));
        object->SetRotation(CVector3_f_((float)(PI * norn[i].rotation[0] / 180),
                                            (float)(PI * norn[i].rotation[1] / 180),
                                            (float)(PI * norn[i].rotation[2] / 180)));

        object->FrameObjectOnOff("win1", 0);
        object->FrameObjectOnOff("light1", 0);

        if (norn[i].lod_name) {
            LoadFile(norn[i].lod_name, (void*)read_buffer, 0);
            object->lod_model = LoadMDSFile(read_buffer, &MapDataBuffer, 14, 0, 0);
            object->lod_distance = -20.0f;
        }
    }

    MAPOBJ_INFO ground[] = {
        { "opdat/norn/t0006.mds", 0, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } },
        { "opdat/norn/t0001.mds", 0, { -25.0203f, 0.03f, -21.3403f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -35.0203f, 0.03f, -21.3403f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -45.0203f, 0.03f, -21.3403f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -55.0203f, 0.03f, -21.3403f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -45.0203f, 0.03f, -28.3403f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -35.0203f, 0.03f, -28.3403f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -25.0203f, 0.03f, -28.3403f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -5.0203f, 0.03f, -28.3403f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 4.9797f, 0.03f, -28.3403f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 14.9797f, 0.03f, -21.3403f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 14.9797f, 0.03f, -28.3403f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 4.9797f, 0.03f, -21.3403f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -5.0203f, 0.03f, -21.3403f }, { 0.0f, 0.0f, 0.0f } },
        { "opdat/norn/t0003.mds", 0, { -50.0f, 0.03f, -21.2932f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -40.0f, 0.03f, -21.2932f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -30.0f, 0.03f, -21.2932f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 0.0f, 0.03f, -21.2932f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 10.0f, 0.03f, -21.2932f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 10.0f, 0.03f, -28.2932f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -30.0f, 0.03f, -28.2932f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { 0.0f, 0.03f, -28.2932f }, { 0.0f, 0.0f, 0.0f } },
        { 0, 0, { -40.0f, 0.03f, -28.2932f }, { 0.0f, 0.0f, 0.0f } }
    };

    for (int i = 0; i < 23; i++) {
        if (ground[i].name) {
            LoadFile(ground[i].name, (void*)read_buffer, 0);
            frame = LoadMDSFile(read_buffer, &MapDataBuffer, 2, 0, 0);
        }

        if (i > 0) {
            frame->SetAttr(attr, 1, 64);
            SetFrameAttr(frame, 1);
        }

        if (i == 0) {
            CFrame* sun = frame->SearchFrame("sun3");
            sceVu0FVECTOR position;

            sceVu0CopyVector(position, sun->position);
            position[1] += 30.0f;
            position[2] -= 300.0f;
            sun->SetPosition(position);
        }

        object = &OP_NornMapObj2[i];

        object->Initialize();
        object->SetFrame(frame, 0);
        OP_NornMapObj2[i].draw_on = 0;
        OP_NornMapObj2[i].unk_34 = 0;

        object->SetPosition(CVector3_f_(10.0f * ground[i].pos[0],
                                            10.0f * ground[i].pos[1],
                                            10.0f * ground[i].pos[2]));
        ((CMapObject&)OP_NornMapObj2[i]).SetRotation(
            CVector3_f_((float)(PI * ground[i].rotation[0] / 180),
                            (float)(PI * ground[i].rotation[1] / 180),
                            (float)(PI * ground[i].rotation[2] / 180)));
    }

    LoadFile("opdat/chara/03p09a.chr", (void*)read_buffer, 0);
    CharaDataBuffer[6].used = 0;
    Chara[9].LoadPackData(read_buffer, "03p09a.cfg",
                          &CharaDataBuffer[6], 0);

    CFrameAttr chara_attr;

    chara_attr.unk_08 = 0;
    Chara[9].frame->SetAttr(chara_attr, 1, 4);
    Chara[9].motion_type.state.time = 10.0f;
    Chara[9].motion_type.state.unk_08 = 0.05f;
    Chara[9].motion_type.state.motion_no = 0;
    Chara[9].motion_type.state.playing_no = 0;

    Fuusya[0].Initialize();
    Fuusya[0].motion_start = 0;
    Fuusya[0].motion_end = 0;
    Fuusya[0].scale[2] = 0.0f;
    Fuusya[0].scale[1] = 0.0f;
    Fuusya[0].scale[0] = 0.0f;
    Fuusya[0].pos[2] = 0.0f;
    Fuusya[0].pos[1] = 0.0f;
    Fuusya[0].pos[0] = 0.0f;
    Fuusya[0].draw_on = 0.0f;
    Fuusya[0].unk_40 = 0.0f;
    Fuusya[0].step = -0.5f;
    strcpy(Fuusya[0].name, "hane");
    InitObjAnime(DoransFuusya[0], &Fuusya[0]);

    Fuusya[1].Initialize();
    Fuusya[1].motion_start = 0;
    Fuusya[1].motion_end = 0;
    Fuusya[1].scale[2] = 0.0f;
    Fuusya[1].scale[1] = 0.0f;
    Fuusya[1].scale[0] = 0.0f;
    Fuusya[1].pos[2] = 0.0f;
    Fuusya[1].pos[1] = 0.0f;
    Fuusya[1].pos[0] = 0.0f;
    Fuusya[1].draw_on = 0.0f;
    Fuusya[1].unk_40 = 0.0f;
    Fuusya[1].step = -0.5f;
    strcpy(Fuusya[1].name, "hane");
    InitObjAnime(DoransFuusya[1], &Fuusya[1]);

    for (int i = 0; i < 12; i++) {
        Taimatsu[i].Initialize();
        Taimatsu[i].motion_start = 3;
        Taimatsu[i].motion_end = 4;
        Taimatsu[i].scale[2] = 80.0f;
        Taimatsu[i].scale[1] = 80.0f;
        Taimatsu[i].scale[0] = 80.0f;
        Taimatsu[i].pos[2] = 128.0f;
        Taimatsu[i].pos[1] = 128.0f;
        Taimatsu[i].pos[0] = 128.0f;
        strcpy(Taimatsu[i].name, "effect");
        InitObjAnime(TaimatsuFrame[i], &Taimatsu[i]);
    }

    VolFade = 0;
    CScript.init_no = 0;
}

/* The second half of the scene, which starts when the camera cuts to Toan's house. Everything the
   first half loaded is thrown away and the pack the background read left in memory is unpacked
   again: the block numbers say which of the registry's blocks each image belongs to, and the five
   named entries are the fixed surfaces the registry keeps for every scene. The three actors are
   loaded one at a time rather than through a table because each is followed by set-up of its own —
   Toan's mother has a frame turned off, Toan himself carries the cloth the wind drives, and the
   second Toan is the one the door animation is timed against. */
void OpB_InitProcess2()
{
    LOADTEXTURE_INFO2 tex[] = {
        { "#blender#640#224#4", 0, 0 },
        { "#fontbase#512#256#1", 26, 0 },
        { "#fukidashibase#640#224#4", 26, 0 },
        { "#shadow_buff#640#224#4", 23, 0 },
        { "#frame_image#640#224#4", 21, 0 },
        { 0, 26, 0 },
        { 0, 26, 0 },
        { 0, 26, 0 },
        { 0, 10, 0 },
        { 0, 2, 0 },
        { 0, 22, 0 },
        { 0, 22, 0 },
        { 0, 22, 0 },
        { 0, 22, 0 },
        { 0, 0, 0 },
        { 0, 19, 0 },
        { 0, 19, 0 },
        { 0, 19, 0 },
        { 0, 2, 0 },
        { "", 0, 0 }
    };

    while (ReadBGSync()) ;

    tex[5].name = (char*)GetPackFile(read_buffer, "gaiji.img", 0);
    tex[6].name = (char*)GetPackFile(read_buffer, "fuki256.img", 0);
    tex[7].name = (char*)GetPackFile(read_buffer, "syst04.img", 0);
    tex[8].name = (char*)GetPackFile(read_buffer, "i01h01n.img", 0);
    tex[9].name = (char*)GetPackFile(read_buffer, "p09a01.img", 0);
    tex[10].name = (char*)GetPackFile(read_buffer, "p10a01.img", 0);
    tex[11].name = (char*)GetPackFile(read_buffer, "c01d01.img", 0);
    tex[12].name = (char*)GetPackFile(read_buffer, "03c01d.img", 0);
    tex[13].name = (char*)GetPackFile(read_buffer, "03komono.img", 0);
    tex[14].name = (char*)GetPackFile(read_buffer, "fire.img", 0);
    tex[15].name = (char*)GetPackFile(read_buffer, "pause.img", 0);
    tex[16].name = (char*)GetPackFile(read_buffer, "pause_e.img", 0);
    tex[17].name = (char*)GetPackFile(read_buffer, "start2.img", 0);
    tex[18].name = (char*)GetPackFile(read_buffer, "p09a01an.img", 0);

    TexManager.Initialize(16352);
    TexManager.LoadTextureBlock(-1, tex);

    OP_FireList = 0;
    OPAnalyz("opdat/toan.cfg");
    OPMdsLoad();

    LoadFile("opdat/toan/t0101.mds", (void*)read_buffer, 0);
    MapDataBuffer.used = 0;
    ToansHouse = LoadMDSFile(read_buffer, &MapDataBuffer, 2, 0, 0);
    OP_ToanMapObj.Initialize();
    OP_ToanMapObj.SetFrame(ToansHouse, 0);
    OP_ToanMapObj.draw_on = 0;
    OP_ToanMapObj.unk_34 = 0;

    LoadFile("opdat/toan/03komono.chr", (void*)read_buffer, 0);
    Komono.LoadPackData(read_buffer, "03komono.cfg", &MapDataBuffer, 0);

    CFrameAttr attr;

    attr.unk_08 = 0;
    Komono.frame->SetAttr(attr, 1, 4);
    Komono.motion_type.state.time = 10.0f;
    Komono.motion_type.state.unk_08 = 0.05f;
    Komono.motion_type.state.motion_no = 0;
    Komono.motion_type.state.playing_no = 0;

    LoadFile("opdat/chara/03p10a.chr", (void*)read_buffer, 0);
    Chara[10].LoadPackData(read_buffer, "03p10a.cfg",
                           &CharaDataBuffer[6], 0);

    CFrameAttr attr2;

    attr2.unk_08 = 0;
    Chara[10].frame->SetAttr(attr2, 1, 4);
    Chara[10].motion_type.state.time = 10.0f;
    Chara[10].motion_type.state.unk_08 = 0.05f;
    Chara[10].motion_type.state.motion_no = 0;
    Chara[10].motion_type.state.playing_no = 0;

    CFrame* soup = Chara[10].frame->SearchFrame("soup_nakami2");

    if (soup) {
            soup->attr.draw_on = 0;
    }

    LoadFile("opdat/chara/03c01d.chr", (void*)read_buffer, 0);
    Chara[8].LoadPackData(read_buffer, "03c01d.cfg",
                          &CharaDataBuffer[6], 0);

    CFrameAttr attr3;

    attr3.unk_08 = 0;
    Chara[8].frame->SetAttr(attr3, 1, 4);
    Chara[8].motion_type.state.time = 10.0f;
    Chara[8].motion_type.state.unk_08 = 0.05f;
    Chara[8].motion_type.state.motion_no = 0;
    Chara[8].motion_type.state.playing_no = 0;

    sceVu0FVECTOR dir;

    dir[3] = 0.0f;
    dir[1] = 0.0f;
    dir[2] = 0.0f;
    dir[0] = 0.0f;
    Wind.SetDir(dir);
    Wind.SetVelocity(0.0f);
    Chara[8].unk_C98 = (int)&Wind;
    Chara[8].ClothStep(-1);

    LoadFile("opdat/chara/03c01d2.chr", (void*)read_buffer, 0);
    Chara[11].LoadPackData(read_buffer, "03c01d2.cfg",
                           &CharaDataBuffer[6], 0);

    attr3.unk_08 = 0;
    Chara[11].frame->SetAttr(attr3, 1, 4);
    Chara[11].motion_type.state.time = 160.0f;
    Chara[11].motion_type.state.unk_08 = 0.1f;
    Chara[11].motion_type.state.motion_no = 0;
    Chara[11].motion_type.state.playing_no = 0;

    Door.Initialize();
    Door.motion_start = 0;
    Door.motion_end = 3;
    Door.scale[0] = 0.0f;
    Door.scale[1] = 0.0f;
    Door.scale[2] = 0.0f;
    Door.pos[0] = 0.0f;
    Door.pos[1] = 0.0f;
    Door.pos[2] = 0.0f;
    Door.unk_40 = 0.0f;
    Door.draw_on = 0.0f;
    Door.step = 0.0f;
    strcpy(Door.name, "door_1");
    InitObjAnime(ToansHouse, &Door);

    CSnd.SE_Stop(15, 16, 22, 0);
    CSnd.SE_Stop(15, 16, 21, 0);
    CSnd.SetVol(0, (float)(OpGetVolSQ(0) * 0.5));
    CSnd.SetVol(1, (float)(OpGetVolSQ(1) * 0.1));
    CScript.init_no = 0;
}

/* The scene's per-tick motion. Four of the actors are told what the script last asked of them —
   the loop is over the four the scene animates rather than over all of them — and a motion that
   has run past its last key falls through to whatever motion was queued behind it. Then the three
   models the camera's own frame tree carries drive three more actors: each is found by name in the
   camera model, and its world transform becomes that actor's position and heading. */
void OpB_MotionProcess()
{
    for (int i = 8; i < 12; i++) {
        if (CScript.obj[i].disp) {
            if (CScript.obj[i].motion_end != -1) {
                if (Chara[i].motion_type.state.time >
                    (float)(Chara[i].motion_type.motion_info[CScript.obj[i].motion].end - 1)) {
                    CScript.obj[i].motion = CScript.obj[i].motion_end;
                    CScript.obj[i].motion_end = -1;
                }
            }

            Chara[i].motion_type.state.unk_08 = CScript.obj[i].step;
            Chara[i].motion_no = CScript.obj[i].motion;
            Chara[i].flags = 0;
            Chara[i].motion_speed = -1.0f;
        }
    }

    char* name[4] = { "c01d", "p09a", "p10a", "c01d" };
    sceVu0FMATRIX matrix;
    float zero = 0.0f;
    sceVu0FVECTOR dir;

    for (int i = 0; i < 4; i++) {
        CFrame* frame = Cam[SceneNp].frame->SearchFrame(name[i]);
        if (frame) {
            frame->GetLWMatrix(matrix);
            Chara[i + 8].SetRotation(zero, atan2f(matrix[2][0], matrix[2][2]), zero);
            float x = matrix[3][0];
            float y = matrix[3][1];
            float z = matrix[3][2];

            Chara[i + 8].SetPosition(x, y, z);
        }
    }

    dir[0] = 0.0f;
    dir[2] = 0.0f;
    dir[1] = 0.0f;
    dir[3] = 0.0f;
    Wind.SetDir(dir);
    Wind.SetVelocity(0.0f);

    static int camera = 0;

    if (camera != CScript.camera_start) {
        camera = CScript.camera_start;

        if (camera == 51) {
            Chara[8].ClothStep(-1);
            for (int i = 0; i < 10; i++) {
                Chara[8].ClothStep(0);
            }
        }
        if (camera == 57) {
            Chara[11].ClothStep(-1);
            for (int i = 0; i < 10; i++) {
                Chara[11].ClothStep(0);
            }
        }
    }

    if (CScript.scene == 1 && !Pause) {
        ObjAnimePlay(&Fuusya[0]);
        ObjAnimePlay(&Fuusya[1]);
        for (int i = 0; i < 12; i++) {
            ObjAnimePlay(&Taimatsu[i]);
        }
    }

    if (CScript.scene == 2) {
        if (CScript.sprite == 1) {
            Door.pos[1] = -85.0f;
            Door.draw_on = -2.8f;
        }
        if (CScript.sprite == 2) {
            Door.pos[1] = 0.0f;
            Door.draw_on = 1.2f;
        }
        if (!Pause) {
            ObjAnimePlay(&Door);
        }
    }
}

/* The scene's per-tick sound. Two of the actors' footfalls are played from their own positions
   rather than from a track, which is why each is a window on the actor's motion frame with a wait
   behind it: a frame number is only inside its window for one tick at the motion's own rate, and
   the wait keeps a stutter in the motion from playing the step twice. Which of the two samples a
   footfall takes is decided by how far the camera's motion has run, because the ground changes
   under the actor part way through the scene. */
void OpB_SoundProcess()
{
    if (CScript.scene == 1) {
        float time = Cam[SceneNp].motion_type.state.time;

        if (CScript.obj[9].motion == 0) {
            static int wait = 0;
            sceVu0FVECTOR position;
            int frame;

            sceVu0CopyVector(position, Chara[9].pos);
            frame = (int)Chara[9].motion_type.state.time;

            if (wait == 0) {
                if (frame > 28 && frame < 30) {
                    if (time < 387.0f) {
                        OpPlayVolPanSE(position, 10.0f, 400.0f, 14, 21, 20);
                    } else {
                        OpPlayVolPanSE(position, 10.0f, 400.0f, 14, 21, 32);
                    }
                    wait = 4;
                } else if (frame > 38 && frame < 40) {
                    if (time < 387.0f) {
                        OpPlayVolPanSE(&position[0], (float)(10 + (frame & 0)),
                                       (float)(wait - wait + 400), 14, 21, 21);
                    } else {
                        OpPlayVolPanSE(position, 10.0f, 400.0f, 14, 21, 33);
                    }
                    wait = 4;
                }
            } else {
                wait = wait - 1;
            }
        }

        sceVu0FVECTOR river = { 50.0f, 50.0f, -100.0f, 0.0f };

        OpSetVolPanSE(river, 100.0f, 400.0f, 15, 16, 21);
    } else if (CScript.scene == 2) {
        if (CScript.sprite == 1) {
            CSnd.SetVol(0, (float)(OpGetVolSQ(0) * 1.0));
            CSnd.SetVol(1, (float)(OpGetVolSQ(1) * 0.7));
        }
        if (CScript.camera_start == 55) {
            CSnd.SetVol(0, (float)(OpGetVolSQ(0) * 0.5));
            CSnd.SetVol(1, (float)(OpGetVolSQ(1) * 0.1));
        }
        if (CScript.camera_start == 55 && CScript.obj[10].motion == 6) {
            static int wait = 0;
            sceVu0FVECTOR position;
            int frame;

            sceVu0CopyVector(position, Chara[9].pos);
            frame = (int)Chara[10].motion_type.state.time;

            if (wait == 0) {
                if (frame > 134 && frame < 136) {
                    OpPlayVolPanSE(position, 50.0f, 300.0f, 14, 21, 32);
                    wait = 5;
                } else if (frame > 144 && frame < 146) {
                    OpPlayVolPanSE(position, 50.0f, 300.0f, 14, 21, 33);
                    wait = 5;
                }
            } else {
                wait = wait - 1;
            }
        }

        sceVu0FVECTOR position;

        sceVu0CopyVector(position, Chara[10].pos);
        OpSetVolPanSE(position, 100.0f, 200.0f, 14, 40, 39);
    }
}

/* The scene's per-tick drawing, in the order the frame is built: the world, then the fires that
   are lights rather than models, then the actors' shadows onto the one buffer that holds them all,
   then the actors themselves, and last the depth of field the two outdoor scenes take. The near
   plane is pulled in to half a unit because the camera passes through the scenery, and the far one
   is the largest the Z buffer holds. */
void OpB_DrawProcess()
{
    RenderInfo* info = &mgRenderInfo;

    MGSetRenderInfo(info->scale[0], 0.5f, 0xffff);
    TexManager.ReloadTexture(Vif1Packet, 10);

    switch (CScript.scene) {
    case 1:
        for (int i = 0; i < 68; i++) {
            CMapObject* obj = &OP_NornMapObj[i];

            obj->Draw();
        }

        TexManager.ReloadTexture(Vif1Packet, 11);

        for (int i = 0; i < 23; i++) {
            CMapObject* obj = &OP_NornMapObj2[i];

            obj->Draw();
        }
        break;

    case 2:
        setTexAnime();
        OP_ToanMapObj.Draw();
        break;
    }

    if (OP_FireList > 0) {
        sceVu0FVECTOR eye;

        TexManager.ReloadTexture(GetVif1Packet(), 0);
        OP_CharaFrame = Cam[SceneNp].frame;
        sceVu0CopyVector(eye, OP_CharaFrame->position);

        if (!Pause) {
            CFire.FireStep();
        }

        CFire.FireCreate();

        for (int i = 0; i < OP_FireList; i++) {
            float z = OP_FirePosition[i][2];
            float y = OP_FirePosition[i][1];
            float x = OP_FirePosition[i][0];

            CFire.pos[0] = 10.0f * x;
            CFire.pos[1] = 10.0f * y;
            CFire.pos[2] = 10.0f * z;
            CFire.pos[3] = 1.0f;

            int flg = OP_FireFlg[i];

            if (flg == 1) {
                CFire.DrawFire(1, 1, &OP_MainCamera, eye, OP_FireScale[i], 3, 15.0f);
            } else {
                CFire.DrawFire(1, 1, &OP_MainCamera, eye, OP_FireScale[i], 2, 15.0f);
            }
        }
    }

    if (CScript.sprite == 3) {
        CFrame* frame = Chara[8].frame->SearchFrame("soup_nakami");

        if (frame) {
        frame->attr.draw_on = 0;
        }
    }

    TexManager.ReloadTexture(Vif1Packet, 23);
    MGBeginDrawShadow(*(sceGsTex0*)&TexManager.GetTexture("shadow_buff", -1)->tex0);

    for (int i = 8; i < 12; i++) {
        if (CScript.obj[i].disp) {
            if (!Pause) {
                Chara[i].ShadowStep();
            }
            Chara[i].DrawShadow();
        }
    }

    MGEndDrawShadow(52);

    for (int i = 8; i < 12; i++) {
        if (CScript.obj[i].disp) {
            TexManager.ReloadTexture(Vif1Packet, CharaTex[i]);

            if (!Pause) {
                Chara[i].Step();
                Chara[i].ClothStep(0);
            }
            if (i == 9) {
                FaceChangeC(i);
            }
            Chara[i].Draw();
        }
    }

    if (CScript.scene == 2) {
        TexManager.ReloadTexture(Vif1Packet, 22);

        if (!Pause) {
            Komono.Step();
        }
        Komono.Draw();
    }

    if (CScript.scene == 1) {
        TexManager.ReloadTexture(Vif1Packet, 23);
    MGBeginDrawShadow(*(sceGsTex0*)&TexManager.GetTexture("shadow_buff", -1)->tex0);

        switch (CScript.scene) {
        case 1:
            for (int i = 0; i < 68; i++) {
                OP_NornMapObj[i].DrawShadow(0);
            }
            break;

        case 2:
            OP_ToanMapObj.DrawShadow(0);
            break;
        }

        MGEndDrawShadow(52);
    }

    if (CScript.scene != 2) {
        TexManager.ReloadTexture(Vif1Packet, 21);

        float dof[2] = { 300.0f, 1000.0f };

        DepthOfField(dof, 2, 64, 0);
    }
}

/* The village sign's one animated texture. The animation is a strip of eight 64-pixel frames in a
   texture of its own and the plate the world draws is another, so a tick is a local-to-local
   transfer of one frame over the plate; the counter advances by a half so that a frame stands for
   two ticks, and the texture cache is flushed first because the plate about to be overwritten is
   the one the previous tick drew from. */
static void setTexAnime()
{
    sceGifTag giftag = { 0, 1, 0, 0, 0, 0, 1, SCE_GIF_PACKED_AD };
    CTexture* plate;
    CTexture* strip;
    int dbp;
    int dbw;
    int sbp;
    int sbw;

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128*)&giftag);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);
    sceVif1PkTerminate(Vif1Packet);

    plate = TexManager.GetTexture("i01e01", -1);
    strip = TexManager.GetTexture("i01e01_a", -1);

    if (plate == 0 || strip == 0) {
        return;
    }

    dbp = plate->tex0 & 0x3fff;
    dbw = (plate->tex0 >> 14) & 0x3f;
    sbp = strip->tex0 & 0x3fff;
    sbw = (strip->tex0 >> 14) & 0x3f;

    static float cnt = 0.0f;

    MoveImageTest(Vif1Packet, sbp, sbw, 0, CRect<int>(0, (int)cnt * 64, 64, 64), dbp, dbw, 0, 0,
                  0, 0);

    cnt += 0.5f;
    if (cnt > 7.0f) {
        cnt = 0.0f;
    }
}

/* One actor's blinking and speaking. The mouth is driven from the script's own clock rather than
   from a motion: while the actor is talking, a new mouth frame is picked at random every sixth
   hundredth of a second left on the timer, and the timer running out closes the mouth and ends the
   line. The eyes are whatever the script last asked for. The cache is flushed on both sides of the
   two transfers because the plate is a texture the previous tick drew from and the next one will. */
