#pragma once

#include "common.h"

/* ?ret */ void __construct_array(/* unknown args */); // @ 0x1222D0 (0x130 bytes) -- mangled: __construct_array
/* ?ret */ void __construct_new_array(/* unknown args */); // @ 0x122400 (0x150 bytes) -- mangled: __construct_new_array
/* ?ret */ void __dl(void *); // @ 0x122550 (0x40 bytes) -- mangled: __dl__FPv
/* ?ret */ void __throw_catch_compare(/* unknown args */); // @ 0x122610 (0x270 bytes) -- mangled: __throw_catch_compare
/* ?ret */ void unexpected(void); // @ 0x122880 (0x30 bytes) -- mangled: unexpected__3stdFv
/* ?ret */ void terminate(void); // @ 0x1228B0 (0x30 bytes) -- mangled: terminate__3stdFv
/* ?ret */ void duhandler(void); // @ 0x1228E0 (0x30 bytes) -- mangled: duhandler__3stdFv
/* ?ret */ void dthandler(void); // @ 0x122910 (0x20 bytes) -- mangled: dthandler__3stdFv
/* ?ret */ void __register_global_object(/* unknown args */); // @ 0x122930 (0x30 bytes) -- mangled: __register_global_object
/* ?ret */ void __initialize_cpp_rts(/* unknown args */); // @ 0x122960 (0x60 bytes) -- mangled: __initialize_cpp_rts
/* ?ret */ void __DecodeUnsignedNumber(char *, unsigned int *); // @ 0x1229C0 (0xA0 bytes) -- mangled: __DecodeUnsignedNumber__FPcPUi
/* ?ret */ void __DecodeSignedNumber(char *, int *); // @ 0x122A60 (0xA0 bytes) -- mangled: __DecodeSignedNumber__FPcPi
/* ?ret */ void __end__catch(/* unknown args */); // @ 0x122B00 (0x40 bytes) -- mangled: __end__catch
/* ?ret */ void __unexpected(/* unknown args */); // @ 0x122B40 (0x1C0 bytes) -- mangled: __unexpected
/* ?ret */ void mwInit(/* unknown args */); // @ 0x122DA0 (0x40 bytes) -- mangled: mwInit
/* ?ret */ void mwOverlayInit(/* unknown args */); // @ 0x122DE0 (0x90 bytes) -- mangled: mwOverlayInit
/* ?ret */ void MWNotifyOverlayLoaded(/* unknown args */); // @ 0x122E70 (0x10 bytes) -- mangled: MWNotifyOverlayLoaded
/* ?ret */ void mwBload(/* unknown args */); // @ 0x122E80 (0xC0 bytes) -- mangled: mwBload
/* ?ret */ void mwLoadOverlay(/* unknown args */); // @ 0x122F40 (0x70 bytes) -- mangled: mwLoadOverlay
/* ?ret */ void VectorMax(float *, float *, float *); // @ 0x122FB0 (0x20 bytes) -- mangled: VectorMax__FPfPfPf
/* ?ret */ void VectorMax(float *, float *, float *, float *); // @ 0x122FD0 (0x20 bytes) -- mangled: VectorMax__FPfPfPfPf
/* ?ret */ void VectorMax(float *, float *, float *, float *, float *); // @ 0x122FF0 (0x30 bytes) -- mangled: VectorMax__FPfPfPfPfPf
/* ?ret */ void VectorMin(float *, float *, float *); // @ 0x123020 (0x20 bytes) -- mangled: VectorMin__FPfPfPf
/* ?ret */ void VectorMin(float *, float *, float *, float *, float *); // @ 0x123040 (0x30 bytes) -- mangled: VectorMin__FPfPfPfPfPf
/* ?ret */ void VectorMaxMin(float *, float *, float *, float *); // @ 0x123070 (0x20 bytes) -- mangled: VectorMaxMin__FPfPfPfPf
/* ?ret */ void VectorMaxMin(float *, float *, float *, float *, float *); // @ 0x123090 (0x30 bytes) -- mangled: VectorMaxMin__FPfPfPfPfPf
/* ?ret */ void VectorMaxMin(float *, float *, float *, float *, float *, float *); // @ 0x1230C0 (0x40 bytes) -- mangled: VectorMaxMin__FPfPfPfPfPfPf
/* ?ret */ void PlaneNormal(float *, float *, float *, float *); // @ 0x123100 (0x30 bytes) -- mangled: PlaneNormal__FPfPfPfPf
/* ?ret */ void DistPlanePoint(float *, float *, float *); // @ 0x123130 (0x50 bytes) -- mangled: DistPlanePoint__FPfPfPf
/* ?ret */ void ReflectionPlane(float *, float *, float *, float *); // @ 0x123180 (0xB0 bytes) -- mangled: ReflectionPlane__FPfPfPfPf
/* ?ret */ void IntersectionPoint_line_poly3(float *, float *, float *, float *, float *, float *, float *); // @ 0x123230 (0x150 bytes) -- mangled: IntersectionPoint_line_poly3__FPfPfPfPfPfPfPf
/* ?ret */ void Check_Point_Poly3_XYZ(float *, float *, float *, float *, float *); // @ 0x123380 (0x1E0 bytes) -- mangled: Check_Point_Poly3_XYZ__FPfPfPfPfPf
/* ?ret */ void DistVector(float *); // @ 0x123560 (0x30 bytes) -- mangled: DistVector__FPf
/* ?ret */ void DistVector(float *, float *); // @ 0x123590 (0x40 bytes) -- mangled: DistVector__FPfPf
/* ?ret */ void MulMatrix(float (*)[4], float (*)[4], float (*)[4]); // @ 0x1235D0 (0x80 bytes) -- mangled: MulMatrix__FPA4_fPA4_fPA4_f
/* ?ret */ void RotMatrixY(float (*)[4], float); // @ 0x123650 (0x80 bytes) -- mangled: RotMatrixY__FPA4_ff
/* ?ret */ void LookAtMatrixZ(float (*)[4], float *); // @ 0x1236D0 (0x110 bytes) -- mangled: LookAtMatrixZ__FPA4_fPf
/* ?ret */ void ApplyMatrixN(float (*)[4], float (*)[4], float (*)[4], int); // @ 0x1237E0 (0x60 bytes) -- mangled: ApplyMatrixN__FPA4_fPA4_fPA4_fi
/* ?ret */ void VectorInterpolate(float *, float *, float *, float, int); // @ 0x123840 (0x190 bytes) -- mangled: VectorInterpolate__FPfPfPffi
/* ?ret */ void AngleInterpolate(float, float, float, int); // @ 0x1239D0 (0x160 bytes) -- mangled: AngleInterpolate__Ffffi
/* ?ret */ void AngleCmp(float, float, float); // @ 0x123B30 (0xB0 bytes) -- mangled: AngleCmp__Ffff
/* ?ret */ void AngleLimit(float); // @ 0x123BE0 (0xD0 bytes) -- mangled: AngleLimit__Ff
/* ?ret */ void rnd(void); // @ 0x123CB0 (0x40 bytes) -- mangled: rnd__Fv
/* ?ret */ void nrnd(void); // @ 0x123CF0 (0xC0 bytes) -- mangled: nrnd__Fv
/* ?ret */ void CreateSinTable(void); // @ 0x123DB0 (0x90 bytes) -- mangled: CreateSinTable__Fv
/* ?ret */ void Sinf(float); // @ 0x123E40 (0xC0 bytes) -- mangled: Sinf__Ff
/* ?ret */ void Cosf(float); // @ 0x123F00 (0x30 bytes) -- mangled: Cosf__Ff

/* + 4 more not-yet-named function(s) in this range (IDA/disassembler could not name them) */
