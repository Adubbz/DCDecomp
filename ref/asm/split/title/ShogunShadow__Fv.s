.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ShogunShadow__Fv
/* 00BBE0 01DB78E0 80FFBD27 */  addiu       $29, $29, -0x80
/* 00BBE4 01DB78E4 3000BF7F */  sq          $31, 0x30($29)
/* 00BBE8 01DB78E8 2000B27F */  sq          $18, 0x20($29)
/* 00BBEC 01DB78EC 1000B17F */  sq          $17, 0x10($29)
/* 00BBF0 01DB78F0 0000B07F */  sq          $16, 0x0($29)
/* 00BBF4 01DB78F4 C701023C */  lui         $2, %hi(TexManager)
/* 00BBF8 01DB78F8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00BBFC 01DB78FC D48B858F */  lw          $5, -0x742C($28)
/* 00BC00 01DB7900 06000624 */  addiu       $6, $0, 0x6
/* 00BC04 01DB7904 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 00BC08 01DB7908 00000000 */   nop
/* 00BC0C 01DB790C DF01013C */  lui         $1, %hi(Chara__3 + 0x35CC)
/* 00BC10 01DB7910 AC34248C */  lw          $4, %lo(Chara__3 + 0x35CC)($1)
/* 00BC14 01DB7914 DE01023C */  lui         $2, %hi(LIT_897)
/* 00BC18 01DB7918 30DF4524 */  addiu       $5, $2, %lo(LIT_897)
/* 00BC1C 01DB791C C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00BC20 01DB7920 00000000 */   nop
/* 00BC24 01DB7924 28264070 */  paddub      $4, $2, $0
/* 00BC28 01DB7928 4000A527 */  addiu       $5, $29, 0x40
/* 00BC2C 01DB792C 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 00BC30 01DB7930 00000000 */   nop
/* 00BC34 01DB7934 7000B227 */  addiu       $18, $29, 0x70
/* 00BC38 01DB7938 00004CC6 */  lwc1        $f12, 0x0($18)
/* 00BC3C 01DB793C 7400B127 */  addiu       $17, $29, 0x74
/* 00BC40 01DB7940 00002DC6 */  lwc1        $f13, 0x0($17)
/* 00BC44 01DB7944 7800B027 */  addiu       $16, $29, 0x78
/* 00BC48 01DB7948 00000EC6 */  lwc1        $f14, 0x0($16)
/* 00BC4C 01DB794C A0DE760C */  jal         DrawShadow__Ffff
/* 00BC50 01DB7950 00000000 */   nop
/* 00BC54 01DB7954 DF01013C */  lui         $1, %hi(Chara__3 + 0x35CC)
/* 00BC58 01DB7958 AC34248C */  lw          $4, %lo(Chara__3 + 0x35CC)($1)
/* 00BC5C 01DB795C DE01023C */  lui         $2, %hi(LIT_898)
/* 00BC60 01DB7960 38DF4524 */  addiu       $5, $2, %lo(LIT_898)
/* 00BC64 01DB7964 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00BC68 01DB7968 00000000 */   nop
/* 00BC6C 01DB796C 28264070 */  paddub      $4, $2, $0
/* 00BC70 01DB7970 4000A527 */  addiu       $5, $29, 0x40
/* 00BC74 01DB7974 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 00BC78 01DB7978 00000000 */   nop
/* 00BC7C 01DB797C 00004CC6 */  lwc1        $f12, 0x0($18)
/* 00BC80 01DB7980 00002DC6 */  lwc1        $f13, 0x0($17)
/* 00BC84 01DB7984 00000EC6 */  lwc1        $f14, 0x0($16)
/* 00BC88 01DB7988 A0DE760C */  jal         DrawShadow__Ffff
/* 00BC8C 01DB798C 00000000 */   nop
/* 00BC90 01DB7990 3000BF7B */  lq          $31, 0x30($29)
/* 00BC94 01DB7994 2000B27B */  lq          $18, 0x20($29)
/* 00BC98 01DB7998 1000B17B */  lq          $17, 0x10($29)
/* 00BC9C 01DB799C 0000B07B */  lq          $16, 0x0($29)
/* 00BCA0 01DB79A0 8000BD27 */  addiu       $29, $29, 0x80
/* 00BCA4 01DB79A4 0800E003 */  jr          $31
/* 00BCA8 01DB79A8 00000000 */   nop
/* 00BCAC 01DB79AC 00000000 */  nop
