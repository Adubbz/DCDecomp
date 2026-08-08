#pragma once

#include "common.h"

/**
 * @mangled __construct_array
 * @address 0x1222D0
 * @size 0x130
 * @unknownret
 */
void __construct_array(/* unknown args */);

/**
 * @mangled __construct_new_array
 * @address 0x122400
 * @size 0x150
 * @unknownret
 */
void __construct_new_array(/* unknown args */);

/**
 * @mangled __dl__FPv
 * @address 0x122550
 * @size 0x40
 * @unknownret
 */
void __dl(void *);

/**
 * @mangled __throw_catch_compare
 * @address 0x122610
 * @size 0x270
 * @unknownret
 */
void __throw_catch_compare(/* unknown args */);

/**
 * @mangled unexpected__3stdFv
 * @address 0x122880
 * @size 0x30
 * @unknownret
 */
void unexpected(void);

/**
 * @mangled terminate__3stdFv
 * @address 0x1228B0
 * @size 0x30
 * @unknownret
 */
void terminate(void);

/**
 * @mangled duhandler__3stdFv
 * @address 0x1228E0
 * @size 0x30
 * @unknownret
 */
void duhandler(void);

/**
 * @mangled dthandler__3stdFv
 * @address 0x122910
 * @size 0x20
 * @unknownret
 */
void dthandler(void);

/**
 * @mangled __register_global_object
 * @address 0x122930
 * @size 0x30
 * @unknownret
 */
void __register_global_object(/* unknown args */);

/**
 * @mangled __initialize_cpp_rts
 * @address 0x122960
 * @size 0x60
 * @unknownret
 */
void __initialize_cpp_rts(/* unknown args */);

/**
 * @mangled __DecodeUnsignedNumber__FPcPUi
 * @address 0x1229C0
 * @size 0xA0
 * @unknownret
 */
void __DecodeUnsignedNumber(char *, unsigned int *);

/**
 * @mangled __DecodeSignedNumber__FPcPi
 * @address 0x122A60
 * @size 0xA0
 * @unknownret
 */
void __DecodeSignedNumber(char *, int *);

/**
 * @mangled __end__catch
 * @address 0x122B00
 * @size 0x40
 * @unknownret
 */
void __end__catch(/* unknown args */);

/**
 * @mangled __unexpected
 * @address 0x122B40
 * @size 0x1C0
 * @unknownret
 */
void __unexpected(/* unknown args */);

/**
 * @mangled mwInit
 * @address 0x122DA0
 * @size 0x40
 * @unknownret
 */
void mwInit(/* unknown args */);

/**
 * @mangled mwOverlayInit
 * @address 0x122DE0
 * @size 0x90
 * @unknownret
 */
void mwOverlayInit(/* unknown args */);

/**
 * @mangled MWNotifyOverlayLoaded
 * @address 0x122E70
 * @size 0x10
 * @unknownret
 */
void MWNotifyOverlayLoaded(/* unknown args */);

/**
 * @mangled mwBload
 * @address 0x122E80
 * @size 0xC0
 * @unknownret
 */
void mwBload(/* unknown args */);

/**
 * @mangled mwLoadOverlay
 * @address 0x122F40
 * @size 0x70
 * @unknownret
 */
void mwLoadOverlay(/* unknown args */);

/**
 * @mangled VectorMax__FPfPfPf
 * @address 0x122FB0
 * @size 0x20
 * @unknownret
 */
void VectorMax(float *, float *, float *);

/**
 * @mangled VectorMax__FPfPfPfPf
 * @address 0x122FD0
 * @size 0x20
 * @unknownret
 */
void VectorMax(float *, float *, float *, float *);

/**
 * @mangled VectorMax__FPfPfPfPfPf
 * @address 0x122FF0
 * @size 0x30
 * @unknownret
 */
void VectorMax(float *, float *, float *, float *, float *);

/**
 * @mangled VectorMin__FPfPfPf
 * @address 0x123020
 * @size 0x20
 * @unknownret
 */
void VectorMin(float *, float *, float *);

/**
 * @mangled VectorMin__FPfPfPfPfPf
 * @address 0x123040
 * @size 0x30
 * @unknownret
 */
void VectorMin(float *, float *, float *, float *, float *);

/**
 * @mangled VectorMaxMin__FPfPfPfPf
 * @address 0x123070
 * @size 0x20
 * @unknownret
 */
