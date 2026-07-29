.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _LOAD_ITEM__FP12RS_STACKDATAi
/* 08DC10 0018DB10 90FFBD27 */  addiu       $29, $29, -0x70
/* 08DC14 0018DB14 4000BF7F */  sq          $31, 0x40($29)
/* 08DC18 0018DB18 3000B37F */  sq          $19, 0x30($29)
/* 08DC1C 0018DB1C 2000B27F */  sq          $18, 0x20($29)
/* 08DC20 0018DB20 1000B17F */  sq          $17, 0x10($29)
/* 08DC24 0018DB24 0000B07F */  sq          $16, 0x0($29)
/* 08DC28 0018DB28 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08DC2C 0018DB2C 00000000 */   nop
/* 08DC30 0018DB30 28864070 */  paddub      $16, $2, $0
/* 08DC34 0018DB34 03000006 */  bltz        $16, .L0018DB44
/* 08DC38 0018DB38 00000000 */   nop
/* 08DC3C 0018DB3C 0400001A */  blez        $16, .L0018DB50
/* 08DC40 0018DB40 00000000 */   nop
.L0018DB44:
/* 08DC44 0018DB44 28160070 */  paddub      $2, $0, $0
/* 08DC48 0018DB48 42000010 */  b           .L0018DC54
/* 08DC4C 0018DB4C 00000000 */   nop
.L0018DB50:
/* 08DC50 0018DB50 28260070 */  paddub      $4, $0, $0
/* 08DC54 0018DB54 18FB040C */  jal         GetReadBGFile__Fi
/* 08DC58 0018DB58 00000000 */   nop
/* 08DC5C 0018DB5C 28264070 */  paddub      $4, $2, $0
/* 08DC60 0018DB60 04008014 */  bnez        $4, .L0018DB74
/* 08DC64 0018DB64 00000000 */   nop
/* 08DC68 0018DB68 28160070 */  paddub      $2, $0, $0
/* 08DC6C 0018DB6C 39000010 */  b           .L0018DC54
/* 08DC70 0018DB70 00000000 */   nop
.L0018DB74:
/* 08DC74 0018DB74 9000918C */  lw          $17, 0x90($4)
/* 08DC78 0018DB78 8C00928C */  lw          $18, 0x8C($4)
/* 08DC7C 0018DB7C B030060C */  jal         get_buffer__Fv
/* 08DC80 0018DB80 00000000 */   nop
/* 08DC84 0018DB84 03191100 */  sra         $3, $17, 4
/* 08DC88 0018DB88 01006524 */  addiu       $5, $3, 0x1
/* 08DC8C 0018DB8C 28264070 */  paddub      $4, $2, $0
/* 08DC90 0018DB90 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 08DC94 0018DB94 00000000 */   nop
/* 08DC98 0018DB98 289E4070 */  paddub      $19, $2, $0
/* 08DC9C 0018DB9C 28266072 */  paddub      $4, $19, $0
/* 08DCA0 0018DBA0 282E4072 */  paddub      $5, $18, $0
/* 08DCA4 0018DBA4 28362072 */  paddub      $6, $17, $0
/* 08DCA8 0018DBA8 EC0C040C */  jal         memcpy
/* 08DCAC 0018DBAC 00000000 */   nop
/* 08DCB0 0018DBB0 28000524 */  addiu       $5, $0, 0x28
/* 08DCB4 0018DBB4 5400A5AF */  sw          $5, 0x54($29)
/* 08DCB8 0018DBB8 5800A0AF */  sw          $0, 0x58($29)
/* 08DCBC 0018DBBC 5000B3AF */  sw          $19, 0x50($29)
/* 08DCC0 0018DBC0 5C00A0AF */  sw          $0, 0x5C($29)
/* 08DCC4 0018DBC4 C701023C */  lui         $2, %hi(TexManager)
/* 08DCC8 0018DBC8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 08DCCC 0018DBCC C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 08DCD0 0018DBD0 00000000 */   nop
/* 08DCD4 0018DBD4 C701023C */  lui         $2, %hi(TexManager)
/* 08DCD8 0018DBD8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 08DCDC 0018DBDC 28000524 */  addiu       $5, $0, 0x28
/* 08DCE0 0018DBE0 5000A627 */  addiu       $6, $29, 0x50
/* 08DCE4 0018DBE4 30D0040C */  jal         LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 08DCE8 0018DBE8 00000000 */   nop
/* 08DCEC 0018DBEC 01000424 */  addiu       $4, $0, 0x1
/* 08DCF0 0018DBF0 18FB040C */  jal         GetReadBGFile__Fi
/* 08DCF4 0018DBF4 00000000 */   nop
/* 08DCF8 0018DBF8 28264070 */  paddub      $4, $2, $0
/* 08DCFC 0018DBFC 04008014 */  bnez        $4, .L0018DC10
/* 08DD00 0018DC00 00000000 */   nop
/* 08DD04 0018DC04 28160070 */  paddub      $2, $0, $0
/* 08DD08 0018DC08 12000010 */  b           .L0018DC54
/* 08DD0C 0018DC0C 00000000 */   nop
.L0018DC10:
/* 08DD10 0018DC10 B030060C */  jal         get_buffer__Fv
/* 08DD14 0018DC14 00000000 */   nop
/* 08DD18 0018DC18 8C00848C */  lw          $4, 0x8C($4)
/* 08DD1C 0018DC1C 282E4070 */  paddub      $5, $2, $0
/* 08DD20 0018DC20 28360070 */  paddub      $6, $0, $0
/* 08DD24 0018DC24 283E0070 */  paddub      $7, $0, $0
/* 08DD28 0018DC28 28460070 */  paddub      $8, $0, $0
/* 08DD2C 0018DC2C AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 08DD30 0018DC30 00000000 */   nop
/* 08DD34 0018DC34 80201000 */  sll         $4, $16, 2
/* 08DD38 0018DC38 D401033C */  lui         $3, %hi(EdEventInfo + 0x25C)
/* 08DD3C 0018DC3C 2CD46324 */  addiu       $3, $3, %lo(EdEventInfo + 0x25C)
/* 08DD40 0018DC40 21186400 */  addu        $3, $3, $4
/* 08DD44 0018DC44 000062AC */  sw          $2, 0x0($3)
/* 08DD48 0018DC48 0000638C */  lw          $3, 0x0($3)
/* 08DD4C 0018DC4C 01000224 */  addiu       $2, $0, 0x1
/* 08DD50 0018DC50 0A100300 */  movz        $2, $0, $3
.L0018DC54:
/* 08DD54 0018DC54 4000BF7B */  lq          $31, 0x40($29)
/* 08DD58 0018DC58 3000B37B */  lq          $19, 0x30($29)
/* 08DD5C 0018DC5C 2000B27B */  lq          $18, 0x20($29)
/* 08DD60 0018DC60 1000B17B */  lq          $17, 0x10($29)
/* 08DD64 0018DC64 0000B07B */  lq          $16, 0x0($29)
/* 08DD68 0018DC68 7000BD27 */  addiu       $29, $29, 0x70
/* 08DD6C 0018DC6C 0800E003 */  jr          $31
/* 08DD70 0018DC70 00000000 */   nop
/* 08DD74 0018DC74 00000000 */  nop
/* 08DD78 0018DC78 00000000 */  nop
/* 08DD7C 0018DC7C 00000000 */  nop
