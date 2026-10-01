#include <libvu0.h>

#include <cstring>

#include "bound.hpp"
#include "cloth.hpp"
#include "frame.hpp"
#include "stubs/cloth.hpp"
#include "vu0_ops.hpp"
#include "wind.hpp"

namespace {

void Follow(float *vertex, float *velocity, float *world_home, const float *home, const float *delta,
            const float matrix[4][4], const float *stiffness) {
    float carried[4];
    vu0::Apply(carried, matrix, home);
    vertex[3] = 1.0f;
    velocity[3] = 1.0f;
    vu0::Copy(world_home, carried);

    float force[4];
    for (int i = 0; i < 4; i++) {
        force[i] = delta[i] + (carried[i] - vertex[i]) * stiffness[i];
    }

    for (int i = 0; i < 3; i++) {
        vertex[i] = (vertex[i] + velocity[i]) + force[i];
        velocity[i] = 0.0f - force[i];
    }
}

} // namespace

void CCloth::Step(int step) {
    float        *velocity;
    int           i;
    int           j;
    int           pass;
    int           reset;
    float         ground;
    float        *vertex;
    sceVu0FVECTOR root;
    sceVu0FVECTOR delta = {0.0f, 0.0f, 0.0f, 0.0f};
    sceVu0FMATRIX matrix = {};
    sceVu0FVECTOR scratch = {};

    // Retail solves in the scratchpad: the grid, then the per-column stretch parameters, then the
    // hit point. Nothing in it outlives the call.
    sceVu0FVECTOR work[16][16] = {};
    sceVu0FVECTOR stretch_params[16] = {};
    float         hit_point[4] = {};

    if (step < 0) {
        Clear();
        return;
    }

    reset = 0;
    ground = floor_y;

    for (i = 0; i < num_i; i++) {
        for (j = 0; j < num_j; j++) {
            vu0::Copy(work[i][j], point[i][j]);
        }
    }

    if (frame != NULL) {
        frame->GetLWMatrix(matrix);
        sceVu0ApplyMatrix(root, matrix, this->position);
        sceVu0SubVector(delta, root, last_position);

        if (vuabs(delta) > 10.0f || stop != 0) {
            reset = 1;
        } else {
            delta[0] *= follow[0];
            delta[1] *= follow[1];
            delta[2] *= follow[2];
        }

        last_position[0] = root[0];
        last_position[1] = root[1];
        last_position[2] = root[2];
    }

    float stiffness_held[4];
    vu0::Copy(stiffness_held, stiffness);

    for (j = 0; j < num_j; j++) {
        for (i = 0; i < num_i; i++) {
            vertex = work[i][j];
            velocity = speed[i][j];

            if (reset != 0) {
                vertex[0] += delta[0];
                vertex[1] += delta[1];
                vertex[2] += delta[2];
            } else if (frame != NULL) {
                Follow(vertex, velocity, world_home[i][j], home[i][j], delta, matrix, stiffness_held);
            } else {
                vertex[0] += velocity[0];
                vertex[1] += velocity[1];
                vertex[2] += velocity[2];
            }
        }
    }

    scratch[1] = 0.5f;
    scratch[2] = 0.5f;

    for (j = 0; j < num_j - 1; j++) {
        stretch_params[j][1] = 0.3f + 0.2f * ((float) j / (float) num_j);
        stretch_params[j][2] = 1.0f - stretch_params[j][1];
    }

    for (pass = 0; pass < 4 && reset == 0; pass++) {
        for (j = 0; j < num_j - 1; j++) {
            for (i = 0; i < num_i; i++) {
                if (i > 1) {
                    scratch[0] = 2.0f * rest[i][j][0];
                    StretchBind2(work[i][j], work[i - 2][j], scratch);
                } else {
                    scratch[0] = 0.0f;
                }

                stretch_params[j][0] = rest[i][j][1];
                StretchBind2(work[i][j], work[i][j + 1], stretch_params[j]);
            }
        }

        for (j = 0; j < num_i; j++) {
            if (frame == NULL) {
                sceVu0CopyVector(work[j][0], home[j][0]);
            } else {
                vu0::Copy(work[j][0], world_home[j][0]);
            }
        }
    }

    if (bound != NULL) {
        bound->UpDate();
    }

    for (j = 1; j < num_j; j++) {
        for (i = 0; i < num_i; i++) {
            CBound       *box = bound;
            int           touched = 0;
            float         hit_count = 0.0f;
            sceVu0FVECTOR hit_sum;
            hit_sum[2] = 0.0f;
            hit_sum[1] = 0.0f;
            hit_sum[0] = 0.0f;
            float friction = 0.0f;

            for (; box != NULL; box = box->next) {
                if ((mask[i][j] & (1 << box->mask_bit)) && box->InCheck(work[i][j], hit_point) != 0) {
                    hit_count += 1.0f;
                    sceVu0AddVector(hit_sum, hit_sum, hit_point);
                    friction += box->friction;
                    touched = 1;
                }
            }

            if (touched) {
                work[i][j][0] = hit_sum[0] / hit_count;
                work[i][j][1] = hit_sum[1] / hit_count;
                work[i][j][2] = hit_sum[2] / hit_count;
                rest[i][j][3] = friction / hit_count;
            } else {
                rest[i][j][3] = -1.0f;
            }
        }
    }

    sceVu0FVECTOR wind_force = {0.0f, 0.0f, 0.0f, 0.0f};

    for (i = 0; i < num_i; i++) {
        if (wind != NULL) {
            ((CWind *) wind)->GetWindNoise(wind_force);
            sceVu0ScaleVector(wind_force, wind_force, wind_effect);
        }

        for (j = 0; j < num_j; j++) {
            speed[i][j][0] += gravity[0] + (work[i][j][0] - last[i][j][0]);
            speed[i][j][1] += gravity[1] + (work[i][j][1] - last[i][j][1]);
            speed[i][j][2] += gravity[2] + (work[i][j][2] - last[i][j][2]);
            sceVu0CopyVector(last[i][j], work[i][j]);
            sceVu0Normalize(scratch, speed[i][j]);
            float facing = sceVu0InnerProduct(scratch, normal_grid[i][j]);

            if (facing < 0.0f) {
                facing *= -1.0f;
            }

            float damping = 0.6f + (1.0f - facing);

            if (damping > 1.0f) {
                damping = 1.0f;
            }

            speed[i][j][0] += facing * wind_force[0];
            speed[i][j][1] += facing * wind_force[1];
            speed[i][j][2] += facing * wind_force[2];
            speed[i][j][0] *= damping;
            speed[i][j][1] *= damping;
            speed[i][j][2] *= damping;

            if (reset != 0) {
                speed[i][j][0] = 0.0f;
                speed[i][j][1] = 0.0f;
                speed[i][j][2] = 0.0f;
            } else {
                if (rest[i][j][3] > 0.0f) {
                    speed[i][j][0] *= rest[i][j][3];
                    speed[i][j][1] *= rest[i][j][3];
                    speed[i][j][2] *= rest[i][j][3];
                }

                if (work[i][j][1] <= ground && floor_on != 0) {
                    work[i][j][1] = ground;
                    speed[i][j][0] *= 0.4f;
                    speed[i][j][2] *= 0.4f;
                }
            }
        }
    }

    sceVu0FVECTOR edge[4];
    sceVu0FVECTOR normal;
    sceVu0FVECTOR cross[4];
    normal[3] = 0.0f;
    normal[2] = 0.0f;
    normal[1] = 0.0f;
    normal[0] = 0.0f;

    for (j = 0; j < num_j; j++) {
        for (i = 0; i < num_i; i++) {
            int next_i = i + 1;
            int prev_i = i - 1;
            int prev_j = j - 1;
            int next_j = j + 1;

            if (prev_i < 0) {
                prev_i = 0;
            }

            if (prev_j < 0) {
                prev_j = 0;
            }

            if (next_i >= num_i) {
                next_i = num_i - 1;
            }

            if (next_j >= num_j) {
                next_j = num_j - 1;
            }

            sceVu0SubVector(edge[0], work[next_i][j], work[i][j]);
            sceVu0SubVector(edge[1], work[prev_i][j], work[i][j]);
            sceVu0SubVector(edge[2], work[i][prev_j], work[i][j]);
            sceVu0SubVector(edge[3], work[i][next_j], work[i][j]);
            sceVu0OuterProduct(cross[0], edge[3], edge[0]);
            sceVu0OuterProduct(cross[1], edge[1], edge[3]);
            sceVu0OuterProduct(cross[2], edge[2], edge[1]);
            sceVu0OuterProduct(cross[3], edge[0], edge[2]);
            sceVu0AddVector(normal, cross[0], cross[1]);
            sceVu0AddVector(normal, normal, cross[2]);
            sceVu0AddVector(normal, normal, cross[3]);
            sceVu0ScaleVector(normal, normal, normal_scale);
            sceVu0Normalize(normal_grid[i][j], normal);
        }
    }

    for (i = 0; i < num_i; i++) {
        for (j = 0; j < num_j; j++) {
            vu0::Copy(point[i][j], work[i][j]);
        }
    }
}
