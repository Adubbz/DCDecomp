#pragma once

#include <libvu0.h>

void MulFrameMatrix(sceVu0FMATRIX m0, sceVu0FMATRIX m1, sceVu0FMATRIX m2);
void ScaleMatrix(sceVu0FMATRIX m0, sceVu0FMATRIX m1, sceVu0FVECTOR scale);
void CopyMatrix(sceVu0FMATRIX m0, sceVu0FMATRIX m1);
void ZeroMatrix(sceVu0FMATRIX m0);
void ScreenBound(sceVu0FVECTOR *screen, sceVu0FVECTOR max, sceVu0FVECTOR min);
void pre_trance_normal(sceVu0FMATRIX matrix);
void trance_normal(float *p0, float *p1, float *p2, float *plane);
