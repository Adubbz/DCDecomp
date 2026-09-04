#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma constant_flag 0
#pragma constant_flag_ones 1, 3, 4, 5, 6, 9, 12, 13, 14, 15
#pragma constant_flag_ones 16, 17, 18, 19, 20, 21, 28, 32, 33, 34
#pragma constant_flag_ones 35, 36, 37, 44, 45, 46, 47, 49, 53, 55
#pragma constant_flag_ones 56, 57, 59, 67, 68, 69, 70, 72, 76, 77
#pragma constant_flag_ones 78, 83, 84, 85, 86
#pragma argument_flag 0
#pragma argument_flag_ones 91, 97, 98, 99, 104, 136, 164, 165, 166, 167
#pragma argument_flag_ones 174, 175, 176, 177, 252, 253, 254, 257, 258, 259
#pragma argument_flag_ones 276, 277, 278, 304, 305, 306, 327, 329, 345, 347
#pragma argument_flag_ones 401, 403, 442, 443, 454, 464, 713, 723, 725, 733
#pragma argument_flag_ones 739, 742, 743, 744, 782

#include "common.h"

#include <libgraph.h>
#include <libpkt.h>
#include <libvu0.h>

#include <cmath>
#include <cstdlib>

#include "camera.hpp"
#include "camerafollow.hpp"
#include "character.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "gamepad.hpp"
#include "mathutil.hpp"
#include "mds.hpp"
#include "object.hpp"
#include "snd.hpp"
#include "sound.hpp"
#include "texture.hpp"
#include "title/dispfade.hpp"
#include "title/script.hpp"
#include "wind.hpp"

#define PI 3.14159265358979323846

class OBJ_ANIME_SEQ {
public:
    void Initialize();

    char name[16];
    int motion_start;
    int motion_end;
    char unk_18[8];
    sceVu0FVECTOR scale;
    sceVu0FVECTOR position;
    float unk_40;
    float unk_44;
    float step;
    char unk_4C[60];
};

/* The classes this movie places in the world, declared here rather than reached through headers of
   their own because each is another unit's to type. Only the members this file touches are named;
   the extents are the sizes the executable gives the objects below. */

/* The rippling water plane the outdoor scenes stand on. The frame is where the plane sits in the
   world. */
class CWater {
public:
    CWater();

    void SetVertex(float *v0, float *v1, float *v2, float *v3);
    void SetSize(int x, int y, CDataAlloc2<1> *buffer);
    void SetParam(float unknown0, float unknown1, float unknown2, float unknown3);
    void SetColor(u_char r, u_char g, u_char b, u_char a);
    void Shake(int x, int y, float power);
    void Hamon();
    int DrawVu1(RenderInfo *info, sceVif1Packet *packet, u_long128 *unknown0);

    char unread[176];
    CFrameVu1 frame;
};

/* Named rather than included, because a unit's include list is a dial on the order a call's
   floating-point arguments are set up in and nothing here needs the definition: adding
   renderinfo.h alone takes RushInit's three-float SetFollow out of the order the image has. */
class RenderInfo;

/* A frame parented to an object, which is what lets the world transform drive a model. */
class CObjectFrame : public CObject {
public:
    virtual void FrameObjectOnOff(char *name, int on);
    virtual void Draw();

    void SetFrame(CFrameVu1 *frame, int unknown0);
};

/* One piece of scenery. The movie builds a table of them, hands each its model, and drives them
   through the object dispatch like anything else in the world. */
class CMapObject : public CObjectFrame {
public:
    CMapObject();

    virtual void Draw();

    void Initialize();
    void DrawShadow(int unknown0);

    char unk_18[36];
    CFrameVu1 *lod_model;
    char unk_4C[8];
    float lod_distance;
    int unk_40;
    int unk_44;
    char unk_3C[4];
};

/* The dust the running feet kick up, declared here for the same reason. */
class CRunEffect {
public:
    CRunEffect();

    void Lighting(int on);
    void Set(float *position);
    void Step();
    void Draw();

    char unread[208];
};

/* The movie's one fire, which is a light rather than a model. */
class CFireOmni {
public:
    CFireOmni();

    void FireStep();
    void FireCreate();

    void SetPosition(float x, float y, float z) {
        position[0] = 10.0f * x;
        position[1] = 10.0f * y;
        position[2] = 10.0f * z;
        position[3] = 1.0f;
    }

    void DrawFire(int unknown0, int unknown1, CCamera *camera, float *eye, float scale,
                  int unknown2, float unknown3);

    char unk_18[32];
    sceVu0FVECTOR position;
    char unk_4C[16];
};

/* A run of frames the world draws as one. */
class CMap {
public:
    void Initialize();
    CMapObject *SetObject(CFrameVu1 *frame, int unknown0, int unknown1);
    CMapObject *SetObject(int no, CFrameVu1 *frame, int unknown0, int unknown1);
    CMapObject *GetObject(int no);
    void Draw();

