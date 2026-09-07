#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 199

#include <eekernel.h>
#include <libvu0.h>

#include <cstdio>
#include <cstring>

#include "boxvu0.hpp"
#include "collisionmdt.hpp"
#include "dataalloc.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "mathutil.hpp"
#include "mds.hpp"
#include "mdt.hpp"
#include "visual.hpp"

void CCollisionMDT::Initialize(void) {
    data = 0;
    mesh = 0;
    num = 0;
}

INCLUDE_RODATA("asm/nonmatchings/dataset", @199);

INCLUDE_ASM("asm/nonmatchings/dataset", InitializeDataBuffer__Fv);
INCLUDE_ASM("asm/nonmatchings/dataset", SetDataBuffer__FP14CDataAlloc2_1_i);
INCLUDE_ASM("asm/nonmatchings/dataset", SetPacketReadBuffer__Fii);
INCLUDE_ASM("asm/nonmatchings/dataset", BufferAllClear__Fv);

static int htoi(char *s) {
    char *p;
    int len;
    int value;
    int i;
    int mult;
    int c;
    int digit;

    p = s;
    len = 0;
    value = 0;
    while (*p++ != '\0')
        len++;
    mult = 1;
    for (i = 0; i < len; i++) {
        c = (unsigned char) s[len - i - 1];
        digit = 0;
        if (c >= '0' && c <= '9')
            digit = c - '0';
        if (c >= 'a' && c <= 'f')
            digit = c - 'a' + 10;
        if (c >= 'A' && c <= 'F')
            digit = c - 'A' + 10;
        value += digit * mult;
        mult <<= 4;
    }
    return value;
}

void SetFrameAttr(CFrame *frame, int children) {
    int found;
    char *p;
    char pair[3];
    CFrame *child;

    frame->attr.unk_08 = 1;
    frame->attr.unk_04 = 150.0f;
    found = 1;
    p = frame->name;
    if (*p == '\0')
        found = 0;
    p++;
    for (;;) {
        if (*p == '\0') {
            found = 0;
            break;
        }
        if (*p == '_' && p[-1] == '_')
            break;
        p++;
    }
    while (found) {
        if (*p == '\0')
            break;
        switch (*p) {
            case 'c':
            case 'C':
                frame->attr.unk_14 = 1;
                frame->attr.color[0] = 128.0f;
                frame->attr.color[1] = 128.0f;
                frame->attr.color[2] = 128.0f;
                frame->attr.color[3] = 128.0f;
                break;
            case 'n':
            case 'N':
                frame->attr.unk_08 = 0;
                break;
            case 'a':
            case 'A':
                pair[0] = p[1];
                p += 2;
                pair[1] = *p;
                pair[2] = '\0';
                if (pair[0] >= 'a' && pair[0] <= 'z')
                    pair[0] -= 32;
                if (pair[1] >= 'a' && pair[1] <= 'z')
                    pair[1] -= 32;
                if (pair[0] == 'P' && pair[1] == 'P')
                    frame->attr.unk_52 = 1;
                else if (pair[0] == 'N' && pair[1] == 'N')
                    frame->attr.unk_52 = -1;
                else
                    frame->attr.unk_50 = htoi(pair);
                break;
            case 'z':
            case 'Z':
                frame->attr.unk_54 = 0;
                break;
            case 'f':
            case 'F':
                frame->attr.unk_0C = 0;
                break;
            case 's':
            case 'S':
                frame->attr.unk_0B = 1;
                break;
            case 'm':
            case 'M':
                frame->attr.unk_56 = 1;
                break;
            case 'b':
            case 'B':
                p++;
                if (*p == '\0') {
                    p--;
                    break;
                }
                if (*p == 'Y' || *p == 'y')
                    frame->attr.unk_58 = 2;
                if (*p == 'A' || *p == 'a')
                    frame->attr.unk_58 = 3;
                break;
            case 't':
            case 'T':
                frame->attr.unk_31 = 1;
                break;
            case 'o':
            case 'O':
                frame->attr.unk_55 = 1;
                break;
            case 'v':
            case 'V':
                frame->attr.draw_on = 2;
                frame->flags = 2;
                break;
        }
        p++;
    }
    if (children) {
        for (child = frame->child; child != 0; child = child->brother) {
            SetFrameAttr(child, children);
        }
    }
}

