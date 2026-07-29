.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishingInit__Fv
/* 0A9170 001A9070 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0A9174 001A9074 0000BF7F */  sq          $31, 0x0($29)
/* 0A9178 001A9078 389380AF */  sw          $0, -0x6CC8($28)
/* 0A917C 001A907C 3C9380AF */  sw          $0, -0x6CC4($28)
/* 0A9180 001A9080 549380AF */  sw          $0, -0x6CAC($28)
/* 0A9184 001A9084 589380AF */  sw          $0, -0x6CA8($28)
/* 0A9188 001A9088 4C9380AF */  sw          $0, -0x6CB4($28)
/* 0A918C 001A908C FFFF0224 */  addiu       $2, $0, -0x1
/* 0A9190 001A9090 509382AF */  sw          $2, -0x6CB0($28)
/* 0A9194 001A9094 D501023C */  lui         $2, %hi(UkiFrameTop)
/* 0A9198 001A9098 104A4424 */  addiu       $4, $2, %lo(UkiFrameTop)
/* 0A919C 001A909C 8CA8040C */  jal         Initialize__9CFrameVu1Fv
/* 0A91A0 001A90A0 00000000 */   nop
/* 0A91A4 001A90A4 D501023C */  lui         $2, %hi(Rod)
/* 0A91A8 001A90A8 804C4424 */  addiu       $4, $2, %lo(Rod)
/* 0A91AC 001A90AC 74E6040C */  jal         Initialize__10CCharacterFv
/* 0A91B0 001A90B0 00000000 */   nop
/* 0A91B4 001A90B4 9DFF0324 */  addiu       $3, $0, -0x63
/* 0A91B8 001A90B8 649383AF */  sw          $3, -0x6C9C($28)
/* 0A91BC 001A90BC 609383AF */  sw          $3, -0x6CA0($28)
/* 0A91C0 001A90C0 5C9383AF */  sw          $3, -0x6CA4($28)
/* 0A91C4 001A90C4 689380AF */  sw          $0, -0x6C98($28)
/* 0A91C8 001A90C8 749380AF */  sw          $0, -0x6C8C($28)
/* 0A91CC 001A90CC 6C9380AF */  sw          $0, -0x6C94($28)
/* 0A91D0 001A90D0 709380AF */  sw          $0, -0x6C90($28)
/* 0A91D4 001A90D4 789380AF */  sw          $0, -0x6C88($28)
/* 0A91D8 001A90D8 7C9380AF */  sw          $0, -0x6C84($28)
/* 0A91DC 001A90DC 0000BF7B */  lq          $31, 0x0($29)
/* 0A91E0 001A90E0 1000BD27 */  addiu       $29, $29, 0x10
/* 0A91E4 001A90E4 0800E003 */  jr          $31
/* 0A91E8 001A90E8 00000000 */   nop
/* 0A91EC 001A90EC 00000000 */  nop
