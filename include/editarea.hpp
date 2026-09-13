#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CBoxVu0;
class CCPoly;
class CFrameVu1;
class CMapParts;
class CRect_i_;
class CVector3_f_;
class CVector3_i_;

class CEditArea {
public:
    /**
     * @mangled SetSize__9CEditAreaFiiff
     * @address 0x16D860
     * @size 0x20
     */
    void SetSize(int, int, float, float);

    /**
     * @mangled GetPos__9CEditAreaFP11CVector3_i_fff
     * @address 0x16D880
     * @size 0xA0
     */
    void GetPos(CVector3_i_ *, float, float, float);

    /**
     * @mangled GetPos__9CEditAreaFP11CVector3_f_iii
     * @address 0x16D920
     * @size 0x70
     */
    void GetPos(CVector3_f_ *, int, int, int);

    /**
     * @mangled SetPartsNo__9CEditAreaFiii
     * @address 0x16D990
     * @size 0x70
     */
    void SetPartsNo(int, int, int);

    /**
     * @mangled SetPartsID__9CEditAreaFiii
     * @address 0x16DA00
     * @size 0x70
     */
    void SetPartsID(int, int, int);

    /**
     * @mangled SetPartsExtra__9CEditAreaFiii
     * @address 0x16DA70
     * @size 0x70
     */
    void SetPartsExtra(int, int, int);

    /**
     * @mangled SetCode__9CEditAreaFiii
     * @address 0x16DAE0
     * @size 0x70
     */
    void SetCode(int, int, int);

    /**
     * @mangled GetPartsID__9CEditAreaFii
     * @address 0x16DB50
     * @size 0x80
     */
    int GetPartsID(int, int);

    /**
     * @mangled GetCode__9CEditAreaFii
     * @address 0x16DBD0
     * @size 0x80
     */
    int GetCode(int, int);

    /**
     * @mangled SetAlt__9CEditAreaFiii
     * @address 0x16DC50
     * @size 0x90
     */
    void SetAlt(int, int, int);

    /**
     * @mangled GetAlt_i__9CEditAreaFii
     * @address 0x16DCE0
     * @size 0x80
     */
    int GetAlt_i(int, int);

    /**
     * @mangled GetAlt__9CEditAreaFii
     * @address 0x16DD60
     * @size 0x90
     */
    float GetAlt(int, int);

    /**
     * @mangled GetAlt__9CEditAreaFfff
     * @address 0x16DDF0
     * @size 0x50
     */
    float GetAlt(float, float, float);

    /**
     * @mangled GetAlt_i__9CEditAreaFfff
     * @address 0x16DE40
     * @size 0x50
     */
    int GetAlt_i(float, float, float);

    /**
     * @mangled GetPartsExtra__9CEditAreaFii
     * @address 0x16DE90
     * @size 0x180
     */
    int GetPartsExtra(int, int);

    /**
     * @mangled SetMapParts__9CEditAreaFiP9CMapPartsfffi
     * @address 0x16E010
     * @size 0x200
     */
    void SetMapParts(int, CMapParts *, float, float, float, int);

    /**
     * @mangled DeleteMapParts__9CEditAreaFiP9CMapPartsfff
     * @address 0x16E210
     * @size 0x260
     */
    int DeleteMapParts(int, CMapParts *, float, float, float);

    /**
     * @mangled SetRiverParts__9CEditAreaFii
     * @address 0x16E470
     * @size 0x440
     */
    int SetRiverParts(int, int);

    /**
     * @mangled SetRoadParts__9CEditAreaFii
     * @address 0x16E8B0
     * @size 0x330
     */
    int SetRoadParts(int, int);

    /**
     * @mangled SearchPartsID__9CEditAreaFfff
     * @address 0x16EBE0
     * @size 0x60
     */
    int SearchPartsID(float, float, float);

    /**
     * @mangled SearchPartsExtra__9CEditAreaFfff
     * @address 0x16EC40
     * @size 0x50
     */
    int SearchPartsExtra(float, float, float);

    /**
     * @mangled GetGrid__9CEditAreaFP11CVector3_f_fff
     * @address 0x16EC90
     * @size 0x60
     */
    void GetGrid(CVector3_f_ *, float, float, float);

    /**
     * @mangled RemakeGrid__9CEditAreaFv
     * @address 0x16ECF0
     * @size 0x1E0
     */
    void RemakeGrid(void);

    /**
     * @mangled GetPartsBox__9CEditAreaFP7CBoxVu0
     * @address 0x16EED0
     * @size 0x30
     */
    void GetPartsBox(CBoxVu0 *);

