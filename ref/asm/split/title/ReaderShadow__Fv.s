.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ReaderShadow__Fv
/* 00BA60 01DB7760 B0FFBD27 */  addiu       $29, $29, -0x50
/* 00BA64 01DB7764 0000BF7F */  sq          $31, 0x0($29)
/* 00BA68 01DB7768 C701023C */  lui         $2, %hi(TexManager)
/* 00BA6C 01DB776C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00BA70 01DB7770 D48B858F */  lw          $5, -0x742C($28)
/* 00BA74 01DB7774 06000624 */  addiu       $6, $0, 0x6
/* 00BA78 01DB7778 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 00BA7C 01DB777C 00000000 */   nop
/* 00BA80 01DB7780 DF01013C */  lui         $1, %hi(UraEventMan + 0xB0C)
/* 00BA84 01DB7784 BC69248C */  lw          $4, %lo(UraEventMan + 0xB0C)($1)
/* 00BA88 01DB7788 DE01023C */  lui         $2, %hi(LIT_885__3)
/* 00BA8C 01DB778C 10DF4524 */  addiu       $5, $2, %lo(LIT_885__3)
/* 00BA90 01DB7790 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00BA94 01DB7794 00000000 */   nop
/* 00BA98 01DB7798 28264070 */  paddub      $4, $2, $0
/* 00BA9C 01DB779C 09008010 */  beqz        $4, .L01DB77C4_2BCFC4
/* 00BAA0 01DB77A0 00000000 */   nop
/* 00BAA4 01DB77A4 1000A527 */  addiu       $5, $29, 0x10
/* 00BAA8 01DB77A8 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 00BAAC 01DB77AC 00000000 */   nop
/* 00BAB0 01DB77B0 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 00BAB4 01DB77B4 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 00BAB8 01DB77B8 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 00BABC 01DB77BC A0DE760C */  jal         DrawShadow__Ffff
/* 00BAC0 01DB77C0 00000000 */   nop
.L01DB77C4_2BCFC4:
/* 00BAC4 01DB77C4 DF01013C */  lui         $1, %hi(UraEventMan + 0xB0C)
/* 00BAC8 01DB77C8 BC69248C */  lw          $4, %lo(UraEventMan + 0xB0C)($1)
/* 00BACC 01DB77CC DE01023C */  lui         $2, %hi(LIT_886__5)
/* 00BAD0 01DB77D0 18DF4524 */  addiu       $5, $2, %lo(LIT_886__5)
/* 00BAD4 01DB77D4 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00BAD8 01DB77D8 00000000 */   nop
/* 00BADC 01DB77DC 28264070 */  paddub      $4, $2, $0
/* 00BAE0 01DB77E0 09008010 */  beqz        $4, .L01DB7808_2BD008
/* 00BAE4 01DB77E4 00000000 */   nop
/* 00BAE8 01DB77E8 1000A527 */  addiu       $5, $29, 0x10
/* 00BAEC 01DB77EC 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 00BAF0 01DB77F0 00000000 */   nop
/* 00BAF4 01DB77F4 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 00BAF8 01DB77F8 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 00BAFC 01DB77FC 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 00BB00 01DB7800 A0DE760C */  jal         DrawShadow__Ffff
/* 00BB04 01DB7804 00000000 */   nop
.L01DB7808_2BD008:
/* 00BB08 01DB7808 0000BF7B */  lq          $31, 0x0($29)
/* 00BB0C 01DB780C 5000BD27 */  addiu       $29, $29, 0x50
/* 00BB10 01DB7810 0800E003 */  jr          $31
/* 00BB14 01DB7814 00000000 */   nop
/* 00BB18 01DB7818 00000000 */  nop
/* 00BB1C 01DB781C 00000000 */  nop