int dset_mds_packet;
int dset_mds_objnum;

/* One edge of a shadow model while the pairing pass is running. The pass is over pairs, so an edge
   already matched is skipped rather than removed, and the pointer is where the answer is written
   back into the model itself. */
struct SHADOW_EDGE {
    short v0;
    short v1;
    short done;
    int *edge;
};

static void ArrangeShadowMDT(u_int *data);
static void CreateBBox(CBox3<float> *box, sceVu0FVECTOR *vertex, int num);

/* A scene file turned into frames. Every object of the file gets one, in the file's own order, so
   that a parent index is an index into the array being built; an object whose name marks it as a
   locator gets a frame and nothing else. */
FUZZY_MATCH("asm/matchings/dataset", LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc)
CFrameVu1 *LoadMDSFile(u_int *data, CDataAlloc2<1> *alloc, int attr, char **name0, char **name1) {
    /* Declared in this order because it is what lays them out in small data, and every reference
       to either is a displacement off $gp that the order decides. */
    static int flag;
    static char init;

    u_int i;
    char **name;
    char **name2;
    float sx;
    float sy;
    float sz;
    float rx;
    float ry;
    float rz;
    MDS_HEADER *head;
    MDS_OBJECT *self;
    CFrameVu1 *node;
    CFrameVu1 *frame;
    CVisualMDTVu1 *visual;
    u_long128 *block;
    float *box[2];
    sceVu0FMATRIX matrix;
    int j;
    int k;
    int save;

    if (!data) {
        return 0;
    }

    /* The file is read into place by whoever loaded it and everything inside is addressed as
       quadwords from its front, so a misaligned block would mislay all of it. */
    if ((int) data % 16) {
        printf("address error!! %d \n", data);
    }
    FlushCache(0);

    if (!init) {
        flag = 0;
        init = 1;
    }

    head = (MDS_HEADER *) data;
    data += sizeof(MDS_HEADER) / sizeof(u_int);

    dset_mds_packet = 0;
    dset_mds_objnum = head->object_num;

    block = (u_long128 *) alloc->Alloc(head->object_num * sizeof(CFrameVu1) / 16);
    frame = new (block) CFrameVu1[head->object_num];

    for (i = 0; i < head->object_num; i++) {
        self = (MDS_OBJECT *) data;
        data += sizeof(MDS_OBJECT) / sizeof(u_int);

        if (memcmp(self->name, "func_", 5) == 0) {
            continue;
        }

        node = &frame[i];
        node->Initialize();
        sz = sy = sx = 1.0f;
        node->SetScale(sx, sy, sz);
        rx = ry = rz = 0.0f;
        node->SetRotation(rx, ry, rz);
        node->SetPosition(0.0f, 0.0f, 0.0f);

        for (j = 0; j < 4; j++) {
            for (k = 0; k < 4; k++) {
                matrix[k][j] = self->matrix[k][j];
            }
        }

        strcpy(node->name, self->name);
        node->SetTransMatrix(matrix);
        SetFrameAttr(node, 0);

        if (self->parent < 0) {
            node->SetParent(0);
        } else {
            node->SetParent(&frame[self->parent]);
        }

        if (self->data_ofs) {
            MDT_HEADER *model = (MDT_HEADER *) ((char *) head + self->data_ofs);

            sceVu0FVECTOR *vertex = (sceVu0FVECTOR *) ((char *) model + model->vertex_ofs);
            int vertex_num = model->vertex_num;

            CreateBBox((CBox3<float> *) node->max, vertex, vertex_num);

            box[0] = node->min;
            box[1] = node->max;
            for (j = 0; j < 8; j++) {
                node->corner[j][3] = 1.0f;
                node->corner[j][0] = box[(j & 1) != 0][0];
                node->corner[j][1] = box[(j & 2) != 0][1];
                node->corner[j][2] = box[(j & 4) != 0][2];
            }

            save = attr;
            name = name0;
            if (name) {
                while (*name) {
                    if (FrameNameComp(node->name, *name)) {
                        attr |= 2;
                        attr |= 4;
                        break;
                    }
                    name++;
                }
            }
            name2 = name1;
            if (name2) {
                while (*name2) {
                    if (FrameNameComp(node->name, *name2)) {
                        attr |= 2;
                        break;
                    }
                    name2++;
                }
            }

            visual = CreateVisual((u_int *) ((char *) head + self->data_ofs), alloc, attr);
            if (attr & 2) {
                node->SetVisual(visual);
            } else {
                node->SetVisual(visual);
            }
            attr = save;
        }
    }

    flag = 1;
    return frame;
}

