#pragma once

#include "common.h"
#include "collision.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCPoly;
class CFrameVu1;
class CMapParts;
class CRect_i_;
class CVector3_f_;
class CVector3_i_;

/**
 * Stores the map-part and elevation state for one editable grid cell.
 */
class CEditAreaCell {
public:
    int parts_no;    /**< Selects the map-part instance occupying the cell. */
    int altitude;    /**< Stores the cell height in vertical grid units. */
    int unk_08;
    int parts_id;    /**< Identifies the map-part definition occupying the cell. */
    int code;        /**< Stores the map-part geometry code for the cell. */
    int parts_extra; /**< Stores the area-specific map-part attribute. */
    int unk_18;
};

STATIC_ASSERT(sizeof(CEditAreaCell) == 0x1C);

/**
 * Maintains the editable map grid and its world-space dimensions.
 */
class CEditArea {
public:
    int area_id;                 /**< Selects the area's special grid rules. */
    int map_no;                  /**< Identifies the map represented by the grid. */
    int width;                   /**< Gives the active grid width in cells. */
    int height;                  /**< Gives the active grid height in cells. */
    float offset_x;              /**< Gives the grid origin on the world X axis. */
    float offset_y;              /**< Gives the grid origin on the world Y axis. */
    float offset_z;              /**< Gives the grid origin on the world Z axis. */
    int unk_1c;
    float unit_size;             /**< Gives one cell's horizontal world-space extent. */
    float unit_alt;              /**< Gives one elevation unit's world-space extent. */
    CEditAreaCell grid[16][16];  /**< Stores the editable cells in grid coordinates. */
    int chain_work[16][16];      /**< Marks cells visited while following river chains. */
    CFrameVu1 *grid_frame;       /**< Holds the frame used to render the grid overlay. */
    int unk_202c;
    CBoxVu0 parts_box;           /**< Bounds all occupied cells in world space. */
    int unk_2050;
    int unk_2054;

    /**
     * Sets the active grid dimensions and world-space unit scales.
     *
     * @mangled SetSize__9CEditAreaFiiff
     * @address 0x16D860
     * @size 0x20
     */
    void SetSize(int, int, float, float);

    /**
     * Converts a world-space position to integral grid coordinates.
     *
     * @mangled GetPos__9CEditAreaFP11CVector3_i_fff
     * @address 0x16D880
     * @size 0xA0
     */
    void GetPos(CVector3_i_ *, float, float, float);

    /**
     * Converts grid coordinates to a world-space position.
     *
     * @mangled GetPos__9CEditAreaFP11CVector3_f_iii
     * @address 0x16D920
     * @size 0x70
     */
    void GetPos(CVector3_f_ *, int, int, int);

    /**
     * Sets the map-part number stored at one grid coordinate.
     *
     * @mangled SetPartsNo__9CEditAreaFiii
     * @address 0x16D990
     * @size 0x70
     */
    void SetPartsNo(int, int, int);

    /**
     * Sets the map-part identifier stored at one grid coordinate.
     *
     * @mangled SetPartsID__9CEditAreaFiii
     * @address 0x16DA00
     * @size 0x70
     */
    void SetPartsID(int, int, int);

    /**
     * Sets the area-specific part attribute at one grid coordinate.
     *
     * @mangled SetPartsExtra__9CEditAreaFiii
     * @address 0x16DA70
     * @size 0x70
     */
    void SetPartsExtra(int, int, int);

    /**
     * Sets the geometry code stored at one grid coordinate.
     *
     * @mangled SetCode__9CEditAreaFiii
     * @address 0x16DAE0
     * @size 0x70
     */
    void SetCode(int, int, int);

    /**
     * Returns the map-part identifier at one grid coordinate.
     *
     * @mangled GetPartsID__9CEditAreaFii
     * @address 0x16DB50
     * @size 0x80
     */
    int GetPartsID(int, int);

    /**
     * Returns the geometry code at one grid coordinate.
     *
     * @mangled GetCode__9CEditAreaFii
     * @address 0x16DBD0
     * @size 0x80
     */
    int GetCode(int, int);

    /**
     * Sets a clamped integral altitude at one grid coordinate.
     *
     * @mangled SetAlt__9CEditAreaFiii
     * @address 0x16DC50
     * @size 0x90
     */
    void SetAlt(int, int, int);

    /**
     * Returns the integral altitude at one grid coordinate.
     *
     * @mangled GetAlt_i__9CEditAreaFii
     * @address 0x16DCE0
     * @size 0x80
     */
    int GetAlt_i(int, int);

