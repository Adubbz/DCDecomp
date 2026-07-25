#pragma once

#include "common.h"

class CFrame {
public:
    /* ?ret */ void Initialize(void); // @ 0x127D70 (0x110 bytes) -- mangled: Initialize__6CFrameFv
    /* ?ret */ void SetPosition(float, float, float); // @ 0x127E80 (0x60 bytes) -- mangled: SetPosition__6CFrameFfff
    /* ?ret */ void SetPosition(float *); // @ 0x127EE0 (0x70 bytes) -- mangled: SetPosition__6CFrameFPf
    /* ?ret */ void SetScale(float, float, float); // @ 0x127F50 (0x60 bytes) -- mangled: SetScale__6CFrameFfff
    /* ?ret */ void SetScale(float *); // @ 0x127FB0 (0x70 bytes) -- mangled: SetScale__6CFrameFPf
    /* ?ret */ void GetFrameNum(void); // @ 0x128020 (0x60 bytes) -- mangled: GetFrameNum__6CFrameFv
    /* ?ret */ void SetParent(CFrame *); // @ 0x128080 (0x50 bytes) -- mangled: SetParent__6CFrameFP6CFrame
    /* ?ret */ void SetBrother(CFrame *); // @ 0x1280D0 (0x50 bytes) -- mangled: SetBrother__6CFrameFP6CFrame
    /* ?ret */ void SetChild(CFrame *); // @ 0x128120 (0x60 bytes) -- mangled: SetChild__6CFrameFP6CFrame
    /* ?ret */ void SetReference(CFrame *); // @ 0x128180 (0x20 bytes) -- mangled: SetReference__6CFrameFP6CFrame
    /* ?ret */ void DeleteReference(void); // @ 0x1281A0 (0x10 bytes) -- mangled: DeleteReference__6CFrameFv
    /* ?ret */ void GetLWMatrix(float (*)[4]); // @ 0x1281B0 (0x360 bytes) -- mangled: GetLWMatrix__6CFrameFPA4_f
    /* ?ret */ void GetInverseMatrix(void); // @ 0x128510 (0x50 bytes) -- mangled: GetInverseMatrix__6CFrameFv
    /* ?ret */ void SetTransMatrix(float (*)[4]); // @ 0x128560 (0x40 bytes) -- mangled: SetTransMatrix__6CFrameFPA4_f
    /* ?ret */ void SetTransMatrix(float *); // @ 0x1285A0 (0x50 bytes) -- mangled: SetTransMatrix__6CFrameFPf
    /* ?ret */ void SearchFrame(char *); // @ 0x128700 (0x90 bytes) -- mangled: SearchFrame__6CFrameFPc
    /* ?ret */ void GetBoundBox(CBoxVu0 *, int); // @ 0x128790 (0x190 bytes) -- mangled: GetBoundBox__6CFrameFP7CBoxVu0i
    /* ?ret */ void ScaleBoundBox(float *); // @ 0x128920 (0x230 bytes) -- mangled: ScaleBoundBox__6CFrameFPf
    /* ?ret */ void SetAttr(CFrameAttr &, int, int); // @ 0x128B50 (0x210 bytes) -- mangled: SetAttr__6CFrameFR10CFrameAttrii
    /* ?ret */ void GetWorldPosition(float *, float *); // @ 0x128D60 (0x60 bytes) -- mangled: GetWorldPosition__6CFrameFPfPf
    /* ?ret */ void SetRotation(float, float, float); // @ 0x128DC0 (0x70 bytes) -- mangled: SetRotation__6CFrameFfff
    /* ?ret */ void GetRotation(float *); // @ 0x128E30 (0x50 bytes) -- mangled: GetRotation__6CFrameFPf
    /* ?ret */ void SetRotType(int); // @ 0x128E80 (0x30 bytes) -- mangled: SetRotType__6CFrameFi
    /* ?ret */ void __as(CFrame &); // @ 0x128EB0 (0x50 bytes) -- mangled: __as__6CFrameFR6CFrame
    /* ?ret */ void SetCollision(CCollision *); // @ 0x12A190 (0x10 bytes) -- mangled: SetCollision__6CFrameFP10CCollision
    /* ?ret */ void DrawVu1(unsigned int *, RenderInfo *); // @ 0x12A1A0 (0x10 bytes) -- mangled: DrawVu1__6CFrameFPUiP10RenderInfo
    /* ?ret */ void DrawVu1(sceVif1Packet *, RenderInfo *); // @ 0x12A1B0 (0x10 bytes) -- mangled: DrawVu1__6CFrameFP13sceVif1PacketP10RenderInfo
    CFrame(void); // @ 0x12A1C0 (0x50 bytes) -- mangled: __ct__6CFrameFv
    /* ?ret */ void PickUpNearPoly(CCPoly *, const CBoxVu0 &); // @ 0x12A390 (0x280 bytes) -- mangled: PickUpNearPoly__6CFrameFP6CCPolyRC7CBoxVu0
};
