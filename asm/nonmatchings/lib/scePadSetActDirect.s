.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel scePadSetActDirect
/* 20230 00120130 2D508000 */  daddu      $10, $4, $0
/* 20234 00120134 1C000324 */  addiu      $3, $0, 0x1C
/* 20238 00120138 70000424 */  addiu      $4, $0, 0x70
/* 2023C 0012013C 1818A300 */  mult       $3, $5, $3
/* 20240 00120140 18204471 */  mult1      $4, $10, $4
/* 20244 00120144 2B00023C */  lui        $2, %hi(D_002A9C90)
/* 20248 00120148 909C4224 */  addiu      $2, $2, %lo(D_002A9C90)
/* 2024C 0012014C 2D380000 */  daddu      $7, $0, $0
/* 20250 00120150 21186400 */  addu       $3, $3, $4
/* 20254 00120154 21104300 */  addu       $2, $2, $3
/* 20258 00120158 0400498C */  lw         $9, 0x4($2)
/* 2025C 0012015C 08002825 */  addiu      $8, $9, 0x8
.L00120160:
/* 20260 00120160 2110C700 */  addu       $2, $6, $7
/* 20264 00120164 21200701 */  addu       $4, $8, $7
/* 20268 00120168 00004390 */  lbu        $3, 0x0($2)
/* 2026C 0012016C 0100E724 */  addiu      $7, $7, 0x1
/* 20270 00120170 0600E228 */  slti       $2, $7, 0x6
/* 20274 00120174 000083A0 */  sb         $3, 0x0($4)
/* 20278 00120178 F9FF4014 */  bnez       $2, .L00120160
/* 2027C 0012017C 00000000 */   nop
/* 20280 00120180 06000224 */  addiu      $2, $0, 0x6
/* 20284 00120184 2D204001 */  daddu      $4, $10, $0
/* 20288 00120188 007D0408 */  j          _send_to_iop
/* 2028C 0012018C 040022AD */   sw        $2, 0x4($9)