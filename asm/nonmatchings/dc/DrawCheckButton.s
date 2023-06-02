.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawCheckButton__Fiii
/* EC8D0 001EC7D0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* EC8D4 001EC7D4 0000BF7F */  sq         $31, 0x0($sp)
/* EC8D8 001EC7D8 283EC070 */  paddub     $7, $6, $0
/* EC8DC 001EC7DC 30010624 */  addiu      $6, $0, 0x130
/* EC8E0 001EC7E0 D901013C */  lui        $at, (0x1D90250 >> 16)
/* EC8E4 001EC7E4 50022384 */  lh         $3, (0x1D90250 & 0xFFFF)($at)
/* EC8E8 001EC7E8 1A000224 */  addiu      $2, $0, 0x1A
/* EC8EC 001EC7EC 03006210 */  beq        $3, $2, .L001EC7FC
/* EC8F0 001EC7F0 00000000 */   nop
/* EC8F4 001EC7F4 09000010 */  b          .L001EC81C
/* EC8F8 001EC7F8 00000000 */   nop
.L001EC7FC:
/* EC8FC 001EC7FC 90010624 */  addiu      $6, $0, 0x190
/* EC900 001EC800 D901013C */  lui        $at, (0x1D90254 >> 16)
/* EC904 001EC804 5402228C */  lw         $2, (0x1D90254 & 0xFFFF)($at)
/* EC908 001EC808 09004128 */  slti       $at, $2, 0x9
/* EC90C 001EC80C 03002014 */  bnez       $at, .L001EC81C
/* EC910 001EC810 00000000 */   nop
/* EC914 001EC814 D901013C */  lui        $at, (0x1D90250 >> 16)
/* EC918 001EC818 500220A4 */  sh         $0, (0x1D90250 & 0xFFFF)($at)
.L001EC81C:
/* EC91C 001EC81C 2000A6AF */  sw         $6, 0x20($sp)
/* EC920 001EC820 90000224 */  addiu      $2, $0, 0x90
/* EC924 001EC824 2400A2AF */  sw         $2, 0x24($sp)
/* EC928 001EC828 60000324 */  addiu      $3, $0, 0x60
/* EC92C 001EC82C 2800A3AF */  sw         $3, 0x28($sp)
/* EC930 001EC830 20000224 */  addiu      $2, $0, 0x20
/* EC934 001EC834 2C00A2AF */  sw         $2, 0x2C($sp)
/* EC938 001EC838 1000A4AF */  sw         $4, 0x10($sp)
/* EC93C 001EC83C 1400A5AF */  sw         $5, 0x14($sp)
/* EC940 001EC840 1800A3AF */  sw         $3, 0x18($sp)
/* EC944 001EC844 1C00A2AF */  sw         $2, 0x1C($sp)
/* EC948 001EC848 8894848F */  lw         $4, -0x6B78($gp)
/* EC94C 001EC84C 1000A527 */  addiu      $5, $sp, 0x10
/* EC950 001EC850 2000A627 */  addiu      $6, $sp, 0x20
/* EC954 001EC854 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* EC958 001EC858 00000000 */   nop
/* EC95C 001EC85C 0000BF7B */  lq         $31, 0x0($sp)
/* EC960 001EC860 3000BD27 */  addiu      $sp, $sp, 0x30
/* EC964 001EC864 0800E003 */  jr         $31
/* EC968 001EC868 00000000 */   nop
/* EC96C 001EC86C 00000000 */  nop
