.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawWeaponNameBoard__Fiiiii
/* F9680 001F9580 70FFBD27 */  addiu      $sp, $sp, -0x90
/* F9684 001F9584 2000BF7F */  sq         $31, 0x20($sp)
/* F9688 001F9588 1000B17F */  sq         $17, 0x10($sp)
/* F968C 001F958C 0000B07F */  sq         $16, 0x0($sp)
/* F9690 001F9590 288EE070 */  paddub     $17, $7, $0
/* F9694 001F9594 28860071 */  paddub     $16, $8, $0
/* F9698 001F9598 3000A4AF */  sw         $4, 0x30($sp)
/* F969C 001F959C 0100A324 */  addiu      $3, $5, 0x1
/* F96A0 001F95A0 3400A3AF */  sw         $3, 0x34($sp)
/* F96A4 001F95A4 28000624 */  addiu      $6, $0, 0x28
/* F96A8 001F95A8 3800A6AF */  sw         $6, 0x38($sp)
/* F96AC 001F95AC 1F000524 */  addiu      $5, $0, 0x1F
/* F96B0 001F95B0 3C00A5AF */  sw         $5, 0x3C($sp)
/* F96B4 001F95B4 28008224 */  addiu      $2, $4, 0x28
/* F96B8 001F95B8 4000A2AF */  sw         $2, 0x40($sp)
/* F96BC 001F95BC 4400A3AF */  sw         $3, 0x44($sp)
/* F96C0 001F95C0 99000224 */  addiu      $2, $0, 0x99
/* F96C4 001F95C4 4800A2AF */  sw         $2, 0x48($sp)
/* F96C8 001F95C8 4C00A5AF */  sw         $5, 0x4C($sp)
/* F96CC 001F95CC AC008224 */  addiu      $2, $4, 0xAC
/* F96D0 001F95D0 5000A2AF */  sw         $2, 0x50($sp)
/* F96D4 001F95D4 5400A3AF */  sw         $3, 0x54($sp)
/* F96D8 001F95D8 20000324 */  addiu      $3, $0, 0x20
/* F96DC 001F95DC 5800A3AF */  sw         $3, 0x58($sp)
/* F96E0 001F95E0 5C00A5AF */  sw         $5, 0x5C($sp)
/* F96E4 001F95E4 E0000224 */  addiu      $2, $0, 0xE0
/* F96E8 001F95E8 6000A2AF */  sw         $2, 0x60($sp)
/* F96EC 001F95EC A8010224 */  addiu      $2, $0, 0x1A8
/* F96F0 001F95F0 6400A2AF */  sw         $2, 0x64($sp)
/* F96F4 001F95F4 6800A6AF */  sw         $6, 0x68($sp)
/* F96F8 001F95F8 6C00A3AF */  sw         $3, 0x6C($sp)
/* F96FC 001F95FC FF000731 */  andi       $7, $8, 0xFF
/* F9700 001F9600 FF000831 */  andi       $8, $8, 0xFF
/* F9704 001F9604 284EE070 */  paddub     $9, $7, $0
/* F9708 001F9608 2C95848F */  lw         $4, -0x6AD4($gp)
/* F970C 001F960C 3000A527 */  addiu      $5, $sp, 0x30
/* F9710 001F9610 6000A627 */  addiu      $6, $sp, 0x60
/* F9714 001F9614 28562072 */  paddub     $10, $17, $0
/* F9718 001F9618 E4B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci
/* F971C 001F961C 00000000 */   nop
/* F9720 001F9620 08010224 */  addiu      $2, $0, 0x108
/* F9724 001F9624 7000A2AF */  sw         $2, 0x70($sp)
/* F9728 001F9628 A8010224 */  addiu      $2, $0, 0x1A8
/* F972C 001F962C 7400A2AF */  sw         $2, 0x74($sp)
/* F9730 001F9630 78000224 */  addiu      $2, $0, 0x78
/* F9734 001F9634 7800A2AF */  sw         $2, 0x78($sp)
/* F9738 001F9638 20000224 */  addiu      $2, $0, 0x20
/* F973C 001F963C 7C00A2AF */  sw         $2, 0x7C($sp)
/* F9740 001F9640 FF000732 */  andi       $7, $16, 0xFF
/* F9744 001F9644 2846E070 */  paddub     $8, $7, $0
/* F9748 001F9648 284EE070 */  paddub     $9, $7, $0
/* F974C 001F964C 2C95848F */  lw         $4, -0x6AD4($gp)
/* F9750 001F9650 4000A527 */  addiu      $5, $sp, 0x40
/* F9754 001F9654 7000A627 */  addiu      $6, $sp, 0x70
/* F9758 001F9658 28562072 */  paddub     $10, $17, $0
/* F975C 001F965C E4B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci
/* F9760 001F9660 00000000 */   nop
/* F9764 001F9664 D4000224 */  addiu      $2, $0, 0xD4
/* F9768 001F9668 8000A2AF */  sw         $2, 0x80($sp)
/* F976C 001F966C D4010224 */  addiu      $2, $0, 0x1D4
/* F9770 001F9670 8400A2AF */  sw         $2, 0x84($sp)
/* F9774 001F9674 20000224 */  addiu      $2, $0, 0x20
/* F9778 001F9678 8800A2AF */  sw         $2, 0x88($sp)
/* F977C 001F967C 8C00A2AF */  sw         $2, 0x8C($sp)
/* F9780 001F9680 FF000732 */  andi       $7, $16, 0xFF
/* F9784 001F9684 2846E070 */  paddub     $8, $7, $0
/* F9788 001F9688 284EE070 */  paddub     $9, $7, $0
/* F978C 001F968C 2C95848F */  lw         $4, -0x6AD4($gp)
/* F9790 001F9690 5000A527 */  addiu      $5, $sp, 0x50
/* F9794 001F9694 8000A627 */  addiu      $6, $sp, 0x80
/* F9798 001F9698 28562072 */  paddub     $10, $17, $0
/* F979C 001F969C E4B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci
/* F97A0 001F96A0 00000000 */   nop
/* F97A4 001F96A4 2000BF7B */  lq         $31, 0x20($sp)
/* F97A8 001F96A8 1000B17B */  lq         $17, 0x10($sp)
/* F97AC 001F96AC 0000B07B */  lq         $16, 0x0($sp)
/* F97B0 001F96B0 9000BD27 */  addiu      $sp, $sp, 0x90
/* F97B4 001F96B4 0800E003 */  jr         $31
/* F97B8 001F96B8 00000000 */   nop
/* F97BC 001F96BC 00000000 */  nop
