.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetScale__6CFrameFfff
/* 28050 00127F50 100280C4 */  lwc1       $f0, 0x210($4)
/* 28054 00127F54 32000C46 */  c.eq.s     $f0, $f12
/* 28058 00127F58 00000000 */  nop
/* 2805C 00127F5C 0B000045 */  bc1f       .L00127F8C
/* 28060 00127F60 00000000 */   nop
/* 28064 00127F64 140280C4 */  lwc1       $f0, 0x214($4)
/* 28068 00127F68 32000D46 */  c.eq.s     $f0, $f13
/* 2806C 00127F6C 00000000 */  nop
/* 28070 00127F70 06000045 */  bc1f       .L00127F8C
/* 28074 00127F74 00000000 */   nop
/* 28078 00127F78 180280C4 */  lwc1       $f0, 0x218($4)
/* 2807C 00127F7C 32000E46 */  c.eq.s     $f0, $f14
/* 28080 00127F80 00000000 */  nop
/* 28084 00127F84 05000145 */  bc1t       .L00127F9C
/* 28088 00127F88 00000000 */   nop
.L00127F8C:
/* 2808C 00127F8C 10028CE4 */  swc1       $f12, 0x210($4)
/* 28090 00127F90 14028DE4 */  swc1       $f13, 0x214($4)
/* 28094 00127F94 18028EE4 */  swc1       $f14, 0x218($4)
/* 28098 00127F98 400280AC */  sw         $0, 0x240($4)
.L00127F9C:
/* 2809C 00127F9C 0800E003 */  jr         $31
/* 280A0 00127FA0 00000000 */   nop
/* 280A4 00127FA4 00000000 */  nop
/* 280A8 00127FA8 00000000 */  nop
/* 280AC 00127FAC 00000000 */  nop