/* One model file turned into the object that draws it. Which of the three kinds it becomes is the
   attribute's business, and so is whether the model file is kept beside the built block and whether
   a second block is built so that the drawing has two to alternate between. */
CVisualMDTVu1 *CreateVisual(u_int *data, CDataAlloc2<1> *alloc, int attr) {
    CVisualMDTVu1 *visual;
    u_int *copy;

    if (!data) {
        return 0;
    }

    if (attr & 2) {
        if (attr & 8) {
            visual = new ((u_long128 *) alloc->Alloc(3)) CVisualShadow;
        } else {
            visual = new ((u_long128 *) alloc->Alloc(3)) CVisualMDTVu1;
        }
    } else {
        if (attr & 8) {
            visual = new ((u_long128 *) alloc->Alloc(3)) CVisualShadow;
        } else {
            visual = (CVisualMDTVu1 *) new ((u_long128 *) alloc->Alloc(2)) CVisualVu1;
        }
    }

    visual->Initialize();
    alloc->Align64();

    /* The block is written where the allocator would hand out next and reserved afterwards, since
       only the visual knows how much of it the model needed. */
    if (attr & 8) {
        ((CVisualShadow *) visual)
            ->CreateVUdataShadow((u_int *) (alloc->base + alloc->used * 16), data);
        visual->vu_data0 = visual->vu_data;
        visual->vu_data1 = visual->vu_data;
        ArrangeShadowMDT(data);
    } else {
        visual->CreateVUdataFromMDT((u_int *) (alloc->base + alloc->used * 16), data, 0, 0);
    }

    alloc->Alloc(visual->vu_size);
    dset_mds_packet += visual->vu_size;
    alloc->Align64();

    if (attr & 2) {
        alloc->Align64();
        copy = (u_int *) alloc->Alloc((((MDT_HEADER *) data)->size >> 4) + 1);
        memcpy(copy, data, ((MDT_HEADER *) data)->size);
        if (attr & 2) {
            visual->SetMDTDataAddress(copy);
        }

        if (attr & 0x10) {
            visual->unk_00 = 1;
        }

        if ((attr & 4) && !(attr & 0x10)) {
            alloc->Align64();
            if (attr & 8) {
                visual->vu_data0 = visual->vu_data;
                ((CVisualShadow *) visual)
                    ->CreateVUdataShadow((u_int *) (alloc->base + alloc->used * 16), data);
            } else {
                visual->vu_data0 = visual->vu_data;
                visual->CreateVUdataFromMDT(
                    (u_int *) (alloc->base + alloc->used * 16), data, 0, 0);
            }
            alloc->Alloc(visual->vu_size);
            visual->vu_data1 = visual->vu_data;
        } else {
            visual->vu_data0 = visual->vu_data;
            visual->vu_data1 = visual->vu_data;
        }
    }

    alloc->Align64();
    return visual;
}

/* Which of a shadow model's edges lie on its silhouette, decided once here rather than per frame.
   Every edge of every triangle is listed with the plane normal of the triangle it came from; two
   edges that are the same pair of corners in opposite order belong to the two triangles that share
   them, and if those two face nearly the same way the edge is interior and is switched off in the
   model itself. What is left switched on is the outline. */