    char unread[2800];
};

/* The overlay's own rectangle. Its constructor assigns x, y, w, h in that order, where
   rect.h's assigns them in the other; the same split title.cpp and opening.cpp carry. */
template <class T>
class CRect {
public:
    CRect() {}

    CRect(T x_, T y_, T w_, T h_) {
        x = x_;
        y = y_;
        w = w_;
        h = h_;
    }

    T x;
    T y;
    T w;
    T h;
};

/* One piece of scenery the third scene lays out: the model file, where it stands and how far it is
   turned about the vertical axis, in degrees. */
struct MAP_INFO {
    char *name;
    float position[3];
    float rotation;
};

void wait_now_loading_vsync();
void InitializeDataBuffer();
void SetDataBuffer(CDataAlloc2<1> *buffer, int size);
void SetPacketReadBuffer(int size, int offset);
void MGSetRenderInfo(float scale, float near_z, float far_z);
void MGSetBGColor(float r, float g, float b, float a);
void InitObjAnime(CFrame *frame, OBJ_ANIME_SEQ *sequence);
void ObjAnimePlay(OBJ_ANIME_SEQ *sequence);
sceVif1Packet *GetVif1Packet();
void MGSetPLight(sceVu0FMATRIX light, sceVu0FMATRIX color);
void MGSetViewMatrix(sceVu0FMATRIX view, float *position);
void MGGetFBuffBackTex(sceGsTex0 *tex);
void MGGetFBuffTex(sceGsTex0 *tex);
void MGMoveImage(sceGsTex0 *src, const CRect<int> &rect, sceGsTex0 *dst, int dsax, int dsay,
                 int dir);
void MGSetGsZBUF(sceGsZbuf *zbuf);
void MGSetAmbient(float *color);
void setAlphaFlag(sceVif1Packet *packet, sceGsAlpha *alpha);
void MGBeginDrawShadow(sceGsTex0 tex);
void MGEndDrawShadow(u_char alpha);
void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect<int> &dst,
                 const CRect<int> &src, u_char alpha);
void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect<int> &dst,
                 const CRect<int> &src, u_char r, u_char g, u_char b, u_char a);
void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect<int> &dst,
                 const CRect<int> &src, int width, int height, float angle);
void DepthOfField(float *dist, int level, int alpha, int blur);
void OPAnalyz(char *name);
void OPMdsLoad();
extern "C" char *strcpy(char *dst, const char *src);

void SndSetCamera(CCamera *camera);
void SndInitialize(int unknown0, int unknown1, int unknown2, int unknown3);
void SndSetReadBuffer(u_int *buffer);
void SndSoundLoad(int no);
void SndAmbientPlay(int no);
void SndBgmInit();
void SndBgmLoad(int no);
void SndBgmPlay(int no);
void SndBgmFadeOut(int time, int unknown0);
void SndBgmStop();
void SndAmbientStop();
void SndStep();
void SndSePlay(int se, float *position, float near_dist, float far_dist);

extern u_int *read_buffer;
extern u_int Vu_prog0f[];
void MoveImageTest(sceVif1Packet *packet, int sbp, int sbw, int spsm, const CRect<int> &rect,
                   int dbp, int dbw, int dpsm, int dsax, int dsay, int dir);

extern sceGifTag GiftagAD;
extern sceVif1Packet *Vif1Packet;
extern CGamePad GamePad;
extern OBJ_ANIME_SEQ OP_AnimeSeq[32];
extern int OP_AnimeSeqRot;
extern CTextureManager TexManager;
extern CCharacter Chara[23];
extern CMapObject OP_NornMapObj[76];
extern int OP_FireList;
extern sceVu0FVECTOR OP_FirePosition[96];
extern float OP_FireScale[96];
extern CMap OP_GroundMap;
extern CMap OP_BuildingMap;
extern CMap OP_BuildingMap2;
extern sceGsZbuf mgZBuffer;
extern RenderInfo mgRenderInfo;
extern sceVu0FMATRIX light;
extern sceVu0FMATRIX lightcolor;
extern sceVu0FVECTOR ambientlight;
extern sceGsAlpha mgAlpha;
extern CDataAlloc2<1> MapDataBuffer;
extern CDataAlloc2<1> TextureData;

CCameraFollow MainCamera(
    20.0f + 0.0f + 0.0f + 0.0f + 0.0f + 0.0f + 0.0f + 0.0f + 0.0f + 0.0f + 0.0f,
    15.0f, 0.0f, 8.0f);
static CDispFade DispFade;
CFireOmni CFire;
class CScript CScript;
extern class CScript ScriptState;
CWind Wind;
CWater Water;
char CharaTex[9];
CDataAlloc2<1> CharaDataBuffer(-1);
static tagFRAME_INF frame_info_cam[300];
CCharacter Cam[4];
static MOTION_INFO MotionInfo;
CDataAlloc2<1> PathDataBuffer(-1);
CDataAlloc2<1> WaterBuffer(-1);
static CDataAlloc2<1> DummyDataBuffer(-1);
CTexAnimeData TexAnimeDataMovie[30];
CRunEffect CRunFx;

