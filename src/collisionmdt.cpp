#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "collisionmdt.hpp"

#include <libvu0.h>

#include "mathutil.hpp"

/* The extent of three points, which is the bound of one triangle. The unit answers both extremes
   from one pass over the pair, so this costs less than the two the library would need. The
   pointers are register variables because that is how an assembly block reaches a value the
   compiler is holding. */
static void vu_maxmin3(float *max, float *min, float *a, float *b, float *c) {
    register float *out_max = max;
    register float *out_min = min;
    register float *p0 = a;
    register float *p1 = b;
    register float *p2 = c;

    asm {
        lqc2    vf15, 0(p0)
        lqc2    vf16, 0(p1)
        lqc2    vf17, 0(p2)
        vmax    vf18, vf15, vf16
        vmini   vf20, vf15, vf16
        vmax    vf19, vf18, vf17
        vmini   vf21, vf20, vf17
        sqc2    vf19, 0(out_max)
        sqc2    vf21, 0(out_min)
    }
}

/* The plane normal of a triangle, as the outer product of two of its edges. */
static void vu_normal(float *normal, float *a, float *b, float *c) {
    register float *out = normal;
    register float *p0 = a;
    register float *p1 = b;
    register float *p2 = c;

    asm {
        lqc2    vf15, 0(p0)
        lqc2    vf16, 0(p1)
        lqc2    vf17, 0(p2)
        vsub    vf10, vf16, vf15
        vsub    vf11, vf17, vf15
        vopmula ACC, vf10, vf11
        vopmsub vf12, vf11, vf10
        sqc2    vf12, 0(out)
    }
}

/* The query bound of a box search, parked in the unit's registers once instead of being reloaded
   per triangle. */
static inline void vu_hold_box(float *max, float *min) {
    register float *p0 = max;
    register float *p1 = min;

    asm {
        lqc2    vf10, 0(p0)
        lqc2    vf11, 0(p1)
    }
}

/* Whether a triangle's own bound misses the one held above, as the two subtractions that would
   both have to come out positive for the two to overlap. Neither result is wanted — the answer is
   the unit's sticky sign and zero flags, cleared before the pair and read back after them, which
   is why the status register rather than a register file entry is what the block hands back. */
static inline int vu_box_missed(float *max, float *min) {
    register float *p0 = max;
    register float *p1 = min;
    register int status;

    asm {
        lqc2    vf12, 0(p0)
        lqc2    vf13, 0(p1)
        vnop
        vnop
        vnop
        ctc2    $0, $vi16
        vsub.xyz vf25, vf10, vf13
        vsub.xyz vf25, vf12, vf11
        vnop
        vnop
        vnop
        vnop
        vnop
        cfc2    status, $vi16
    }

    return status & 0xc0;
}

/* The bound of whatever the shape is made of, which the base can build because the vertices are
   the one thing every shape answers. A shape with no vertices leaves the bound all zero. */
void CCollision::CreateBBox() {
    int i;
    int num;
    sceVu0FVECTOR *vertex;

    vertex = GetVertexAddress(&num);
    if (vertex == 0) {
        max[0] = min[0] = 0.0f;
        max[1] = min[1] = 0.0f;
        max[2] = min[2] = 0.0f;
        return;
    }

    max[0] = vertex[0][0];
    max[1] = vertex[0][1];
    max[2] = vertex[0][2];
    min[0] = vertex[0][0];
    min[1] = vertex[0][1];
    min[2] = vertex[0][2];

    for (i = 0; i < num; i++) {
        if (max[0] < vertex[0][0]) {
            max[0] = vertex[0][0];
        }
        if (max[1] < vertex[0][1]) {
            max[1] = vertex[0][1];
        }
        if (max[2] < vertex[0][2]) {
            max[2] = vertex[0][2];
        }
        if (min[0] > vertex[0][0]) {
            min[0] = vertex[0][0];
        }
        if (min[1] > vertex[0][1]) {
            min[1] = vertex[0][1];
        }
        if (min[2] > vertex[0][2]) {
            min[2] = vertex[0][2];
        }
        vertex++;
    }
}

INCLUDE_ASM("asm/nonmatchings/collisionmdt", GetVertexAddress__10CCollisionFPi);

int CCollisionMDT::GetPolygon(int index, sceVu0FMATRIX v0, sceVu0FMATRIX v1, sceVu0FMATRIX v2) {
    MDT_COLLISION *collision;

    if (data == 0) {
        return 0;
    }

    collision = (MDT_COLLISION *) ((char *) data + data->mesh_ofs);
    if (index >= collision->set.num) {
        return 0;
    }

    return 1;
}

/* The height of the mesh under a point, as the highest triangle a vertical line meets. The line is
   spelled from y zero to y one and the intersection treats it as infinite, so nothing bounds the
   search in y. */