static void ArrangeShadowMDT(u_int *data) {
    SHADOW_EDGE edge[1024];
    sceVu0FVECTOR normal[1024];
    sceVu0FVECTOR edge0;
    sceVu0FVECTOR edge1;
    sceVu0FVECTOR face;

    sceVu0FVECTOR *vertex;
    MDT_HEADER *model;
    MDT_SHADOW *mesh;
    MDT_SSHAPE *shape;
    int num;
    int i;
    int j;
    MDT_SVERTEX *corner;
    int shape_num;
    int count;
    int k;
    int m;

    model = (MDT_HEADER *) data;
    mesh = (MDT_SHADOW *) ((char *) model + model->mesh_ofs);
    vertex = (sceVu0FVECTOR *) ((char *) model + model->vertex_ofs);

    shape_num = mesh->shape_num;
    shape = mesh->shape;
    num = 0;
    for (i = 0; i < shape_num; i++) {
        count = shape->index_num;
        corner = shape->vertex;

        for (j = 0; j < count / 3; j++) {
            sceVu0SubVector(edge0, vertex[corner[1].index], vertex[corner[0].index]);
            sceVu0SubVector(edge1, vertex[corner[2].index], vertex[corner[0].index]);
            sceVu0OuterProduct(face, edge0, edge1);
            sceVu0Normalize(normal[num], face);
            sceVu0CopyVector(normal[num + 1], normal[num]);
            sceVu0CopyVector(normal[num + 2], normal[num]);

            edge[num].v0 = corner[0].index;
            edge[num].v1 = corner[1].index;
            edge[num].done = 0;
            edge[num].edge = &corner[0].edge;
            corner[0].edge = 0;
            num++;

            edge[num].v0 = corner[1].index;
            edge[num].v1 = corner[2].index;
            edge[num].done = 0;
            edge[num].edge = &corner[1].edge;
            corner[1].edge = 0;
            num++;

            edge[num].v0 = corner[2].index;
            edge[num].v1 = corner[0].index;
            edge[num].done = 0;
            edge[num].edge = &corner[2].edge;
            corner[2].edge = 0;
            num++;
            if (num > 1020) {
                printf("shadow initialize failed\n");
                while (1)
                    ;
            }
            corner += 3;
        }

        shape = (MDT_SSHAPE *) corner;
    }

    for (k = 0; k < num - 1; k++) {
        if (edge[k].done) {
            continue;
        }
        for (m = k + 1; m < num; m++) {
            if (edge[m].done) {
                continue;
            }
            if (edge[k].v0 != edge[m].v1) {
                continue;
            }
            if (edge[k].v1 != edge[m].v0) {
                continue;
            }
            if (DistVector(normal[k], normal[m]) < 0.0008f) {
                edge[k].done = 1;
                *edge[k].edge = 1;
                edge[m].done = 1;
                *edge[m].edge = 1;
                break;
            }
        }
    }
}

/* The four detail levels of one object, loaded as four scenes. A level the caller has no file for
   leaves a null behind rather than a scene with nothing in it. */
void LoadMDSFileLOD(CFrameVu1 **frame, u_int **data, CDataAlloc2<1> *alloc, int attr) {
    int i;

    for (i = 0; i < 4; i++) {
        if (!data[i]) {
            frame[i] = 0;
        } else {
            frame[i] = LoadMDSFile(data[i], alloc, attr, 0, 0);
        }
    }
}

/* A collision scene turned into frames. It is the scene loader with the drawing left out: the same
   file shape and the same parenting, but every object carries a shape to be asked questions of
   rather than geometry to be drawn, and nothing scales or positions a frame because the transform
   the file carries is the whole of it. */
