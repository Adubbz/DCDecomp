.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _CHK_MOTION_FRM__FP12RS_STACKDATAi
/* 0E1C90 001E1B90 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E1C94 001E1B94 0000BF7F */  sq          $31, 0x0($29)
/* 0E1C98 001E1B98 28468070 */  paddub      $8, $4, $0
/* 0E1C9C 001E1B9C 283EA070 */  paddub      $7, $5, $0
/* 0E1CA0 001E1BA0 E09C848F */  lw          $4, -0x6320($28)
/* 0E1CA4 001E1BA4 9000838C */  lw          $3, 0x90($4)
/* 0E1CA8 001E1BA8 10350224 */  addiu       $2, $0, 0x3510
/* 0E1CAC 001E1BAC 18106200 */  mult        $2, $3, $2
/* 0E1CB0 001E1BB0 21104400 */  addu        $2, $2, $4
/* 0E1CB4 001E1BB4 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E1CB8 001E1BB8 21084100 */  addu        $1, $2, $1
/* 0E1CBC 001E1BBC C0FF2CC4 */  lwc1        $f12, -0x40($1)
/* 0E1CC0 001E1BC0 0200013C */  lui         $1, (0x20938 >> 16)
/* 0E1CC4 001E1BC4 21084100 */  addu        $1, $2, $1
/* 0E1CC8 001E1BC8 3809248C */  lw          $4, (0x20938 & 0xFFFF)($1)
/* 0E1CCC 001E1BCC 0200013C */  lui         $1, (0x20014 >> 16)
/* 0E1CD0 001E1BD0 21084100 */  addu        $1, $2, $1
/* 0E1CD4 001E1BD4 1400238C */  lw          $3, (0x20014 & 0xFFFF)($1)
/* 0E1CD8 001E1BD8 00110400 */  sll         $2, $4, 4
/* 0E1CDC 001E1BDC 21104300 */  addu        $2, $2, $3
/* 0E1CE0 001E1BE0 040040C4 */  lwc1        $f0, 0x4($2)
/* 0E1CE4 001E1BE4 60008046 */  cvt.s.w     $f1, $f0
/* 0E1CE8 001E1BE8 282E0070 */  paddub      $5, $0, $0
/* 0E1CEC 001E1BEC 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0E1CF0 001E1BF0 00008244 */  mtc1        $2, $f0
/* 0E1CF4 001E1BF4 00000000 */  nop
/* 0E1CF8 001E1BF8 01080046 */  sub.s       $f0, $f1, $f0
/* 0E1CFC 001E1BFC 34600046 */  c.lt.s      $f12, $f0
/* 0E1D00 001E1C00 00000000 */  nop
/* 0E1D04 001E1C04 06000145 */  bc1t        .L001E1C20
/* 0E1D08 001E1C08 00000000 */   nop
/* 0E1D0C 001E1C0C 34600146 */  c.lt.s      $f12, $f1
/* 0E1D10 001E1C10 00000000 */  nop
/* 0E1D14 001E1C14 02000045 */  bc1f        .L001E1C20
/* 0E1D18 001E1C18 00000000 */   nop
/* 0E1D1C 001E1C1C 01000524 */  addiu       $5, $0, 0x1
.L001E1C20:
/* 0E1D20 001E1C20 28260071 */  paddub      $4, $8, $0
/* 0E1D24 001E1C24 08008824 */  addiu       $8, $4, 0x8
/* 0E1D28 001E1C28 B485070C */  jal         SetStack__FP12RS_STACKDATAi__3
/* 0E1D2C 001E1C2C 00000000 */   nop
/* 0E1D30 001E1C30 02000224 */  addiu       $2, $0, 0x2
/* 0E1D34 001E1C34 0400E214 */  bne         $7, $2, .L001E1C48
/* 0E1D38 001E1C38 00000000 */   nop
/* 0E1D3C 001E1C3C 28260071 */  paddub      $4, $8, $0
/* 0E1D40 001E1C40 BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E1D44 001E1C44 00000000 */   nop
.L001E1C48:
/* 0E1D48 001E1C48 01000224 */  addiu       $2, $0, 0x1
/* 0E1D4C 001E1C4C 0000BF7B */  lq          $31, 0x0($29)
/* 0E1D50 001E1C50 1000BD27 */  addiu       $29, $29, 0x10
/* 0E1D54 001E1C54 0800E003 */  jr          $31
/* 0E1D58 001E1C58 00000000 */   nop
/* 0E1D5C 001E1C5C 00000000 */  nop
