#pragma constant_flag 0
#pragma constant_flag_ones 1, 4, 6, 8, 9, 10, 17, 19, 21, 22
#pragma constant_flag_ones 24, 25, 27, 33, 35, 36, 41, 42, 43, 45
#pragma constant_flag_ones 46, 47, 48, 50, 54, 64, 67, 68, 71, 73
#pragma constant_flag_ones 76, 81, 86, 89, 95, 99, 100, 102, 106, 107
#pragma constant_flag_ones 108, 109, 110, 112, 113
#pragma argument_flag 0
#pragma argument_flag_ones 47, 54, 61, 64, 66, 159, 160, 162, 168, 334
#pragma argument_flag_ones 339, 344, 349, 354, 359, 364, 428, 430, 1138, 1139
#pragma argument_flag_ones 1140, 1143, 1144, 1145, 1407, 1427, 1428, 1514, 1516, 1517
#pragma argument_flag_ones 1519, 1533

#include "common.h"

#include <cstdlib>
#include <cstring>

#include "camera.hpp"
#include "camerafollow.hpp"
#include "character.hpp"
#include "clsmes.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "gamepad.hpp"
#include "mainselect.hpp"
#include "mds.hpp"
#include "mglib.hpp"
#include "snd.hpp"
#include "sound.hpp"
#include "texture.hpp"
#include "title/dispfade.hpp"
#include "title/script.hpp"
#include "vector.hpp"

extern CSound CSnd;

/* The rectangle every 2D draw takes, declared here rather than reached through rect.h for the
   reason title.cpp declares its own: the rectangles this file builds are temporaries whose four
   stores come out ascending, and the constructor rect.h states assigns them in the other order. */
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
} __attribute__((aligned(16)));

/* What this file reaches of the display layer, declared here rather than reached through mglib.h
   because that header states the rectangle above. */
extern sceVif1Packet *Vif1Packet;

sceVif1Packet *GetVif1Packet();
void MGSetRenderInfo(float scale, float near_z, float far_z);
void MGSetBGColor(float r, float g, float b, float a);
void MGSetViewMatrix(sceVu0FMATRIX view);
void MGSetViewMatrix(sceVu0FMATRIX view, float *position);
void MGGetFBuffBackTex(sceGsTex0 *tex);
void MGFillBox(const CRect<int> &rect, u_char r, u_char g, u_char b, u_char a);

void wait_now_loading_vsync();
void InitializeDataBuffer();
void SetDataBuffer(CDataAlloc2<1> *buffer, int size);
void SetPacketReadBuffer(int size, int offset);
void setbilinear(int on);
void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect<int> &dst,
                 const CRect<int> &src, u_char alpha);
void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect<int> &dst,
                 const CRect<int> &src, u_char r, u_char g, u_char b, u_char a);

void OpA_InitProcess();
void OpA_MotionProcess();
void OpA_SoundProcess();
void OpA_DrawProcess();
void OpB_InitProcess();
void OpB_InitProcess2();
void OpB_LoadDataBG();
void OpB_LoadDataBG2();
void OpB_MotionProcess();
void OpB_SoundProcess();
void OpB_DrawProcess();
void OpC_InitProcess();
void OpC_InitProcess2();
void OpC_InitProcess3();
void OpC_InitProcess4();
void OpC_InitProcess5();
void OpC_LoadDataBG();
void OpC_LoadDataBG2();
void OpC_LoadDataBG3();
void OpC_LoadDataBG4();
void OpC_LoadDataBG5();
void OpC_MotionProcess();
void OpC_SoundProcess();
void OpC_DrawProcess();
void OpD_InitProcess();
void OpD_InitProcess2();
void OpD_LoadDataBG();
void OpD_LoadDataBG2();
void OpD_MotionProcess();
void OpD_SoundProcess();
void OpD_DrawProcess();

extern u_int *read_buffer;
extern u_int Vu_prog0f[];
extern int Mes1MakeFlg;
extern char MesWinTexBuff_01[256];
extern CDataAlloc2<1> VisualData;
extern CDataAlloc2<1> TextureData;

static void LoadMessage();
static void LoadScene();
static void SceneChange();
static void PauseProcess();
static void SoundStop();
static void WaitKeyProcess();
static void MotionProcess();
static void SoundProcess();
static void DrawProcess();
static void DrawMess();

void OpPlayVolSE(int group, int no, int voice, float volume);
void FadeCansel();

CDataAlloc2<1> CharaDataBuffer[7];
CDataAlloc2<1> DummyBuffer(-1);
CDataAlloc2<1> PassDataBuffer[3];
CDataAlloc2<1> MapDataBuffer(-1);
CDataAlloc2<1> WaterBuffer(-1);
CDataAlloc2<1> testBuffer(-1);

CCharacter Chara[23];
char CharaTex[23];

/* Nothing calls this and nothing reads the table it fills: the link this file was built by removed
   both. They are here because the compiler carries state from one definition to the next, and the
   camera below is constructed with its arguments evaluated in an order no declaration that emits
   nothing reaches. */
static int OpeningWork[9];

static void OpeningWorkInit() {
    OpeningWork[0] = 1;
    OpeningWork[1] = 2;
    OpeningWork[2] = 3;
    OpeningWork[3] = 4;
    OpeningWork[4] = 5;
    OpeningWork[5] = 6;
    OpeningWork[6] = 7;
    OpeningWork[7] = 8;
    OpeningWork[8] = 9;
}

/* Nothing reads this pointer and the link removes it. Together with the exact folded constant
   below, it preserves the camera initializer's argument order without adding retained data. */

CCameraFollow OP_MainCamera(
    60.0f + 0.0f + 0.0f + 0.0f + 0.0f + 0.0f + 0.0f,
    20.0f, 0.0f, 4.0f);

CCharacter Cam[3];
MOTION_INFO Op_MotionInfo;
static ClsMes Mes1;
static CDispFade DispFade;

u_char *PassReadBuffer;
u_char *MesBuffer;
int OpBgmSqPort;
static tagFRAME_INF *frame_info_cam;
int SceneNp;
int Pause;
static int CameraMode;
static int SceneRp;
static int SceneCnt;
static int SceneFlg;
static int SceneSw;
static float PauseFrame;
static u_char End;
static int EndCnt;
static int BgmOff;
static int BgmVol;
static int BgmNo;

void OpeningInit() {
    wait_now_loading_vsync();
    InitializeDataBuffer();
    SetDataBuffer(&VisualData, 7500);
    MesBuffer = VisualData.Alloc(4312);
    SetDataBuffer(&CharaDataBuffer[0], 253000);
    SetDataBuffer(&CharaDataBuffer[4], 65000);
    SetDataBuffer(&CharaDataBuffer[6], 327000);
    SetDataBuffer(&PassDataBuffer[0], 15000);
    SetDataBuffer(&PassDataBuffer[1], 15000);
    SetDataBuffer(&PassDataBuffer[2], 15000);
    SetDataBuffer(&testBuffer, 15000);
    PassReadBuffer = testBuffer.Alloc(15000);
    SetDataBuffer(&MapDataBuffer, 159500);
    SetDataBuffer(&WaterBuffer, 30000);
    SetDataBuffer(&TextureData, 355000);
    SetPacketReadBuffer(40000, 273000);
    OP_MainCamera.SetRef(0, 0.0f, 0.0f, 0.0f);
    OP_MainCamera.SetPos(0, 0.0f, 0.0f, 0.0f);
    OP_MainCamera.SetDistance(80.0f);
    OP_MainCamera.SetHeight(0.0f);
    OP_MainCamera.SetFollow(0.0f, 0.0f, 0.0f);
    OP_MainCamera.Step(0);
    OP_MainCamera.SetSpeed(0.0f);
    MGSetRenderInfo(800.0f, 6.0f, 65535);
    wait_now_loading_vsync();
    CScript.Load("opdat/opening.scr");
    wait_now_loading_vsync();
    LoadMessage();
    wait_now_loading_vsync();
    LoadScene();
    wait_now_loading_vsync();
    OpA_InitProcess();
    CameraMode = 0;
    SceneNp = 0;
    SceneRp = 0;
    SceneCnt = 3;
    SceneFlg = 2;
    SceneSw = 0;
    Pause = 0;
    End = 0;
    EndCnt = 0;
    BgmOff = 0;
    BgmNo = 0;
    BgmVol = 127;
    DispFade.FadeInit(128.0f);
    DispFade.FadeOutStart(128.0f, 0);
}

static void LoadMessage() {
    Mes1.Preset(2);
    Mes1.text_x = 90;
    Mes1.text_y = 350;
    Mes1.text_rate = 1.0f;
    Mes1.text_rate_set = 1.0f;
    Mes1.end_mark = 0;
    Mes1.tex_block = 26;
    Mes1.unk_17B0 = MesWinTexBuff_01;
    Mes1.tail_to_x = 320;
    Mes1.tail_to_y = 234;
    Mes1.tail_half_width = 8;
    Mes1.tail_length = 64;
    Mes1.grow_x = 310;
    Mes1.grow_y = 210;

    switch (LanguageCode) {
        case 0:
            LoadFile("opdat/fconv.bin", MesBuffer, 0);
            break;
        case 1:
            LoadFile("opdat/usa/fconv.bin", MesBuffer, 0);
            break;
        case 2:
            LoadFile("opdat/usa/fconv.bin", MesBuffer, 0);
            break;
        case 3:
            LoadFile("opdat/optext_3.mes", MesBuffer, 0);
            break;
        case 4:
            LoadFile("opdat/optext_4.mes", MesBuffer, 0);
            break;
        case 5:
            LoadFile("opdat/optext_5.mes", MesBuffer, 0);
            break;
        case 6:
            LoadFile("opdat/usa/fconv.bin", MesBuffer, 0);
            break;
    }

    Mes1.buff = (short *) MesBuffer;
    Mes1.text = (char *) MesBuffer;
    Mes1.text += *(short *) (MesBuffer + 2);
}

