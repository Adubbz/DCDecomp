.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__13CHitPointMarkFv
/* B3710 001B3610 90FFBD27 */  addiu      $sp, $sp, -0x70
/* B3714 001B3614 1000BF7F */  sq         $31, 0x10($sp)
/* B3718 001B3618 0000B07F */  sq         $16, 0x0($sp)
/* B371C 001B361C 28868070 */  paddub     $16, $4, $0
/* B3720 001B3620 1800838C */  lw         $3, 0x18($4)
/* B3724 001B3624 34006010 */  beqz       $3, .L001B36F8
/* B3728 001B3628 00000000 */   nop
/* B372C 001B362C 2040023C */  lui        $2, (0x40200000 >> 16)
/* B3730 001B3630 00688244 */  mtc1       $2, $f13
/* B3734 001B3634 A040023C */  lui        $2, (0x40A00000 >> 16)
/* B3738 001B3638 00608244 */  mtc1       $2, $f12
/* B373C 001B363C 2000A427 */  addiu      $4, $sp, 0x20
/* B3740 001B3640 5000A527 */  addiu      $5, $sp, 0x50
/* B3744 001B3644 28360072 */  paddub     $6, $16, $0
/* B3748 001B3648 283E0070 */  paddub     $7, $0, $0
/* B374C 001B364C D0B9040C */  jal        MGRotTransPers3DSprite__FPiPiPfffi
/* B3750 001B3650 00000000 */   nop
/* B3754 001B3654 01000424 */  addiu      $4, $0, 0x1
/* B3758 001B3658 27004414 */  bne        $2, $4, .L001B36F8
/* B375C 001B365C 00000000 */   nop
/* B3760 001B3660 1400038E */  lw         $3, 0x14($16)
/* B3764 001B3664 24006414 */  bne        $3, $4, .L001B36F8
/* B3768 001B3668 00000000 */   nop
/* B376C 001B366C 5000A28F */  lw         $2, 0x50($sp)
/* B3770 001B3670 3000A2AF */  sw         $2, 0x30($sp)
/* B3774 001B3674 2400A28F */  lw         $2, 0x24($sp)
/* B3778 001B3678 3400A2AF */  sw         $2, 0x34($sp)
/* B377C 001B367C 2800A28F */  lw         $2, 0x28($sp)
/* B3780 001B3680 3800A2AF */  sw         $2, 0x38($sp)
/* B3784 001B3684 2000A28F */  lw         $2, 0x20($sp)
/* B3788 001B3688 4000A2AF */  sw         $2, 0x40($sp)
/* B378C 001B368C 5400A28F */  lw         $2, 0x54($sp)
/* B3790 001B3690 4400A2AF */  sw         $2, 0x44($sp)
/* B3794 001B3694 5800A28F */  lw         $2, 0x58($sp)
/* B3798 001B3698 4800A2AF */  sw         $2, 0x48($sp)
/* B379C 001B369C 6000A0AF */  sw         $0, 0x60($sp)
/* B37A0 001B36A0 20000224 */  addiu      $2, $0, 0x20
/* B37A4 001B36A4 6400A2AF */  sw         $2, 0x64($sp)
/* B37A8 001B36A8 30000224 */  addiu      $2, $0, 0x30
/* B37AC 001B36AC 6800A2AF */  sw         $2, 0x68($sp)
/* B37B0 001B36B0 6C00A2AF */  sw         $2, 0x6C($sp)
/* B37B4 001B36B4 C701023C */  lui        $2, %hi(TexManager)
/* B37B8 001B36B8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* B37BC 001B36BC 2A00023C */  lui        $2, %hi(_1430)
/* B37C0 001B36C0 F8B64524 */  addiu      $5, $2, %lo(_1430)
/* B37C4 001B36C4 FFFF0624 */  addiu      $6, $0, -0x1
/* B37C8 001B36C8 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* B37CC 001B36CC 00000000 */   nop
/* B37D0 001B36D0 D48B848F */  lw         $4, -0x742C($gp)
/* B37D4 001B36D4 282E4070 */  paddub     $5, $2, $0
/* B37D8 001B36D8 6000A627 */  addiu      $6, $sp, 0x60
/* B37DC 001B36DC 2000A727 */  addiu      $7, $sp, 0x20
/* B37E0 001B36E0 3000A827 */  addiu      $8, $sp, 0x30
/* B37E4 001B36E4 4000A927 */  addiu      $9, $sp, 0x40
/* B37E8 001B36E8 5000AA27 */  addiu      $10, $sp, 0x50
/* B37EC 001B36EC 80000B24 */  addiu      $11, $0, 0x80
/* B37F0 001B36F0 1C75050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* B37F4 001B36F4 00000000 */   nop
.L001B36F8:
/* B37F8 001B36F8 1000BF7B */  lq         $31, 0x10($sp)
/* B37FC 001B36FC 0000B07B */  lq         $16, 0x0($sp)
/* B3800 001B3700 7000BD27 */  addiu      $sp, $sp, 0x70
/* B3804 001B3704 0800E003 */  jr         $31
/* B3808 001B3708 00000000 */   nop
/* B380C 001B370C 00000000 */  nop