    /**
     * @mangled MakePartsBox__9CEditAreaFv
     * @address 0x16EF00
     * @size 0x190
     */
    void MakePartsBox(void);

    /**
     * @mangled CheckArea__9CEditAreaFfff
     * @address 0x16F090
     * @size 0xB0
     */
    int CheckArea(float, float, float);

    /**
     * @mangled CheckAreaRect__9CEditAreaFfffii
     * @address 0x16F140
     * @size 0xC0
     */
    int CheckAreaRect(float, float, float, int, int);

    /**
     * @mangled CheckParts__9CEditAreaFP9CMapPartsfffi
     * @address 0x16F200
     * @size 0x460
     */
    int CheckParts(CMapParts *, float, float, float, int);

    /**
     * @mangled PickUpPoly__9CEditAreaFP6CCPolyfff
     * @address 0x16F660
     * @size 0xD0
     */
    int PickUpPoly(CCPoly *, float, float, float);

    /**
     * @mangled PickUpPoly__9CEditAreaFP6CCPoly8CRect_i_
     * @address 0x16F730
     * @size 0x340
     */
    int PickUpPoly(CCPoly *, CRect_i_);

    /**
     * @mangled PickUpPoly__9CEditAreaFP6CCPoly7CBoxVu0
     * @address 0x16FA70
     * @size 0xE0
     */
    int PickUpPoly(CCPoly *, CBoxVu0);

    /**
     * @mangled GetPartsRect__9CEditAreaFR8CRect_i_Pii
     * @address 0x16FB50
     * @size 0x150
     */
    int GetPartsRect(CRect_i_ &, int *, int);

    /**
     * @mangled ChainWorkClear__9CEditAreaFv
     * @address 0x16FCA0
     * @size 0x60
     */
    void ChainWorkClear(void);

    /**
     * @mangled CheckRiverChain__9CEditAreaFiiii
     * @address 0x16FD00
     * @size 0x1F0
     */
    int CheckRiverChain(int, int, int, int);

    /**
     * @mangled DrawGrid__9CEditAreaFv
     * @address 0x16FEF0
     * @size 0xD0
     */
    void DrawGrid(void);

    /**
     * @mangled Clear__9CEditAreaFv
     * @address 0x16FFC0
     * @size 0xA0
     */
    void Clear(void);

    /**
     * @mangled Initialize__9CEditAreaFv
     * @address 0x170060
     * @size 0x80
     */
    void Initialize(void);

    /**
     * @mangled SetMapInfo__9CEditAreaFii
     * @address 0x1700E0
     * @size 0x10
     */
    void SetMapInfo(int, int);

    /**
     * @mangled GetMapNo__9CEditAreaFv
     * @address 0x1700F0
     * @size 0x10
     */
    int GetMapNo(void);

    /**
     * @mangled GetAreaID__9CEditAreaFv
     * @address 0x170100
     * @size 0x10
     */
    int GetAreaID(void);

    /**
     * @mangled SetGridFrame__9CEditAreaFP9CFrameVu1
     * @address 0x170110
     * @size 0x10
     */
    void SetGridFrame(CFrameVu1 *);

    /**
     * @mangled GetGridFrame__9CEditAreaFv
     * @address 0x170120
     * @size 0x10
     */
    CFrameVu1 *GetGridFrame(void);

    /**
     * @mangled SetOffset__9CEditAreaFfff
     * @address 0x170130
     * @size 0x20
     */
    void SetOffset(float, float, float);

    /**
     * @mangled GetOffset__9CEditAreaFPf
     * @address 0x170150
     * @size 0x20
     */
    void GetOffset(float *);

    /**
     * @mangled GetWidth__9CEditAreaFv
     * @address 0x170170
     * @size 0x10
     */
    int GetWidth(void);

    /**
     * @mangled GetHeight__9CEditAreaFv
     * @address 0x170180
     * @size 0x10
     */
    int GetHeight(void);

    /**
     * @mangled AddAlt__9CEditAreaFiii
     * @address 0x170190
     * @size 0x70
     */
    void AddAlt(int, int, int);

    /**
     * @mangled GetUnitSize__9CEditAreaFv
     * @address 0x170200
     * @size 0x10
     */
    float GetUnitSize(void);

    /**
     * @mangled GetUnitAlt__9CEditAreaFv
     * @address 0x170210
     * @size 0x10
     */
    float GetUnitAlt(void);

    /**
     * @mangled __ct__9CEditAreaFv
     * @address 0x170220
     * @size 0x30
     */
    CEditArea(void);
};
