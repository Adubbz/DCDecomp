#include "editarea.hpp"

#include <cstring>

#include "collision.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "mapparts.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "vector3.hpp"
#ifdef NON_MATCHING // draft includes
#include "visualvu1.hpp"
#endif

/**
 * Identifies map-part attributes used by connection queries.
 */
// clang-format off
enum MapConnectionAttribute {
    MAP_CONNECTION_ROAD = 1,
    MAP_CONNECTION_RIVER = 2
};
// clang-format on

/**
 * Identifies the shape encoded by connected map-part neighbors.
 */
// clang-format off
enum MapConnectionShape {
    MAP_CONNECTION_CORNER = 1,
    MAP_CONNECTION_STRAIGHT = 2,
    MAP_CONNECTION_THREE_WAY = 3,
    MAP_CONNECTION_FOUR_WAY = 4,
    MAP_CONNECTION_ISOLATED = 5,
    MAP_CONNECTION_END = 6
};
// clang-format on

void CEditArea::SetSize(s32 width, s32 height, float unit_size, float unit_alt) {
    this->width = width;
    this->height = height;
    this->unit_size = unit_size;
    this->unit_alt = unit_alt;
}
void CEditArea::GetPos(CVector3_i_ *position, float x, float y, float z) {
    x -= offset_x;
    y -= offset_y;
    z -= offset_z;
    x += 0.1f;
    z += 0.1f;
    position->x = (int) (x / unit_size);
    position->y = (int) (y / unit_alt);
    position->z = (int) (z / unit_size);
}

void CEditArea::GetPos(CVector3_f_ *position, s32 x, s32 y, s32 z) {
    position->x = this->offset_x + ((float) x * this->unit_size);
    position->y = this->offset_y + ((float) y * this->unit_alt);
    position->z = this->offset_z + ((float) z * this->unit_size);
}

void CEditArea::SetPartsNo(int x, int y, int parts_no) {
    if (x < 0 || x >= width) {
        return;
    }
    if (y < 0 || y >= height) {
        return;
    }
    grid[x][y].parts_no = parts_no;
}

void CEditArea::SetPartsID(int x, int y, int parts_id) {
    if (x < 0 || x >= width) {
        return;
    }
    if (y < 0 || y >= height) {
        return;
    }
    grid[x][y].parts_id = parts_id;
}

void CEditArea::SetPartsExtra(int x, int y, int parts_extra) {
    if (x < 0 || x >= width) {
        return;
    }
    if (y < 0 || y >= height) {
        return;
    }
    grid[x][y].parts_extra = parts_extra;
}

void CEditArea::SetCode(int x, int y, int code) {
    if (x < 0 || x >= width) {
        return;
    }
    if (y < 0 || y >= height) {
        return;
    }
    grid[x][y].code = code;
}

int CEditArea::GetPartsID(int x, int y) {
    if (x < 0 || x >= width) {
        return -1;
    }
    if (y < 0 || y >= height) {
        return -1;
    }
    return grid[x][y].parts_id;
}

int CEditArea::GetCode(int x, int y) {
    if (x < 0 || x >= width) {
        return -1;
    }
    if (y < 0 || y >= height) {
        return -1;
    }
    return grid[x][y].code;
}

void CEditArea::SetAlt(int x, int y, int altitude) {
    if (x < 0 || x >= width) {
        return;
    }
    if (y < 0 || y >= height) {
        return;
    }
    if (altitude < 0) {
        altitude = 0;
    }
    if (altitude >= 128) {
        altitude = 127;
    }
    grid[x][y].altitude = altitude;
}

int CEditArea::GetAlt_i(int x, int y) {
    if (x < 0 || x >= width) {
        return 0;
    }
    if (y < 0 || y >= height) {
        return 0;
    }
    return grid[x][y].altitude;
}

float CEditArea::GetAlt(int x, int y) {
    if (x < 0 || x >= width) {
        return 0.0f;
    }
    if (y < 0 || y >= height) {
        return 0.0f;
    }
    return offset_y + static_cast<float>(grid[x][y].altitude) * unit_alt;
}

float CEditArea::GetAlt(float x, float y, float z) {
    CVector3_i_ position;
    GetPos(&position, x, y, z);
    return GetAlt(position.x, position.z);
}

