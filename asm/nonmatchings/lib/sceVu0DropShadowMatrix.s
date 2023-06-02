.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0DropShadowMatrix
/* 21F98 00121E98 06640046 */  mov.s      $f16, $f12
/* 21F9C 00121E9C 2A00C010 */  beqz       $6, .L00121F48
/* 21FA0 00121EA0 C66B0046 */   mov.s     $f15, $f13
/* 21FA4 00121EA4 0000A1C4 */  lwc1       $f1, 0x0($5)
/* 21FA8 00121EA8 0400A2C4 */  lwc1       $f2, 0x4($5)
/* 21FAC 00121EAC 42820146 */  mul.s      $f9, $f16, $f1
/* 21FB0 00121EB0 0800A3C4 */  lwc1       $f3, 0x8($5)
/* 21FB4 00121EB4 827A0246 */  mul.s      $f10, $f15, $f2
/* 21FB8 00121EB8 803F013C */  lui        $at, (0x3F800000 >> 16)
/* 21FBC 00121EBC 00288144 */  mtc1       $at, $f5
/* 21FC0 00121EC0 82710346 */  mul.s      $f6, $f14, $f3
/* 21FC4 00121EC4 0C0090E4 */  swc1       $f16, 0xC($4)
/* 21FC8 00121EC8 C7090046 */  neg.s      $f7, $f1
/* 21FCC 00121ECC 1C008FE4 */  swc1       $f15, 0x1C($4)
/* 21FD0 00121ED0 00480A46 */  add.s      $f0, $f9, $f10
/* 21FD4 00121ED4 2C008EE4 */  swc1       $f14, 0x2C($4)
/* 21FD8 00121ED8 07110046 */  neg.s      $f4, $f2
/* 21FDC 00121EDC 300087E4 */  swc1       $f7, 0x30($4)
/* 21FE0 00121EE0 071A0046 */  neg.s      $f8, $f3
/* 21FE4 00121EE4 00000646 */  add.s      $f0, $f0, $f6
/* 21FE8 00121EE8 340084E4 */  swc1       $f4, 0x34($4)
/* 21FEC 00121EEC C2790146 */  mul.s      $f7, $f15, $f1
/* 21FF0 00121EF0 02810246 */  mul.s      $f4, $f16, $f2
/* 21FF4 00121EF4 380088E4 */  swc1       $f8, 0x38($4)
/* 21FF8 00121EF8 01280046 */  sub.s      $f0, $f5, $f0
/* 21FFC 00121EFC 42700146 */  mul.s      $f1, $f14, $f1
/* 22000 00121F00 100087E4 */  swc1       $f7, 0x10($4)
/* 22004 00121F04 82700246 */  mul.s      $f2, $f14, $f2
/* 22008 00121F08 040084E4 */  swc1       $f4, 0x4($4)
/* 2200C 00121F0C 41010546 */  sub.s      $f5, $f0, $f5
/* 22010 00121F10 404A0046 */  add.s      $f9, $f9, $f0
/* 22014 00121F14 200081E4 */  swc1       $f1, 0x20($4)
/* 22018 00121F18 80520046 */  add.s      $f10, $f10, $f0
/* 2201C 00121F1C 240082E4 */  swc1       $f2, 0x24($4)
/* 22020 00121F20 80310046 */  add.s      $f6, $f6, $f0
/* 22024 00121F24 3C0085E4 */  swc1       $f5, 0x3C($4)
/* 22028 00121F28 02800346 */  mul.s      $f0, $f16, $f3
/* 2202C 00121F2C 000089E4 */  swc1       $f9, 0x0($4)
/* 22030 00121F30 C2780346 */  mul.s      $f3, $f15, $f3
/* 22034 00121F34 14008AE4 */  swc1       $f10, 0x14($4)
/* 22038 00121F38 280086E4 */  swc1       $f6, 0x28($4)
/* 2203C 00121F3C 080080E4 */  swc1       $f0, 0x8($4)
/* 22040 00121F40 0800E003 */  jr         $31
/* 22044 00121F44 180083E4 */   swc1      $f3, 0x18($4)
.L00121F48:
/* 22048 00121F48 0000A2C4 */  lwc1       $f2, 0x0($5)
/* 2204C 00121F4C 0400A4C4 */  lwc1       $f4, 0x4($5)
/* 22050 00121F50 42810246 */  mul.s      $f5, $f16, $f2
/* 22054 00121F54 0800A7C4 */  lwc1       $f7, 0x8($5)
/* 22058 00121F58 82790446 */  mul.s      $f6, $f15, $f4
/* 2205C 00121F5C 80BF013C */  lui        $at, (0xBF800000 >> 16)
/* 22060 00121F60 00088144 */  mtc1       $at, $f1
/* 22064 00121F64 02720746 */  mul.s      $f8, $f14, $f7
/* 22068 00121F68 0C0080AC */  sw         $0, 0xC($4)
/* 2206C 00121F6C 47120046 */  neg.s      $f9, $f2
/* 22070 00121F70 1C0080AC */  sw         $0, 0x1C($4)
/* 22074 00121F74 00280646 */  add.s      $f0, $f5, $f6
/* 22078 00121F78 2C0080AC */  sw         $0, 0x2C($4)
/* 2207C 00121F7C 82720446 */  mul.s      $f10, $f14, $f4
/* 22080 00121F80 C7220046 */  neg.s      $f11, $f4
/* 22084 00121F84 00000846 */  add.s      $f0, $f0, $f8
/* 22088 00121F88 C2780246 */  mul.s      $f3, $f15, $f2
/* 2208C 00121F8C 02830746 */  mul.s      $f12, $f16, $f7
/* 22090 00121F90 00000000 */  nop
/* 22094 00121F94 00000000 */  nop
/* 22098 00121F98 43080046 */  div.s      $f1, $f1, $f0
/* 2209C 00121F9C 41290046 */  sub.s      $f5, $f5, $f0
/* 220A0 00121FA0 81310046 */  sub.s      $f6, $f6, $f0
/* 220A4 00121FA4 01420046 */  sub.s      $f8, $f8, $f0
/* 220A8 00121FA8 427B0746 */  mul.s      $f13, $f15, $f7
/* 220AC 00121FAC 07000046 */  neg.s      $f0, $f0
/* 220B0 00121FB0 82700246 */  mul.s      $f2, $f14, $f2
/* 220B4 00121FB4 02810446 */  mul.s      $f4, $f16, $f4
/* 220B8 00121FB8 C7390046 */  neg.s      $f7, $f7
/* 220BC 00121FBC 02080046 */  mul.s      $f0, $f1, $f0
/* 220C0 00121FC0 42090546 */  mul.s      $f5, $f1, $f5
/* 220C4 00121FC4 C2080346 */  mul.s      $f3, $f1, $f3
/* 220C8 00121FC8 82080246 */  mul.s      $f2, $f1, $f2
/* 220CC 00121FCC 3C0080E4 */  swc1       $f0, 0x3C($4)
/* 220D0 00121FD0 420A0946 */  mul.s      $f9, $f1, $f9
/* 220D4 00121FD4 000085E4 */  swc1       $f5, 0x0($4)
/* 220D8 00121FD8 02090446 */  mul.s      $f4, $f1, $f4
/* 220DC 00121FDC 100083E4 */  swc1       $f3, 0x10($4)
/* 220E0 00121FE0 82090646 */  mul.s      $f6, $f1, $f6
/* 220E4 00121FE4 200082E4 */  swc1       $f2, 0x20($4)
/* 220E8 00121FE8 820A0A46 */  mul.s      $f10, $f1, $f10
/* 220EC 00121FEC 300089E4 */  swc1       $f9, 0x30($4)
/* 220F0 00121FF0 C20A0B46 */  mul.s      $f11, $f1, $f11
/* 220F4 00121FF4 040084E4 */  swc1       $f4, 0x4($4)
/* 220F8 00121FF8 020B0C46 */  mul.s      $f12, $f1, $f12
/* 220FC 00121FFC 140086E4 */  swc1       $f6, 0x14($4)
/* 22100 00122000 420B0D46 */  mul.s      $f13, $f1, $f13
/* 22104 00122004 24008AE4 */  swc1       $f10, 0x24($4)
/* 22108 00122008 020A0846 */  mul.s      $f8, $f1, $f8
/* 2210C 0012200C 34008BE4 */  swc1       $f11, 0x34($4)
/* 22110 00122010 42080746 */  mul.s      $f1, $f1, $f7
/* 22114 00122014 08008CE4 */  swc1       $f12, 0x8($4)
/* 22118 00122018 18008DE4 */  swc1       $f13, 0x18($4)
/* 2211C 0012201C 280088E4 */  swc1       $f8, 0x28($4)
/* 22120 00122020 0800E003 */  jr         $31
/* 22124 00122024 380081E4 */   swc1      $f1, 0x38($4)