static void LoadScene() {
    char *name[3][2] = {
        {"opdat/scene/0101acp.sne", "0101acp.cfg"},
        {"opdat/scene/0101bcp.sne", "0101bcp.cfg"},
        {"opdat/scene/0104cp.sne", "0104cp.cfg"},
    };
    int i;

    for (i = 0; i < 3; i++) {
        LoadFile(name[i][0], (void *) read_buffer, 0);
        Cam[i].LoadPackData(read_buffer, name[i][1], &PassDataBuffer[i], 0);
        Cam[i].motion_type.state.time = 1.0f;
        Cam[i].motion_type.state.unk_08 = 1.0f;
        Cam[i].motion_type.state.motion_no = 0;
        Cam[i].motion_type.state.playing_no = 0;
        Cam[i].motion_type.camera = &OP_MainCamera;
    }
}

void LoadSceneBG() {
    CDataAlloc2<1> *buffer;
    int rp;
    char *name[126][2] = {
        {"opdat/scene/0101acp.sne", "0101acp.cfg"},
        {"opdat/scene/0101bcp.sne", "0101bcp.cfg"},
        {"opdat/scene/0104cp.sne", "0104cp.cfg"},
        {"opdat/scene/0104bcp.sne", "0104bcp.cfg"},
        {"opdat/scene/0105cp.sne", "0105cp.cfg"},
        {"opdat/scene/0107cp.sne", "0107cp.cfg"},
        {"opdat/scene/0108cp.sne", "0108cp.cfg"},
        {"opdat/scene/0109cp.sne", "0109cp.cfg"},
        {"opdat/scene/0110cp.sne", "0110cp.cfg"},
        {"opdat/scene/0111cp.sne", "0111cp.cfg"},
        {"opdat/scene/0112cp.sne", "0112cp.cfg"},
        {"opdat/scene/0113cp.sne", "0113cp.cfg"},
        {"opdat/scene/0114acp.sne", "0114acp.cfg"},
        {"opdat/scene/0114bcp.sne", "0114bcp.cfg"},
        {"opdat/scene/0114ccp.sne", "0114ccp.cfg"},
        {"opdat/scene/0114dcp.sne", "0114dcp.cfg"},
        {"opdat/scene/0114ecp.sne", "0114ecp.cfg"},
        {"opdat/scene/0114gcp.sne", "0114gcp.cfg"},
        {"opdat/scene/0114hcp.sne", "0114hcp.cfg"},
        {"opdat/scene/0114icp.sne", "0114icp.cfg"},
        {"opdat/scene/0114jcp.sne", "0114jcp.cfg"},
        {"opdat/scene/0114kcp.sne", "0114kcp.cfg"},
        {"opdat/scene/0114f1cp.sne", "0114f1cp.cfg"},
        {"opdat/scene/0114f2cp.sne", "0114f2cp.cfg"},
        {"opdat/scene/0115cp.sne", "0115cp.cfg"},
        {"opdat/scene/0116cp.sne", "0116cp.cfg"},
        {"opdat/scene/0117cp.sne", "0117cp.cfg"},
        {"opdat/scene/0118cp.sne", "0118cp.cfg"},
        {"opdat/scene/0119cp.sne", "0119cp.cfg"},
        {"opdat/scene/0119bcp.sne", "0119bcp.cfg"},
        {"opdat/scene/0120cp.sne", "0120cp.cfg"},
        {"opdat/scene/0121cp.sne", "0121cp.cfg"},
        {"opdat/scene/0122cp.sne", "0122cp.cfg"},
        {"opdat/scene/0123cp.sne", "0123cp.cfg"},
        {"opdat/scene/0124cp.sne", "0124cp.cfg"},
        {"opdat/scene/0125cp.sne", "0125cp.cfg"},
        {"opdat/scene/0126cp.sne", "0126cp.cfg"},
        {"opdat/scene/0120cp.sne", "0120cp.cfg"},
        {"opdat/scene/0128cp.sne", "0128cp.cfg"},
        {"opdat/scene/0129cp.sne", "0129cp.cfg"},
        {"opdat/scene/0126cp.sne", "0126cp.cfg"},
        {"opdat/scene/0130cp.sne", "0130cp.cfg"},
        {"opdat/scene/0126cp.sne", "0126cp.cfg"},
        {"opdat/scene/0132cp.sne", "0132cp.cfg"},
        {"opdat/scene/0132bcp.sne", "0132bcp.cfg"},
        {"opdat/scene/0132ccp.sne", "0132ccp.cfg"},
        {"opdat/scene/0133cp.sne", "0133cp.cfg"},
        {"opdat/scene/0134cp.sne", "0134cp.cfg"},
        {"opdat/scene/0135cp.sne", "0135cp.cfg"},
        {"opdat/scene/0136cp.sne", "0136cp.cfg"},
        {"opdat/scene/0301cp.sne", "0301cp.cfg"},
        {"opdat/scene/0302cp.sne", "0302cp.cfg"},
        {"opdat/scene/0303cp.sne", "0303cp.cfg"},
        {"opdat/scene/0304cp.sne", "0304cp.cfg"},
        {"opdat/scene/0305cp.sne", "0305cp.cfg"},
        {"opdat/scene/0306cp.sne", "0306cp.cfg"},
        {"opdat/scene/0307cp.sne", "0307cp.cfg"},
        {"opdat/scene/0308cp.sne", "0308cp.cfg"},
        {"opdat/scene/0401cp.sne", "0401cp.cfg"},
        {"opdat/scene/0402cp.sne", "0402cp.cfg"},
        {"opdat/scene/0403cp.sne", "0403cp.cfg"},
        {"opdat/scene/0404cp.sne", "0404cp.cfg"},
        {"opdat/scene/0405cp.sne", "0405cp.cfg"},
        {"opdat/scene/0406cp.sne", "0406cp.cfg"},
        {"opdat/scene/0407cp.sne", "0407cp.cfg"},
        {"opdat/scene/0408cp.sne", "0408cp.cfg"},
        {"opdat/scene/0409cp.sne", "0409cp.cfg"},
        {"opdat/scene/0410cp.sne", "0410cp.cfg"},
        {"opdat/scene/0411cp.sne", "0411cp.cfg"},
        {"opdat/scene/0412cp.sne", "0412cp.cfg"},
        {"opdat/scene/0413cp.sne", "0413cp.cfg"},
        {"opdat/scene/0414cp.sne", "0414cp.cfg"},
        {"opdat/scene/0415cp.sne", "0415cp.cfg"},
        {"opdat/scene/0416cp.sne", "0416cp.cfg"},
        {"opdat/scene/0417cp.sne", "0417cp.cfg"},
        {"opdat/scene/0418cp.sne", "0418cp.cfg"},
        {"opdat/scene/0419cp.sne", "0419cp.cfg"},
        {"opdat/scene/0420cp.sne", "0420cp.cfg"},
        {"opdat/scene/0421cp.sne", "0421cp.cfg"},
        {"opdat/scene/0423cp.sne", "0423cp.cfg"},
        {"opdat/scene/0425cp.sne", "0425cp.cfg"},
        {"opdat/scene/0426cp.sne", "0426cp.cfg"},
        {"opdat/scene/0427cp.sne", "0427cp.cfg"},
        {"opdat/scene/0428cp.sne", "0428cp.cfg"},
        {"opdat/scene/0429cp.sne", "0429cp.cfg"},
        {"opdat/scene/0430cp.sne", "0430cp.cfg"},
        {"opdat/scene/0431cp.sne", "0431cp.cfg"},
        {"opdat/scene/0432cp.sne", "0432cp.cfg"},
        {"opdat/scene/0433cp.sne", "0433cp.cfg"},
        {"opdat/scene/0434cp.sne", "0434cp.cfg"},
        {"opdat/scene/0435cp.sne", "0435cp.cfg"},
        {"opdat/scene/0436cp.sne", "0436cp.cfg"},
        {"opdat/scene/0437cp.sne", "0437cp.cfg"},
        {"opdat/scene/0438cp.sne", "0438cp.cfg"},
        {"opdat/scene/0439cp.sne", "0439cp.cfg"},
        {"opdat/scene/0440cp.sne", "0440cp.cfg"},
        {"opdat/scene/0441cp.sne", "0441cp.cfg"},
        {"opdat/scene/0442cp.sne", "0442cp.cfg"},
        {"opdat/scene/0443cp.sne", "0443cp.cfg"},
        {"opdat/scene/0501cp.sne", "0501cp.cfg"},
        {"opdat/scene/0502cp.sne", "0502cp.cfg"},
        {"opdat/scene/0503cp.sne", "0503cp.cfg"},
        {"opdat/scene/0504cp.sne", "0504cp.cfg"},
        {"opdat/scene/0505cp.sne", "0505cp.cfg"},
        {"opdat/scene/0506cp.sne", "0506cp.cfg"},
        {"opdat/scene/0510cp.sne", "0510cp.cfg"},
        {"opdat/scene/0511cp.sne", "0511cp.cfg"},
        {"opdat/scene/0512cp.sne", "0512cp.cfg"},
        {"opdat/scene/0513cp.sne", "0513cp.cfg"},
        {"opdat/scene/0514cp.sne", "0514cp.cfg"},
        {"opdat/scene/0515cp.sne", "0515cp.cfg"},
        {"opdat/scene/0515bcp.sne", "0515bcp.cfg"},
        {"opdat/scene/0516cp.sne", "0516cp.cfg"},
        {"opdat/scene/0517cp.sne", "0517cp.cfg"},
        {"opdat/scene/0518cp.sne", "0518cp.cfg"},
        {"opdat/scene/0520cp.sne", "0520cp.cfg"},
        {"opdat/scene/0521cp.sne", "0521cp.cfg"},
        {"opdat/scene/0522cp.sne", "0522cp.cfg"},
        {"opdat/scene/0523cp.sne", "0523cp.cfg"},
        {"opdat/scene/0524cp.sne", "0524cp.cfg"},
        {"opdat/scene/0525cp.sne", "0525cp.cfg"},
        {"opdat/scene/0526cp.sne", "0526cp.cfg"},
        {"opdat/scene/0527cp.sne", "0527cp.cfg"},
        {"opdat/scene/0528cp.sne", "0528cp.cfg"},
        {"opdat/scene/0529cp.sne", "0529cp.cfg"},
        {"-1", "-1"},
    };

    if (name[SceneCnt][0] == "-1")
        return;

    switch (SceneFlg) {
        case 0:
            while (ReadBGSync())
                ;
            if (SceneCnt % 5 == 0)
                StartReadBG();
            LoadFileBG(name[SceneCnt][0], (u_long128 *) PassReadBuffer, 0);
            SceneFlg = 1;
            break;
        case 1:
            if (ReadBGSync())
                break;
            rp = SceneRp;
            buffer = &PassDataBuffer[rp];
            buffer->used = 0;
            Cam[rp].LoadPackData((u_int *) PassReadBuffer, name[SceneCnt][1], buffer, 0);
            SceneCnt++;
            SceneRp++;
            if (SceneRp > 2)
                SceneRp = 0;
            SceneFlg = 2;
            break;
        case 2:
            break;
    }
}