int CEditArea::GetAlt_i(float x, float y, float z) {
    CVector3_i_ position;
    GetPos(&position, x, y, z);
    return GetAlt_i(position.x, position.z);
}

int CEditArea::GetPartsExtra(int x, int y) {
    switch (map_no) {
        case 1:
            switch (area_id) {
                case 0:
                    if (x == 5 && y == -1)
                        return MAP_CONNECTION_RIVER;
                    if (x == 2 && y == 8)
                        return MAP_CONNECTION_RIVER;
                    break;
                case 1:
                    if (x == 3 && y == 6)
                        return MAP_CONNECTION_RIVER;
                    if (x == 12 && y == 3)
                        return MAP_CONNECTION_RIVER;
                    break;
                case 2:
                    if (x == 4 && y == -1)
                        return MAP_CONNECTION_RIVER;
                    if (x == 3 && y == 8)
                        return MAP_CONNECTION_RIVER;
                    break;
            }
    }
    if (x < 0 || x >= width)
        return -1;
    if (y < 0 || y >= height)
        return -1;
    return grid[x][y].parts_extra;
}
#ifdef NON_MATCHING
void CEditArea::SetMapParts(int parts_id, CMapParts *parts, float x, float y, float z, int unused) {
    CVector3_i_ position;
    CMapParts *part = &parts[parts_id];

    *(float *) &part->kind = this->unit_size;
    int width = part->GetWidth();
    int height = part->GetHeight();
    GetPos(&position, x, y, z);
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            int grid_x = i + (position.x - (width >> 1));
            int grid_y = j + (position.z - (height >> 1));
            int code = part->GetInfoData(i, j);
            if (code != 0) {
                SetCode(grid_x, grid_y, code);
                if (code < 0x80) {
                    AddAlt(grid_x, grid_y, code);
                } else {
                    SetPartsNo(grid_x, grid_y, part->handle);
                    SetPartsID(grid_x, grid_y, parts_id);
                    SetPartsExtra(grid_x, grid_y, part->subtype);
                }
            }
        }
    }
    this->grid_redraw = 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editarea", SetMapParts__9CEditAreaFiP9CMapPartsfffi);
#endif
int CEditArea::DeleteMapParts(int parts_no, CMapParts *parts, float x, float y, float z) {
    CVector3_i_ position;
    GetPos(&position, x, y, z);
    if (parts_no < 0) {
        return 0;
    }
    CMapParts *target = &parts[parts_no];
    int width = target->GetWidth();
    int height = target->GetHeight();
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            int half_width = width >> 1;
            int cell_x = i + (position.x - half_width);
            int half_height = height >> 1;
            int cell_y = j + (position.z - half_height);
            s16 info = target->GetInfoData(i, j);
            if (info != 0) {
                if (info < 0x80) {
                    int occupant = GetPartsID(cell_x, cell_y);
                    AddAlt(cell_x, cell_y, -info);
                    if (occupant >= 0) {
                        CMapParts *occupant_parts = &parts[occupant];
                        float occupant_position[3];
                        occupant_parts->GetPosition(occupant_position);
                        occupant_position[1] = GetAlt(cell_x, cell_y);
                        occupant_parts->SetPosition(occupant_position);
                    }
                } else {
                    SetPartsNo(cell_x, cell_y, -1);
                    SetPartsID(cell_x, cell_y, -1);
                    SetPartsExtra(cell_x, cell_y, -1);
                    SetCode(cell_x, cell_y, -1);
                }
            }
        }
    }
    grid_redraw = 1;
    return 1;
}

