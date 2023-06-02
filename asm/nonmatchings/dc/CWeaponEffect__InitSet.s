.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitSet__13CWeaponEffectFP6CFramePcPc
/* D66C0 001D65C0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* D66C4 001D65C4 3000BF7F */  sq         $31, 0x30($sp)
/* D66C8 001D65C8 2000B27F */  sq         $18, 0x20($sp)
/* D66CC 001D65CC 1000B17F */  sq         $17, 0x10($sp)
/* D66D0 001D65D0 0000B07F */  sq         $16, 0x0($sp)
/* D66D4 001D65D4 28968070 */  paddub     $18, $4, $0
/* D66D8 001D65D8 288EA070 */  paddub     $17, $5, $0
/* D66DC 001D65DC 2886E070 */  paddub     $16, $7, $0
/* D66E0 001D65E0 040080AC */  sw         $0, 0x4($4)
/* D66E4 001D65E4 000080AC */  sw         $0, 0x0($4)
/* D66E8 001D65E8 0B002012 */  beqz       $17, .L001D6618
/* D66EC 001D65EC 00000000 */   nop
/* D66F0 001D65F0 28262072 */  paddub     $4, $17, $0
/* D66F4 001D65F4 282EC070 */  paddub     $5, $6, $0
/* D66F8 001D65F8 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* D66FC 001D65FC 00000000 */   nop
/* D6700 001D6600 000042AE */  sw         $2, 0x0($18)
/* D6704 001D6604 28262072 */  paddub     $4, $17, $0
/* D6708 001D6608 282E0072 */  paddub     $5, $16, $0
/* D670C 001D660C C0A1040C */  jal        SearchFrame__6CFrameFPc
/* D6710 001D6610 00000000 */   nop
/* D6714 001D6614 040042AE */  sw         $2, 0x4($18)
.L001D6618:
/* D6718 001D6618 3000BF7B */  lq         $31, 0x30($sp)
/* D671C 001D661C 2000B27B */  lq         $18, 0x20($sp)
/* D6720 001D6620 1000B17B */  lq         $17, 0x10($sp)
/* D6724 001D6624 0000B07B */  lq         $16, 0x0($sp)
/* D6728 001D6628 4000BD27 */  addiu      $sp, $sp, 0x40
/* D672C 001D662C 0800E003 */  jr         $31
/* D6730 001D6630 00000000 */   nop
/* D6734 001D6634 00000000 */  nop
/* D6738 001D6638 00000000 */  nop
/* D673C 001D663C 00000000 */  nop