extern CFrame *OP_CharaFrame;
static u_char bEnd;
static int EndCnt;
static int CameraMode;
int SceneNp;
float TitleAngle;
static int StartDisp;
int TitleFade;
int TitleFadeCnt;
int StartLightning;
float atraGetStatusRate;

/* One actor's face, as this scene animates it. The eyes and the mouth are two strips of frames
   stacked bottom-up in one texture, and a tick copies the current frame of each over the model's
   face plate. This scene's eye strip is three columns of ten rather than one column, which is what
   the eye number is folded into two coordinates for below. */
struct FACE_INFO {
    char *plate;
    char *strip;
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

void SetObjAnime(char *name, CFrameVu1 *frame, float *scale, float *position);
void FaceChange(int no);
static void MotionProcess();
static void DrawProcess();
static void SoundProcess();
void WaterProcess();
static void DataLoad();
static void InitProcA();
static void DrawProcA();
static void InitProcB();
static void DrawProcB();
static void AtraLight();
static void InitProcC();
static void DrawProcC();
static void InitProcD();
static void DrawProcD();
static void InitProcE();
static void DrawProcE();
static void InitProcF();
static void DrawProcF();
static void InitProcG();
static void DrawProcG();
static void InitProcH();
static void DrawProcH();
static void InitProcI();
static void DrawProcI();
static void InitProcTitle();
static void DrawProcTitle();

/* One actor's blinking and speaking. The eyes and the mouth are two strips of frames in one
   texture, and a tick copies the current frame of each over the actor's face plate. This scene's
   eye strip is three columns of ten frames rather than one column, so the eye number the script
   holds picks the column as well as the row. */
void FaceChange(int no) {
    static FACE_INFO face = {"c01d01", "c01d01an_4", 27, 48, 78, 44, 0, 0, 512, 3, 0};
    CTexture *plate;
    CTexture *strip;
    int sbp;
    int dbp;
    int sbw;
    int dbw;

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);

    if (face.plate == 0) {
        return;
    }

    plate = TexManager.GetTexture(face.plate, -1);
    strip = TexManager.GetTexture(face.strip, -1);

    if (plate == 0 || strip == 0) {
        return;
    }

    sbp = strip->tex0 & 0x3fff;
    dbp = plate->tex0 & 0x3fff;
    sbw = (strip->tex0 >> 14) & 0x3f;
    dbw = (plate->tex0 >> 14) & 0x3f;

    face.eye = ScriptState.obj[no].eye;

    int eye = face.eye;
    int column;

    if (eye < 10) {
        column = 0;
    } else if (eye < 18) {
        column = 128;
        eye -= 10;
    } else {
        column = 256;
        eye -= 18;
    }

    CRect<int> eyes(column, face.strip_bottom - face.eye_height * (eye + 1), 128,
                    face.eye_height);

    MoveImageTest(Vif1Packet, sbp, sbw, SCE_GS_PSMT8, eyes, dbp, dbw, SCE_GS_PSMT8, 0,
                  128 - face.eye_height - face.eye_bottom, 0);

    face.mouth = ScriptState.obj[no].mouth;

    CRect<int> mouth(384, face.strip_bottom - face.mouth_height * (face.mouth + 1), 128,
                     face.mouth_height);

    MoveImageTest(Vif1Packet, sbp, sbw, SCE_GS_PSMT8, mouth, dbp, dbw, SCE_GS_PSMT8, 0,
                  128 - face.mouth_height - face.mouth_bottom, 0);

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);
}

void RushInit() {
    wait_now_loading_vsync();
    InitializeDataBuffer();
    SetDataBuffer(&CharaDataBuffer, 490000);
    SetDataBuffer(&PathDataBuffer, 30000);
    SetDataBuffer(&MapDataBuffer, 260000);
    SetDataBuffer(&WaterBuffer, 30000);
    SetDataBuffer(&DummyDataBuffer, 10000);
    SetDataBuffer(&TextureData, 250000);
    SetPacketReadBuffer(50000, 360000);

    MainCamera.SetDistance(80.0f);
    MainCamera.SetHeight(0.0f);
    MainCamera.SetFollow(0.0f, 0.0f, 0.0f);
    MainCamera.Step(0);
    MGSetRenderInfo(800.0f, 6.0f, 65535.0f);

    wait_now_loading_vsync();
    SndInitialize(4, 30, 4, 5);
    SndSetReadBuffer(read_buffer);
    SndSoundLoad(309);
    SndAmbientPlay(0);
    SndVoiceLoad(0);
    SndBgmInit();
    SndBgmLoad(25);
    wait_now_loading_vsync();

    StartReadBG();
    CScript.load_no = 0;
    CScript.init_no = 0;
    DataLoad();
    wait_now_loading_vsync();
    CScript.Load("rmdat/rmdat.scr");

    DispFade.FadeInit(128.0f);
    DispFade.FadeOutStart(128.0f, 0);
    bEnd = 0;
    EndCnt = 0;
    CameraMode = 1;
    TitleAngle = 1.57f;
    StartDisp = 1;
    TitleFade = 0;
    TitleFadeCnt = 0;
    atraGetStatusRate = 0;
    StartLightning = 0;
}

