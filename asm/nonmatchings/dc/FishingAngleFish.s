.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingAngleFish__Fi
/* A98B0 001A97B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A98B4 001A97B4 1000BF7F */  sq         $31, 0x10($sp)
/* A98B8 001A97B8 0000B07F */  sq         $16, 0x0($sp)
/* A98BC 001A97BC 6C9380AF */  sw         $0, -0x6C94($gp)
/* A98C0 001A97C0 16008004 */  bltz       $4, .L001A981C
/* A98C4 001A97C4 00000000 */   nop
/* A98C8 001A97C8 06008128 */  slti       $at, $4, 0x6
/* A98CC 001A97CC 13002010 */  beqz       $at, .L001A981C
/* A98D0 001A97D0 00000000 */   nop
/* A98D4 001A97D4 C0180400 */  sll        $3, $4, 3
/* A98D8 001A97D8 21186400 */  addu       $3, $3, $4
/* A98DC 001A97DC 80190300 */  sll        $3, $3, 6
/* A98E0 001A97E0 21186400 */  addu       $3, $3, $4
/* A98E4 001A97E4 00810300 */  sll        $16, $3, 4
/* A98E8 001A97E8 6893838F */  lw         $3, -0x6C98($gp)
/* A98EC 001A97EC 21207000 */  addu       $4, $3, $16
/* A98F0 001A97F0 5000858C */  lw         $5, 0x50($4)
/* A98F4 001A97F4 08000324 */  addiu      $3, $0, 0x8
/* A98F8 001A97F8 0800A314 */  bne        $5, $3, .L001A981C
/* A98FC 001A97FC 00000000 */   nop
/* A9900 001A9800 6C9384AF */  sw         $4, -0x6C94($gp)
/* A9904 001A9804 4803090C */  jal        SetAngleMode__5CFishFv
/* A9908 001A9808 00000000 */   nop
/* A990C 001A980C 6893838F */  lw         $3, -0x6C98($gp)
/* A9910 001A9810 21207000 */  addu       $4, $3, $16
/* A9914 001A9814 01000324 */  addiu      $3, $0, 0x1
/* A9918 001A9818 5C0083AC */  sw         $3, 0x5C($4)
.L001A981C:
/* A991C 001A981C 1000BF7B */  lq         $31, 0x10($sp)
/* A9920 001A9820 0000B07B */  lq         $16, 0x0($sp)
/* A9924 001A9824 2000BD27 */  addiu      $sp, $sp, 0x20
/* A9928 001A9828 0800E003 */  jr         $31
/* A992C 001A982C 00000000 */   nop