int OpeningLoop() {
    ReadBG();
    PauseProcess();
    if (Pause == 0) {
        CScript.Step();
        WaitKeyProcess();
        SceneChange();
    }
    MotionProcess();
    SoundProcess();
    DrawProcess();

    if (End) {
        if (EndCnt < 128) {
            EndCnt++;
        } else {
            SoundStop();
            MGSetBGColor(0.0f, 0.0f, 0.0f, 128.0f);
            FadeCansel();
            return 1;
        }
    }
    /* These type-only names preserve the second exit's background-colour argument state. */
    typedef float ExitState0, ExitState1;
    if (CScript.end) {
        MGSetBGColor(0.0f, 0.0f, 0.0f, 128.0f);
        FadeCansel();
        return 1;
    }
    CSnd.Step();
    return 0;
}

static void SceneChange() {
    switch (CScript.load_no) {
        case 1:
            OpB_LoadDataBG();
            break;
        case 2:
            OpB_LoadDataBG2();
            break;
        case 3:
            OpC_LoadDataBG();
            break;
        case 4:
            OpC_LoadDataBG2();
            break;
        case 5:
            OpC_LoadDataBG3();
            break;
        case 6:
            OpC_LoadDataBG4();
            break;
        case 7:
            OpC_LoadDataBG5();
            break;
        case 8:
            OpD_LoadDataBG();
            break;
        case 9:
            OpD_LoadDataBG2();
            break;
    }

    switch (CScript.init_no) {
        case 1:
            SoundStop();
            OpB_InitProcess();
            break;
        case 2:
            OpB_InitProcess2();
            break;
        case 3:
            SoundStop();
            OpC_InitProcess();
            break;
        case 4:
            OpC_InitProcess2();
            break;
        case 5:
            SoundStop();
            OpC_InitProcess3();
            break;
        case 6:
            OpC_InitProcess4();
            break;
        case 7:
            OpC_InitProcess5();
            break;
        case 8:
            SoundStop();
            OpD_InitProcess();
            break;
        case 9:
            SoundStop();
            OpD_InitProcess2();
            break;
    }
}

static void PauseProcess() {
    static int endflg = 0;

    if (DispFade.GetRate() != 0.0)
        return;
    if (!endflg) {
        if (End)
            return;

        if (Pause == 0) {
            if (!GamePad.Down(2048))
                return;
            CSnd.Stop(0);
            if (CScript.scene)
                CSnd.Stop(1);
            CSnd.SetVol(15, 0);
            CSnd.SetVol(14, 0);
            CSnd.SetVol(13, 0);
            CSnd.SetVol(12, 0);
            Pause = 1;
            endflg = 0;
            PauseFrame = Cam[SceneNp].motion_type.state.time;
        } else if (Pause == 1) {
            if (GamePad.Down(32)) {
                endflg = 1;
                CSnd.SetVol(15, 256);
                CSnd.SetVol(14, 256);
                CSnd.SetVol(13, 256);
                CSnd.SetVol(12, 256);
                if (CScript.scene)
                    CSnd.SQ_RePlay(1);
                if (OpBgmSqPort != -1)
                    CSnd.SQ_RePlay(0);
            } else if (GamePad.Down(64)) {
                while (ReadBGSync())
                    ;
                End = 1;
                DispFade.FadeOutStart(1.0f, 0);
            }
        }
    } else {
        endflg = 0;
        Pause = 0;
    }
}

static void SoundStop() {
    SndStopAllSe();
    CSnd.Stop(0);
    CSnd.StopVoice(0);
}

static void WaitKeyProcess() {
    static int flg = 0;
    static int cnt = 0;

    if (CScript.mes_wait) {
        if (!flg) {
            PauseFrame = Cam[SceneNp].motion_type.state.time;
            flg = 1;
        }
        if (Pause)
            return;
        if (GamePad.Down(32) || GamePad.Down(64)) {
            if (Mes1.State() == 5) {
                Mes1.text_rate = 1.0f;
                Mes1.text_rate_set = 1.0f;
                Mes1.GoNextPage();
            } else if (Mes1.State() == 3) {
                CScript.mes_wait = 0;
                flg = 0;
            } else {
                Mes1.text_rate = 0;
                Mes1.text_rate_set = 0;
            }
        }
    } else {
        flg = 0;
        cnt = 0;
        Mes1.text_rate = 1.0f;
        Mes1.text_rate_set = 1.0f;
    }
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

    if (CScript.motion_req) {
        if (!ReadBGSync()) {
            Op_MotionInfo.start = CScript.motion_start;
            Op_MotionInfo.end = CScript.motion_end;
            Op_MotionInfo.speed = CScript.motion_step;
            CScript.motion_req = 0;
            if (SceneSw == 1) {
                SceneNp++;
                if (SceneNp > 2)
                    SceneNp = 0;
                SceneFlg = 0;
            }
            SceneSw = 1;
            Cam[SceneNp].motion_type.state.time = (float) CScript.motion_start;
        } else {
            while (ReadBGSync())
                ;
        }
    }

    if (Cam[SceneNp].motion_type.state.time > (float) (CScript.motion_end - 1)) {
        Cam[SceneNp].motion_type.state.time = (float) (CScript.motion_end - 1);
    }
    if (CameraMode == 0) {
        Cam[SceneNp].motion_type.camera = &OP_MainCamera;
        if (PauseFrame > (float) (CScript.motion_end - 1)) {
            PauseFrame = (float) (CScript.motion_end - 1);
        }
        if (Pause) {
            Cam[SceneNp].motion_type.state.time = PauseFrame - CScript.motion_step;
        }
        if (CScript.mes_wait == 1) {
            Cam[SceneNp].motion_type.state.time = PauseFrame - CScript.motion_step;
        }
        SetMotionEX(Cam[SceneNp].frame, &Cam[SceneNp].motion_type, &Op_MotionInfo,
                    &Cam[SceneNp].motion_type.state, frame_info_cam);
        LoadSceneBG();
    }

    if (!Pause) {
        switch (CScript.scene) {
            case 0:
                OpA_MotionProcess();
                break;
            case 1:
                OpB_MotionProcess();
                break;
            case 2:
                OpB_MotionProcess();
                break;
            case 3:
                OpC_MotionProcess();
                break;
            case 4:
                OpC_MotionProcess();
                break;
            case 5:
                OpC_MotionProcess();
                break;
            case 6:
                OpC_MotionProcess();
                break;
            case 7:
                OpC_MotionProcess();
                break;
            case 8:
                OpD_MotionProcess();
                break;
            case 9:
                OpD_MotionProcess();
                break;
        }
    }
}

static void SoundProcess() {
    if (CScript.se_stop == 0) {
        if (CScript.se_voice != 0) {
            switch (CScript.se_kind) {
                case 0:
                    OpPlayVolSE(14, CScript.se_no, CScript.se_voice, 1.0f);
                    break;
                case 1:
                    OpPlayVolSE(12, CScript.se_no, CScript.se_voice, 1.0f);
                    break;
            }
            CScript.se_voice = 0;
        }
    } else {
        switch (CScript.se_kind) {
            case 0:
                CSnd.SE_Stop(14, CScript.se_no, CScript.se_voice, 0);
                break;
            case 1:
                CSnd.SE_Stop(12, CScript.se_no, CScript.se_voice, 0);
                break;
        }
        CScript.se_stop = 0;
    }

    if (CScript.bgm_fade != 0) {
        switch (CScript.se_kind) {
            case -1:
                CSnd.Fade(0, (float) CScript.bgm_fade / 2.0f, CScript.se_fade_time);
                CSnd.Fade(1, (float) CScript.bgm_fade, CScript.se_fade_time);
                CSnd.Fade(2, (float) CScript.bgm_fade, CScript.se_fade_time);
                CSnd.Fade(15, (float) CScript.bgm_fade, CScript.se_fade_time);
                CSnd.Fade(14, (float) CScript.bgm_fade, CScript.se_fade_time);
                CSnd.Fade(13, (float) CScript.bgm_fade, CScript.se_fade_time);
                CSnd.Fade(12, (float) CScript.bgm_fade, CScript.se_fade_time);
                break;
        }
        CScript.bgm_fade = 0;
    }

    switch (CScript.scene) {
        case 0:
            OpA_SoundProcess();
            break;
        case 1:
            OpB_SoundProcess();
            break;
        case 2:
            OpB_SoundProcess();
            break;
        case 3:
            OpC_SoundProcess();
            break;
        case 4:
            OpC_SoundProcess();
            break;
        case 5:
            OpC_SoundProcess();
            break;
        case 6:
            OpC_SoundProcess();
            break;
        case 7:
            OpC_SoundProcess();
            break;
        case 8:
            OpD_SoundProcess();
            break;
        case 9:
            OpD_SoundProcess();
            break;
    }
}

