.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishingLoad__FP14CDataAlloc2_1_i
/* 0A88E0 001A87E0 70FFBD27 */  addiu       $29, $29, -0x90
/* 0A88E4 001A87E4 2000BF7F */  sq          $31, 0x20($29)
/* 0A88E8 001A87E8 1000B17F */  sq          $17, 0x10($29)
/* 0A88EC 001A87EC 0000B07F */  sq          $16, 0x0($29)
/* 0A88F0 001A87F0 288E8070 */  paddub      $17, $4, $0
/* 0A88F4 001A87F4 2886A070 */  paddub      $16, $5, $0
/* 0A88F8 001A87F8 2A00023C */  lui         $2, %hi(LIT_353__4)
/* 0A88FC 001A87FC 70B44424 */  addiu       $4, $2, %lo(LIT_353__4)
/* 0A8900 001A8800 948B858F */  lw          $5, -0x746C($28)
/* 0A8904 001A8804 28360070 */  paddub      $6, $0, $0
/* 0A8908 001A8808 D8FC040C */  jal         LoadFile__FPcPvPi
/* 0A890C 001A880C 00000000 */   nop
/* 0A8910 001A8810 5C9390AF */  sw          $16, -0x6CA4($28)
/* 0A8914 001A8814 948B848F */  lw          $4, -0x746C($28)
/* 0A8918 001A8818 2A00023C */  lui         $2, %hi(LIT_354__2)
/* 0A891C 001A881C 88B44524 */  addiu       $5, $2, %lo(LIT_354__2)
/* 0A8920 001A8820 28360070 */  paddub      $6, $0, $0
/* 0A8924 001A8824 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0A8928 001A8828 00000000 */   nop
/* 0A892C 001A882C 28264070 */  paddub      $4, $2, $0
/* 0A8930 001A8830 282E2072 */  paddub      $5, $17, $0
/* 0A8934 001A8834 28360070 */  paddub      $6, $0, $0
/* 0A8938 001A8838 283E0070 */  paddub      $7, $0, $0
/* 0A893C 001A883C 28460070 */  paddub      $8, $0, $0
/* 0A8940 001A8840 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 0A8944 001A8844 00000000 */   nop
/* 0A8948 001A8848 549382AF */  sw          $2, -0x6CAC($28)
/* 0A894C 001A884C 948B848F */  lw          $4, -0x746C($28)
/* 0A8950 001A8850 2A00023C */  lui         $2, %hi(LIT_355__2)
/* 0A8954 001A8854 98B44524 */  addiu       $5, $2, %lo(LIT_355__2)
/* 0A8958 001A8858 28360070 */  paddub      $6, $0, $0
/* 0A895C 001A885C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0A8960 001A8860 00000000 */   nop
/* 0A8964 001A8864 28264070 */  paddub      $4, $2, $0
/* 0A8968 001A8868 282E2072 */  paddub      $5, $17, $0
/* 0A896C 001A886C 28360070 */  paddub      $6, $0, $0
/* 0A8970 001A8870 283E0070 */  paddub      $7, $0, $0
/* 0A8974 001A8874 28460070 */  paddub      $8, $0, $0
/* 0A8978 001A8878 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 0A897C 001A887C 00000000 */   nop
/* 0A8980 001A8880 589382AF */  sw          $2, -0x6CA8($28)
/* 0A8984 001A8884 3000A427 */  addiu       $4, $29, 0x30
/* 0A8988 001A8888 509F040C */  jal         __ct__10CFrameAttrFv
/* 0A898C 001A888C 00000000 */   nop
/* 0A8990 001A8890 01000624 */  addiu       $6, $0, 0x1
/* 0A8994 001A8894 4400A6A3 */  sb          $6, 0x44($29)
/* 0A8998 001A8898 5893848F */  lw          $4, -0x6CA8($28)
/* 0A899C 001A889C 05008010 */  beqz        $4, .L001A88B4
/* 0A89A0 001A88A0 00000000 */   nop
/* 0A89A4 001A88A4 3000A527 */  addiu       $5, $29, 0x30
/* 0A89A8 001A88A8 00020724 */  addiu       $7, $0, 0x200
/* 0A89AC 001A88AC D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0A89B0 001A88B0 00000000 */   nop
.L001A88B4:
/* 0A89B4 001A88B4 28262072 */  paddub      $4, $17, $0
/* 0A89B8 001A88B8 00180524 */  addiu       $5, $0, 0x1800
/* 0A89BC 001A88BC 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0A89C0 001A88C0 00000000 */   nop
/* 0A89C4 001A88C4 789382AF */  sw          $2, -0x6C88($28)
/* 0A89C8 001A88C8 7C9380AF */  sw          $0, -0x6C84($28)
/* 0A89CC 001A88CC 2F000424 */  addiu       $4, $0, 0x2F
/* 0A89D0 001A88D0 B46D050C */  jal         SndSPSeLoad__Fi
/* 0A89D4 001A88D4 00000000 */   nop
/* 0A89D8 001A88D8 2000BF7B */  lq          $31, 0x20($29)
/* 0A89DC 001A88DC 1000B17B */  lq          $17, 0x10($29)
/* 0A89E0 001A88E0 0000B07B */  lq          $16, 0x0($29)
/* 0A89E4 001A88E4 9000BD27 */  addiu       $29, $29, 0x90
/* 0A89E8 001A88E8 0800E003 */  jr          $31
/* 0A89EC 001A88EC 00000000 */   nop
