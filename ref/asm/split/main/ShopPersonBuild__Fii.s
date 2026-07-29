.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ShopPersonBuild__Fii
/* 0E8140 001E8040 20FFBD27 */  addiu       $29, $29, -0xE0
/* 0E8144 001E8044 4000BF7F */  sq          $31, 0x40($29)
/* 0E8148 001E8048 3000B37F */  sq          $19, 0x30($29)
/* 0E814C 001E804C 2000B27F */  sq          $18, 0x20($29)
/* 0E8150 001E8050 1000B17F */  sq          $17, 0x10($29)
/* 0E8154 001E8054 0000B07F */  sq          $16, 0x0($29)
/* 0E8158 001E8058 289E8070 */  paddub      $19, $4, $0
/* 0E815C 001E805C 2896A070 */  paddub      $18, $5, $0
/* 0E8160 001E8060 D901013C */  lui         $1, %hi(ShopMenu + 0x194)
/* 0E8164 001E8064 64022284 */  lh          $2, %lo(ShopMenu + 0x194)($1)
/* 0E8168 001E8068 08004014 */  bnez        $2, .L001E808C
/* 0E816C 001E806C 00000000 */   nop
/* 0E8170 001E8070 8CFB040C */  jal         ReadBGSync__Fv
/* 0E8174 001E8074 00000000 */   nop
/* 0E8178 001E8078 04004010 */  beqz        $2, .L001E808C
/* 0E817C 001E807C 00000000 */   nop
/* 0E8180 001E8080 28160070 */  paddub      $2, $0, $0
/* 0E8184 001E8084 80000010 */  b           .L001E8288
/* 0E8188 001E8088 00000000 */   nop
.L001E808C:
/* 0E818C 001E808C 28266072 */  paddub      $4, $19, $0
/* 0E8190 001E8090 282E4072 */  paddub      $5, $18, $0
/* 0E8194 001E8094 5000A627 */  addiu       $6, $29, 0x50
/* 0E8198 001E8098 D8B6070C */  jal         ItemShopGetImgFileName__FiiPc
/* 0E819C 001E809C 00000000 */   nop
/* 0E81A0 001E80A0 28260070 */  paddub      $4, $0, $0
/* 0E81A4 001E80A4 18FB040C */  jal         GetReadBGFile__Fi
/* 0E81A8 001E80A8 00000000 */   nop
/* 0E81AC 001E80AC 8C00508C */  lw          $16, 0x8C($2)
/* 0E81B0 001E80B0 9000428C */  lw          $2, 0x90($2)
/* 0E81B4 001E80B4 03110200 */  sra         $2, $2, 4
/* 0E81B8 001E80B8 01004224 */  addiu       $2, $2, 0x1
/* 0E81BC 001E80BC 00110200 */  sll         $2, $2, 4
/* 0E81C0 001E80C0 21880202 */  addu        $17, $16, $2
/* 0E81C4 001E80C4 2900023C */  lui         $2, %hi(LIT_820__2)
/* 0E81C8 001E80C8 10274524 */  addiu       $5, $2, %lo(LIT_820__2)
/* 0E81CC 001E80CC 9000A427 */  addiu       $4, $29, 0x90
/* 0E81D0 001E80D0 02000324 */  addiu       $3, $0, 0x2
.L001E80D4:
/* 0E81D4 001E80D4 0000A278 */  lq          $2, 0x0($5)
/* 0E81D8 001E80D8 1000A524 */  addiu       $5, $5, 0x10
/* 0E81DC 001E80DC FFFF6324 */  addiu       $3, $3, -0x1
/* 0E81E0 001E80E0 0000827C */  sq          $2, 0x0($4)
/* 0E81E4 001E80E4 10008424 */  addiu       $4, $4, 0x10
/* 0E81E8 001E80E8 FAFF601C */  bgtz        $3, .L001E80D4
/* 0E81EC 001E80EC 00000000 */   nop
/* 0E81F0 001E80F0 0000A2C4 */  lwc1        $f2, 0x0($5)
/* 0E81F4 001E80F4 000082E4 */  swc1        $f2, 0x0($4)
/* 0E81F8 001E80F8 D901013C */  lui         $1, %hi(ShopMenu + 0x196)
/* 0E81FC 001E80FC 66022284 */  lh          $2, %lo(ShopMenu + 0x196)($1)
/* 0E8200 001E8100 9400A2AF */  sw          $2, 0x94($29)
/* 0E8204 001E8104 A000A2AF */  sw          $2, 0xA0($29)
/* 0E8208 001E8108 28260072 */  paddub      $4, $16, $0
/* 0E820C 001E810C 5000A527 */  addiu       $5, $29, 0x50
/* 0E8210 001E8110 DC00A627 */  addiu       $6, $29, 0xDC
/* 0E8214 001E8114 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0E8218 001E8118 00000000 */   nop
/* 0E821C 001E811C 9C00A2AF */  sw          $2, 0x9C($29)
/* 0E8220 001E8120 D901013C */  lui         $1, %hi(ShopMenu + 0x196)
/* 0E8224 001E8124 66022584 */  lh          $5, %lo(ShopMenu + 0x196)($1)
/* 0E8228 001E8128 C701023C */  lui         $2, %hi(TexManager)
/* 0E822C 001E812C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0E8230 001E8130 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 0E8234 001E8134 00000000 */   nop
/* 0E8238 001E8138 C701023C */  lui         $2, %hi(TexManager)
/* 0E823C 001E813C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0E8240 001E8140 FFFF0524 */  addiu       $5, $0, -0x1
/* 0E8244 001E8144 9000A627 */  addiu       $6, $29, 0x90
/* 0E8248 001E8148 30D0040C */  jal         LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0E824C 001E814C 00000000 */   nop
/* 0E8250 001E8150 D901013C */  lui         $1, %hi(ShopCashBuffer + 0xC)
/* 0E8254 001E8154 BC00228C */  lw          $2, %lo(ShopCashBuffer + 0xC)($1)
/* 0E8258 001E8158 D201013C */  lui         $1, %hi(EdMenuBuffer + 0xC)
/* 0E825C 001E815C DCB3238C */  lw          $3, %lo(EdMenuBuffer + 0xC)($1)
/* 0E8260 001E8160 23106200 */  subu        $2, $3, $2
/* 0E8264 001E8164 DC00A2AF */  sw          $2, 0xDC($29)
/* 0E8268 001E8168 DC00A28F */  lw          $2, 0xDC($29)
/* 0E826C 001E816C D901013C */  lui         $1, %hi(ShopCashBuffer2)
/* 0E8270 001E8170 C00031AC */  sw          $17, %lo(ShopCashBuffer2)($1)
/* 0E8274 001E8174 D901013C */  lui         $1, %hi(ShopCashBuffer2 + 0xC)
/* 0E8278 001E8178 CC0022AC */  sw          $2, %lo(ShopCashBuffer2 + 0xC)($1)
/* 0E827C 001E817C D901013C */  lui         $1, %hi(ShopCashBuffer2 + 0x8)
/* 0E8280 001E8180 C80020AC */  sw          $0, %lo(ShopCashBuffer2 + 0x8)($1)
/* 0E8284 001E8184 D901023C */  lui         $2, %hi(MenuCharaFrame)
/* 0E8288 001E8188 80044424 */  addiu       $4, $2, %lo(MenuCharaFrame)
/* 0E828C 001E818C 74E6040C */  jal         Initialize__10CCharacterFv
/* 0E8290 001E8190 00000000 */   nop
/* 0E8294 001E8194 D901023C */  lui         $2, %hi(MenuCharaFrame)
/* 0E8298 001E8198 80044424 */  addiu       $4, $2, %lo(MenuCharaFrame)
/* 0E829C 001E819C 282E0072 */  paddub      $5, $16, $0
/* 0E82A0 001E81A0 2A00023C */  lui         $2, %hi(LIT_837__3)
/* 0E82A4 001E81A4 10D24624 */  addiu       $6, $2, %lo(LIT_837__3)
/* 0E82A8 001E81A8 D901023C */  lui         $2, %hi(ShopCashBuffer2)
/* 0E82AC 001E81AC C0004724 */  addiu       $7, $2, %lo(ShopCashBuffer2)
/* 0E82B0 001E81B0 D901023C */  lui         $2, %hi(ShopCashBuffer2)
/* 0E82B4 001E81B4 C0004824 */  addiu       $8, $2, %lo(ShopCashBuffer2)
/* 0E82B8 001E81B8 284E0070 */  paddub      $9, $0, $0
/* 0E82BC 001E81BC 08E6040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_
/* 0E82C0 001E81C0 00000000 */   nop
/* 0E82C4 001E81C4 2900023C */  lui         $2, %hi(LIT_821__2)
/* 0E82C8 001E81C8 40274224 */  addiu       $2, $2, %lo(LIT_821__2)
/* 0E82CC 001E81CC C000A527 */  addiu       $5, $29, 0xC0
/* 0E82D0 001E81D0 00004278 */  lq          $2, 0x0($2)
/* 0E82D4 001E81D4 0000A27C */  sq          $2, 0x0($5)
/* 0E82D8 001E81D8 D901023C */  lui         $2, %hi(MenuCharaFrame)
/* 0E82DC 001E81DC 80044424 */  addiu       $4, $2, %lo(MenuCharaFrame)
/* 0E82E0 001E81E0 38E4040C */  jal         SetPosition__10CCharacterFPf
/* 0E82E4 001E81E4 00000000 */   nop
/* 0E82E8 001E81E8 28266072 */  paddub      $4, $19, $0
/* 0E82EC 001E81EC 282E4072 */  paddub      $5, $18, $0
/* 0E82F0 001E81F0 209C070C */  jal         ShopPolySetInit__Fii
/* 0E82F4 001E81F4 00000000 */   nop
/* 0E82F8 001E81F8 D901013C */  lui         $1, %hi(MenuCharaFrame + 0xBC)
/* 0E82FC 001E81FC 3C05228C */  lw          $2, %lo(MenuCharaFrame + 0xBC)($1)
/* 0E8300 001E8200 08004014 */  bnez        $2, .L001E8224
/* 0E8304 001E8204 00000000 */   nop
/* 0E8308 001E8208 2A00023C */  lui         $2, %hi(LIT_838__2)
/* 0E830C 001E820C 20D24424 */  addiu       $4, $2, %lo(LIT_838__2)
/* 0E8310 001E8210 A611040C */  jal         printf
/* 0E8314 001E8214 00000000 */   nop
/* 0E8318 001E8218 28160070 */  paddub      $2, $0, $0
/* 0E831C 001E821C 1A000010 */  b           .L001E8288
/* 0E8320 001E8220 00000000 */   nop
.L001E8224:
/* 0E8324 001E8224 03000424 */  addiu       $4, $0, 0x3
/* 0E8328 001E8228 D901013C */  lui         $1, %hi(ShopMenu + 0x19C)
/* 0E832C 001E822C 6C0224A4 */  sh          $4, %lo(ShopMenu + 0x19C)($1)
/* 0E8330 001E8230 D901013C */  lui         $1, %hi(ShopMenu + 0x19C)
/* 0E8334 001E8234 6C022284 */  lh          $2, %lo(ShopMenu + 0x19C)($1)
/* 0E8338 001E8238 D901013C */  lui         $1, %hi(MenuCharaFrame + 0xC68)
/* 0E833C 001E823C E81022AC */  sw          $2, %lo(MenuCharaFrame + 0xC68)($1)
/* 0E8340 001E8240 D901013C */  lui         $1, %hi(MenuCharaFrame + 0xC64)
/* 0E8344 001E8244 E41020AC */  sw          $0, %lo(MenuCharaFrame + 0xC64)($1)
/* 0E8348 001E8248 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 0E834C 001E824C D901013C */  lui         $1, %hi(MenuCharaFrame + 0xC60)
/* 0E8350 001E8250 E01022AC */  sw          $2, %lo(MenuCharaFrame + 0xC60)($1)
/* 0E8354 001E8254 01000524 */  addiu       $5, $0, 0x1
/* 0E8358 001E8258 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0E835C 001E825C 00000000 */   nop
/* 0E8360 001E8260 D901013C */  lui         $1, %hi(ShopMenu + 0x1A4)
/* 0E8364 001E8264 740220AC */  sw          $0, %lo(ShopMenu + 0x1A4)($1)
/* 0E8368 001E8268 D901013C */  lui         $1, %hi(ShopMenu + 0x19E)
/* 0E836C 001E826C 6E0220A4 */  sh          $0, %lo(ShopMenu + 0x19E)($1)
/* 0E8370 001E8270 28260070 */  paddub      $4, $0, $0
/* 0E8374 001E8274 ECA0070C */  jal         ShopMasterVectorSet__Fi
/* 0E8378 001E8278 00000000 */   nop
/* 0E837C 001E827C D901013C */  lui         $1, %hi(ShopMenu + 0x1A0)
/* 0E8380 001E8280 700220AC */  sw          $0, %lo(ShopMenu + 0x1A0)($1)
/* 0E8384 001E8284 02000224 */  addiu       $2, $0, 0x2
.L001E8288:
/* 0E8388 001E8288 4000BF7B */  lq          $31, 0x40($29)
/* 0E838C 001E828C 3000B37B */  lq          $19, 0x30($29)
/* 0E8390 001E8290 2000B27B */  lq          $18, 0x20($29)
/* 0E8394 001E8294 1000B17B */  lq          $17, 0x10($29)
/* 0E8398 001E8298 0000B07B */  lq          $16, 0x0($29)
/* 0E839C 001E829C E000BD27 */  addiu       $29, $29, 0xE0
/* 0E83A0 001E82A0 0800E003 */  jr          $31
/* 0E83A4 001E82A4 00000000 */   nop
/* 0E83A8 001E82A8 00000000 */  nop
/* 0E83AC 001E82AC 00000000 */  nop