static void DrawProcess() {
    sceVu0FVECTOR position;
    sceVu0FMATRIX camera;
    sceVu0FMATRIX view;
    sceVu0FMATRIX unit;
    sceGsTex0 tex0;

    OP_MainCamera.GetPos(position);
    SndSetCamera(&OP_MainCamera);
    OP_MainCamera.GetCameraMatrix(camera);
    if (CScript.scene == 5 || CScript.scene == 8) {
        OP_MainCamera.Step(1);
    }
    sceVu0UnitMatrix(unit);
    sceVu0MulMatrix(view, unit, camera);
    if (CScript.scene != 1) {
        MGSetViewMatrix(view, position);
    } else {
        MGSetViewMatrix(view);
    }
    sceVif1PkCall(Vif1Packet, (u_long128 *) Vu_prog0f, 0);
    sceVif1PkTerminate(Vif1Packet);

    switch (CScript.scene) {
        case 0:
            OpA_DrawProcess();
            break;
        case 1:
            OpB_DrawProcess();
            break;
        case 2:
            OpB_DrawProcess();
            break;
        case 3:
            OpC_DrawProcess();
            break;
        case 4:
            OpC_DrawProcess();
            break;
        case 5:
            OpC_DrawProcess();
            break;
        case 6:
            OpC_DrawProcess();
            break;
        case 7:
            OpC_DrawProcess();
            break;
        case 8:
            OpD_DrawProcess();
            break;
        case 9:
            OpD_DrawProcess();
            break;
    }

    DrawMess();

    if (Pause == 1) {
        setbilinear(0);
        MGFillBox(CRect<int>(0, 0, 10240, 3584), 0, 0, 0, 64);
        TexManager.ReloadTexture(Vif1Packet, 19);
        set2DSprite(GetVif1Packet(), TexManager.GetTexture("pause_e", -1),
                    CRect<int>(256, 160, 128, 128), CRect<int>(0, 0, 128, 128), 128);
        setbilinear(1);
    }

    MGGetFBuffBackTex(&tex0);

    CTexture texture;

    texture.tex0 = *(u_long *) &tex0;
    set2DSprite(Vif1Packet, &texture, CRect<int>(0, 0, 640, 448), CRect<int>(0, 0, 640, 224), 128,
                128, 128, 35);
    DispFade.FadeIn(Vif1Packet);
    DispFade.FadeOut(Vif1Packet);
}

static void DrawMess() {
    int offset;
    int center;

    if (CScript.scene > 6)
        Mes1.auto_page = 0;
    if (CScript.mes_no == 0)
        return;

    TexManager.ReloadTexture(Vif1Packet, Mes1.tex_block);

    static int no = 0;

    if (CScript.mes_no != no) {
        no = CScript.mes_no;
        Mes1MakeFlg = 1;
    } else {
        if (!Pause) {
            if (CScript.mes_timer > CScript.motion_step) {
                CScript.mes_timer -= CScript.motion_step;
            } else {
                CScript.mes_no = 0;
            }
        }
        Mes1.end_mark = 0;
        if (CScript.mes_wait) {
            CScript.mes_timer = 2.0f * CScript.motion_step;
            if (Mes1.State() == 3 || (Mes1.auto_page == 0 && Mes1.State() == 5)) {
                static int cnt = 0;

                if (cnt < 16) {
                    Mes1.end_mark = 1;
                } else {
                    Mes1.end_mark = 0;
                }
                cnt++;
                if (cnt > 31)
                    cnt = 0;
            } else {
                Mes1.end_mark = 0;
            }
        }
    }

    Mes1.auto_page_wait = CScript.mes_fuchi;
    Mes1.text_x = CScript.mes_x;
    Mes1.text_y = CScript.mes_y;
    if (CScript.mes_tail_x == 0) {
        Mes1.tail_length = 0;
        Mes1.grow_x = CScript.mes_x;
        Mes1.grow_y = CScript.mes_y;
    } else {
        Mes1.tail_length = 64;
        Mes1.tail_to_x = CScript.mes_tail_x;
        Mes1.tail_to_y = CScript.mes_tail_y;
        Mes1.grow_x = CScript.mes_x;
        Mes1.grow_y = CScript.mes_y;
    }

    center = Mes1.win_x + (Mes1.win_width >> 1);
    offset = (center - Mes1.tail_to_x) >> 2;
    Mes1.tail_x = center - offset;
    if (CScript.mes_tail_x != 0) {
        if (offset > 0) {
            Mes1.tail_length += offset / 3;
        } else {
            Mes1.tail_length -= offset / 3;
        }
    }
    if (Mes1.grow_y > Mes1.tail_to_y) {
        Mes1.tail_y = Mes1.win_y + 20;
    } else {
        Mes1.tail_y = Mes1.win_y + Mes1.win_height - 20;
    }
    Mes1.fade_speed = 0.1f;
    if (Mes1MakeFlg) {
        Mes1MakeFlg = Mes1.MakeMesWin(CScript.mes_no);
    }
    Mes1.Step();
    Mes1.AbsFukidashiIn();
    Mes1.DrawMesWin();
}

void OpBgmPlay() {
    int vol[8] = {82, 106, 64, 69, 91, 92, 95, 108};

    if (BgmOff == 0) {
        CSnd.SQ_Play(0, 0);
    } else {
        CSnd.SQ_Play(0, 0, 0);
    }
    BgmVol = vol[BgmNo];
    BgmNo++;
}

void OpPlayVolPanSE(float *position, float near_dist, float far_dist, int group, int no, int voice) {
    float volume;
    float pan;
    short *table;
    short base;
    int level;
    int se;
    int pan_level;

    SndGetVolPan(&volume, &pan, position, near_dist, far_dist);
    if (pan < -1.0f)
        pan = -1.0f;
    if (pan > 1.0f)
        pan = 1.0f;
    pan_level = (int) (63.0f * pan) + 64;
    se = CSnd.GetSeNo(no, voice);
    table = CSnd.GetSeInfTbl();
    base = table[se * 2 + 1];
    level = (int) ((float) base * volume);
    if (level < 0)
        level = 0;
    if (level > 127)
        level = 127;
    CSnd.SE_Play(group, no, voice, pan_level, 127, level, 0);
}

void OpSetVolPanSE(float *position, float near_dist, float far_dist, int group, int no, int voice) {
    float volume;
    float pan;
    short *table;
    short base;
    int level;
    int se;
    int pan_level;

    SndGetVolPan(&volume, &pan, position, near_dist, far_dist);
    if (pan < -1.0f)
        pan = -1.0f;
    if (pan > 1.0f)
        pan = 1.0f;
    pan_level = (int) (63.0f * pan) + 64;
    CSnd.SE_SetPan(group, no, voice, pan_level, 0);
    se = CSnd.GetSeNo(no, voice);
    table = CSnd.GetSeInfTbl();
    base = table[se * 2 + 1];
    level = (int) ((float) base * volume);
    if (level < 0)
        level = 0;
    if (level > 127)
        level = 127;
    CSnd.SE_SetVol(group, no, voice, level, 0);
}

void OpPlayVolSE(int group, int no, int voice, float volume) {
    short *table;
    short base;
    int se;
    int level;

    se = CSnd.GetSeNo(no, voice);
    table = CSnd.GetSeInfTbl();
    base = table[se * 2 + 1];
    level = (int) ((float) base * volume);
    if (level < 0)
        level = 0;
    if (level > 127)
        level = 127;
    CSnd.SE_Play(group, no, voice, 64, 127, level, 0);
}

int OpGetVolSQ(int no) {
    switch (no) {
        case 0:
            return CSnd.GetMidiState()->sequence->volume;
        case 1:
            return CSnd.GetMidiState()->sequence->volume;
    }
}

void FadeCansel() {
    MIDI_STATE *state;

    state = CSnd.GetMidiState();
    state->unk_5C = 0;
    state->unk_15C = 0;
    state->unk_EC = 0;
    state->unk_26C = 0;
    state->unk_2EC = 0;
    state->unk_36C = 0;
    CSnd.SetVol(15, 256);
    CSnd.SetVol(14, 256);
    CSnd.SetVol(13, 256);
    CSnd.SetVol(12, 256);
    CSnd.Step();
}

/* Spelled here rather than reached through a header because the image holds it only as an
   anonymous pooled constant, which is what a macro gives and a file-scope object does not. The
   suffix is what keeps the degree conversions below in single precision: without it every one of
   them is a run of calls into the double-precision library, which this compiler has no hardware
   for and the image does not contain. */
#define PI 3.14159265358979323846f

/* The classes the loader places in the world, declared here rather than reached through headers of
   their own because each is another unit's to type. Only the members this file touches are named;
   the extents are the sizes the executable gives the objects below. */

/* A frame parented to an object, which is what lets the world transform drive a model. */
class CObjectFrame : public CObject {
public:
    virtual void FrameObjectOnOff(char *name, int on);
    virtual void Draw();

    void SetFrame(CFrameVu1 *frame, int unknown0);
};

/* One piece of scenery. A map holds a table of them, hands each its model, and drives them through
   the object dispatch like anything else in the world. */
class CMapObject : public CObjectFrame {
public:
    virtual void Draw();

    void Initialize();
    void DrawShadow(int unknown0);

    char unk_00[36];
    CFrameVu1 *lod_model;
    char unk_28[8];
    float lod_distance;
    int unk_34;
    int unk_38;
    char unk_3C[4];
};

/* One row of the table a map sorts its scenery by. The loader writes row one and no other, and
   what it writes there are the four distances a level-of-detail object changes model at. */
class CategoryAttr {
public:
    float lod[4];
    int unk_10;
    int unk_14;
};

/* A run of frames the world draws as one. */
class CMap {
public:
    CMapObject *SetObject(CFrameVu1 *frame, int unknown0, int unknown1);
    CMapObject *SetObject(int no, CFrameVu1 *frame, int unknown0, int unknown1);
    CMapObject *GetObject(int no);

