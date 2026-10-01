#include "stubs/water.hpp"
#include "vu0_ops.hpp"

namespace {

// pretest parks the cell matrix and step in VU0 registers for the Trans_AddCell calls that follow.
float g_cell_matrix[4][4];
float g_cell_step[4];

} // namespace

void pretest(float matrix[4][4], float *translation) {
    std::memcpy(g_cell_matrix, matrix, sizeof(g_cell_matrix));
    vu0::Copy(g_cell_step, translation);
}

void Trans_AddCell(float *output, float *position) {
    float source[4];
    float result[4];
    vu0::Copy(source, position);
    vu0::Apply(result, g_cell_matrix, source);
    source[0] = source[0] + g_cell_step[0];
    source[2] = source[2] + g_cell_step[2];
    vu0::Copy(output, result);
    vu0::Copy(position, source);
}
