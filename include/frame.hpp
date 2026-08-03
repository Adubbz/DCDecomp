#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CBoxVu0;
class CCPoly;
class CCollision;
class CFrameAttr;
struct RenderInfo;
struct sceVif1Packet;


class CFrame {
public:
    /**
     * @mangled Initialize__6CFrameFv
     * @address 0x127D70
     * @size 0x110
     * @unknownret
     */
    void Initialize(void);

    /**
     * @mangled SetPosition__6CFrameFfff
     * @address 0x127E80
     * @size 0x60
     * @unknownret
     */
    void SetPosition(float, float, float);

    /**
     * @mangled SetPosition__6CFrameFPf
     * @address 0x127EE0
     * @size 0x70
     * @unknownret
     */
    void SetPosition(float *);

    /**
     * @mangled SetScale__6CFrameFfff
     * @address 0x127F50
     * @size 0x60
     * @unknownret
     */
    void SetScale(float, float, float);

    /**
     * @mangled SetScale__6CFrameFPf
     * @address 0x127FB0
     * @size 0x70
     * @unknownret
     */
    void SetScale(float *);

    /**
     * @mangled GetFrameNum__6CFrameFv
     * @address 0x128020
     * @size 0x60
     * @unknownret
     */
    void GetFrameNum(void);

    /**
     * @mangled SetParent__6CFrameFP6CFrame
     * @address 0x128080
     * @size 0x50
     * @unknownret
     */
    void SetParent(CFrame *);

    /**
     * @mangled SetBrother__6CFrameFP6CFrame
     * @address 0x1280D0
     * @size 0x50
     * @unknownret
     */
    void SetBrother(CFrame *);

    /**
     * @mangled SetChild__6CFrameFP6CFrame
     * @address 0x128120
     * @size 0x60
     * @unknownret
     */
    void SetChild(CFrame *);

    /**
     * @mangled SetReference__6CFrameFP6CFrame
     * @address 0x128180
     * @size 0x20
     * @unknownret
     */
    void SetReference(CFrame *);

    /**
     * @mangled DeleteReference__6CFrameFv
     * @address 0x1281A0
     * @size 0x10
     * @unknownret
     */
    void DeleteReference(void);

    /**
     * @mangled GetLWMatrix__6CFrameFPA4_f
     * @address 0x1281B0
     * @size 0x360
     * @unknownret
     */
    void GetLWMatrix(float (*)[4]);

    /**
     * @mangled GetInverseMatrix__6CFrameFv
     * @address 0x128510
     * @size 0x50
     * @unknownret
     */
    void GetInverseMatrix(void);

    /**
     * @mangled SetTransMatrix__6CFrameFPA4_f
     * @address 0x128560
     * @size 0x40
     * @unknownret
     */
    void SetTransMatrix(float (*)[4]);

    /**
     * @mangled SetTransMatrix__6CFrameFPf
     * @address 0x1285A0
     * @size 0x50
     * @unknownret
     */
    void SetTransMatrix(float *);

    /**
     * @mangled SearchFrame__6CFrameFPc
     * @address 0x128700
     * @size 0x90
     * @unknownret
     */
    void SearchFrame(char *);

    /**
     * @mangled GetBoundBox__6CFrameFP7CBoxVu0i
     * @address 0x128790
     * @size 0x190
     * @unknownret
     */
    void GetBoundBox(CBoxVu0 *, int);

    /**
     * @mangled ScaleBoundBox__6CFrameFPf
     * @address 0x128920
     * @size 0x230
     * @unknownret
     */
    void ScaleBoundBox(float *);

    /**
     * @mangled SetAttr__6CFrameFR10CFrameAttrii
     * @address 0x128B50
     * @size 0x210
     * @unknownret
     */
    void SetAttr(CFrameAttr &, int, int);

    /**
     * @mangled GetWorldPosition__6CFrameFPfPf
     * @address 0x128D60
     * @size 0x60
     * @unknownret
     */
    void GetWorldPosition(float *, float *);

    /**
     * @mangled SetRotation__6CFrameFfff
     * @address 0x128DC0
     * @size 0x70
     * @unknownret
     */
    void SetRotation(float, float, float);

    /**
     * @mangled GetRotation__6CFrameFPf
     * @address 0x128E30
     * @size 0x50
     * @unknownret
     */
    void GetRotation(float *);

    /**
     * @mangled SetRotType__6CFrameFi
     * @address 0x128E80
     * @size 0x30
     * @unknownret
     */
    void SetRotType(int);

    /**
     * @mangled __as__6CFrameFR6CFrame
     * @address 0x128EB0
     * @size 0x50
     * @unknownret
     */
    void __as(CFrame &);

    /**
     * @mangled SetCollision__6CFrameFP10CCollision
     * @address 0x12A190
     * @size 0x10
     * @unknownret
     */
    void SetCollision(CCollision *);

    /**
     * @mangled DrawVu1__6CFrameFPUiP10RenderInfo
     * @address 0x12A1A0
     * @size 0x10
     * @unknownret
     */
    void DrawVu1(unsigned int *, RenderInfo *);

    /**
     * @mangled DrawVu1__6CFrameFP13sceVif1PacketP10RenderInfo
     * @address 0x12A1B0
     * @size 0x10
     * @unknownret
     */
    void DrawVu1(sceVif1Packet *, RenderInfo *);

    /**
     * @mangled __ct__6CFrameFv
     * @address 0x12A1C0
     * @size 0x50
     */
    CFrame(void);

    /**
     * @mangled PickUpNearPoly__6CFrameFP6CCPolyRC7CBoxVu0
     * @address 0x12A390
     * @size 0x280
     * @unknownret
     */
    void PickUpNearPoly(CCPoly *, const CBoxVu0 &);
};