int RushLoop() {
    ReadBG();
    CScript.Step();
    DataLoad();
    MotionProcess();
    DrawProcess();
    DispFade.FadeIn(Vif1Packet);
    DispFade.FadeOut(Vif1Packet);
    SoundProcess();

    if (!bEnd) {
        if (GamePad.Down(2048)) {
            while (ReadBGSync())
                ;
            DispFade.FadeOutStart(8.0f, 0);
            bEnd = 1;
            SndBgmFadeOut(32, 0);
        }
    }

    if (bEnd) {
        if (EndCnt < 128) {
            EndCnt += 8;
        } else {
            while (ReadBGSync())
                ;
            float black = 0.0f;
            MGSetBGColor(black, black, black, 128.0f);
            SndStopAllSe();
            SndBgmStop();
            SndAmbientStop();
            SndStep();
            return 1;
        }
    }

    if (CScript.end) {
        while (ReadBGSync())
            ;
        float black = 0.0f;
        MGSetBGColor(black, black, black, 128.0f);
        SndStopAllSe();
        SndBgmStop();
        SndAmbientStop();
        SndStep();
        return 1;
    }

    SndStep();
    return 0;
}

static void MotionProcess() {
    switch (CScript.fade) {
        case 1:
            DispFade.FadeInStart(CScript.fade_speed, 0);
            CScript.fade = 0;
            break;
        case 2:
            DispFade.FadeOutStart(CScript.fade_speed, 0);
            CScript.fade = 0;
            break;
        case 3:
            DispFade.FadeInStart(CScript.fade_speed, 1);
            CScript.fade = 0;
            break;
        case 4:
            DispFade.FadeOutStart(CScript.fade_speed, 1);
            CScript.fade = 0;
            break;
    }

    if (DispFade.GetRate() == 128.0) {
        return;
    }

    if (CScript.scene == 9) {
        return;
    }

    if (CScript.motion_req) {
        MotionInfo.start = CScript.motion_start;
        MotionInfo.end = CScript.motion_end;
        MotionInfo.speed = CScript.motion_step;

        if (CScript.camera_no != CScript.camera_start) {
            SceneNp++;
        }

        Cam[SceneNp].motion_type.state.time = (float) CScript.motion_start;
        Cam[SceneNp].motion_type.camera = &MainCamera;
        CScript.motion_req = 0;
    }

    if (Cam[SceneNp].motion_type.state.time > (float) (CScript.motion_end - 1)) {
        Cam[SceneNp].motion_type.state.time = (float) (CScript.motion_end - 1);
    }

    for (int i = 0; i < OP_AnimeSeqRot - 1; i++) {
        ObjAnimePlay(&OP_AnimeSeq[i]);
    }

    for (int i = 0; i < 9; i++) {
        if (CScript.obj[i].disp) {
            if (CScript.obj[i].motion_end != -1) {
                if (Chara[i].motion_type.state.time > (float) (Chara[i].motion_type.motion_info[CScript.obj[i].motion].end - 1)) {
                    CScript.obj[i].motion = CScript.obj[i].motion_end;
                    CScript.obj[i].motion_end = -1;
                }
            }

            Chara[i].motion_type.state.unk_08 = CScript.obj[i].step;

            if (CScript.obj[i].step == 1.0f) {
                if (CScript.obj[i].motion != Chara[i].motion_no) {
                    Chara[i].motion_type.state.time =
                        (float) Chara[i].motion_type.motion_info[CScript.obj[i].motion].start;
                    Chara[i].motion_no = CScript.obj[i].motion;
                    Chara[i].flags = 4;
                    Chara[i].motion_speed = -1.0f;
                } else {
                    Chara[i].motion_no = CScript.obj[i].motion;
                    Chara[i].flags = 0;
                    Chara[i].motion_speed = -1.0f;
                }
            } else {
                Chara[i].motion_no = CScript.obj[i].motion;
                Chara[i].flags = 0;
                Chara[i].motion_speed = -1.0f;
            }
        }
    }

    SetMotionEX(Cam[SceneNp].frame, &Cam[SceneNp].motion_type, &MotionInfo,
                &Cam[SceneNp].motion_type.state, frame_info_cam);

    sceVu0FVECTOR dir;

    if (CScript.scene == 0) {
        dir[0] = 0.2f;
        dir[2] = -0.2f;
        dir[1] = 0.0f;
        dir[3] = 0.0f;
    } else {
        dir[0] = -0.2f;
        dir[2] = 0.2f;
        dir[1] = 0.0f;
        dir[3] = 0.0f;
    }

    Wind.SetDir(dir);

    switch (CScript.scene) {
        case 0:
            Wind.SetVelocity(1.3f);
            break;
        case 1:
            Wind.SetVelocity(0.4f);
            break;
        case 2:
            Wind.SetVelocity(0.4f);
            break;
        case 3:
            Wind.SetVelocity(0.4f);
            break;
        case 4:
            Wind.SetVelocity(0.0f);
            break;
        case 5:
            Wind.SetVelocity(0.4f);
            break;
        case 6:
            Wind.SetVelocity(0.4f);
            break;
        case 7:
            Wind.SetVelocity(0.4f);
            break;
        case 8:
            Wind.SetVelocity(0.4f);
            break;
        case 9:
            Wind.SetVelocity(0.3f);
            break;
    }

    if (CScript.scene == 7) {
        Chara[1].unk_C98 = (int) &Wind;
    } else {
        Chara[0].unk_C98 = (int) &Wind;
    }

    Wind.Step();

    typedef float MotionLocal0, MotionLocal1, MotionLocal2, MotionLocal3, MotionLocal4,
        MotionLocal5, MotionLocal6, MotionLocal7, MotionLocal8, MotionLocal9,
        MotionLocal10, MotionLocal11, MotionLocal12, MotionLocal13, MotionLocal14,
        MotionLocal15;
    char *opening_frames[9] = {
        "c12a", "c12a", "c08a", "c08a", "e04a1", "e04a2", "e04a3", "e04a4", "e04a5"};
    char *scene_frames[9] = {
        "chr_a", "chr_b", "chr_c", "chr_d", "chr_e", "chr_f", "chr_g", "chr_h", "chr_i"};
    sceVu0FMATRIX matrix;
    CFrame *frame;

    for (int i = 0; i < 9; i++) {
        if (CScript.obj[i].disp) {
            if (CScript.scene == 0) {
                frame = Cam[SceneNp].frame->SearchFrame(opening_frames[i]);
            } else {
                frame = Cam[SceneNp].frame->SearchFrame(scene_frames[i]);
            }

            if (frame) {
                if (CScript.scene == 0 || CScript.camera_start == 16 || (CScript.camera_start == 17 && i == 0)) {
                    Chara[i].SetPosition(0.0f, 0.0f, 0.0f);
                    Chara[i].SetRotation(0.0f, 0.0f, 0.0f);
                    Chara[i].frame->SetReference(frame);
                } else {
                    frame->GetLWMatrix(matrix);

                    float angle = atan2f(matrix[2][0], matrix[2][2]);
                    float zero = 0.0f;

                    Chara[i].SetRotation(zero, angle, zero);
                    float x = matrix[3][0];
                    float y = matrix[3][1];
                    float z = matrix[3][2];
                    Chara[i].SetPosition(x, y, z);
                }
            }
        }
    }

    int scene = CScript.scene;

    if (scene == 1 || scene == 3 || scene == 5 || scene == 7) {
        if (scene != 7) {
            frame = Chara[0].frame->SearchFrame("weapon");
        } else {
            frame = Chara[1].frame->SearchFrame("weapon");
        }

        if (frame) {
            frame->GetLWMatrix(matrix);
            sceVu0Normalize(matrix[0], matrix[0]);
            sceVu0Normalize(matrix[1], matrix[1]);
            sceVu0Normalize(matrix[2], matrix[2]);
            Chara[8].SetPosition((float) (scene & 0), 0.0f, 0.0f);
            Chara[8].SetRotation(0.0f, 0.0f, 0.0f);
            Chara[8].frame->SetTransMatrix(matrix);
        }
    }

    if (scene == 1) {
        if (CScript.camera_start == 5) {
            CScript.obj[7].disp = 1;
        }

        if (CScript.obj[7].disp) {
            frame = Chara[0].frame->SearchFrame("dcol");

            if (frame) {
                frame->GetLWMatrix(matrix);
                sceVu0Normalize(matrix[0], matrix[0]);
                sceVu0Normalize(matrix[1], matrix[1]);
                sceVu0Normalize(matrix[2], matrix[2]);
                typedef float m7p0, m7p1, m7p2, m7p3, m7p4, m7p5, m7p6, m7p7, m7p8,
                    m7p9, m7p10, m7p11, m7p12, m7p13, m7p14, m7p15, m7p16, m7p17,
                    m7p18, m7p19, m7p20, m7p21, m7p22, m7p23, m7p24, m7p25, m7p26,
                    m7p27, m7p28, m7p29, m7p30, m7p31;
                Chara[7].SetPosition(0.0f, 0.0f, 0.0f);
                Chara[7].SetRotation(0.0f, 0.0f, 0.0f);
                Chara[7].frame->SetTransMatrix(matrix);
            }

            static int old = 0;

            int step = (int) Cam[SceneNp].motion_type.state.time;

            if (old != step && (step == 12 || step == 17 || step == 52 || step == 111)) {
                CScript.obj[7].motion = 0;
                Chara[7].motion_no = 0;
                Chara[7].flags = 4;
                Chara[7].motion_speed = -1.0f;
                old = step;
            } else if (old != step && step == 119) {
                CScript.obj[7].motion = 1;
                Chara[7].motion_no = 1;
                Chara[7].flags = 4;
                Chara[7].motion_speed = -1.0f;
                old = step;
            } else {
                Chara[7].motion_no = CScript.obj[7].motion;
                Chara[7].flags = 2;
                Chara[7].motion_speed = -1.0f;
            }
        }
    }

    static int iwacnt = 0;

    if (CScript.camera_start == 19) {
        if (iwacnt == 0) {
            Chara[2].SetPosition(260.26f, 507.76f, 520.5f);
            Chara[2].SetRotation(0.0f, 1.92f, 0.0f);
            Chara[2].motion_no = 0;
            Chara[2].flags = 0;
            Chara[2].motion_speed = -1.0f;
            Chara[2].motion_type.state.time = 2.0f;
        }

        if (iwacnt == 330) {
            Chara[2].SetPosition(260.26f, 507.76f, 520.5f);
            Chara[2].SetRotation((float) (iwacnt & 0), 1.92f, 0.0f);
            Chara[2].motion_no = 1;
            Chara[2].flags = 4;
            Chara[2].motion_speed = -1.0f;
            Chara[2].motion_type.state.time = 2.0f;
        }

        if (iwacnt == 331) {
            Chara[2].motion_no = 1;
            Chara[2].flags = 0;
            Chara[2].motion_speed = -1.0f;
        }

        iwacnt++;
    } else {
        iwacnt = 0;
    }
}