    /**
     * Returns the world-space altitude at one grid coordinate.
     *
     * @mangled GetAlt__9CEditAreaFii
     * @address 0x16DD60
     * @size 0x90
     */
    float GetAlt(int, int);

    /**
     * Returns the world-space altitude at one world position.
     *
     * @mangled GetAlt__9CEditAreaFfff
     * @address 0x16DDF0
     * @size 0x50
     */
    float GetAlt(float, float, float);

    /**
     * Returns the integral altitude at one world position.
     *
     * @mangled GetAlt_i__9CEditAreaFfff
     * @address 0x16DE40
     * @size 0x50
     */
    int GetAlt_i(float, float, float);

    /**
     * Returns the area-specific part attribute at one grid coordinate.
     *
     * @mangled GetPartsExtra__9CEditAreaFii
     * @address 0x16DE90
     * @size 0x180
     */
    int GetPartsExtra(int, int);

    /**
     * Projects one map part into the editable grid.
     *
     * @mangled SetMapParts__9CEditAreaFiP9CMapPartsfffi
     * @address 0x16E010
     * @size 0x200
     */
    void SetMapParts(int, CMapParts *, float, float, float, int);

    /**
     * Removes one map part from the editable grid.
     *
     * @mangled DeleteMapParts__9CEditAreaFiP9CMapPartsfff
     * @address 0x16E210
     * @size 0x260
     */
    int DeleteMapParts(int, CMapParts *, float, float, float);

    /**
     * Determines the river connection code at one grid coordinate.
     *
     * @mangled SetRiverParts__9CEditAreaFii
     * @address 0x16E470
     * @size 0x440
     */
    int SetRiverParts(int, int);

    /**
     * Determines the road connection code at one grid coordinate.
     *
     * @mangled SetRoadParts__9CEditAreaFii
     * @address 0x16E8B0
     * @size 0x330
     */
    int SetRoadParts(int, int);

    /**
     * Returns the map-part identifier at one world position.
     *
     * @mangled SearchPartsID__9CEditAreaFfff
     * @address 0x16EBE0
     * @size 0x60
     */
    int SearchPartsID(float, float, float);

    /**
     * Returns the area-specific part attribute at one world position.
     *
     * @mangled SearchPartsExtra__9CEditAreaFfff
     * @address 0x16EC40
     * @size 0x50
     */
    int SearchPartsExtra(float, float, float);

    /**
     * Returns floating grid coordinates for one world position.
     *
     * @mangled GetGrid__9CEditAreaFP11CVector3_f_fff
     * @address 0x16EC90
     * @size 0x60
     */
    void GetGrid(CVector3_f_ *, float, float, float);

    /**
     * Rebuilds the frame geometry used to draw the grid.
     *
     * @mangled RemakeGrid__9CEditAreaFv
     * @address 0x16ECF0
     * @size 0x1E0
     */
    void RemakeGrid(void);

    /**
     * Copies the occupied-parts bounding box to the caller.
     *
     * @mangled GetPartsBox__9CEditAreaFP7CBoxVu0
     * @address 0x16EED0
     * @size 0x30
     */
    void GetPartsBox(CBoxVu0 *);

    /**
     * Recomputes the occupied-parts bounding box.
     *
     * @mangled MakePartsBox__9CEditAreaFv
     * @address 0x16EF00
     * @size 0x190
     */
    void MakePartsBox(void);

    /**
     * Returns whether a world position lies inside the editable area.
     *
     * @mangled CheckArea__9CEditAreaFfff
     * @address 0x16F090
     * @size 0xB0
     */
    int CheckArea(float, float, float);

    /**
     * Returns whether a centered grid rectangle fits inside the area.
     *
     * @mangled CheckAreaRect__9CEditAreaFfffii
     * @address 0x16F140
     * @size 0xC0
     */
    int CheckAreaRect(float, float, float, int, int);

    /**
     * Returns whether a map part can occupy the requested world position.
     *
     * @mangled CheckParts__9CEditAreaFP9CMapPartsfffi
     * @address 0x16F200
     * @size 0x460
     */
    int CheckParts(CMapParts *, float, float, float, int);

    /**
     * Collects collision polygons around one world position.
     *
     * @mangled PickUpPoly__9CEditAreaFP6CCPolyfff
     * @address 0x16F660
     * @size 0xD0
     */
    int PickUpPoly(CCPoly *, float, float, float);

    /**
     * Collects collision polygons from one grid rectangle.
     *
     * @mangled PickUpPoly__9CEditAreaFP6CCPoly8CRect_i_
     * @address 0x16F730
     * @size 0x340
     */
    int PickUpPoly(CCPoly *, CRect_i_);

