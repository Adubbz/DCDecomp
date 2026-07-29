.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishingAngleFish__Fi
/* 0A98B0 001A97B0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0A98B4 001A97B4 1000BF7F */  sq          $31, 0x10($29)
/* 0A98B8 001A97B8 0000B07F */  sq          $16, 0x0($29)
/* 0A98BC 001A97BC 6C9380AF */  sw          $0, -0x6C94($28)
/* 0A98C0 001A97C0 16008004 */  bltz        $4, .L001A981C
/* 0A98C4 001A97C4 00000000 */   nop
/* 0A98C8 001A97C8 06008128 */  slti        $1, $4, 0x6
/* 0A98CC 001A97CC 13002010 */  beqz        $1, .L001A981C
/* 0A98D0 001A97D0 00000000 */   nop
/* 0A98D4 001A97D4 C0180400 */  sll         $3, $4, 3
/* 0A98D8 001A97D8 21186400 */  addu        $3, $3, $4
/* 0A98DC 001A97DC 80190300 */  sll         $3, $3, 6
/* 0A98E0 001A97E0 21186400 */  addu        $3, $3, $4
/* 0A98E4 001A97E4 00810300 */  sll         $16, $3, 4
/* 0A98E8 001A97E8 6893838F */  lw          $3, -0x6C98($28)
/* 0A98EC 001A97EC 21207000 */  addu        $4, $3, $16
/* 0A98F0 001A97F0 5000858C */  lw          $5, 0x50($4)
/* 0A98F4 001A97F4 08000324 */  addiu       $3, $0, 0x8
/* 0A98F8 001A97F8 0800A314 */  bne         $5, $3, .L001A981C
/* 0A98FC 001A97FC 00000000 */   nop
/* 0A9900 001A9800 6C9384AF */  sw          $4, -0x6C94($28)
/* 0A9904 001A9804 4803090C */  jal         SetAngleMode__5CFishFv
/* 0A9908 001A9808 00000000 */   nop
/* 0A990C 001A980C 6893838F */  lw          $3, -0x6C98($28)
/* 0A9910 001A9810 21207000 */  addu        $4, $3, $16
/* 0A9914 001A9814 01000324 */  addiu       $3, $0, 0x1
/* 0A9918 001A9818 5C0083AC */  sw          $3, 0x5C($4)
.L001A981C:
/* 0A991C 001A981C 1000BF7B */  lq          $31, 0x10($29)
/* 0A9920 001A9820 0000B07B */  lq          $16, 0x0($29)
/* 0A9924 001A9824 2000BD27 */  addiu       $29, $29, 0x20
/* 0A9928 001A9828 0800E003 */  jr          $31
/* 0A992C 001A982C 00000000 */   nop