    CategoryAttr category[16];
    char unread0[2416];
};

/* One looping object animation a definition file registers: a frame is found by name and then
   driven between two motion numbers at a rate, with a scale of its own. */
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

void InitObjAnime(CFrame *frame, OBJ_ANIME_SEQ *sequence);
void MGSetBGColor(float r, float g, float b, float a);
void MGSetFogParm(float near_z, float far_z, u_char r, u_char g, u_char b, float far_fog,
                  float near_fog);
void MGSetPLight(sceVu0FMATRIX light, sceVu0FMATRIX color);
void MGSetAmbient(float *color);

extern u_int *read_buffer;
extern CDataAlloc2<1> MapDataBuffer;
extern sceVu0FVECTOR ambientlight;
extern sceVu0FMATRIX light;
extern sceVu0FMATRIX lightcolor;
extern CMap OP_BuildingMap;
extern CMap OP_BuildingMap2;
extern CMap OP_GroundMap;
extern OBJ_ANIME_SEQ OP_AnimeSeq[32];
extern int OP_AnimeSeqRot;
extern int OP_FireList;
extern sceVu0FVECTOR OP_FirePosition[96];
extern float OP_FireScale[96];
extern int OP_FireFlg[96];
extern CFrameVu1 *OP_GroundCol;
extern CFrameVu1 *OP_SkyFrame;

/* How far the scene's fog reaches and what colour it is. The four rates are the near and far
   planes and the two densities the renderer takes; the editor's own pair below shadows them and is
   never handed to the renderer here. */
float op_fogRate[4] = {1000.0f, 3500.0f, 0.0f, 255.0f};
u_char op_fogColor[3] = {96, 160, 239};

static int debugModeFlag = 1;
static float run_speed = 1.0f;

/* The water plane a definition file may place. The four corners are built from one width and one
   depth, so the quad is always centred on the position and always axis-aligned; everything after
   them is what the simulation reads. */
static sceVu0FVECTOR WaterV1;
static sceVu0FVECTOR WaterV2;
static sceVu0FVECTOR WaterV3;
static sceVu0FVECTOR WaterV4;
static sceVu0FVECTOR WaterPos;
static u_char WaterR;
static u_char WaterG;
static u_char WaterB;
static int WaterFlag;
static int WaterMeshW;
static int WaterMeshH;
static float WaterShake;
static float WaterCourant;
static float WaterDecline;
static float WaterAmplitude;
static float WaterRefraction;

/* The two lists the loader appends to as it goes: the shapes a scene is asked collision questions
   against, and the models that cast its shadows. */
static CFrameVu1 *ColModel[64];
static int ColModelCount;
static CFrameVu1 *ShadowModel[64];
static int shadowModelCount;

static int animeSpeed1;
static int animeSpeed2;

/* One command of the definition language: the number the loader knows it by, how many arguments it
   takes, and one type per argument. A type-0 argument is a quoted string, a type-1 one a number
   behind a comma and a type-2 one a number standing on its own. The rows are read as plain `int`
   because that is how the reader takes them. */
static int TEIGI_GRD_IMG[] = {0, 2, 0, 1};
static int TEIGI_BLD_IMG[] = {1, 2, 0, 1};
static int TEIGI_SKY_IMG[] = {2, 2, 0, 1};
static int TEIGI_FIRE_IMG[] = {31, 1, 0};
static int TEIGI_GRD[] = {3, 7, 0, 1, 1, 1, 1, 1, 1};
static int TEIGI_BLD[] = {4, 8, 0, 1, 1, 1, 1, 1, 1, 1};
static int TEIGI_LOD[] = {5, 1, 0};
static int TEIGI_CRD[] = {6, 1, 0};
static int TEIGI_SKY[] = {7, 2, 0, 1};
static int TEIGI_FOG[] = {8, 7, 2, 1, 1, 1, 1, 1, 1};
static int TEIGI_AMBIENT[] = {9, 3, 2, 1, 1};
static int TEIGI_LIGHT_COL[] = {10, 7, 2, 1, 1, 1, 1, 1, 1};
static int TEIGI_FARCLIP[] = {11, 1, 2};
static int TEIGI_BG_COL2[] = {12, 3, 2, 1, 1};
static int TEIGI_BG_COL[] = {12, 3, 2, 1, 1};
static int TEIGI_NORMALCLIP_OFF[] = {13, 1, 2};
static int TEIGI_RUN_SPEED[] = {14, 1, 2};
static int TEIGI_EDIT_FOG[] = {16, 7, 2, 1, 1, 1, 1, 1, 1};
static int TEIGI_WATER_SET[] = {17, 5, 2, 1, 1, 1, 1};
static int TEIGI_WATER_RGB[] = {18, 3, 2, 1, 1};
static int TEIGI_WATER_PARAM[] = {19, 7, 2, 1, 1, 1, 1, 1, 1};
static int TEIGI_LEVEL_FAR[] = {21, 4, 2, 1, 1, 1};
static int TEIGI_DebugFlag[] = {22, 1, 2};
static int TEIGI_AnimeSpeed[] = {23, 2, 2, 1};
static int TEIGI_UPER[] = {24, 8, 0, 1, 1, 1, 1, 1, 1, 1};
static int TEIGI_UPR_IMG[] = {25, 2, 0, 1};
static int TEIGI_PLIGHT[] = {26, 9, 2, 1, 1, 1, 1, 1, 1, 1, 1};
static int TEIGI_ADD_CRD[] = {27, 7, 0, 1, 1, 1, 1, 1, 1};
static int TEIGI_DEF_PATS[] = {50, 0};
static int TEIGI_DEF_ENDS[] = {51, 0};
static int TEIGI_S_VOLUME[] = {28, 7, 0, 1, 1, 1, 1, 1, 1};
static int TEIGI_PROJECTION[] = {29, 1, 2};
static int TEIGI_OBJ_ROT[] = {30, 7, 0, 1, 1, 1, 1, 1, 1};
static int TEIGI_FIRE[] = {32, 5, 2, 1, 1, 1, 1};
static int TEIGI_MAPINFO[] = {80, 1, 0};
static int TEIGI_PT_BASE[] = {52, 2, 0, 1};
static int TEIGI_PT_COLS[] = {54, 1, 0};
static int TEIGI_MAPD[] = {53, 32, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                           1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
static int TEIGI_PT_FIRE[] = {55, 3, 2, 1, 1};
static int TEIGI_PT_WATER[] = {56, 9, 2, 1, 1, 1, 1, 1, 1, 1, 1};

/* The projection the scene is drawn with, and the editor's own fog beside the renderer's. */
static float Projection = 800.0f;
static u_char editFogColor[3] = {96, 160, 239};
static float editFogRate[4] = {1000.0f, 3500.0f, 0.0f, 255.0f};

/* The four distances a level-of-detail object changes model at, which every such object in a scene
   shares because the loader copies them into the map's own row rather than into the object. */
static float levelOfDitialZ[4] = {200.0f, 400.0f, 800.0f, 1600.0f};

/* One of the ninety-six lights a definition file may place. The first word is what the file has
   asked for and everything after it is what it asked for it to be, which is why the parser clears
   only that word and the loader writes the rest. */
struct POINT_LIGHT {
    int used;
    float x;
    float y;
    float z;
    u_char r;
    u_char g;
    u_char b;
    char unk_13[1];
    u_int unk_14;
    u_int unk_18;
    float unk_1C;
};

static POINT_LIGHT pointLight[96];
static int pointLightStack;

/* The parse state the two readers share. `argLevel` is the nesting the caller has reached, which
   is what gives each level of a definition its own row of the two argument buffers; the file size
   is read once by the loader and then bounds every walk over the text. */
static int argLevel;
static int teigiFileSize;

/* The definition file is read straight into this one off the disc, and the drive transfers by
   DMA into whole cache lines. */
static char teigiBuff[4096] __attribute__((aligned(64)));
static char argStrBuff[128][64];
static float argValBuff[128][64];

/* The four model names one level-of-detail object is built from, as the loader hands them to the
   loader below it: a null entry is a level the file left out. */
static char *LODNameBuff[4];

static int nowObjCnt;
static int nowObjCnt2;
static int nowPartsCnt;

static int skipSpace(char *buf, int pos);
static int checkArg(char *buf, int pos, int *command);

/* Read one definition file and turn it into rows of arguments the loader can walk. Every line
   ending becomes a pair of NULs first, so the rest of the file is one long run of tokens with no
   line structure left in it; each command the text names is then matched by its keyword, its
   arguments are checked into the buffers at the next level, and the level moves on. A line naming
   no command at all is fatal, because a definition file the loader half-understands would place
   half a scene. */
void OPAnalyz(char *name) {
    char *buf;
    int i;
    int pos;
    int ok;

    argLevel = 0;
    buf = teigiBuff;

    if (LoadFile(name, teigiBuff, &teigiFileSize) == 0)
        return;

    for (i = 0; i < teigiFileSize; i++) {
        if (buf[i] == 13 && buf[i + 1] == 10) {
            buf[i + 1] = 0;
            buf[i] = 0;
        }
    }

    for (i = 0; i < 96; i++)
        pointLight[i].used = 0;
    pointLightStack = 0;

    pos = 0;
    while (pos < teigiFileSize) {
        ok = 0;

        pos = skipSpace(buf, pos);

        if (memcmp(&buf[pos], "GRD_IMG", 7) == 0) {
            pos = skipSpace(buf, pos + 7);
            pos = checkArg(buf, pos, TEIGI_GRD_IMG);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "BLD_IMG", 7) == 0) {
            pos = skipSpace(buf, pos + 7);
            pos = checkArg(buf, pos, TEIGI_BLD_IMG);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "SKY_IMG", 7) == 0) {
            pos = skipSpace(buf, pos + 7);
            pos = checkArg(buf, pos, TEIGI_SKY_IMG);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "GND", 3) == 0) {
            pos = skipSpace(buf, pos + 3);
            pos = checkArg(buf, pos, TEIGI_GRD);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "BLD", 3) == 0 &&
            memcmp(&buf[pos], "BLD_IMG", 7) != 0) {
            pos = skipSpace(buf, pos + 3);
            pos = checkArg(buf, pos, TEIGI_BLD);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "LOD", 3) == 0) {
            pos = skipSpace(buf, pos + 3);
            pos = checkArg(buf, pos, TEIGI_LOD);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "SKY", 3) == 0) {
            pos = skipSpace(buf, pos + 3);
            pos = checkArg(buf, pos, TEIGI_SKY);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "FOG", 3) == 0) {
            pos = skipSpace(buf, pos + 3);
            pos = checkArg(buf, pos, TEIGI_FOG);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "CRD", 3) == 0) {
            pos = skipSpace(buf, pos + 3);
            pos = checkArg(buf, pos, TEIGI_CRD);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "AMBIENT", 7) == 0) {
            pos = skipSpace(buf, pos + 7);
            pos = checkArg(buf, pos, TEIGI_AMBIENT);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "LIGHT_C", 7) == 0) {
            pos = skipSpace(buf, pos + 7);
            pos = checkArg(buf, pos, TEIGI_LIGHT_COL);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "FARCLIP", 7) == 0) {
            pos = skipSpace(buf, pos + 7);
            pos = checkArg(buf, pos, TEIGI_FARCLIP);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        /* Six where the keyword is seven, which is the original's own step: the `2` is left
           standing, and a digit is not a separator, so it is the argument reader that meets it. */
        if (memcmp(&buf[pos], "BG_COL2", 7) == 0) {
            pos = skipSpace(buf, pos + 6);
            pos = checkArg(buf, pos, TEIGI_BG_COL2);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "BG_COL", 6) == 0) {
            pos = skipSpace(buf, pos + 6);
            pos = checkArg(buf, pos, TEIGI_BG_COL);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "NORMALCLIP_OFF", 14) == 0) {
            pos = skipSpace(buf, pos + 14);
            pos = checkArg(buf, pos, TEIGI_NORMALCLIP_OFF);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "RUN_SPEED", 9) == 0) {
            pos = skipSpace(buf, pos + 9);
            pos = checkArg(buf, pos, TEIGI_RUN_SPEED);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "EDIT_FOG", 8) == 0) {
            pos = skipSpace(buf, pos + 8);
            pos = checkArg(buf, pos, TEIGI_EDIT_FOG);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "WATER_SET", 9) == 0) {
            pos = skipSpace(buf, pos + 9);
            pos = checkArg(buf, pos, TEIGI_WATER_SET);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "WATER_RGB", 9) == 0) {
            pos = skipSpace(buf, pos + 9);
            pos = checkArg(buf, pos, TEIGI_WATER_RGB);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "WATER_PARAM", 11) == 0) {
            pos = skipSpace(buf, pos + 11);
            pos = checkArg(buf, pos, TEIGI_WATER_PARAM);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "LEVEL_FAR", 9) == 0) {
            pos = skipSpace(buf, pos + 9);
            pos = checkArg(buf, pos, TEIGI_LEVEL_FAR);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "DebugFlag", 9) == 0) {
            pos = skipSpace(buf, pos + 9);
            pos = checkArg(buf, pos, TEIGI_DebugFlag);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "AnimeSpeed", 10) == 0) {
            pos = skipSpace(buf, pos + 10);
            pos = checkArg(buf, pos, TEIGI_AnimeSpeed);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "UPER", 4) == 0) {
            pos = skipSpace(buf, pos + 4);
            pos = checkArg(buf, pos, TEIGI_UPER);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "UPR_IMG", 7) == 0) {
            pos = skipSpace(buf, pos + 7);
            pos = checkArg(buf, pos, TEIGI_UPR_IMG);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "PLIGHT", 6) == 0) {
            pos = skipSpace(buf, pos + 6);
            pos = checkArg(buf, pos, TEIGI_PLIGHT);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "ADD_CRD", 7) == 0) {
            pos = skipSpace(buf, pos + 7);
            pos = checkArg(buf, pos, TEIGI_ADD_CRD);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "DEF_PATS", 8) == 0) {
            pos = skipSpace(buf, pos + 8);
            argValBuff[argLevel][0] = (float) TEIGI_DEF_PATS[0];
            ok = 1;
            argLevel++;
        }

        if (memcmp(&buf[pos], "DEF_ENDS", 8) == 0) {
            pos = skipSpace(buf, pos + 8);
            argValBuff[argLevel][0] = (float) TEIGI_DEF_ENDS[0];
            ok = 1;
            argLevel++;
        }

        if (memcmp(&buf[pos], "PT_BASE", 7) == 0) {
            pos = skipSpace(buf, pos + 7);
            pos = checkArg(buf, pos, TEIGI_PT_BASE);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "MAPD", 4) == 0) {
            pos = skipSpace(buf, pos + 4);
            pos = checkArg(buf, pos, TEIGI_MAPD);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "PT_COLS", 7) == 0) {
            pos = skipSpace(buf, pos + 7);
            pos = checkArg(buf, pos, TEIGI_PT_COLS);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "PT_FIRE", 7) == 0) {
            pos = skipSpace(buf, pos + 7);
            pos = checkArg(buf, pos, TEIGI_PT_FIRE);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "PT_WATER", 8) == 0) {
            pos = skipSpace(buf, pos + 8);
            pos = checkArg(buf, pos, TEIGI_PT_WATER);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "S_VOLUME", 8) == 0) {
            pos = skipSpace(buf, pos + 8);
            pos = checkArg(buf, pos, TEIGI_S_VOLUME);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "PROJECTION", 10) == 0) {
            pos = skipSpace(buf, pos + 10);
            pos = checkArg(buf, pos, TEIGI_PROJECTION);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "OBJ_ROT", 7) == 0) {
            pos = skipSpace(buf, pos + 7);
            pos = checkArg(buf, pos, TEIGI_OBJ_ROT);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "MAPINFO", 7) == 0) {
            pos = skipSpace(buf, pos + 7);
            pos = checkArg(buf, pos, TEIGI_MAPINFO);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "FIRE_IMG", 8) == 0) {
            pos = skipSpace(buf, pos + 8);
            pos = checkArg(buf, pos, TEIGI_FIRE_IMG);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }

        if (memcmp(&buf[pos], "FIRE", 4) == 0) {
            pos = skipSpace(buf, pos + 4);
            pos = checkArg(buf, pos, TEIGI_FIRE);
            if (pos != -1)
                ok = 1;
            pos = skipSpace(buf, pos);
            argLevel++;
        }
        if (!ok)
            exit__2(-1);

        pos = skipSpace(buf, pos);
    }
}

