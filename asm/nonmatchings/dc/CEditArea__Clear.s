.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Clear__9CEditAreaFv
/* 700C0 0016FFC0 283E0070 */  paddub     $7, $0, $0
/* 700C4 0016FFC4 1A000010 */  b          .L00170030
/* 700C8 0016FFC8 00000000 */   nop
.L0016FFCC:
/* 700CC 0016FFCC 28460070 */  paddub     $8, $0, $0
/* 700D0 0016FFD0 12000010 */  b          .L0017001C
/* 700D4 0016FFD4 00000000 */   nop
.L0016FFD8:
/* 700D8 0016FFD8 FFFF0624 */  addiu      $6, $0, -0x1
/* 700DC 0016FFDC C0180700 */  sll        $3, $7, 3
/* 700E0 0016FFE0 23186700 */  subu       $3, $3, $7
/* 700E4 0016FFE4 80190300 */  sll        $3, $3, 6
/* 700E8 0016FFE8 21286400 */  addu       $5, $3, $4
/* 700EC 0016FFEC C0180800 */  sll        $3, $8, 3
/* 700F0 0016FFF0 23186800 */  subu       $3, $3, $8
/* 700F4 0016FFF4 80180300 */  sll        $3, $3, 2
/* 700F8 0016FFF8 21186500 */  addu       $3, $3, $5
/* 700FC 0016FFFC 280066AC */  sw         $6, 0x28($3)
/* 70100 00170000 2C0060AC */  sw         $0, 0x2C($3)
/* 70104 00170004 300060AC */  sw         $0, 0x30($3)
/* 70108 00170008 340066AC */  sw         $6, 0x34($3)
/* 7010C 0017000C 380066AC */  sw         $6, 0x38($3)
/* 70110 00170010 3C0066AC */  sw         $6, 0x3C($3)
/* 70114 00170014 400066AC */  sw         $6, 0x40($3)
/* 70118 00170018 01000825 */  addiu      $8, $8, 0x1
.L0017001C:
/* 7011C 0017001C 0C00838C */  lw         $3, 0xC($4)
/* 70120 00170020 2A180301 */  slt        $3, $8, $3
/* 70124 00170024 ECFF6014 */  bnez       $3, .L0016FFD8
/* 70128 00170028 00000000 */   nop
/* 7012C 0017002C 0100E724 */  addiu      $7, $7, 0x1
.L00170030:
/* 70130 00170030 0800838C */  lw         $3, 0x8($4)
/* 70134 00170034 2A18E300 */  slt        $3, $7, $3
/* 70138 00170038 E4FF6014 */  bnez       $3, .L0016FFCC
/* 7013C 0017003C 00000000 */   nop
/* 70140 00170040 01000324 */  addiu      $3, $0, 0x1
/* 70144 00170044 502083AC */  sw         $3, 0x2050($4)
/* 70148 00170048 04000324 */  addiu      $3, $0, 0x4
/* 7014C 0017004C 542083AC */  sw         $3, 0x2054($4)
/* 70150 00170050 0800E003 */  jr         $31
/* 70154 00170054 00000000 */   nop
/* 70158 00170058 00000000 */  nop
/* 7015C 0017005C 00000000 */  nop