    /**
     * Collects collision polygons overlapping one world-space box.
     *
     * @mangled PickUpPoly__9CEditAreaFP6CCPoly7CBoxVu0
     * @address 0x16FA70
     * @size 0xE0
     */
    int PickUpPoly(CCPoly *, CBoxVu0);

    /**
     * Collects part identifiers from one grid rectangle.
     *
     * @mangled GetPartsRect__9CEditAreaFR8CRect_i_Pii
     * @address 0x16FB50
     * @size 0x150
     */
    int GetPartsRect(CRect_i_ &, int *, int);

    /**
     * Clears the river-chain traversal marks.
     *
     * @mangled ChainWorkClear__9CEditAreaFv
     * @address 0x16FCA0
     * @size 0x60
     */
    void ChainWorkClear(void);

    /**
     * Returns whether two river cells belong to one connected chain.
     *
     * @mangled CheckRiverChain__9CEditAreaFiiii
     * @address 0x16FD00
     * @size 0x1F0
     */
    int CheckRiverChain(int, int, int, int);

    /**
     * Updates and draws the editable grid overlay.
     *
     * @mangled DrawGrid__9CEditAreaFv
     * @address 0x16FEF0
     * @size 0xD0
     */
    void DrawGrid(void);

    /**
     * Resets every active grid cell to its empty state.
     *
     * @mangled Clear__9CEditAreaFv
     * @address 0x16FFC0
     * @size 0xA0
     */
    void Clear(void);

    /**
     * Initializes the editable area to an empty 16 by 16 grid.
     *
     * @mangled Initialize__9CEditAreaFv
     * @address 0x170060
     * @size 0x80
     */
    void Initialize(void);

    /**
     * Selects the map number and area identifier represented by the grid.
     *
     * @mangled SetMapInfo__9CEditAreaFii
     * @address 0x1700E0
     * @size 0x10
     */
    void SetMapInfo(int, int);

    /**
     * Returns the selected map number.
     *
     * @mangled GetMapNo__9CEditAreaFv
     * @address 0x1700F0
     * @size 0x10
     */
    int GetMapNo(void);

    /**
     * Returns the selected area identifier.
     *
     * @mangled GetAreaID__9CEditAreaFv
     * @address 0x170100
     * @size 0x10
     */
    int GetAreaID(void);

    /**
     * Selects the frame used to render the grid overlay.
     *
     * @mangled SetGridFrame__9CEditAreaFP9CFrameVu1
     * @address 0x170110
     * @size 0x10
     */
    void SetGridFrame(CFrameVu1 *);

    /**
     * Returns the frame used to render the grid overlay.
     *
     * @mangled GetGridFrame__9CEditAreaFv
     * @address 0x170120
     * @size 0x10
     */
    CFrameVu1 *GetGridFrame(void);

    /**
     * Sets the world-space origin of the editable grid.
     *
     * @mangled SetOffset__9CEditAreaFfff
     * @address 0x170130
     * @size 0x20
     */
    void SetOffset(float, float, float);

    /**
     * Copies the world-space grid origin to the caller.
     *
     * @mangled GetOffset__9CEditAreaFPf
     * @address 0x170150
     * @size 0x20
     */
    void GetOffset(float *);

    /**
     * Returns the active grid width.
     *
     * @mangled GetWidth__9CEditAreaFv
     * @address 0x170170
     * @size 0x10
     */
    int GetWidth(void);

    /**
     * Returns the active grid height.
     *
     * @mangled GetHeight__9CEditAreaFv
     * @address 0x170180
     * @size 0x10
     */
    int GetHeight(void);

    /**
     * Adds an integral altitude delta to one grid coordinate.
     *
     * @mangled AddAlt__9CEditAreaFiii
     * @address 0x170190
     * @size 0x70
     */
    void AddAlt(int, int, int);

    /**
     * Returns one cell's horizontal world-space extent.
     *
     * @mangled GetUnitSize__9CEditAreaFv
     * @address 0x170200
     * @size 0x10
     */
    float GetUnitSize(void);

    /**
     * Returns one elevation unit's world-space extent.
     *
     * @mangled GetUnitAlt__9CEditAreaFv
     * @address 0x170210
     * @size 0x10
     */
    float GetUnitAlt(void);

    /**
     * Constructs an initialized editable area.
     *
     * @mangled __ct__9CEditAreaFv
     * @address 0x170220
     * @size 0x30
     */
    CEditArea(void);
};

STATIC_ASSERT(sizeof(CEditArea) == 0x2060);