/* Walk the levels the reader left behind and do what each one asks. A level's number stands in
   slot 0 of its row and every command is tested against every level, so a file may repeat a
   command as often as it likes and the last one to run wins. The frame attribute the loader builds
   as it goes is what every model it places is given, which is why the two commands that place a
   whole building save it and put it back: what they set is theirs alone. */
void OPMdsLoad() {
    CFrameAttr attrSave;
    CFrameAttr attr;
    char path[4][128];
    CFrameVu1 *lodFrame[4];
    sceVu0FVECTOR lightDir;
    int i;
    int j;
    int k;
    int lightNo;
    int slot;
    CFrameVu1 *frame;
    CFrameVu1 *rotFrame;
    CMapObject *object;
    CFrame *shadow;
    float rx;
    float ry;
    float rz;
    float lx;

    attr.unk_04 = 20.0f;
    attr.unk_08 = 1;
    attr.unk_0B = 0;

    nowObjCnt = 0;
    nowObjCnt2 = 0;

    for (i = 0; i < argLevel; i++) {
        if (TEIGI_AnimeSpeed[0] == (int) argValBuff[i][0]) {
            animeSpeed1 = (int) argValBuff[i][1];
            animeSpeed2 = (int) argValBuff[i][2];
        }

        if (TEIGI_DebugFlag[0] == (int) argValBuff[i][0]) {
            debugModeFlag = (int) argValBuff[i][1];
        }

        if (TEIGI_LEVEL_FAR[0] == (int) argValBuff[i][0]) {
            levelOfDitialZ[0] = argValBuff[i][1];
            levelOfDitialZ[1] = argValBuff[i][2];
            levelOfDitialZ[2] = argValBuff[i][3];
            levelOfDitialZ[3] = argValBuff[i][4];
        }

        if (TEIGI_WATER_PARAM[0] == (int) argValBuff[i][0]) {
            WaterMeshW = (int) argValBuff[i][1];
            WaterMeshH = (int) argValBuff[i][2];
            WaterShake = argValBuff[i][3];
            WaterCourant = argValBuff[i][4];
            WaterDecline = argValBuff[i][5];
            WaterAmplitude = argValBuff[i][6];
            WaterRefraction = argValBuff[i][7];
        }

        if (TEIGI_WATER_SET[0] == (int) argValBuff[i][0]) {
            float w = argValBuff[i][1] / 2.0f;
            float h = argValBuff[i][2] / 2.0f;

            WaterV1[0] = -w;
            WaterV1[2] = -h;
            WaterV2[0] = w;
            WaterV2[2] = -h;
            WaterV3[0] = -w;
            WaterV3[2] = h;
            WaterV4[0] = w;
            WaterV4[2] = h;
            WaterPos[0] = argValBuff[i][3];
            WaterPos[1] = argValBuff[i][4];
            WaterPos[2] = argValBuff[i][5];
            WaterFlag = 1;
        }

        if (TEIGI_WATER_RGB[0] == (int) argValBuff[i][0]) {
            WaterR = argValBuff[i][1];
            WaterG = argValBuff[i][2];
            WaterB = argValBuff[i][3];
        }

        if (TEIGI_RUN_SPEED[0] == (int) argValBuff[i][0]) {
            run_speed = argValBuff[i][1];
        }

        if (TEIGI_NORMALCLIP_OFF[0] == (int) argValBuff[i][0]) {
            if (argValBuff[i][1] == 0.0f) {
                attr.unk_0B = 0;
            } else {
                attr.unk_0B = 1;
            }
        }

        if (TEIGI_BG_COL2[0] == (int) argValBuff[i][0]) {
            MGSetBGColor((float) (u_int) argValBuff[i][1], (float) (u_int) argValBuff[i][2],
                         (float) (u_int) argValBuff[i][3], 128.0f);
        }

        if (TEIGI_BG_COL[0] == (int) argValBuff[i][0]) {
            MGSetBGColor((float) (u_int) argValBuff[i][1], (float) (u_int) argValBuff[i][2],
                         (float) (u_int) argValBuff[i][3], 128.0f);
        }

        if (TEIGI_FARCLIP[0] == (int) argValBuff[i][0]) {
            attr.unk_0D = 1;
            attr.unk_10 = argValBuff[i][1];
        }

        if (TEIGI_LIGHT_COL[0] == (int) argValBuff[i][0]) {
            lightNo = (int) argValBuff[i][7];
            lightDir[0] = argValBuff[i][1];
            lightDir[1] = argValBuff[i][2];
            lightDir[2] = argValBuff[i][3];
            sceVu0Normalize(lightDir, lightDir);
            /* The row's index is materialised between the first component's load and its store,
               and an assignment's right-hand side is emitted before the subscript it is stored
               through, so the component has to already be in a register when the statement that
               computes the index runs. */
            lx = lightDir[0];
            slot = lightNo - 1;
            light[0][slot] = lx;
            light[1][slot] = lightDir[1];
            light[2][slot] = lightDir[2];
            lightcolor[slot][0] = argValBuff[i][4];
            lightcolor[slot][1] = argValBuff[i][5];
            lightcolor[slot][2] = argValBuff[i][6];
            MGSetPLight(light, lightcolor);
        }

        if (TEIGI_AMBIENT[0] == (int) argValBuff[i][0]) {
            ambientlight[0] = argValBuff[i][1];
            ambientlight[1] = argValBuff[i][2];
            ambientlight[2] = argValBuff[i][3];
            MGSetAmbient(ambientlight);
        }

        if (TEIGI_CRD[0] == (int) argValBuff[i][0]) {
            strcpy(path[0], "sim:");
            strcat(path[0], argStrBuff[i]);
            LoadFile(path[0], (void *) read_buffer, 0);
            OP_GroundCol = LoadCollisionFile(read_buffer);
        }

        if (TEIGI_FOG[0] == (int) argValBuff[i][0]) {
            op_fogRate[0] = argValBuff[i][1];
            op_fogRate[1] = argValBuff[i][2];
            op_fogRate[2] = argValBuff[i][6];
            op_fogRate[3] = argValBuff[i][7];
            op_fogColor[0] = argValBuff[i][3];
            op_fogColor[1] = argValBuff[i][4];
            op_fogColor[2] = argValBuff[i][5];
            MGSetFogParm(op_fogRate[0], op_fogRate[1], op_fogColor[0], op_fogColor[1],
                         op_fogColor[2], op_fogRate[2], op_fogRate[3]);
            attr.fog_enable = 1;
        }

        if (TEIGI_EDIT_FOG[0] == (int) argValBuff[i][0]) {
            editFogRate[0] = argValBuff[i][1];
            editFogRate[1] = argValBuff[i][2];
            editFogRate[2] = argValBuff[i][6];
            editFogRate[3] = argValBuff[i][7];
            editFogColor[0] = argValBuff[i][3];
            editFogColor[1] = argValBuff[i][4];
            editFogColor[2] = argValBuff[i][5];
            attr.fog_enable = 1;
        }

        if (TEIGI_PLIGHT[0] == (int) argValBuff[i][0]) {
            pointLight[pointLightStack].used = 1;
            pointLight[pointLightStack].x = 10.0f * argValBuff[i][1];
            pointLight[pointLightStack].y = 10.0f * argValBuff[i][2];
            pointLight[pointLightStack].z = 10.0f * argValBuff[i][3];
            pointLight[pointLightStack].r = argValBuff[i][4];
            pointLight[pointLightStack].g = argValBuff[i][5];
            pointLight[pointLightStack].b = argValBuff[i][6];
            pointLight[pointLightStack].unk_14 = argValBuff[i][7];
            pointLight[pointLightStack].unk_18 = argValBuff[i][8];
            pointLight[pointLightStack].unk_1C = argValBuff[i][9];
            pointLightStack++;
        }

        if (TEIGI_GRD[0] == (int) argValBuff[i][0]) {
            strcpy(path[0], "sim:");
            strcat(path[0], argStrBuff[i]);
            LoadFile(path[0], (void *) read_buffer, 0);
            frame = LoadMDSFile(read_buffer, &MapDataBuffer, 2, 0, 0);
            rotFrame = frame;
            frame->SetAttr(attr, 1, 64);
            SetFrameAttr(frame, 1);
            object = OP_GroundMap.SetObject(frame, 0, 0);
            CVector3_f_ pos(10.0f * argValBuff[i][2], 10.0f * argValBuff[i][3],
                            10.0f * argValBuff[i][4]);
            object->SetPosition(pos);
            rx = PI * argValBuff[i][5] / 180.0f;
            ry = PI * argValBuff[i][6] / 180.0f;
            rz = PI * argValBuff[i][7] / 180.0f;
            CVector3_f_ rot(rx, ry, rz);
            object->SetRotation(rot);
        }

        if (TEIGI_SKY[0] == (int) argValBuff[i][0]) {
            strcpy(path[0], "sim:");
            strcat(path[0], argStrBuff[i]);
            LoadFile(path[0], (void *) read_buffer, 0);
            OP_SkyFrame = LoadMDSFile(read_buffer, &MapDataBuffer, 2, 0, 0);

            if (argValBuff[i][2] == 1.0f) {
                OP_SkyFrame->SetAttr(attr, 1, 64);
            }
        }

        if (TEIGI_BLD[0] == (int) argValBuff[i][0]) {
            attrSave = attr;

            if (argValBuff[i][8] == 0.0f) {
                strcpy(path[0], "sim:");
                strcat(path[0], argStrBuff[i]);
                LoadFile(path[0], (void *) read_buffer, 0);
                frame = LoadMDSFile(read_buffer, &MapDataBuffer, 2, 0, 0);
                rotFrame = frame;
                frame->SetAttr(attr, 1, 64);
                SetFrameAttr(frame, 1);
                object = OP_BuildingMap.SetObject(nowObjCnt++, frame, 0, 0);
                object->unk_38 = 1;
                object->unk_34 = 5;
                CVector3_f_ pos(10.0f * argValBuff[i][2],
                                10.0f * argValBuff[i][3],
                                10.0f * argValBuff[i][4]);
                object->SetPosition(pos);
                rx = PI * argValBuff[i][5] / 180.0f;
                ry = PI * argValBuff[i][6] / 180.0f;
                rz = PI * argValBuff[i][7] / 180.0f;
                CVector3_f_ rot(rx, ry, rz);
                object->SetRotation(rot);
            } else {
                for (j = 0; j < 4; j++) {
                    if (argStrBuff[i + j][0] != 0) {
                        strcpy(path[j], "sim:");
                        strcat(path[j], argStrBuff[i + j]);
                        LODNameBuff[j] = path[j];
                    } else {
                        LODNameBuff[j] = 0;
                    }
                }

                LoadLODData(lodFrame, LODNameBuff, read_buffer, 0);

                object = OP_BuildingMap.GetObject(nowObjCnt++);
                object->unk_38 = 1;
                object->unk_34 = 1;

                CategoryAttr *category = &OP_BuildingMap.category[1];

                for (k = 0; k < 4; k++) {
                    category->lod[k] = levelOfDitialZ[k];
                }

                category->unk_10 = 0;
                category->unk_14 = 3;

                for (j = 0; j < 4; j++) {
                    object->SetFrame(lodFrame[j], j);

                    if (lodFrame[j] != 0) {
                        lodFrame[j]->SetAttr(attr, 1, 64);
                        SetFrameAttr(lodFrame[j], 1);
                        shadow = frame->SearchFrame("shadow");

                        if (shadow != 0) {
                            attr.unk_50 = 1;
                            shadow->SetAttr(attr, 1, 64);
                            SetFrameAttr(shadow, 1);
                        }
                    }
                }

                CVector3_f_ pos(10.0f * argValBuff[i][2],
                                10.0f * argValBuff[i][3],
                                10.0f * argValBuff[i][4]);
                object->SetPosition(pos);
                rx = PI * argValBuff[i][5] / 180.0f;
                ry = PI * argValBuff[i][6] / 180.0f;
                rz = PI * argValBuff[i][7] / 180.0f;
                CVector3_f_ rot(rx, ry, rz);
                object->SetRotation(rot);
            }

            attr = attrSave;
        }

        if (TEIGI_UPER[0] == (int) argValBuff[i][0]) {
            attrSave = attr;

            if (argValBuff[i][8] == 0.0f) {
                strcpy(path[0], "sim:");
                strcat(path[0], argStrBuff[i]);
                LoadFile(path[0], (void *) read_buffer, 0);
                frame = LoadMDSFile(read_buffer, &MapDataBuffer, 2, 0, 0);
                frame->SetAttr(attr, 1, 64);
                SetFrameAttr(frame, 1);
                object = OP_BuildingMap2.SetObject(nowObjCnt2++, frame, 0, 0);
                object->unk_38 = 1;
                object->unk_34 = 5;
                CVector3_f_ pos(10.0f * argValBuff[i][2],
                                10.0f * argValBuff[i][3],
                                10.0f * argValBuff[i][4]);
                object->SetPosition(pos);
                rx = PI * argValBuff[i][5] / 180.0f;
                ry = PI * argValBuff[i][6] / 180.0f;
                rz = PI * argValBuff[i][7] / 180.0f;
                CVector3_f_ rot(rx, ry, rz);
                object->SetRotation(rot);
            } else {
                for (j = 0; j < 4; j++) {
                    if (argStrBuff[i + j][0] != 0) {
                        strcpy(path[j], "sim:");
                        strcat(path[j], argStrBuff[i + j]);
                        LODNameBuff[j] = path[j];
                    } else {
                        LODNameBuff[j] = 0;
                    }
                }

                LoadLODData(lodFrame, LODNameBuff, read_buffer, 0);

                object = OP_BuildingMap2.GetObject(nowObjCnt++);
                object->unk_38 = 1;
                object->unk_34 = 1;

                CategoryAttr *category = &OP_BuildingMap2.category[1];

                for (k = 0; k < 4; k++) {
                    category->lod[k] = levelOfDitialZ[k];
                }

                category->unk_10 = 0;
                category->unk_14 = 3;

                for (j = 0; j < 4; j++) {
                    object->SetFrame(lodFrame[j], j);

                    if (lodFrame[j] != 0) {
                        lodFrame[j]->SetAttr(attr, 1, 64);
                        SetFrameAttr(lodFrame[j], 1);
                        shadow = frame->SearchFrame("shadow");

                        if (shadow != 0) {
                            attr.unk_50 = 1;
                            shadow->SetAttr(attr, 1, 64);
                            SetFrameAttr(shadow, 1);
                        }
                    }
                }

                CVector3_f_ pos(10.0f * argValBuff[i][2],
                                10.0f * argValBuff[i][3],
                                10.0f * argValBuff[i][4]);
                object->SetPosition(pos);
                rx = PI * argValBuff[i][5] / 180.0f;
                ry = PI * argValBuff[i][6] / 180.0f;
                rz = PI * argValBuff[i][7] / 180.0f;
                CVector3_f_ rot(rx, ry, rz);
                object->SetRotation(rot);
            }

            attr = attrSave;
        }

        if (TEIGI_S_VOLUME[0] == (int) argValBuff[i][0]) {
            strcpy(path[0], "sim:");
            strcat(path[0], argStrBuff[i]);
            LoadFile(path[0], (void *) read_buffer, 0);
            ShadowModel[shadowModelCount] = LoadMDSFile(read_buffer, 14, 0);
            ShadowModel[shadowModelCount]->SetPosition(10.0f * argValBuff[i][2],
                                                       10.0f * argValBuff[i][3],
                                                       10.0f * argValBuff[i][4]);
            rx = PI * argValBuff[i][5] / 180.0f;
            ry = PI * argValBuff[i][6] / 180.0f;
            rz = PI * argValBuff[i][7] / 180.0f;
            ShadowModel[shadowModelCount]->SetRotation(rx, ry, rz);
            shadowModelCount++;
        }

        if (TEIGI_ADD_CRD[0] == (int) argValBuff[i][0]) {
            strcpy(path[0], "sim:");
            strcat(path[0], argStrBuff[i]);
            LoadFile(path[0], (void *) read_buffer, 0);
            ColModel[ColModelCount] = LoadCollisionFile(read_buffer);
            ColModel[ColModelCount]->SetPosition(10.0f * argValBuff[i][2],
                                                 10.0f * argValBuff[i][3],
                                                 10.0f * argValBuff[i][4]);
            rx = PI * argValBuff[i][5] / 180.0f;
            ry = PI * argValBuff[i][6] / 180.0f;
            rz = PI * argValBuff[i][7] / 180.0f;
            ColModel[ColModelCount]->SetRotation(rx, ry, rz);
            ColModelCount++;
        }

        if (TEIGI_PROJECTION[0] == (int) argValBuff[i][0]) {
            Projection = argValBuff[i][1];
        }

        if (TEIGI_OBJ_ROT[0] == (int) argValBuff[i][0]) {
            OP_AnimeSeq[OP_AnimeSeqRot].Initialize();
            OP_AnimeSeq[OP_AnimeSeqRot].motion_start = 0;
            OP_AnimeSeq[OP_AnimeSeqRot].motion_end = 0;
            OP_AnimeSeq[OP_AnimeSeqRot].scale[0] = argValBuff[i][2];
            OP_AnimeSeq[OP_AnimeSeqRot].scale[1] = argValBuff[i][3];
            OP_AnimeSeq[OP_AnimeSeqRot].scale[2] = argValBuff[i][4];
            OP_AnimeSeq[OP_AnimeSeqRot].unk_40 = argValBuff[i][5];
            OP_AnimeSeq[OP_AnimeSeqRot].unk_44 = argValBuff[i][6];
            OP_AnimeSeq[OP_AnimeSeqRot].step = argValBuff[i][7];
            strcpy(OP_AnimeSeq[OP_AnimeSeqRot].name, argStrBuff[i]);
            InitObjAnime(rotFrame, &OP_AnimeSeq[OP_AnimeSeqRot]);
            OP_AnimeSeqRot++;
        }

        if (TEIGI_FIRE[0] == (int) argValBuff[i][0]) {
            OP_FirePosition[OP_FireList][0] = argValBuff[i][1];
            OP_FirePosition[OP_FireList][1] = argValBuff[i][2];
            OP_FirePosition[OP_FireList][2] = argValBuff[i][3];
            OP_FireScale[OP_FireList] = argValBuff[i][4];
            OP_FireFlg[OP_FireList] = (int) argValBuff[i][5];
            OP_FireList++;
        }

        if (TEIGI_DEF_ENDS[0] == (int) argValBuff[i][0]) {
            nowPartsCnt++;
        }
    }
}