int CCollisionMDT::GetMaxY(float *position) {
    sceVu0FVECTOR v0;
    sceVu0FVECTOR v1;
    sceVu0FVECTOR v2;
    sceVu0FVECTOR from;
    sceVu0FVECTOR to;
    sceVu0FVECTOR hit;
    sceVu0FVECTOR normal;
    sceVu0FVECTOR max;
    sceVu0FVECTOR min;
    int i;
    int found;
    sceVu0FVECTOR *vertex;
    MDT_CPOLY_SET *set;
    MDT_CPOLY *poly;
    float y;

    found = 0;

    if (data == 0) {
        return 0;
    }

    /* An integer floor, converted rather than written as a float constant: the game spells it that
       way and the conversion is in the instruction stream. */
    y = -100000000;

    from[0] = to[0] = position[0];
    from[2] = to[2] = position[2];
    from[1] = 0.0f;
    to[1] = 1.0f;

    vertex = (sceVu0FVECTOR *) ((char *) data + data->vertex_ofs);
    set = &((MDT_COLLISION *) ((char *) data + data->mesh_ofs))->set;
    poly = set->poly;

    for (i = 0; i < set->num; i++) {
        *(u_long128 *) v0 = *(u_long128 *) vertex[poly->vertex[0]];
        *(u_long128 *) v1 = *(u_long128 *) vertex[poly->vertex[1]];
        *(u_long128 *) v2 = *(u_long128 *) vertex[poly->vertex[2]];
        poly++;

        vu_maxmin3(max, min, v0, v1, v2);

        if (position[0] < min[0] || position[0] > max[0]) {
            continue;
        }
        if (position[2] < min[2] || position[2] > max[2]) {
            continue;
        }

        vu_normal(normal, v0, v1, v2);

        if (IntersectionPoint_line_poly3(from, to, v0, v1, v2, normal, hit) == 0) {
            continue;
        }

        found = 1;
        if (y < hit[1]) {
            y = hit[1];
        }
    }

    if (found != 0) {
        position[1] = y;
    }

    return found;
}

/* The nearest point at which a line meets the mesh. Each triangle is rejected first by its own
   bound and then by the plane it lies in, and only what survives both is intersected. */
int CCollisionMDT::Intersection(float *from, float *to, float *hit) {
    sceVu0FVECTOR v0;
    sceVu0FVECTOR v1;
    sceVu0FVECTOR v2;
    sceVu0FVECTOR point;
    sceVu0FVECTOR edge0;
    sceVu0FVECTOR edge1;
    sceVu0FVECTOR normal;
    sceVu0FVECTOR max;
    sceVu0FVECTOR min;
    int i;
    int found;
    sceVu0FVECTOR *vertex;
    MDT_CPOLY_SET *set;
    MDT_CPOLY *poly;
    float plane;
    float start;
    float end;
    float best;
    float distance;
    float dx;
    float dy;
    float dz;

    found = 0;

    vertex = (sceVu0FVECTOR *) ((char *) data + data->vertex_ofs);
    set = &((MDT_COLLISION *) ((char *) data + data->mesh_ofs))->set;
    poly = set->poly;

    for (i = 0; i < set->num; i++) {
        *(u_long128 *) v0 = *(u_long128 *) vertex[poly->vertex[0]];
        *(u_long128 *) v1 = *(u_long128 *) vertex[poly->vertex[1]];
        *(u_long128 *) v2 = *(u_long128 *) vertex[poly->vertex[2]];
        poly++;

        vu_maxmin3(max, min, v0, v1, v2);

        if (from[0] < min[0] && to[0] < min[0]) {
            continue;
        }
        if (from[0] > max[0] && to[0] > max[0]) {
            continue;
        }
        /* The far endpoint is held against the x extent in y and not the y one. That is what the
           game does and what its bytes depend on, so it is what this does; the effect is a reject
           that keeps more triangles than it needs to, and nothing below trusts it on its own. */
        if (from[1] < min[1] && to[1] < min[0]) {
            continue;
        }
        if (from[1] > max[1] && to[1] > max[0]) {
            continue;
        }
        if (from[2] < min[2] && to[2] < min[2]) {
            continue;
        }
        if (from[2] > max[2] && to[2] > max[2]) {
            continue;
        }

        edge0[0] = v1[0] - v0[0];
        edge0[1] = v1[1] - v0[1];
        edge0[2] = v1[2] - v0[2];
        edge0[3] = 0.0f;
        edge1[0] = v2[0] - v0[0];
        edge1[1] = v2[1] - v0[1];
        edge1[2] = v2[2] - v0[2];
        edge1[3] = 0.0f;

        sceVu0OuterProduct(normal, edge0, edge1);
        normal[3] = 0.0f;

        plane = sceVu0InnerProduct(normal, v0);
        start = sceVu0InnerProduct(normal, from);
        end = sceVu0InnerProduct(normal, to);

        if (plane - start > 0.0f && plane - end > 0.0f) {
            continue;
        }
        if (plane - start < 0.0f && plane - end < 0.0f) {
            continue;
        }

        if (IntersectionPoint_line_poly3(from, to, v0, v1, v2, normal, point) == 0) {
            continue;
        }

        dx = point[0] - from[0];
        dy = point[1] - from[1];
        dz = point[2] - from[2];
        distance = dx * dx + dy * dy + dz * dz;

        if (found == 0) {
            best = distance;
            sceVu0CopyVector(hit, point);
            found = 1;
        } else {
            if (distance < best) {
                best = distance;
                sceVu0CopyVector(hit, point);
            }
            found = 1;
        }
    }

    return found;
}