static void DrawProcess() {
    if (DispFade.GetRate() == 128.0) {
        return;
    }

    sceVu0FVECTOR position;
    sceVu0FMATRIX camera;
    sceVu0FMATRIX view;
    sceVu0FMATRIX unit;

    MainCamera.GetPos(position);
    SndSetCamera(&MainCamera);
    MainCamera.GetCameraMatrix(camera);
    MainCamera.Step(1);

    sceVu0UnitMatrix(unit);
    sceVu0MulMatrix(view, unit, camera);
    MGSetViewMatrix(view, position);

    sceVif1PkCall(Vif1Packet, (u_long128 *) Vu_prog0f, 0);
    sceVif1PkTerminate(Vif1Packet);

    switch (CScript.scene) {
        case 0:
            DrawProcA();
            break;
        case 1:
            DrawProcB();
            break;
        case 2:
            DrawProcC();
            break;
        case 3:
            DrawProcD();
            break;
        case 4:
            DrawProcE();
            break;
        case 5:
            DrawProcF();
            break;
        case 6:
            DrawProcG();
            break;
        case 7:
            DrawProcH();
            break;
        case 8:
            DrawProcI();
            break;
        case 9:
            DrawProcTitle();
            break;
    }

    if (CScript.scene != 9) {
        static int fade = 0;

        if (StartDisp) {
            TexManager.ReloadTexture(Vif1Packet, 20);
            set2DSprite(GetVif1Packet(), TexManager.GetTexture("start2", -1),
                        CRect<int>(192, 360, 256, 32), CRect<int>(0, 0, 256, 32),
                        fade);
            fade = (fade + 2) & 127;
        }

        if (GamePad.Down(240)) {
            StartDisp ^= 1;
        }
        if (!StartDisp) {
            fade = 0;
        }
    }

    sceGsTex0 back;

    MGGetFBuffBackTex(&back);

    CTexture texture;

    texture.tex0 = *(u_long *) &back;
    set2DSprite(Vif1Packet, &texture,
                CRect<int>(0, 0, 640, 448), CRect<int>(0, 0, 640, 224),
                128, 128, 128, 35);
}