/* The run of separators standing before a token. The loader turns every line ending into a pair of
   NULs before anything reads the text, so a NUL is a separator here and a comment is the run up to
   the next one; the ideographic space is two bytes, which is why the skip is a loop over the file
   rather than a walk over one kind of byte. */
static int skipSpace(char *buf, int pos) {
    int skip;

    while (pos < teigiFileSize) {
        skip = 0;

        if (memcmp(&buf[pos], "\x81\x40", 2) == 0) {
            pos++;
            skip = 1;
        }

        if (buf[pos] == ' ')
            skip = 1;
        if (buf[pos] == '\t')
            skip = 1;
        if (buf[pos] == '\0') {
            pos++;
            skip = 1;
        }

        if (memcmp(&buf[pos], "//", 2) == 0) {
            while (buf[pos] != '\0')
                pos++;
            pos++;
            skip = 1;
        }

        if (!skip)
            return pos;
        pos++;
    }

    return teigiFileSize;
}

/* One command's arguments, described by the row the caller passes: its own number, how many
   arguments it takes, and one type per argument. A type-0 argument is a quoted string and lands in
   the string buffer; the other two are numbers and land in the value buffer beside the command
   number, and differ only in whether a comma has to stand in front. Anything the forms do not
   cover hands back -1. */
