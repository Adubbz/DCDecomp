.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetPosition__6CFrameFfff
/* 027F80 00127E80 01000324 */  addiu       $3, $0, 0x1
/* 027F84 00127E84 4C0283AC */  sw          $3, 0x24C($4)
/* 027F88 00127E88 200280C4 */  lwc1        $f0, 0x220($4)
/* 027F8C 00127E8C 32000C46 */  c.eq.s      $f0, $f12
/* 027F90 00127E90 00000000 */  nop
/* 027F94 00127E94 0B000045 */  bc1f        .L00127EC4
/* 027F98 00127E98 00000000 */   nop
/* 027F9C 00127E9C 240280C4 */  lwc1        $f0, 0x224($4)
/* 027FA0 00127EA0 32000D46 */  c.eq.s      $f0, $f13
/* 027FA4 00127EA4 00000000 */  nop
/* 027FA8 00127EA8 06000045 */  bc1f        .L00127EC4
/* 027FAC 00127EAC 00000000 */   nop
/* 027FB0 00127EB0 280280C4 */  lwc1        $f0, 0x228($4)
/* 027FB4 00127EB4 32000E46 */  c.eq.s      $f0, $f14
/* 027FB8 00127EB8 00000000 */  nop
/* 027FBC 00127EBC 05000145 */  bc1t        .L00127ED4
/* 027FC0 00127EC0 00000000 */   nop
.L00127EC4:
/* 027FC4 00127EC4 20028CE4 */  swc1        $f12, 0x220($4)
/* 027FC8 00127EC8 24028DE4 */  swc1        $f13, 0x224($4)
/* 027FCC 00127ECC 28028EE4 */  swc1        $f14, 0x228($4)
/* 027FD0 00127ED0 400280AC */  sw          $0, 0x240($4)
.L00127ED4:
/* 027FD4 00127ED4 0800E003 */  jr          $31
/* 027FD8 00127ED8 00000000 */   nop
/* 027FDC 00127EDC 00000000 */  nop
