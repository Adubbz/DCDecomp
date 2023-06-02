.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0UnitMatrix
/* 219A8 001218A8 2C01E04B */  vsub.xyzw  $vf4, $vf0, $vf0
/* 219AC 001218AC 2821204A */  vadd.w     $vf4, $vf4, $vf0
/* 219B0 001218B0 3D23E54B */  vmr32.xyzw $vf5, $vf4
/* 219B4 001218B4 3D2BE64B */  vmr32.xyzw $vf6, $vf5
/* 219B8 001218B8 3D33E74B */  vmr32.xyzw $vf7, $vf6
/* 219BC 001218BC 300084F8 */  sqc2       $vf4, 0x30($4)
/* 219C0 001218C0 200085F8 */  sqc2       $vf5, 0x20($4)
/* 219C4 001218C4 100086F8 */  sqc2       $vf6, 0x10($4)
/* 219C8 001218C8 0800E003 */  jr         $31
/* 219CC 001218CC 000087F8 */   sqc2      $vf7, 0x0($4)