void VectorMaxMin(float *, float *, float *, float *);

/**
 * @mangled VectorMaxMin__FPfPfPfPfPf
 * @address 0x123090
 * @size 0x30
 * @unknownret
 */
void VectorMaxMin(float *, float *, float *, float *, float *);

/**
 * @mangled VectorMaxMin__FPfPfPfPfPfPf
 * @address 0x1230C0
 * @size 0x40
 * @unknownret
 */
void VectorMaxMin(float *, float *, float *, float *, float *, float *);

/**
 * @mangled PlaneNormal__FPfPfPfPf
 * @address 0x123100
 * @size 0x30
 * @unknownret
 */
void PlaneNormal(float *, float *, float *, float *);

/**
 * @mangled DistPlanePoint__FPfPfPf
 * @address 0x123130
 * @size 0x50
 * @unknownret
 */
void DistPlanePoint(float *, float *, float *);

/**
 * @mangled ReflectionPlane__FPfPfPfPf
 * @address 0x123180
 * @size 0xB0
 * @unknownret
 */
void ReflectionPlane(float *, float *, float *, float *);

/**
 * @mangled IntersectionPoint_line_poly3__FPfPfPfPfPfPfPf
 * @address 0x123230
 * @size 0x150
 * @unknownret
 */
void IntersectionPoint_line_poly3(float *, float *, float *, float *, float *, float *, float *);

/**
 * @mangled Check_Point_Poly3_XYZ__FPfPfPfPfPf
 * @address 0x123380
 * @size 0x1E0
 * @unknownret
 */
void Check_Point_Poly3_XYZ(float *, float *, float *, float *, float *);

/**
 * @mangled DistVector__FPf
 * @address 0x123560
 * @size 0x30
 * @unknownret
 */
void DistVector(float *);

/**
 * Returns the distance between two positions.
 *
 * @mangled DistVector__FPfPf
 * @address 0x123590
 * @size 0x40
 */
float DistVector(float *a, float *b);

/**
 * @mangled MulMatrix__FPA4_fPA4_fPA4_f
 * @address 0x1235D0
 * @size 0x80
 * @unknownret
 */
void MulMatrix(float (*)[4], float (*)[4], float (*)[4]);

/**
 * @mangled RotMatrixY__FPA4_ff
 * @address 0x123650
 * @size 0x80
 * @unknownret
 */
void RotMatrixY(float (*)[4], float);

/**
 * @mangled LookAtMatrixZ__FPA4_fPf
 * @address 0x1236D0
 * @size 0x110
 * @unknownret
 */
void LookAtMatrixZ(float (*)[4], float *);

/**
 * @mangled ApplyMatrixN__FPA4_fPA4_fPA4_fi
 * @address 0x1237E0
 * @size 0x60
 * @unknownret
 */
void ApplyMatrixN(float (*)[4], float (*)[4], float (*)[4], int);

/**
 * @mangled VectorInterpolate__FPfPfPffi
 * @address 0x123840
 * @size 0x190
 * @unknownret
 */
void VectorInterpolate(float *, float *, float *, float, int);

/**
 * @mangled AngleInterpolate__Ffffi
 * @address 0x1239D0
 * @size 0x160
 * @unknownret
 */
void AngleInterpolate(float, float, float, int);

/**
 * @mangled AngleCmp__Ffff
 * @address 0x123B30
 * @size 0xB0
 * @unknownret
 */
void AngleCmp(float, float, float);

/**
 * @mangled AngleLimit__Ff
 * @address 0x123BE0
 * @size 0xD0
 * @unknownret
 */
void AngleLimit(float);

/**
 * @mangled rnd__Fv
 * @address 0x123CB0
 * @size 0x40
 * @unknownret
 */
void rnd(void);

/**
 * @mangled nrnd__Fv
 * @address 0x123CF0
 * @size 0xC0
 * @unknownret
 */
void nrnd(void);

/**
 * @mangled CreateSinTable__Fv
 * @address 0x123DB0
 * @size 0x90
 * @unknownret
 */
void CreateSinTable(void);

/**
 * @mangled Sinf__Ff
 * @address 0x123E40
 * @size 0xC0
 * @unknownret
 */
void Sinf(float);

/**
 * @mangled Cosf__Ff
 * @address 0x123F00
 * @size 0x30
 * @unknownret
 */
void Cosf(float);

/* + 4 more not-yet-named function(s) in this range (IDA/disassembler could not name them) */
