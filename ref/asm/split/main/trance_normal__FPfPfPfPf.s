.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel trance_normal__FPfPfPfPf
/* 02A420 0012A320 000090D8 */  lqc2        $vf16, 0x0($4)
/* 02A424 0012A324 100091D8 */  lqc2        $vf17, 0x10($4)
/* 02A428 0012A328 200092D8 */  lqc2        $vf18, 0x20($4)
/* 02A42C 0012A32C BC51F04B */  vmulax.xyzw $ACC, $vf10, $vf16x
/* 02A430 0012A330 BD58F04B */  vmadday.xyzw $ACC, $vf11, $vf16y
/* 02A434 0012A334 BE60F04B */  vmaddaz.xyzw $ACC, $vf12, $vf16z
/* 02A438 0012A338 0B6CF04B */  vmaddw.xyzw $vf16, $vf13, $vf16w
/* 02A43C 0012A33C BC51F14B */  vmulax.xyzw $ACC, $vf10, $vf17x
/* 02A440 0012A340 BD58F14B */  vmadday.xyzw $ACC, $vf11, $vf17y
/* 02A444 0012A344 BE60F14B */  vmaddaz.xyzw $ACC, $vf12, $vf17z
/* 02A448 0012A348 4B6CF14B */  vmaddw.xyzw $vf17, $vf13, $vf17w
/* 02A44C 0012A34C BC51F24B */  vmulax.xyzw $ACC, $vf10, $vf18x
/* 02A450 0012A350 BD58F24B */  vmadday.xyzw $ACC, $vf11, $vf18y
/* 02A454 0012A354 BE60F24B */  vmaddaz.xyzw $ACC, $vf12, $vf18z
/* 02A458 0012A358 8B6CF24B */  vmaddw.xyzw $vf18, $vf13, $vf18w
/* 02A45C 0012A35C 2C8DF04B */  vsub.xyzw   $vf20, $vf17, $vf16
/* 02A460 0012A360 6C95F04B */  vsub.xyzw   $vf21, $vf18, $vf16
/* 02A464 0012A364 000090F8 */  sqc2        $vf16, 0x0($4)
/* 02A468 0012A368 0000B1F8 */  sqc2        $vf17, 0x0($5)
/* 02A46C 0012A36C 0000D2F8 */  sqc2        $vf18, 0x0($6)
/* 02A470 0012A370 FF02004A */  vnop
/* 02A474 0012A374 FEA2D54B */  vopmula.xyz $ACC, $vf20, $vf21
/* 02A478 0012A378 AEADD44B */  vopmsub.xyz $vf22, $vf21, $vf20
/* 02A47C 0012A37C 0000F6F8 */  sqc2        $vf22, 0x0($7)
/* 02A480 0012A380 0800E003 */  jr          $31
/* 02A484 0012A384 00000000 */   nop
/* 02A488 0012A388 00000000 */  nop
/* 02A48C 0012A38C 00000000 */  nop