static void SoundProcess() {
    if (CScript.bgm_fade) {
        SndBgmFadeOut(64, 0);
        CScript.bgm_fade = 0;
    }

    if (CScript.scene == 0) {
        static int mus = 0;

        if (CScript.camera_start == 1) {
            if (!mus) {
                SndBgmPlay(0);
                mus = 1;
            }
        } else {
            mus = 0;
        }
    }

    static int ambi = 0;

    if (CScript.scene == 9) {
        if (!ambi) {
            SndAmbientStop();
            ambi = 1;
        }
    } else {
        ambi = 0;
    }

    static int bat = 0;

    if (CScript.scene == 0 && Cam[SceneNp].motion_type.state.time > 10.0f) {
        if (!bat) {
            CFrame *frame = Cam[SceneNp].frame->SearchFrame("e04a5");

            if (frame) {
                sceVu0FMATRIX matrix;

                frame->GetLWMatrix(matrix);

                sceVu0FVECTOR position;

                position[0] = matrix[3][0];
                position[1] = matrix[3][1];
                position[2] = matrix[3][2];
                SndSePlay(346, position, 100.0f, 1000.0f);
            }
        }

        bat++;

        if (bat > 32) {
            bat = 0;
        }
    } else {
        bat = 0;
    }

    if ((CScript.scene == 0 && Cam[SceneNp].motion_type.state.time > 10.0f) || (CScript.scene == 7 && Cam[SceneNp].motion_type.state.time > 10.0f)) {
        static int wait = 0;

        if (CScript.scene == 0) {
            CFrame *frame = Cam[SceneNp].frame->SearchFrame("c12a");
            int step = (int) Chara[1].motion_type.state.time;

            if (wait == 0) {
                if (step == 10) {
                    if (frame) {
                        sceVu0FMATRIX matrix;

                        frame->GetLWMatrix(matrix);

                        sceVu0FVECTOR position;

                        position[0] = matrix[3][0];
                        position[1] = matrix[3][1];
                        position[2] = matrix[3][2];
                        SndSePlay(374, position, 500.0f, 3000);
                    }

                    wait = 5;
                }
            } else if (wait > 0) {
                wait--;
            }
        } else {
            CFrame *frame = Cam[SceneNp].frame->SearchFrame("chr_a");
            int step = (int) Chara[0].motion_type.state.time;

            if (wait == 0) {
                if (step == 20) {
                    if (frame) {
                        sceVu0FMATRIX matrix;

                        frame->GetLWMatrix(matrix);

                        sceVu0FVECTOR position;

                        position[0] = matrix[3][0];
                        position[1] = matrix[3][1];
                        position[2] = matrix[3][2];
                        SndSePlay(374, position, 500.0f, 3000);
                    }

                    wait = 5;
                }
            } else if (wait > 0) {
                wait--;
            }
        }
    }

    static int wait = 0;

    if (wait == 0) {
        int step = (int) Cam[SceneNp].motion_type.state.time;

        switch (CScript.camera_start) {
            case 4:
                if (step == 30) {
                    SndSePlay(54, -1, 0);
                    SndSetSeVolf(54, 0.75f, 0);
                    wait = 5;
                }
                break;
            case 5:
                if (step == 10) {
                    SndSetSeVolf(54, 0.65f, 0);
                    SndSePlay(616, -1, 0);
                    wait = 5;
                }
                if (step == 17) {
                    SndSePlay(617, -1, 0);
                    wait = 5;
                }
                if (step == 23) {
                    SndSePlay(606, -1, 0);
                    wait = 5;
                }
                if (step == 31) {
                    SndSePlay(607, -1, 0);
                    wait = 5;
                }
                if (step == 46) {
                    SndSePlay(155, -1, 0);
                    wait = 5;
                }
                if (step == 50) {
                    SndSePlay(422, -1, 0);
                    SndSePlay(403, -1, 0);
                    wait = 5;
                }
                if (step == 53) {
                    SndSePlay(610, -1, 0);
                    wait = 5;
                }
                if (step == 62) {
                    SndSePlay(607, -1, 0);
                    wait = 5;
                }
                if (step == 65) {
                    SndSePlay(153, -1, 0);
                    wait = 5;
                }
                if (step == 97) {
                    SndSePlay(606, -1, 0);
                    wait = 5;
                }
                if (step == 113) {
                    SndSePlay(400, -1, 0);
                    SndSePlay(617, -1, 0);
                    wait = 5;
                }
                if (step == 119) {
                    SndSePlay(401, -1, 0);
                    SndSePlay(420, -1, 0);
                    SndSePlay(160, -1, 0);
                    wait = 5;
                }
                if (step == 124) {
                    SndSePlay(612, -1, 0);
                    wait = 5;
                }
                if (step == 130) {
                    SndSePlay(618, -1, 0);
                    wait = 5;
                }
                break;
            case 6:
                if (step == 47) {
                    SndSePlay(345, -1, 0);
                    wait = 10;
                }
                if (step == 124) {
                    SndSeStop(54, 0);
                    wait = 5;
                }
                break;
            case 8:
                if (step == 20) {
                    SndSePlay(395, -1, 0);
                    wait = 5;
                }
                if (step == 37) {
                    SndSePlay(155, -1, 0);
                    wait = 5;
                }
                if (step == 57) {
                    SndSePlay(400, -1, 0);
                    wait = 4;
                }
                if (step == 60) {
                    SndSePlay(160, -1, 0);
                    wait = 5;
                }
                if (step == 71) {
                    SndSePlay(155, -1, 0);
                    wait = 5;
                }
                if (step == 86) {
                    SndSePlay(396, -1, 0);
                    wait = 5;
                }
                break;
            case 11:
                if (step == 140) {
                    SndSePlay(1746, -1, 0);
                    wait = 10;
                }
                if (step == 145) {
                    SndSePlay(1746, -1, 0);
                    wait = 10;
                }
                if (step == 158) {
                    SndSePlay(1755, -1, 0);
                    wait = 10;
                }
                break;
            case 12:
                if (step == 117) {
                    SndSePlay(1747, -1, 0);
                    wait = 10;
                }
                if (step == 160) {
                    SndSePlay(1749, -1, 0);
                    wait = 10;
                }
                break;
            case 14:
                if (step == 87) {
                    SndSePlay(360, -1, 0);
                    wait = 3;
                }
                break;
            case 15:
                if (step == 10) {
                    SndSePlay(362, -1, 0);
                    SndSePlay(366, -1, 0);
                    wait = 5;
                }
                if (step == 18) {
                    SndSePlay(364, -1, 0);
                    wait = 5;
                }
                if (step == 40) {
                    SndSePlay(363, -1, 0);
                    wait = 5;
                }
                if (step == 52) {
                    SndSePlay(364, -1, 0);
                    wait = 5;
                }
                if (step == 72) {
                    SndSePlay(369, -1, 0);
                    wait = 5;
                }
                if (step == 88) {
                    SndSePlay(365, -1, 0);
                    SndSePlay(370, -1, 0);
                    wait = 5;
                }
                if (step == 94) {
                    SndSePlay(368, -1, 0);
                    wait = 5;
                }
                break;
            case 17:
                if (step == 2) {
                    SndSePlay(1737, -1, 0);
                    wait = 3;
                }
                if (step == 40) {
                    SndSePlay(1727, -1, 0);
                    wait = 3;
                }
                if (step == 70) {
                    SndSePlay(1737, -1, 0);
                    SndSePlay(1729, -1, 0);
                    wait = 3;
                }
                break;
            case 18:
                if (step == 2) {
                    SndSePlay(300, -1, 0);
                    SndSePlay(302, -1, 0);
                    wait = 5;
                }
                break;
            case 19:
                if (step == 26) {
                    SndSePlay(305, -1, 0);
                    wait = 5;
                }
                if (step == 56) {
                    SndSePlay(305, -1, 0);
                    wait = 5;
                }
                if (step == 86) {
                    SndSePlay(305, -1, 0);
                    wait = 5;
                }
                if (step == 120) {
                    SndSeStop(300, 0);
                    SndSeStop(302, 0);
                    wait = 5;
                }
                break;
        }
    } else {
        wait--;
    }
}

