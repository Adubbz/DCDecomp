.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadStartLogo__Fi
/* 015480 01DC1180 70FFBD27 */  addiu       $29, $29, -0x90
/* 015484 01DC1184 2000BF7F */  sq          $31, 0x20($29)
/* 015488 01DC1188 1000B17F */  sq          $17, 0x10($29)
/* 01548C 01DC118C 0000B07F */  sq          $16, 0x0($29)
/* 015490 01DC1190 DC01023C */  lui         $2, %hi(LIT_6752)
/* 015494 01DC1194 00294224 */  addiu       $2, $2, %lo(LIT_6752)
/* 015498 01DC1198 3000A627 */  addiu       $6, $29, 0x30
/* 01549C 01DC119C 00004578 */  lq          $5, 0x0($2)
/* 0154A0 01DC11A0 100043DC */  ld          $3, 0x10($2)
/* 0154A4 01DC11A4 180042C4 */  lwc1        $f2, 0x18($2)
/* 0154A8 01DC11A8 0000C57C */  sq          $5, 0x0($6)
/* 0154AC 01DC11AC 1000C3FC */  sd          $3, 0x10($6)
/* 0154B0 01DC11B0 1800C2E4 */  swc1        $f2, 0x18($6)
/* 0154B4 01DC11B4 DC01023C */  lui         $2, %hi(LIT_6760)
/* 0154B8 01DC11B8 20294224 */  addiu       $2, $2, %lo(LIT_6760)
/* 0154BC 01DC11BC 5000A627 */  addiu       $6, $29, 0x50
/* 0154C0 01DC11C0 00004578 */  lq          $5, 0x0($2)
/* 0154C4 01DC11C4 100043DC */  ld          $3, 0x10($2)
/* 0154C8 01DC11C8 180042C4 */  lwc1        $f2, 0x18($2)
/* 0154CC 01DC11CC 0000C57C */  sq          $5, 0x0($6)
/* 0154D0 01DC11D0 1000C3FC */  sd          $3, 0x10($6)
/* 0154D4 01DC11D4 1800C2E4 */  swc1        $f2, 0x18($6)
/* 0154D8 01DC11D8 80800400 */  sll         $16, $4, 2
/* 0154DC 01DC11DC 21101D02 */  addu        $2, $16, $29
/* 0154E0 01DC11E0 3000448C */  lw          $4, 0x30($2)
/* 0154E4 01DC11E4 282E0070 */  paddub      $5, $0, $0
/* 0154E8 01DC11E8 D0D5060C */  jal         NameExchg__FPci
/* 0154EC 01DC11EC 00000000 */   nop
/* 0154F0 01DC11F0 7000A2AF */  sw          $2, 0x70($29)
/* 0154F4 01DC11F4 7400A0AF */  sw          $0, 0x74($29)
/* 0154F8 01DC11F8 F001013C */  lui         $1, %hi(BtStartLogoBuffer + 0x8)
/* 0154FC 01DC11FC C86620AC */  sw          $0, %lo(BtStartLogoBuffer + 0x8)($1)
/* 015500 01DC1200 F001013C */  lui         $1, %hi(BtStartLogoBuffer)
/* 015504 01DC1204 C066268C */  lw          $6, %lo(BtStartLogoBuffer)($1)
/* 015508 01DC1208 7000A427 */  addiu       $4, $29, 0x70
/* 01550C 01DC120C 08000524 */  addiu       $5, $0, 0x8
/* 015510 01DC1210 B4AF760C */  jal         LoadTempTexture__FPPciPc
/* 015514 01DC1214 00000000 */   nop
/* 015518 01DC1218 83110200 */  sra         $2, $2, 6
/* 01551C 01DC121C 01004224 */  addiu       $2, $2, 0x1
/* 015520 01DC1220 80110200 */  sll         $2, $2, 6
/* 015524 01DC1224 03890200 */  sra         $17, $2, 4
/* 015528 01DC1228 F001023C */  lui         $2, %hi(BtStartLogoBuffer)
/* 01552C 01DC122C C0664424 */  addiu       $4, $2, %lo(BtStartLogoBuffer)
/* 015530 01DC1230 282E2072 */  paddub      $5, $17, $0
/* 015534 01DC1234 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 015538 01DC1238 00000000 */   nop
/* 01553C 01DC123C 21101D02 */  addu        $2, $16, $29
/* 015540 01DC1240 5000508C */  lw          $16, 0x50($2)
/* 015544 01DC1244 C701023C */  lui         $2, %hi(TexManager)
/* 015548 01DC1248 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01554C 01DC124C 282E0072 */  paddub      $5, $16, $0
/* 015550 01DC1250 FFFF0624 */  addiu       $6, $0, -0x1
/* 015554 01DC1254 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 015558 01DC1258 00000000 */   nop
/* 01555C 01DC125C 1C9E82AF */  sw          $2, -0x61E4($28)
/* 015560 01DC1260 F001023C */  lui         $2, %hi(floor_name)
/* 015564 01DC1264 80684424 */  addiu       $4, $2, %lo(floor_name)
/* 015568 01DC1268 282E0072 */  paddub      $5, $16, $0
/* 01556C 01DC126C 5A15040C */  jal         strcpy
/* 015570 01DC1270 00000000 */   nop
/* 015574 01DC1274 28162072 */  paddub      $2, $17, $0
/* 015578 01DC1278 2000BF7B */  lq          $31, 0x20($29)
/* 01557C 01DC127C 1000B17B */  lq          $17, 0x10($29)
/* 015580 01DC1280 0000B07B */  lq          $16, 0x0($29)
/* 015584 01DC1284 9000BD27 */  addiu       $29, $29, 0x90
/* 015588 01DC1288 0800E003 */  jr          $31
/* 01558C 01DC128C 00000000 */   nop
