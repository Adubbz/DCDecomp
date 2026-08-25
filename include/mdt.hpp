#pragma once

#include "common.h"

#include <libvu0.h>

/**
 * Describes the sections and vertex data of an MDT resource.
 */
struct MDT_HEADER {
    int unk_00[2];
    unsigned int size;
    int vertex_num;
    int vertex_ofs;
    int unk_14[5];
    int mesh_ofs;
    int unk_2c[3];
    int info_ofs;
};

/**
 * Stores the vector parameters and texture name for an MDT material.
 */
struct MDT_MATERIAL {
    sceVu0FVECTOR unk_00;
    sceVu0FVECTOR unk_10;
    sceVu0FVECTOR unk_20;
    int unk_30;
    char texture[44];
};

/**
 * Stores the three vertex indices of an MDT collision triangle.
 */
struct MDT_CPOLY {
    int vertex[3];
    int unk_0c;
    int unk_10;
};

/**
 * Describes the triangle array in an MDT collision mesh.
 */
struct MDT_CPOLY_SET {
    int unk_00;
    unsigned int num;
    MDT_CPOLY poly[1];
};

/**
 * Stores the collision-mesh section of an MDT resource.
 */
struct MDT_COLLISION {
    int unk_00[4];
    MDT_CPOLY_SET set;
};

/**
 * Stores a vertex reference and edge state for an MDT shadow triangle.
 */
struct MDT_SVERTEX {
    int index;
    int unk_04;
    int edge;
};

/**
 * Describes one indexed shape in an MDT shadow mesh.
 */
struct MDT_SSHAPE {
    int unk_00;
    int index_num;
    int unk_08;
    MDT_SVERTEX vertex[1];
};

/**
 * Stores the shape array in an MDT shadow-mesh section.
 */
struct MDT_SHADOW {
    int unk_00[2];
    int shape_num;
    int unk_0c;
    MDT_SSHAPE shape[1];
};
