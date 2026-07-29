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
    /* ?ret */ void SetSize(int, int, float, float); // @ 0x16D860 (0x20 bytes) -- mangled: SetSize__9CEditAreaFiiff
    /* ?ret */ void GetPos(CVector3_i_ *, float, float, float); // @ 0x16D880 (0xA0 bytes) -- mangled: GetPos__9CEditAreaFP11CVector3_i_fff
    /* ?ret */ void GetPos(CVector3_f_ *, int, int, int); // @ 0x16D920 (0x70 bytes) -- mangled: GetPos__9CEditAreaFP11CVector3_f_iii
    /* ?ret */ void SetPartsNo(int, int, int); // @ 0x16D990 (0x70 bytes) -- mangled: SetPartsNo__9CEditAreaFiii
    /* ?ret */ void SetPartsID(int, int, int); // @ 0x16DA00 (0x70 bytes) -- mangled: SetPartsID__9CEditAreaFiii
    /* ?ret */ void SetPartsExtra(int, int, int); // @ 0x16DA70 (0x70 bytes) -- mangled: SetPartsExtra__9CEditAreaFiii
    /* ?ret */ void SetCode(int, int, int); // @ 0x16DAE0 (0x70 bytes) -- mangled: SetCode__9CEditAreaFiii
    /* ?ret */ void GetPartsID(int, int); // @ 0x16DB50 (0x80 bytes) -- mangled: GetPartsID__9CEditAreaFii
    /* ?ret */ void GetCode(int, int); // @ 0x16DBD0 (0x80 bytes) -- mangled: GetCode__9CEditAreaFii
    /* ?ret */ void SetAlt(int, int, int); // @ 0x16DC50 (0x90 bytes) -- mangled: SetAlt__9CEditAreaFiii
    /* ?ret */ void GetAlt_i(int, int); // @ 0x16DCE0 (0x80 bytes) -- mangled: GetAlt_i__9CEditAreaFii
    /* ?ret */ void GetAlt(int, int); // @ 0x16DD60 (0x90 bytes) -- mangled: GetAlt__9CEditAreaFii
    /* ?ret */ void GetAlt(float, float, float); // @ 0x16DDF0 (0x50 bytes) -- mangled: GetAlt__9CEditAreaFfff
    /* ?ret */ void GetAlt_i(float, float, float); // @ 0x16DE40 (0x50 bytes) -- mangled: GetAlt_i__9CEditAreaFfff
    /* ?ret */ void GetPartsExtra(int, int); // @ 0x16DE90 (0x180 bytes) -- mangled: GetPartsExtra__9CEditAreaFii
    /* ?ret */ void SetMapParts(int, CMapParts *, float, float, float, int); // @ 0x16E010 (0x200 bytes) -- mangled: SetMapParts__9CEditAreaFiP9CMapPartsfffi
    /* ?ret */ void DeleteMapParts(int, CMapParts *, float, float, float); // @ 0x16E210 (0x260 bytes) -- mangled: DeleteMapParts__9CEditAreaFiP9CMapPartsfff
    /* ?ret */ void SetRiverParts(int, int); // @ 0x16E470 (0x440 bytes) -- mangled: SetRiverParts__9CEditAreaFii
    /* ?ret */ void SetRoadParts(int, int); // @ 0x16E8B0 (0x330 bytes) -- mangled: SetRoadParts__9CEditAreaFii
    /* ?ret */ void SearchPartsID(float, float, float); // @ 0x16EBE0 (0x60 bytes) -- mangled: SearchPartsID__9CEditAreaFfff
    /* ?ret */ void SearchPartsExtra(float, float, float); // @ 0x16EC40 (0x50 bytes) -- mangled: SearchPartsExtra__9CEditAreaFfff
    /* ?ret */ void GetGrid(CVector3_f_ *, float, float, float); // @ 0x16EC90 (0x60 bytes) -- mangled: GetGrid__9CEditAreaFP11CVector3_f_fff
    /* ?ret */ void RemakeGrid(void); // @ 0x16ECF0 (0x1E0 bytes) -- mangled: RemakeGrid__9CEditAreaFv
    /* ?ret */ void GetPartsBox(CBoxVu0 *); // @ 0x16EED0 (0x30 bytes) -- mangled: GetPartsBox__9CEditAreaFP7CBoxVu0
    /* ?ret */ void MakePartsBox(void); // @ 0x16EF00 (0x190 bytes) -- mangled: MakePartsBox__9CEditAreaFv
    /* ?ret */ void CheckArea(float, float, float); // @ 0x16F090 (0xB0 bytes) -- mangled: CheckArea__9CEditAreaFfff
    /* ?ret */ void CheckAreaRect(float, float, float, int, int); // @ 0x16F140 (0xC0 bytes) -- mangled: CheckAreaRect__9CEditAreaFfffii
    /* ?ret */ void CheckParts(CMapParts *, float, float, float, int); // @ 0x16F200 (0x460 bytes) -- mangled: CheckParts__9CEditAreaFP9CMapPartsfffi
    /* ?ret */ void PickUpPoly(CCPoly *, float, float, float); // @ 0x16F660 (0xD0 bytes) -- mangled: PickUpPoly__9CEditAreaFP6CCPolyfff
    /* ?ret */ void PickUpPoly(CCPoly *, CRect_i_); // @ 0x16F730 (0x340 bytes) -- mangled: PickUpPoly__9CEditAreaFP6CCPoly8CRect_i_
    /* ?ret */ void PickUpPoly(CCPoly *, CBoxVu0); // @ 0x16FA70 (0xE0 bytes) -- mangled: PickUpPoly__9CEditAreaFP6CCPoly7CBoxVu0
    /* ?ret */ void GetPartsRect(CRect_i_ &, int *, int); // @ 0x16FB50 (0x150 bytes) -- mangled: GetPartsRect__9CEditAreaFR8CRect_i_Pii
    /* ?ret */ void ChainWorkClear(void); // @ 0x16FCA0 (0x60 bytes) -- mangled: ChainWorkClear__9CEditAreaFv
    /* ?ret */ void CheckRiverChain(int, int, int, int); // @ 0x16FD00 (0x1F0 bytes) -- mangled: CheckRiverChain__9CEditAreaFiiii
    /* ?ret */ void DrawGrid(void); // @ 0x16FEF0 (0xD0 bytes) -- mangled: DrawGrid__9CEditAreaFv
    /* ?ret */ void Clear(void); // @ 0x16FFC0 (0xA0 bytes) -- mangled: Clear__9CEditAreaFv
    /* ?ret */ void Initialize(void); // @ 0x170060 (0x80 bytes) -- mangled: Initialize__9CEditAreaFv
    /* ?ret */ void SetMapInfo(int, int); // @ 0x1700E0 (0x10 bytes) -- mangled: SetMapInfo__9CEditAreaFii
    /* ?ret */ void GetMapNo(void); // @ 0x1700F0 (0x10 bytes) -- mangled: GetMapNo__9CEditAreaFv
    /* ?ret */ void GetAreaID(void); // @ 0x170100 (0x10 bytes) -- mangled: GetAreaID__9CEditAreaFv
    /* ?ret */ void SetGridFrame(CFrameVu1 *); // @ 0x170110 (0x10 bytes) -- mangled: SetGridFrame__9CEditAreaFP9CFrameVu1
    /* ?ret */ void GetGridFrame(void); // @ 0x170120 (0x10 bytes) -- mangled: GetGridFrame__9CEditAreaFv
    /* ?ret */ void SetOffset(float, float, float); // @ 0x170130 (0x20 bytes) -- mangled: SetOffset__9CEditAreaFfff
    /* ?ret */ void GetOffset(float *); // @ 0x170150 (0x20 bytes) -- mangled: GetOffset__9CEditAreaFPf
    /* ?ret */ void GetWidth(void); // @ 0x170170 (0x10 bytes) -- mangled: GetWidth__9CEditAreaFv
    /* ?ret */ void GetHeight(void); // @ 0x170180 (0x10 bytes) -- mangled: GetHeight__9CEditAreaFv
    /* ?ret */ void AddAlt(int, int, int); // @ 0x170190 (0x70 bytes) -- mangled: AddAlt__9CEditAreaFiii
    /* ?ret */ void GetUnitSize(void); // @ 0x170200 (0x10 bytes) -- mangled: GetUnitSize__9CEditAreaFv
    /* ?ret */ void GetUnitAlt(void); // @ 0x170210 (0x10 bytes) -- mangled: GetUnitAlt__9CEditAreaFv
    CEditArea(void); // @ 0x170220 (0x30 bytes) -- mangled: __ct__9CEditAreaFv
};
