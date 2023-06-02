.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetItemShopTalkMode__Fii
/* E72D0 001E71D0 03008004 */  bltz       $4, .L001E71E0
/* E72D4 001E71D4 00000000 */   nop
/* E72D8 001E71D8 D901013C */  lui        $at, (0x1D90250 >> 16)
/* E72DC 001E71DC 500224A4 */  sh         $4, (0x1D90250 & 0xFFFF)($at)
.L001E71E0:
/* E72E0 001E71E0 0300A004 */  bltz       $5, .L001E71F0
/* E72E4 001E71E4 00000000 */   nop
/* E72E8 001E71E8 D901013C */  lui        $at, (0x1D9026A >> 16)
/* E72EC 001E71EC 6A0225A4 */  sh         $5, (0x1D9026A & 0xFFFF)($at)
.L001E71F0:
/* E72F0 001E71F0 D901013C */  lui        $at, (0x1D9026A >> 16)
/* E72F4 001E71F4 6A022484 */  lh         $4, (0x1D9026A & 0xFFFF)($at)
/* E72F8 001E71F8 01000324 */  addiu      $3, $0, 0x1
/* E72FC 001E71FC 06008314 */  bne        $4, $3, .L001E7218
/* E7300 001E7200 00000000 */   nop
/* E7304 001E7204 FFFF0324 */  addiu      $3, $0, -0x1
/* E7308 001E7208 DA01013C */  lui        $at, (0x1DA51CC >> 16)
/* E730C 001E720C CC5123AC */  sw         $3, (0x1DA51CC & 0xFFFF)($at)
/* E7310 001E7210 D901013C */  lui        $at, (0x1D9026E >> 16)
/* E7314 001E7214 6E0223A4 */  sh         $3, (0x1D9026E & 0xFFFF)($at)
.L001E7218:
/* E7318 001E7218 0800E003 */  jr         $31
/* E731C 001E721C 00000000 */   nop