sceVu0FVECTOR *CCollisionMDT::GetVertexAddress(int *count) {
    if (data == 0) {
        return 0;
    }

    *count = data->vertex_num;
    if (*count <= 0) {
        return 0;
    }

    return (sceVu0FVECTOR *) ((char *) data + data->vertex_ofs);
}

/* Every triangle of the mesh whose own bound reaches a cube around the point. */
int CCollisionMDT::PickUpNearPoly(CCPoly *poly, float *position, float radius) {
    sceVu0FVECTOR max;
    sceVu0FVECTOR min;
    int i;
    int num;
    sceVu0FVECTOR *vertex;
    MDT_CPOLY_SET *set;
    MDT_CPOLY *box_poly;
    CCPoly *out;
    float max_x;
    float max_y;
    float max_z;
    float min_x;
    float min_y;
    float min_z;

    out = poly;
    num = 0;

    max_x = position[0] + radius;
    max_y = position[1] + radius;
    max_z = position[2] + radius;
    min_x = position[0] - radius;
    min_y = position[1] - radius;
    min_z = position[2] - radius;

    vertex = (sceVu0FVECTOR *) ((char *) data + data->vertex_ofs);
    set = &((MDT_COLLISION *) ((char *) data + data->mesh_ofs))->set;
    box_poly = set->poly;

    for (i = 0; i < set->num; i++) {
        *(u_long128 *) out->vertex[0] = *(u_long128 *) vertex[box_poly->vertex[0]];
        *(u_long128 *) out->vertex[1] = *(u_long128 *) vertex[box_poly->vertex[1]];
        *(u_long128 *) out->vertex[2] = *(u_long128 *) vertex[box_poly->vertex[2]];
        box_poly++;

        vu_maxmin3(max, min, out->vertex[0], out->vertex[1], out->vertex[2]);

        if (min_x > max[0] || min_y > max[1] || min_z > max[2]) {
            continue;
        }
        if (max_x < min[0] || max_y < min[1] || max_z < min[2]) {
            continue;
        }

        vu_normal(out->normal, out->vertex[0], out->vertex[1], out->vertex[2]);
        out++;
        num++;
    }

    return num;
}

/* Every built triangle whose bound overlaps the one the caller gives, tested two bounds at a time
   on the unit and read back through its sticky flags rather than as a value. */
int CCollisionMDT::PickUpNearPoly(CCPoly *poly, const CBoxVu0 &box) {
    CBoxVu0 bound;
    int i;
    int num;
    CCPolyBox *box_poly;

    if (box.min[0] > max[0]) {
        return 0;
    }
    if (box.min[1] > max[1]) {
        return 0;
    }
    if (box.min[2] > max[2]) {
        return 0;
    }
    if (box.max[0] < min[0]) {
        return 0;
    }
    if (box.max[1] < min[1]) {
        return 0;
    }
    if (box.max[2] < min[2]) {
        return 0;
    }

    num = 0;

    bound.max[0] = box.max[0];
    bound.max[1] = box.max[1];
    bound.max[2] = box.max[2];
    bound.min[0] = box.min[0];
    bound.min[1] = box.min[1];
    bound.min[2] = box.min[2];

    vu_hold_box(bound.max, bound.min);

    box_poly = mesh;
    for (i = 0; i < this->num; i++, box_poly++) {
        if (vu_box_missed(box_poly->box.max, box_poly->box.min) == 0) {
            *(u_long128 *) poly->vertex[0] = *(u_long128 *) box_poly->poly.vertex[0];
            *(u_long128 *) poly->vertex[1] = *(u_long128 *) box_poly->poly.vertex[1];
            *(u_long128 *) poly->vertex[2] = *(u_long128 *) box_poly->poly.vertex[2];
            poly->info = box_poly->poly.info;
            *(u_long128 *) poly->normal = *(u_long128 *) box_poly->poly.normal;
            poly++;
            num++;
        }
    }

    return num;
}

/* The whole mesh, with no test at all. */
int CCollisionMDT::PickUpNearPoly(CCPoly *poly) {
    int i;
    int num;
    sceVu0FVECTOR *vertex;
    MDT_CPOLY_SET *set;
    MDT_CPOLY *box_poly;

    num = 0;

    vertex = (sceVu0FVECTOR *) ((char *) data + data->vertex_ofs);
    set = &((MDT_COLLISION *) ((char *) data + data->mesh_ofs))->set;
    box_poly = set->poly;

    for (i = 0; i < set->num; i++) {
        *(u_long128 *) poly->vertex[0] = *(u_long128 *) vertex[box_poly->vertex[0]];
        *(u_long128 *) poly->vertex[1] = *(u_long128 *) vertex[box_poly->vertex[1]];
        *(u_long128 *) poly->vertex[2] = *(u_long128 *) vertex[box_poly->vertex[2]];
        box_poly++;

        vu_normal(poly->normal, poly->vertex[0], poly->vertex[1], poly->vertex[2]);
        poly++;
        num++;
    }

    return num;
}
