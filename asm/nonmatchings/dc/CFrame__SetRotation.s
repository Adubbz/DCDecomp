.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRotation__6CFrameFfff
/* 28EC0 00128DC0 01000324 */  addiu      $3, $0, 0x1
/* 28EC4 00128DC4 4C0283AC */  sw         $3, 0x24C($4)
/* 28EC8 00128DC8 440280AC */  sw         $0, 0x244($4)
/* 28ECC 00128DCC 3C0280AC */  sw         $0, 0x23C($4)
/* 28ED0 00128DD0 300280C4 */  lwc1       $f0, 0x230($4)
/* 28ED4 00128DD4 32000C46 */  c.eq.s     $f0, $f12
/* 28ED8 00128DD8 00000000 */  nop
/* 28EDC 00128DDC 0B000045 */  bc1f       .L00128E0C
/* 28EE0 00128DE0 00000000 */   nop
/* 28EE4 00128DE4 340280C4 */  lwc1       $f0, 0x234($4)
/* 28EE8 00128DE8 32000D46 */  c.eq.s     $f0, $f13
/* 28EEC 00128DEC 00000000 */  nop
/* 28EF0 00128DF0 06000045 */  bc1f       .L00128E0C
/* 28EF4 00128DF4 00000000 */   nop
/* 28EF8 00128DF8 380280C4 */  lwc1       $f0, 0x238($4)
/* 28EFC 00128DFC 32000E46 */  c.eq.s     $f0, $f14
/* 28F00 00128E00 00000000 */  nop
/* 28F04 00128E04 08000145 */  bc1t       .L00128E28
/* 28F08 00128E08 00000000 */   nop
.L00128E0C:
/* 28F0C 00128E0C 400280AC */  sw         $0, 0x240($4)
/* 28F10 00128E10 4802838C */  lw         $3, 0x248($4)
/* 28F14 00128E14 01006334 */  ori        $3, $3, 0x1
/* 28F18 00128E18 480283AC */  sw         $3, 0x248($4)
/* 28F1C 00128E1C 30028CE4 */  swc1       $f12, 0x230($4)
/* 28F20 00128E20 34028DE4 */  swc1       $f13, 0x234($4)
/* 28F24 00128E24 38028EE4 */  swc1       $f14, 0x238($4)
.L00128E28:
/* 28F28 00128E28 0800E003 */  jr         $31
/* 28F2C 00128E2C 00000000 */   nop
