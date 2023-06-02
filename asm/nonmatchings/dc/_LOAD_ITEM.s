.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_ITEM__FP12RS_STACKDATAi
/* 8DC10 0018DB10 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 8DC14 0018DB14 4000BF7F */  sq         $31, 0x40($sp)
/* 8DC18 0018DB18 3000B37F */  sq         $19, 0x30($sp)
/* 8DC1C 0018DB1C 2000B27F */  sq         $18, 0x20($sp)
/* 8DC20 0018DB20 1000B17F */  sq         $17, 0x10($sp)
/* 8DC24 0018DB24 0000B07F */  sq         $16, 0x0($sp)
/* 8DC28 0018DB28 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8DC2C 0018DB2C 00000000 */   nop
/* 8DC30 0018DB30 28864070 */  paddub     $16, $2, $0
/* 8DC34 0018DB34 03000006 */  bltz       $16, .L0018DB44
/* 8DC38 0018DB38 00000000 */   nop
/* 8DC3C 0018DB3C 0400001A */  blez       $16, .L0018DB50
/* 8DC40 0018DB40 00000000 */   nop
.L0018DB44:
/* 8DC44 0018DB44 28160070 */  paddub     $2, $0, $0
/* 8DC48 0018DB48 42000010 */  b          .L0018DC54
/* 8DC4C 0018DB4C 00000000 */   nop
.L0018DB50:
/* 8DC50 0018DB50 28260070 */  paddub     $4, $0, $0
/* 8DC54 0018DB54 18FB040C */  jal        GetReadBGFile__Fi
/* 8DC58 0018DB58 00000000 */   nop
/* 8DC5C 0018DB5C 28264070 */  paddub     $4, $2, $0
/* 8DC60 0018DB60 04008014 */  bnez       $4, .L0018DB74
/* 8DC64 0018DB64 00000000 */   nop
/* 8DC68 0018DB68 28160070 */  paddub     $2, $0, $0
/* 8DC6C 0018DB6C 39000010 */  b          .L0018DC54
/* 8DC70 0018DB70 00000000 */   nop
.L0018DB74:
/* 8DC74 0018DB74 9000918C */  lw         $17, 0x90($4)
/* 8DC78 0018DB78 8C00928C */  lw         $18, 0x8C($4)
/* 8DC7C 0018DB7C B030060C */  jal        get_buffer__Fv
/* 8DC80 0018DB80 00000000 */   nop
/* 8DC84 0018DB84 03191100 */  sra        $3, $17, 4
/* 8DC88 0018DB88 01006524 */  addiu      $5, $3, 0x1
/* 8DC8C 0018DB8C 28264070 */  paddub     $4, $2, $0
/* 8DC90 0018DB90 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 8DC94 0018DB94 00000000 */   nop
/* 8DC98 0018DB98 289E4070 */  paddub     $19, $2, $0
/* 8DC9C 0018DB9C 28266072 */  paddub     $4, $19, $0
/* 8DCA0 0018DBA0 282E4072 */  paddub     $5, $18, $0
/* 8DCA4 0018DBA4 28362072 */  paddub     $6, $17, $0
/* 8DCA8 0018DBA8 EC0C040C */  jal        memcpy
/* 8DCAC 0018DBAC 00000000 */   nop
/* 8DCB0 0018DBB0 28000524 */  addiu      $5, $0, 0x28
/* 8DCB4 0018DBB4 5400A5AF */  sw         $5, 0x54($sp)
/* 8DCB8 0018DBB8 5800A0AF */  sw         $0, 0x58($sp)
/* 8DCBC 0018DBBC 5000B3AF */  sw         $19, 0x50($sp)
/* 8DCC0 0018DBC0 5C00A0AF */  sw         $0, 0x5C($sp)
/* 8DCC4 0018DBC4 C701023C */  lui        $2, %hi(TexManager)
/* 8DCC8 0018DBC8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 8DCCC 0018DBCC C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 8DCD0 0018DBD0 00000000 */   nop
/* 8DCD4 0018DBD4 C701023C */  lui        $2, %hi(TexManager)
/* 8DCD8 0018DBD8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 8DCDC 0018DBDC 28000524 */  addiu      $5, $0, 0x28
/* 8DCE0 0018DBE0 5000A627 */  addiu      $6, $sp, 0x50
/* 8DCE4 0018DBE4 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 8DCE8 0018DBE8 00000000 */   nop
/* 8DCEC 0018DBEC 01000424 */  addiu      $4, $0, 0x1
/* 8DCF0 0018DBF0 18FB040C */  jal        GetReadBGFile__Fi
/* 8DCF4 0018DBF4 00000000 */   nop
/* 8DCF8 0018DBF8 28264070 */  paddub     $4, $2, $0
/* 8DCFC 0018DBFC 04008014 */  bnez       $4, .L0018DC10
/* 8DD00 0018DC00 00000000 */   nop
/* 8DD04 0018DC04 28160070 */  paddub     $2, $0, $0
/* 8DD08 0018DC08 12000010 */  b          .L0018DC54
/* 8DD0C 0018DC0C 00000000 */   nop
.L0018DC10:
/* 8DD10 0018DC10 B030060C */  jal        get_buffer__Fv
/* 8DD14 0018DC14 00000000 */   nop
/* 8DD18 0018DC18 8C00848C */  lw         $4, 0x8C($4)
/* 8DD1C 0018DC1C 282E4070 */  paddub     $5, $2, $0
/* 8DD20 0018DC20 28360070 */  paddub     $6, $0, $0
/* 8DD24 0018DC24 283E0070 */  paddub     $7, $0, $0
/* 8DD28 0018DC28 28460070 */  paddub     $8, $0, $0
/* 8DD2C 0018DC2C AC98040C */  jal        LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 8DD30 0018DC30 00000000 */   nop
/* 8DD34 0018DC34 80201000 */  sll        $4, $16, 2
/* 8DD38 0018DC38 D401033C */  lui        $3, %hi(D_1D3D42C)
/* 8DD3C 0018DC3C 2CD46324 */  addiu      $3, $3, %lo(D_1D3D42C)
/* 8DD40 0018DC40 21186400 */  addu       $3, $3, $4
/* 8DD44 0018DC44 000062AC */  sw         $2, 0x0($3)
/* 8DD48 0018DC48 0000638C */  lw         $3, 0x0($3)
/* 8DD4C 0018DC4C 01000224 */  addiu      $2, $0, 0x1
/* 8DD50 0018DC50 0A100300 */  movz       $2, $0, $3
.L0018DC54:
/* 8DD54 0018DC54 4000BF7B */  lq         $31, 0x40($sp)
/* 8DD58 0018DC58 3000B37B */  lq         $19, 0x30($sp)
/* 8DD5C 0018DC5C 2000B27B */  lq         $18, 0x20($sp)
/* 8DD60 0018DC60 1000B17B */  lq         $17, 0x10($sp)
/* 8DD64 0018DC64 0000B07B */  lq         $16, 0x0($sp)
/* 8DD68 0018DC68 7000BD27 */  addiu      $sp, $sp, 0x70
/* 8DD6C 0018DC6C 0800E003 */  jr         $31
/* 8DD70 0018DC70 00000000 */   nop
/* 8DD74 0018DC74 00000000 */  nop
/* 8DD78 0018DC78 00000000 */  nop
/* 8DD7C 0018DC7C 00000000 */  nop
