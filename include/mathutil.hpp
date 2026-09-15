#pragma once

#include "common.h"

/**
 * @file
 * Declares the game's vector, geometry, interpolation, and trigonometry helpers.
 */

/**
 * Runs a constructor over every element of an array.
 *
 * @mangled __construct_array
 * @address 0x1222D0
 * @size 0x12C
 */
void __construct_array(/* unknown args */);

/**
 * Runs a constructor over every element of a newly allocated array.
 *
 * @mangled __construct_new_array
 * @address 0x122400
 * @size 0x14C
 */
void __construct_new_array(/* unknown args */);

/**
 * Frees storage that `operator new` handed out.
 *
 * @mangled __dl__FPv
 * @address 0x122550
 * @size 0x40
 */
void __dl(void *);

/**
 * Reports whether a thrown type matches a catch clause's type.
 *
 * @mangled __throw_catch_compare
 * @address 0x122610
 * @size 0x26C
 */
void __throw_catch_compare(/* unknown args */);

/**
 * Calls the handler for an exception a function did not declare.
 *
 * @mangled unexpected__3stdFv
 * @address 0x122880
 * @size 0x24
 */
void unexpected(void);

/**
 * Calls the handler that ends the program after an unrecoverable exception.
 *
 * @mangled terminate__3stdFv
 * @address 0x1228B0
 * @size 0x24
 */
void terminate(void);

/**
 * The default unexpected-exception handler, which terminates.
 *
 * @mangled duhandler__3stdFv
 * @address 0x1228E0
 * @size 0x24
 */
void duhandler(void);

/**
 * The default terminate handler, which stops the program.
 *
 * @mangled dthandler__3stdFv
 * @address 0x122910
 * @size 0x1C
 */
void dthandler(void);

/**
 * Records one global object so that its destructor runs at exit.
 *
 * @mangled __register_global_object
 * @address 0x122930
 * @size 0x24
 */
void __register_global_object(/* unknown args */);

/**
 * Calls each static initializer in the table from the first pointer up to the second.
 *
 * @mangled __initialize_cpp_rts
 * @address 0x122960
 * @size 0x54
 */
extern "C" void __initialize_cpp_rts(void *, void *, void *, void *);

/**
 * Reads an unsigned number out of a mangled type name.
 *
 * @mangled __DecodeUnsignedNumber__FPcPUi
 * @address 0x1229C0
 * @size 0xA0
 */
void __DecodeUnsignedNumber(char *, unsigned int *);

/**
 * Reads a signed number out of a mangled type name.
 *
 * @mangled __DecodeSignedNumber__FPcPi
 * @address 0x122A60
 * @size 0xA0
 */
void __DecodeSignedNumber(char *, int *);

/**
 * Ends a catch clause and releases the exception it caught.
 *
 * @mangled __end__catch
 * @address 0x122B00
 * @size 0x38
 */
void __end__catch(/* unknown args */);

/**
 * Raises an exception a function did not declare, through the unexpected handler.
 *
 * @mangled __unexpected
 * @address 0x122B40
 * @size 0x1C0
 */
void __unexpected(/* unknown args */);

/**
 * Starts the MetroWerks runtime.
 *
 * @mangled mwInit
 * @address 0x122DA0
 * @size 0x40
 */
extern "C" void mwInit(int argc, const char **argv, const char **envp);

/**
 * Starts the overlay loader and records where overlays are read to.
 *
 * @mangled mwOverlayInit
 * @address 0x122DE0
 * @size 0x8C
 */
void mwOverlayInit(/* unknown args */);

/**
 * Tells the runtime that an overlay has finished loading.
 *
 * @mangled MWNotifyOverlayLoaded
 * @address 0x122E70
 * @size 0x8
 */
extern "C" void MWNotifyOverlayLoaded(void);

/**
 * Reads one overlay image off the disc.
 *
 * @mangled mwBload
 * @address 0x122E80
 * @size 0xB4
 */
void mwBload(/* unknown args */);

/**
 * Reads an overlay into memory and gives back whether it succeeded.
 *
 * @mangled mwLoadOverlay
 * @address 0x122F40
 * @size 0x70
 */