void SetObjAnime(char *name, CFrameVu1 *frame, float *scale, float *position) {
    OP_AnimeSeq[OP_AnimeSeqRot].Initialize();
    OP_AnimeSeq[OP_AnimeSeqRot].motion_start = 0;
    OP_AnimeSeq[OP_AnimeSeqRot].motion_end = 0;
    OP_AnimeSeq[OP_AnimeSeqRot].scale[0] = scale[0];
    OP_AnimeSeq[OP_AnimeSeqRot].scale[1] = scale[1];
    OP_AnimeSeq[OP_AnimeSeqRot].scale[2] = scale[2];
    OP_AnimeSeq[OP_AnimeSeqRot].unk_40 = position[0];
    OP_AnimeSeq[OP_AnimeSeqRot].unk_44 = position[1];
    OP_AnimeSeq[OP_AnimeSeqRot].step = position[2];
    strcpy(OP_AnimeSeq[OP_AnimeSeqRot].name, name);
    InitObjAnime(frame, &OP_AnimeSeq[OP_AnimeSeqRot]);
    OP_AnimeSeqRot++;
}

void WaterProcess() {
    sceGsTex0 fbuff;
    sceGsTex0 buff;
    sceGsZbuf zbuf;

    MGGetFBuffTex(&fbuff);

    CRect<int> rect(0, 0, 640, 224);

    buff = *(sceGsTex0 *) &TexManager.GetTexture("water_buff", -1)->tex0;
    MGMoveImage(&fbuff, rect, &buff, 0, 0, 0);

    zbuf = mgZBuffer;
    zbuf.bits.zmsk = 1;
    MGSetGsZBUF(&zbuf);

    if (CScript.scene == 1) {
        sceVu0FVECTOR position = {0.0f, -0.4f, 0.0f, 0.0f};

        Water.frame.SetPosition(position);
        Water.Shake(12, 4, (float) rand() * 4.5 / 2147483647.0 + 0.5);
    } else {
        sceVu0FVECTOR ref;

        MainCamera.GetRef(ref);
        ref[1] = 0.0f;
        Water.frame.SetPosition(ref);
        Water.Shake((int) (rand() * 32.0f / 2147483648.0f),
                    (int) (rand() * 32.0f / 2147483648.0f), -0.5f);
    }

    Water.Hamon();
    Water.DrawVu1(&mgRenderInfo, GetVif1Packet(), 0);
    MGSetGsZBUF(&mgZBuffer);
}