static int checkArg(char *buf, int pos, int *command) {
    int i;
    int at;
    int n;
    int ok;

    at = pos;

    if (command[1] == 0)
        return pos;

    for (i = 0; i < command[1]; i++) {
        argValBuff[argLevel][0] = (float) command[0];

        switch (command[2 + i]) {
            case 0:
                if (buf[at] != '"')
                    return -1;

                at++;
                for (n = 0; n < 64; n++) {
                    if (buf[at] == '"') {
                        argStrBuff[argLevel][n] = '\0';
                        at++;
                        break;
                    }
                    argStrBuff[argLevel][n] = buf[at];
                    at++;
                }

                if (n == 64)
                    return -1;

                at = skipSpace(buf, at);
                break;

            case 1:
                if (buf[at] != ',')
                    return -1;

                at = skipSpace(buf, at + 1);
                if (memcmp(&buf[at], "ON", 2) == 0) {
                    argValBuff[argLevel][1 + i] = 1.0f;
                    at += 2;
                } else if (memcmp(&buf[at], "OFF", 3) == 0) {
                    argValBuff[argLevel][1 + i] = 0;
                    at += 3;
                } else {
                    ok = 0;
                    if (buf[at] == '-')
                        ok = 1;
                    if (buf[at] >= '0' && buf[at] <= '9')
                        ok = 1;
                    if (!ok)
                        return -1;

                    argValBuff[argLevel][1 + i] = (float) atof(&buf[at]);

                    for (n = 0; n < 32; n++) {
                        ok = 0;
                        if (buf[at] == '-') {
                            at++;
                            ok = 1;
                        }
                        if (buf[at] >= '0' && buf[at] <= '9') {
                            at++;
                            ok = 1;
                        }
                        if (buf[at] == '.') {
                            at++;
                            ok = 1;
                        }
                        if (!ok)
                            break;
                    }

                    if (n == 32)
                        return -1;
                }

                at = skipSpace(buf, at);
                break;

            case 2:
                if (memcmp(&buf[at], "ON", 2) == 0) {
                    argValBuff[argLevel][1 + i] = 1.0f;
                    at += 2;
                } else if (memcmp(&buf[at], "OFF", 3) == 0) {
                    argValBuff[argLevel][1 + i] = 0;
                    at += 3;
                } else {
                    ok = 0;
                    if (buf[at] == '-')
                        ok = 1;
                    if (buf[at] >= '0' && buf[at] <= '9')
                        ok = 1;
                    if (!ok)
                        return -1;

                    argValBuff[argLevel][1 + i] = (float) atof(&buf[at]);

                    for (n = 0; n < 32; n++) {
                        ok = 0;
                        if (buf[at] == '-') {
                            at++;
                            ok = 1;
                        }
                        if (buf[at] >= '0' && buf[at] <= '9') {
                            at++;
                            ok = 1;
                        }
                        if (buf[at] == '.') {
                            at++;
                            ok = 1;
                        }
                        if (!ok)
                            break;
                    }

                    if (n == 32)
                        return -1;
                }

                at = skipSpace(buf, at);
                break;
        }
    }

    return at;
}