int CEditArea::SetRiverParts(int x, int y) {
    int neighbors[4];
    int negative_z, positive_x, positive_z, negative_x;
    int count, shape, direction, i;

    if ((x < 0) || (x >= this->width)) {
        return -1;
    }
    if ((y < 0) || (y >= this->height)) {
        return -1;
    }
    if (GetPartsExtra(x, y) != MAP_CONNECTION_RIVER) {
        return -1;
    }
    negative_z = GetPartsExtra(x, y - 1);
    positive_x = GetPartsExtra(x + 1, y);
    positive_z = GetPartsExtra(x, y + 1);
    negative_x = GetPartsExtra(x - 1, y);
    neighbors[0] = negative_z == MAP_CONNECTION_RIVER;
    neighbors[1] = positive_x == MAP_CONNECTION_RIVER;
    neighbors[2] = positive_z == MAP_CONNECTION_RIVER;
    neighbors[3] = negative_x == MAP_CONNECTION_RIVER;
    neighbors[0] = neighbors[0] || negative_z == 3;
    neighbors[1] = neighbors[1] || positive_x == 3;
    neighbors[2] = neighbors[2] || positive_z == 3;
    neighbors[3] = neighbors[3] || negative_x == 3;
    neighbors[0] = neighbors[0] || negative_z == 5;
    neighbors[1] = neighbors[1] || positive_x == 5;
    neighbors[2] = neighbors[2] || positive_z == 5;
    neighbors[3] = neighbors[3] || negative_x == 5;
    count = 0;
    for (i = 0; i < 4; i++) {
        count += neighbors[i];
    }
    shape = -1;
    direction = 0;
    if (count == 4) {
        shape = MAP_CONNECTION_FOUR_WAY;
    }
    if (count == 3) {
        shape = MAP_CONNECTION_THREE_WAY;
        if (neighbors[0] == 0) {
            direction = 3;
        }
        if (neighbors[1] == 0) {
            direction = 2;
        }
        if (neighbors[2] == 0) {
            direction = 1;
        }
        if (neighbors[3] == 0) {
            direction = 0;
        }
    }
    if (count == 2) {
        if (((neighbors[0] != 0) && (neighbors[2] != 0)) || ((neighbors[1] != 0) && (neighbors[3] != 0))) {
            shape = MAP_CONNECTION_STRAIGHT;
            if (neighbors[0] != 0) {
                direction = 0;
            }
            if (neighbors[1] != 0) {
                direction = 1;
            }
        } else {
            shape = MAP_CONNECTION_CORNER;
            if ((neighbors[1] != 0) && (neighbors[2] != 0)) {
                direction = 3;
            }
            if ((neighbors[2] != 0) && (neighbors[3] != 0)) {
                direction = 2;
            }
            if ((neighbors[3] != 0) && (neighbors[0] != 0)) {
                direction = 1;
            }
            if ((neighbors[0] != 0) && (neighbors[1] != 0)) {
                direction = 0;
            }
        }
    }
    if (count == 1) {
        shape = MAP_CONNECTION_END;
        if (neighbors[0] != 0) {
            direction = 2;
        }
        if (neighbors[1] != 0) {
            direction = 1;
        }
        if (neighbors[2] != 0) {
            direction = 0;
        }
        if (neighbors[3] != 0) {
            direction = 3;
        }
    }
    if (count == 0) {
        shape = MAP_CONNECTION_ISOLATED;
    }
    if (shape < 0) {
        return -1;
    }
    shape = (shape << 4) & 0xFF0;
    return shape | (direction & 0xF);
}