CFrameVu1 *LoadCollisionFile(u_int *data, CDataAlloc2<1> *alloc) {
    CFrameVu1 *frame;
    u_int i;
    u_int *body;
    MDS_HEADER *head;
    MDS_OBJECT *self;
    CFrameVu1 *node;
    u_long128 *block;
    float *box[2];
    sceVu0FMATRIX matrix;
    int j;
    int k;
    int corner;

    body = data;
    head = (MDS_HEADER *) data;
    body += sizeof(MDS_HEADER) / sizeof(u_int);

    if (!((MDS_HEADER *) data)->object_num) {
        return 0;
    }

    block = (u_long128 *) alloc->Alloc(((MDS_HEADER *) data)->object_num * sizeof(CFrameVu1) / 16);
    frame = new (block) CFrameVu1[head->object_num];

    for (i = 0; i < head->object_num; i++) {
        self = (MDS_OBJECT *) body;
        body += sizeof(MDS_OBJECT) / sizeof(u_int);

        node = &frame[i];
        node->Initialize();

        for (j = 0; j < 4; j++) {
            for (k = 0; k < 4; k++) {
                matrix[k][j] = self->matrix[k][j];
            }
        }

        strcpy(node->name, self->name);
        node->SetTransMatrix(matrix);

        if (self->parent < 0) {
            node->SetParent(0);
        } else {
            node->SetParent(&frame[self->parent]);
        }

        if (self->data_ofs) {
            MDT_HEADER *model = (MDT_HEADER *) ((char *) head + self->data_ofs);

            node->SetCollision(CreateCollisionMDT((u_int *) model, alloc));
            sceVu0FVECTOR *vertex = (sceVu0FVECTOR *) ((char *) model + model->vertex_ofs);
            int vertex_num = model->vertex_num;

            CreateBBox((CBox3<float> *) node->max, vertex, vertex_num);

            box[0] = node->min;
            box[1] = node->max;
            for (corner = 0; corner < 8; corner++) {
                node->corner[corner][3] = 1.0f;
                node->corner[corner][0] = box[(corner & 1) != 0][0];
                node->corner[corner][1] = box[(corner & 2) != 0][1];
                node->corner[corner][2] = box[(corner & 4) != 0][2];
            }
        }
    }

    return frame;
}

/* One model file turned into the shape a frame answers about. The file is copied into the block
   first, because everything the collision holds points into that copy and the caller's own is not
   expected to outlive the load; the triangles are then built out of it with the bound of each
   beside it, which is what lets a box query reject one without reading a vertex. */
CCollisionMDT *CreateCollisionMDT(u_int *data, CDataAlloc2<1> *alloc) {
    u_long128 *info;
    MDT_HEADER *model;
    u_long128 *vertex;
    MDT_CPOLY *poly;
    u_int i;
    u_int num;
    CCollisionMDT *collision;
    MDT_HEADER *file;
    MDT_CPOLY_SET *set;
    CCPolyBox *built;
    int index;

    file = (MDT_HEADER *) data;
    model = (MDT_HEADER *) alloc->Alloc64((((MDT_HEADER *) data)->size >> 4) + 1);
    memcpy(model, file, file->size);

    collision = new ((u_long128 *) alloc->Alloc(4)) CCollisionMDT;
    collision->data = model;
    collision->CreateBBox();

    vertex = (u_long128 *) ((char *) model + model->vertex_ofs);
    info = (u_long128 *) ((char *) model + model->info_ofs);
    set = &((MDT_COLLISION *) ((char *) model + model->mesh_ofs))->set;
    poly = set->poly;

    built = (CCPolyBox *) alloc->Alloc(set->num * sizeof(CCPolyBox) / 16);

    for (i = 0; i < (num = set->num); i++) {
        *(u_long128 *) built[i].poly.vertex[0] = vertex[poly->vertex[0]];
        *(u_long128 *) built[i].poly.vertex[1] = vertex[poly->vertex[1]];
        *(u_long128 *) built[i].poly.vertex[2] = vertex[poly->vertex[2]];

        index = poly->unk_0c;
        if (!model->info_ofs || index < 0) {
            memset(&built[i].poly.info, 0, 16);
        } else {
            *(u_long128 *) &built[i].poly.info = info[index];
        }
        poly++;

        VectorMaxMin(built[i].box.max, built[i].box.min, built[i].poly.vertex[0],
                     built[i].poly.vertex[1], built[i].poly.vertex[2]);
        PlaneNormal(built[i].poly.normal, built[i].poly.vertex[0],
                    built[i].poly.vertex[1], built[i].poly.vertex[2]);
    }

    collision->mesh = built;
    collision->num = num;
    return collision;
}

