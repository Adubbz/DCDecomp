.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel trance_normal__FPfPfPfPf
/* 2A420 0012A320 000090D8 */  lqc2       $vf16, 0x0($4)
/* 2A424 0012A324 100091D8 */  lqc2       $vf17, 0x10($4)
/* 2A428 0012A328 200092D8 */  lqc2       $vf18, 0x20($4)
/* 2A42C 0012A32C BC51F04B */  vmulax.xyzw ACC, $vf10, $vf16x
/* 2A430 0012A330 BD58F04B */  vmadday.xyzw ACC, $vf11, $vf16y
/* 2A434 0012A334 BE60F04B */  vmaddaz.xyzw ACC, $vf12, $vf16z
/* 2A438 0012A338 0B6CF04B */  vmaddw.xyzw $vf16, $vf13, $vf16w
/* 2A43C 0012A33C BC51F14B */  vmulax.xyzw ACC, $vf10, $vf17x
/* 2A440 0012A340 BD58F14B */  vmadday.xyzw ACC, $vf11, $vf17y
/* 2A444 0012A344 BE60F14B */  vmaddaz.xyzw ACC, $vf12, $vf17z
/* 2A448 0012A348 4B6CF14B */  vmaddw.xyzw $vf17, $vf13, $vf17w
/* 2A44C 0012A34C BC51F24B */  vmulax.xyzw ACC, $vf10, $vf18x
/* 2A450 0012A350 BD58F24B */  vmadday.xyzw ACC, $vf11, $vf18y
/* 2A454 0012A354 BE60F24B */  vmaddaz.xyzw ACC, $vf12, $vf18z
/* 2A458 0012A358 8B6CF24B */  vmaddw.xyzw $vf18, $vf13, $vf18w
/* 2A45C 0012A35C 2C8DF04B */  vsub.xyzw  $vf20, $vf17, $vf16
/* 2A460 0012A360 6C95F04B */  vsub.xyzw  $vf21, $vf18, $vf16
/* 2A464 0012A364 000090F8 */  sqc2       $vf16, 0x0($4)
/* 2A468 0012A368 0000B1F8 */  sqc2       $vf17, 0x0($5)
/* 2A46C 0012A36C 0000D2F8 */  sqc2       $vf18, 0x0($6)
/* 2A470 0012A370 FF02004A */  vnop
/* 2A474 0012A374 FEA2D54B */  vopmula.xyz ACC, $vf20, $vf21
/* 2A478 0012A378 AEADD44B */  vopmsub.xyz $vf22, $vf21, $vf20
/* 2A47C 0012A37C 0000F6F8 */  sqc2       $vf22, 0x0($7)
/* 2A480 0012A380 0800E003 */  jr         $31
/* 2A484 0012A384 00000000 */   nop
/* 2A488 0012A388 00000000 */  nop
/* 2A48C 0012A38C 00000000 */  nop