int CEditArea::SetRoadParts(int x, int y) {
    int neighbors[4];
    int count;
    int shape;
    int direction;
    int i;

    if ((x < 0) || (x >= this->width)) {
        return -1;
    }
    if ((y < 0) || (y >= this->height)) {
        return -1;
    }
    if (GetPartsExtra(x, y) != MAP_CONNECTION_ROAD) {
        return -1;
    }
    neighbors[0] = GetPartsExtra(x, y - 1) == MAP_CONNECTION_ROAD;
    neighbors[1] = GetPartsExtra(x + 1, y) == MAP_CONNECTION_ROAD;
    neighbors[2] = GetPartsExtra(x, y + 1) == MAP_CONNECTION_ROAD;
    neighbors[3] = GetPartsExtra(x - 1, y) == MAP_CONNECTION_ROAD;
    count = 0;
    for (i = 0; i < 4; i++) {
        count += neighbors[i];
    }
    shape = -1;
    direction = 0;
    if (count == 4) {
        shape = MAP_CONNECTION_FOUR_WAY;
    }
    if (count == 3) {
        shape = MAP_CONNECTION_THREE_WAY;
        if (neighbors[0] == 0) {
            direction = 0;
        }
        if (neighbors[1] == 0) {
            direction = 3;
        }
        if (neighbors[2] == 0) {
            direction = 2;
        }
        if (neighbors[3] == 0) {
            direction = 1;
        }
    }
    if (count == 2) {
        if (((neighbors[0] != 0) && (neighbors[2] != 0)) || ((neighbors[1] != 0) && (neighbors[3] != 0))) {
            shape = MAP_CONNECTION_STRAIGHT;
            if (neighbors[0] != 0) {
                direction = 0;
            }
            if (neighbors[1] != 0) {
                direction = 1;
            }
        } else {
            shape = MAP_CONNECTION_CORNER;
            if ((neighbors[1] != 0) && (neighbors[2] != 0)) {
                direction = 0;
            }
            if ((neighbors[2] != 0) && (neighbors[3] != 0)) {
                direction = 3;
            }
            if ((neighbors[3] != 0) && (neighbors[0] != 0)) {
                direction = 2;
            }
            if ((neighbors[0] != 0) && (neighbors[1] != 0)) {
                direction = 1;
            }
        }
    }
    if (count == 1) {
        shape = MAP_CONNECTION_END;
        if (neighbors[0] != 0) {
            direction = 2;
        }
        if (neighbors[1] != 0) {
            direction = 1;
        }
        if (neighbors[2] != 0) {
            direction = 0;
        }
        if (neighbors[3] != 0) {
            direction = 3;
        }
    }
    if (count == 0) {
        shape = MAP_CONNECTION_ISOLATED;
    }
    if (shape < 0) {
        return -1;
    }
    shape = (shape << 4) & 0xFF0;
    return shape | (direction & 0xF);
}

int CEditArea::SearchPartsID(float x, float y, float z) {
    CVector3_i_ position;
    GetPos(&position, x, y, z);
    return grid[position.x][position.z].parts_id;
}

int CEditArea::SearchPartsExtra(float x, float y, float z) {
    CVector3_i_ position;
    GetPos(&position, x, y, z);
    return GetPartsExtra(position.x, position.z);
}