/* A scene loaded into the allocator every scene without one of its own goes into. */
CFrameVu1 *LoadMDSFile(u_int *data, int attr, int unknown0) {
    return LoadMDSFile(data, &VisualData, attr, 0, 0);
}

/* The extent of a run of points, which is a model's bound when the points are its vertices. A model
   with no vertex array at all answers an empty bound rather than reading one. */
static void CreateBBox(CBox3<float> *box, sceVu0FVECTOR *vertex, int num) {
    int i;

    if (!vertex) {
        box->max[0] = box->min[0] = 0.0f;
        box->max[1] = box->min[1] = 0.0f;
        box->max[2] = box->min[2] = 0.0f;
        return;
    }

    box->max[0] = vertex[0][0];
    box->max[1] = vertex[0][1];
    box->max[2] = vertex[0][2];
    box->min[0] = vertex[0][0];
    box->min[1] = vertex[0][1];
    box->min[2] = vertex[0][2];

    for (i = 0; i < num; i++) {
        if (box->max[0] < vertex[0][0]) {
            box->max[0] = vertex[0][0];
        }
        if (box->max[1] < vertex[0][1]) {
            box->max[1] = vertex[0][1];
        }
        if (box->max[2] < vertex[0][2]) {
            box->max[2] = vertex[0][2];
        }
        if (box->min[0] > vertex[0][0]) {
            box->min[0] = vertex[0][0];
        }
        if (box->min[1] > vertex[0][1]) {
            box->min[1] = vertex[0][1];
        }
        if (box->min[2] > vertex[0][2]) {
            box->min[2] = vertex[0][2];
        }
        vertex++;
    }
}

/* A subtree copied into an allocator, node by node. Each copy is constructed where the allocator
   hands out next and then assigned from its original, so what a node carries travels with it and
   what ties it to its neighbours does not — the parenting is redone from the copies as the walk
   descends. */
CFrameVu1 *CopyFrameVu1(CFrameVu1 *frame, CDataAlloc2<1> *alloc) {
    CFrame *head;
    CFrame *child;
    CFrameVu1 *node;

    if (!frame) {
        return 0;
    }

    node = new ((u_long128 *) alloc->Alloc(sizeof(CFrameVu1) / 16)) CFrameVu1;
    node->Initialize();
    *node = *frame;

    head = frame->child;
    for (child = head; child; child = child->brother) {
        CopyFrameVu1((CFrameVu1 *) child, alloc)->SetParent(node);
    }
    return node;
}

/* The same over frames that draw nothing. */
CFrame *CopyFrame(CFrame *frame, CDataAlloc2<1> *alloc) {
    CFrame *head;
    CFrame *child;
    CFrame *node;

    if (!frame) {
        return 0;
    }

    node = new ((u_long128 *) alloc->Alloc(sizeof(CFrame) / 16)) CFrame;
    node->Initialize();
    *node = *frame;

    head = frame->child;
    for (child = head; child; child = child->brother) {
        CopyFrame(child, alloc)->SetParent(node);
    }
    return node;
}

void LoadLODData(CFrameVu1 **frame, char **name, u_int *data, int attr) {
}

/* A collision scene loaded into the allocator every scene without one of its own goes into. */
CFrameVu1 *LoadCollisionFile(u_int *data) {
    return LoadCollisionFile(data, &VisualData);
}

INCLUDE_ASM("asm/nonmatchings/dataset", GetPolygon__10CCollisionFiPA4_fPA4_fPA4_f);
int CCollision::GetMaxY(float *position) {
    return 0;
}
int CCollision::Intersection(float *from, float *to, float *hit) {
    return 0;
}
INCLUDE_ASM("asm/nonmatchings/dataset", PickUpNearPoly__10CCollisionFP6CCPoly);
INCLUDE_ASM("asm/nonmatchings/dataset", PickUpNearPoly__10CCollisionFP6CCPolyRC7CBoxVu0);
INCLUDE_ASM("asm/nonmatchings/dataset", PickUpNearPoly__10CCollisionFP6CCPolyPff);
void CCollision::Initialize() {
}