extern "C" int mwLoadOverlay(char *path, void *address);

/**
 * @mangled VectorMax__FPfPfPf
 * @address 0x122FB0
 * @size 0x18
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
 * @size 0x28
 * @unknownret
 */
void VectorMax(float *, float *, float *, float *, float *);

/**
 * @mangled VectorMin__FPfPfPf
 * @address 0x123020
 * @size 0x18
 * @unknownret
 */
void VectorMin(float *, float *, float *);

/**
 * @mangled VectorMin__FPfPfPfPfPf
 * @address 0x123040
 * @size 0x28
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
 * @size 0x2C
 * @unknownret
 */
void VectorMaxMin(float *, float *, float *, float *, float *);

/**
 * @mangled VectorMaxMin__FPfPfPfPfPfPf
 * @address 0x1230C0
 * @size 0x38
 * @unknownret
 */
void VectorMaxMin(float *, float *, float *, float *, float *, float *);

/**
 * @mangled PlaneNormal__FPfPfPfPf
 * @address 0x123100
 * @size 0x28
 * @unknownret
 */
void PlaneNormal(float *, float *, float *, float *);

/**
 * @mangled DistPlanePoint__FPfPfPf
 * @address 0x123130
 * @size 0x4C
 */
float DistPlanePoint(float *normal, float *on_plane, float *point);

/**
 * @mangled ReflectionPlane__FPfPfPfPf
 * @address 0x123180
 * @size 0xA8
 */
float ReflectionPlane(float *normal, float *on_plane, float *point, float *reflection);

/**
 * @mangled IntersectionPoint_line_poly3__FPfPfPfPfPfPfPf
 * @address 0x123230
 * @size 0x144
 */
int IntersectionPoint_line_poly3(float *from, float *to, float *v0, float *v1, float *v2,
                                 float *normal, float *hit);

/**
 * @mangled Check_Point_Poly3_XYZ__FPfPfPfPfPf
 * @address 0x123380
 * @size 0x1DC
 */
int Check_Point_Poly3_XYZ(float *point, float *v0, float *v1, float *v2, float *normal);

/**
 * @mangled DistVector__FPf
 * @address 0x123560
 * @size 0x30
 */
float DistVector(float *vector);

/**
 * Returns the distance between two positions.
 *
 * @mangled DistVector__FPfPf
 * @address 0x123590
 * @size 0x38
 */
float DistVector(float *a, float *b);

/**
 * @mangled MulMatrix__FPA4_fPA4_fPA4_f
 * @address 0x1235D0
 * @size 0x78
 * @unknownret
 */
void MulMatrix(float (*)[4], float (*)[4], float (*)[4]);

/**
 * @mangled RotMatrixY__FPA4_ff
 * @address 0x123650
 * @size 0x74
 * @unknownret
 */
void RotMatrixY(float (*)[4], float);

/**
 * @mangled LookAtMatrixZ__FPA4_fPf
 * @address 0x1236D0
 * @size 0x10C
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
 * @size 0x18C
 * @unknownret
 */
void VectorInterpolate(float *, float *, float *, float, int);

/**
 * @mangled AngleInterpolate__Ffffi
 * @address 0x1239D0
 * @size 0x160
 */
float AngleInterpolate(float, float, float, int);

/**
 * @mangled AngleCmp__Ffff
 * @address 0x123B30
 * @size 0xA8
 * @unknownret
 */
int AngleCmp(float a, float b, float range);

/**
 * Wraps one angle into the half turn either side of zero.
 *
 * @mangled AngleLimit__Ff
 * @address 0x123BE0
 * @size 0xD0
 */
float AngleLimit(float angle);

/**
 * @mangled rnd__Fv
 * @address 0x123CB0
 * @size 0x3C
 */
float rnd(void);

/**
 * @mangled nrnd__Fv
 * @address 0x123CF0
 * @size 0xC0
 */
float nrnd(void);

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
 * @size 0xB8
 */
float Sinf(float angle);

/**
 * @mangled Cosf__Ff
 * @address 0x123F00
 * @size 0x28
 */
float Cosf(float angle);

/* + 4 more not-yet-named function(s) in this range (IDA/disassembler could not name them) */