void CEditArea::GetGrid(CVector3_f_ *position, float x, float y, float z) {
    CVector3_i_ grid_position;
    GetPos(&grid_position, x, y, z);
    GetPos(position, grid_position.x, grid_position.y, grid_position.z);
}
#ifdef NON_MATCHING
void CEditArea::RemakeGrid() {
    if (this->grid_frame == NULL) {
        return;
    }
    CVisualVu1 *visual = this->grid_frame->GetVisual();
    if (visual == NULL) {
        return;
    }
    unsigned int *mdt = visual->GetMDTDataAddress();
    if (mdt == NULL) {
        return;
    }
    sceVu0FVECTOR *vertex = (sceVu0FVECTOR *) ((char *) mdt + mdt[4]);
    for (int x = 0; x < this->width; x++) {
        for (int y = 0; y < this->height; y++) {
            int index = (x + y * this->width) * 4;
            if (GetCode(x, y) == 0x81) {
                sceVu0CopyVector(vertex[index + 1], vertex[index]);
                sceVu0CopyVector(vertex[index + 2], vertex[index]);
                sceVu0CopyVector(vertex[index + 3], vertex[index]);
            } else {
                float *corner = vertex[index];
                corner[4] = 1.002f * this->unit_size + corner[0];
                corner[6] = corner[2];
                corner[8] = corner[0];
                corner[10] = 1.002f * this->unit_size + corner[2];
                corner[12] = 1.002f * this->unit_size + corner[0];
                corner[14] = 1.002f * this->unit_size + corner[2];
            }
        }
    }
    this->grid_frame->attr.unk_0A = 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editarea", RemakeGrid__9CEditAreaFv);
#endif

void CEditArea::GetPartsBox(CBoxVu0 *box) {
    memcpy(box, &this->parts_box, sizeof(CBoxVu0));
}

void CEditArea::MakePartsBox() {
    CVector3_f_ position;
    int min_x = 0;
    int max_x = 0;
    int max_z = 0;
    int min_z = 0;
    for (int x = 0; x < width; x++) {
        for (int z = 0; z < height; z++) {
            if (grid[x][z].parts_no >= 0 && grid[x][z].parts_id >= 0) {
                if (max_x < x)
                    max_x = x;
                if (max_z < z)
                    max_z = z;
                if (min_x > x)
                    max_x = x;
                if (z < min_z)
                    min_z = z;
            }
        }
    }
    GetPos(&position, max_x, 0, max_z);
    parts_box.max[0] = position.x + unit_size;
    parts_box.max[1] = position.y;
    parts_box.max[2] = position.z + unit_size;
    parts_box.max[3] = 1.0f;
    GetPos(&position, 0, 0, min_z);
    parts_box.min[0] = position.x;
    parts_box.min[1] = position.y;
    parts_box.min[2] = position.z;
    parts_box.min[3] = 1.0f;
}

int CEditArea::CheckArea(float x, float, float z) {
    if (x < offset_x) {
        return 0;
    }
    if (z < offset_z) {
        return 0;
    }
    if (x > offset_x + unit_size * static_cast<float>(width)) {
        return 0;
    }
    if (z > offset_z + unit_size * static_cast<float>(height)) {
        return 0;
    }
    return 1;
}
#ifdef NON_MATCHING
int CEditArea::CheckAreaRect(float x, float y, float z, int rect_width, int rect_height) {
    CVector3_i_ position;
    GetPos(&position, x, y, z);
    int left = position.x - (rect_width >> 1);
    int top = position.z - (rect_height >> 1);
    if (left < 0 || top < 0) {
        return 0;
    }
    if ((rect_width + left - 1) >= this->width || (rect_height + top - 1) >= this->height) {
        return 0;
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editarea", CheckAreaRect__9CEditAreaFfffii);
#endif
int CEditArea::CheckParts(CMapParts *parts, float x, float y, float z, int rotation) {
    if (parts->info == NULL) {
        return 0;
    }
    CVector3_i_ position;
    GetPos(&position, x, y, z);
    if (parts->subtype == 5) {
        if (GetPartsExtra(position.x, position.z) != 2) {
            return 0;
        }
        return 1;
    }
    parts->SetRotY(rotation);
    int i;
    int j;
    int part_width = parts->GetWidth();
    int part_height = parts->GetHeight();
    for (i = 0; i < part_width; i++) {
        for (j = 0; j < part_height; j++) {
            int half_width = part_width >> 1;
            int cell_x = i + (position.x - half_width);
            int half_height = part_height >> 1;
            int cell_y = j + (position.z - half_height);
            if (cell_x < 0 || cell_x >= this->width) {
                return 0;
            }
            if (cell_y < 0 || cell_y >= this->height) {
                return 0;
            }
            s16 info = parts->GetInfoData(i, j);
            if (info != 0) {
                int neighbor_parts_no = grid[cell_x][cell_y].parts_no;
                int extra = GetPartsExtra(cell_x, cell_y);
                if ((parts->subtype == 1 || extra != 1) && neighbor_parts_no >= 0) {
                    return 0;
                }
            }
        }
    }
    if (parts->subtype == 2) {
        if (GetAlt_i(position.x, position.z) > 0) {
            return 0;
        }
        int neighbors[4];
        neighbors[0] = GetPartsExtra(position.x + 1, position.z);
        neighbors[1] = GetPartsExtra(position.x - 1, position.z);
        neighbors[2] = GetPartsExtra(position.x, position.z - 1);
        neighbors[3] = GetPartsExtra(position.x, position.z + 1);
        for (int i = 0; i < 4; i++) {
            int extra = neighbors[i];
            if (extra == 3) {
                return 0;
            }
            if (extra == 4) {
                return 0;
            }
            if (extra == 5) {
                return 0;
            }
            if (extra == 5) {
                return 0;
            }
        }
    }
    if (parts->subtype == 4) {
        if (GetAlt_i(position.x, position.z) > 0) {
            return 0;
        }
        for (int i = -1; i < part_width + 1; i++) {
            for (int j = -1; j < part_height + 1; j++) {
                int half_width = part_width >> 1;
                int cell_x = i + (position.x - half_width);
                int extra = GetPartsExtra(cell_x, j + (position.z - (part_height >> 1)));
                if (extra == 3) {
                    return 0;
                }
                if (extra == 2) {
                    return 0;
                }
                if (extra == 5) {
                    return 0;
                }
            }
        }
    }
    return 1;
}

int CEditArea::PickUpPoly(CCPoly *polygons, float x, float y, float z) {
    CVector3_i_ position;
    if (CheckArea(x, y, z) == 0) {
        return 0;
    }
    GetPos(&position, x, y, z);
    CRect_i_ rect(position.x - 1, position.z - 1, 2, 2);
    return PickUpPoly(polygons, rect);
}
#ifdef NON_MATCHING
int CEditArea::PickUpPoly(CCPoly *polygons, CRect_i_ rect) {
    static int sound[5] = {0, 1, 0, 14, 2};
    CVector3_f_ position;
    sceVu0FVECTOR corner0;
    sceVu0FVECTOR corner1;
    sceVu0FVECTOR corner2;
    sceVu0FVECTOR corner3;
    sceVu0FVECTOR normal;
    CCPolyInfo info;
    CCPoly *poly = polygons;
    int count = 0;

    for (int x = rect.x; x < rect.x + rect.width; x++) {
        for (int y = rect.y; y < rect.y + rect.height; y++) {
            if (x >= 0 && x < this->width && y >= 0 && y < this->height && GetCode(x, y) != 0x81) {
                GetPos(&position, x, 0, y);
                memset(&info, 0, sizeof(info));
                ((s16 *) &info)[1] = sound[this->map_no];
                corner0[0] = position.x - 0.01f * this->unit_size;
                corner0[1] = position.y;
                corner0[2] = position.z - 0.01f * this->unit_size;
                corner0[3] = 1.0f;
                sceVu0CopyVector(corner1, corner0);
                sceVu0CopyVector(corner2, corner0);
                sceVu0CopyVector(corner3, corner0);
                corner1[0] = 0.02f * this->unit_size + (corner0[0] + this->unit_size);
                corner2[2] = 0.02f * this->unit_size + (corner0[2] + this->unit_size);
                corner3[0] = 0.02f * this->unit_size + (corner0[0] + this->unit_size);
                corner3[2] = 0.02f * this->unit_size + (corner0[2] + this->unit_size);
                normal[0] = 0.0f;
                normal[1] = 1.0f;
                normal[2] = 0.0f;
                normal[3] = 0.0f;
                sceVu0CopyVector(poly[0].vertex[0], corner0);
                sceVu0CopyVector(poly[0].vertex[1], corner1);
                sceVu0CopyVector(poly[0].vertex[2], corner2);
                sceVu0CopyVector(poly[0].normal, normal);
                poly[0].info = info;
                sceVu0CopyVector(poly[1].vertex[0], corner2);
                sceVu0CopyVector(poly[1].vertex[1], corner1);
                sceVu0CopyVector(poly[1].vertex[2], corner3);
                sceVu0CopyVector(poly[1].normal, normal);
                poly[1].info = info;
                poly += 2;
                count += 2;
            }
        }
    }
    return count;
}
#else
INCLUDE_ASM("asm/nonmatchings/editarea", PickUpPoly__9CEditAreaFP6CCPoly8CRect_i_);
#endif

int CEditArea::PickUpPoly(CCPoly *polygons, CBoxVu0 box) {
    int left, top;
    CVector3_i_ position;
    GetPos(&position, box.min[0], box.min[1], box.min[2]);
    left = position.x;
    top = position.z;
    GetPos(&position, box.max[0], box.max[1], box.max[2]);
    int right = position.x;
    int bottom = position.z;
    CRect_i_ rect;
    rect.x = left - 1;
    rect.y = top - 1;
    rect.width = right - left + 2;
    rect.height = bottom - top + 2;
    return PickUpPoly(polygons, rect);
}

int CEditArea::GetPartsRect(CRect_i_ &rect, int *parts_ids, int max_parts) {
    int x, y;
    int count = 0;
    for (x = rect.x; x < rect.x + rect.width; x++) {
        for (y = rect.y; y < rect.y + rect.height; y++) {
            if (count >= max_parts)
                break;
            int parts_id = GetPartsID(x, y);
            if (parts_id >= 0) {
                if (count == 0) {
                    parts_ids[count++] = parts_id;
                } else {
                    int found = 0;
                    for (int i = 0; i < count; i++) {
                        if (parts_id == parts_ids[i])
                            found = 1;
                    }
                    if (!found)
                        parts_ids[count++] = parts_id;
                }
            }
        }
    }
    return count;
}

void CEditArea::ChainWorkClear(void) {
    for (int x = 0; x < 16; x++) {
        for (int y = 0; y < 16; y++) {
            chain_work[x][y] = 0;
        }
    }
}

int CEditArea::CheckRiverChain(int x, int y, int target_x, int target_y) {
    if (x < 0 || y < 0 || x >= 16 || y >= 16) {
        return 0;
    }
    if (chain_work[x][y] != 0) {
        return 0;
    }
    chain_work[x][y] = 1;
    static int ext = 0;
    ext = GetPartsExtra(x, y);
    if (ext != MAP_CONNECTION_RIVER && ext != 3 && ext != 5) {
        return 0;
    }
    if (x == target_x && y == target_y) {
        return 1;
    }
    if (CheckRiverChain(x - 1, y, target_x, target_y)) {
        return 1;
    }
    if (CheckRiverChain(x + 1, y, target_x, target_y)) {
        return 1;
    }
    if (CheckRiverChain(x, y - 1, target_x, target_y)) {
        return 1;
    }
    return CheckRiverChain(x, y + 1, target_x, target_y) ? 1 : 0;
}

void CEditArea::DrawGrid(void) {
    sceVu0FVECTOR position;

    grid_redraw_count--;
    if (grid_redraw != 0) {
        grid_redraw_count = 2;
    }
    if (grid_redraw_count > 0) {
        RemakeGrid();
        if (grid_frame != NULL) {
            grid_frame->attr.unk_30 = 0;
        }
    } else {
        if (grid_frame != NULL) {
            grid_frame->attr.unk_30 = 1;
        }
    }
    grid_redraw = 0;
    if (grid_redraw_count < 0) {
        grid_redraw_count = 0;
    }
    position[0] = offset_x;
    position[1] = offset_y;
    position[2] = offset_z;
    grid_frame->SetPosition(position);
    MGDraw(grid_frame);
}

void CEditArea::Clear(void) {
    for (int x = 0; x < width; x++) {
        for (int y = 0; y < height; y++) {
            grid[x][y].parts_no = -1;
            grid[x][y].altitude = 0;
            grid[x][y].unk_08 = 0;
            grid[x][y].parts_id = -1;
            grid[x][y].code = -1;
            grid[x][y].parts_extra = -1;
            grid[x][y].unk_18 = -1;
        }
    }
    grid_redraw = 1;
    grid_redraw_count = 4;
}

void CEditArea::Initialize() {
    float zero = 0.0f;
    SetOffset(zero, zero, zero);
    SetSize(16, 16, 1.0f, 1.0f);
    grid_frame = NULL;
    Clear();
    map_no = 0;
    area_id = 0;
}

void CEditArea::SetMapInfo(s32 map_no, s32 area_id) {
    this->map_no = map_no;
    this->area_id = area_id;
}

int CEditArea::GetMapNo() {
    return this->map_no;
}

int CEditArea::GetAreaID() {
    return this->area_id;
}

void CEditArea::SetGridFrame(CFrameVu1 *frame) {
    this->grid_frame = frame;
}

CFrameVu1 *CEditArea::GetGridFrame() {
    return this->grid_frame;
}

void CEditArea::SetOffset(float x, float y, float z) {
    this->offset_x = x;
    this->offset_y = y;
    this->offset_z = z;
}

void CEditArea::GetOffset(float *offset) {
    offset[0] = offset_x;
    offset[1] = offset_y;
    offset[2] = offset_z;
}

int CEditArea::GetWidth() {
    return this->width;
}

int CEditArea::GetHeight() {
    return this->height;
}

void CEditArea::AddAlt(int x, int y, int altitude_delta) {
    SetAlt(x, y, GetAlt_i(x, y) + altitude_delta);
}

float CEditArea::GetUnitSize() {
    return this->unit_size;
}

float CEditArea::GetUnitAlt() {
    return this->unit_alt;
}

CEditArea::CEditArea(void) {
    Initialize();
}
