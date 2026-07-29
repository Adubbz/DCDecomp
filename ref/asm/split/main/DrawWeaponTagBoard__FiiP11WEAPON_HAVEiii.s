.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawWeaponTagBoard__FiiP11WEAPON_HAVEiii
/* 0FB0F0 001FAFF0 20FFBD27 */  addiu       $29, $29, -0xE0
/* 0FB0F4 001FAFF4 9000BF7F */  sq          $31, 0x90($29)
/* 0FB0F8 001FAFF8 8000BE7F */  sq          $30, 0x80($29)
/* 0FB0FC 001FAFFC 7000B77F */  sq          $23, 0x70($29)
/* 0FB100 001FB000 6000B67F */  sq          $22, 0x60($29)
/* 0FB104 001FB004 5000B57F */  sq          $21, 0x50($29)
/* 0FB108 001FB008 4000B47F */  sq          $20, 0x40($29)
/* 0FB10C 001FB00C 3000B37F */  sq          $19, 0x30($29)
/* 0FB110 001FB010 2000B27F */  sq          $18, 0x20($29)
/* 0FB114 001FB014 1000B17F */  sq          $17, 0x10($29)
/* 0FB118 001FB018 0000B07F */  sq          $16, 0x0($29)
/* 0FB11C 001FB01C 28AE8070 */  paddub      $21, $4, $0
/* 0FB120 001FB020 28A6A070 */  paddub      $20, $5, $0
/* 0FB124 001FB024 289EC070 */  paddub      $19, $6, $0
/* 0FB128 001FB028 28B6E070 */  paddub      $22, $7, $0
/* 0FB12C 001FB02C 28BE0071 */  paddub      $23, $8, $0
/* 0FB130 001FB030 28962071 */  paddub      $18, $9, $0
/* 0FB134 001FB034 DA01013C */  lui         $1, %hi(WepMenu + 0x178)
/* 0FB138 001FB038 E8EB3080 */  lb          $16, %lo(WepMenu + 0x178)($1)
/* 0FB13C 001FB03C 288E0070 */  paddub      $17, $0, $0
/* 0FB140 001FB040 28F60070 */  paddub      $30, $0, $0
/* 0FB144 001FB044 01000324 */  addiu       $3, $0, 0x1
/* 0FB148 001FB048 A000A3AF */  sw          $3, 0xA0($29)
/* 0FB14C 001FB04C B000A0AF */  sw          $0, 0xB0($29)
/* 0FB150 001FB050 33000010 */  b           .L001FB120
/* 0FB154 001FB054 00000000 */   nop
.L001FB058:
/* 0FB158 001FB058 80000424 */  addiu       $4, $0, 0x80
/* 0FB15C 001FB05C 0C001116 */  bne         $16, $17, .L001FB090
/* 0FB160 001FB060 00000000 */   nop
/* 0FB164 001FB064 B000A28F */  lw          $2, 0xB0($29)
/* 0FB168 001FB068 04004010 */  beqz        $2, .L001FB07C
/* 0FB16C 001FB06C 00000000 */   nop
/* 0FB170 001FB070 288E0072 */  paddub      $17, $16, $0
/* 0FB174 001FB074 06000010 */  b           .L001FB090
/* 0FB178 001FB078 00000000 */   nop
.L001FB07C:
/* 0FB17C 001FB07C 02001124 */  addiu       $17, $0, 0x2
/* 0FB180 001FB080 FFFF0224 */  addiu       $2, $0, -0x1
/* 0FB184 001FB084 A000A2AF */  sw          $2, 0xA0($29)
/* 0FB188 001FB088 01000224 */  addiu       $2, $0, 0x1
/* 0FB18C 001FB08C B000A2AF */  sw          $2, 0xB0($29)
.L001FB090:
/* 0FB190 001FB090 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FB194 001FB094 72EA2384 */  lh          $3, %lo(WepMenu + 0x2)($1)
/* 0FB198 001FB098 02000224 */  addiu       $2, $0, 0x2
/* 0FB19C 001FB09C 05006214 */  bne         $3, $2, .L001FB0B4
/* 0FB1A0 001FB0A0 00000000 */   nop
/* 0FB1A4 001FB0A4 01000224 */  addiu       $2, $0, 0x1
/* 0FB1A8 001FB0A8 02002212 */  beq         $17, $2, .L001FB0B4
/* 0FB1AC 001FB0AC 00000000 */   nop
/* 0FB1B0 001FB0B0 40000424 */  addiu       $4, $0, 0x40
.L001FB0B4:
/* 0FB1B4 001FB0B4 00111100 */  sll         $2, $17, 4
/* 0FB1B8 001FB0B8 21185100 */  addu        $3, $2, $17
/* 0FB1BC 001FB0BC 80100300 */  sll         $2, $3, 2
/* 0FB1C0 001FB0C0 21106200 */  addu        $2, $3, $2
/* 0FB1C4 001FB0C4 40100200 */  sll         $2, $2, 1
/* 0FB1C8 001FB0C8 D000A0AF */  sw          $0, 0xD0($29)
/* 0FB1CC 001FB0CC D400A2AF */  sw          $2, 0xD4($29)
/* 0FB1D0 001FB0D0 D4000324 */  addiu       $3, $0, 0xD4
/* 0FB1D4 001FB0D4 D800A3AF */  sw          $3, 0xD8($29)
/* 0FB1D8 001FB0D8 AA000224 */  addiu       $2, $0, 0xAA
/* 0FB1DC 001FB0DC DC00A2AF */  sw          $2, 0xDC($29)
/* 0FB1E0 001FB0E0 C000B5AF */  sw          $21, 0xC0($29)
/* 0FB1E4 001FB0E4 C400B4AF */  sw          $20, 0xC4($29)
/* 0FB1E8 001FB0E8 C800A3AF */  sw          $3, 0xC8($29)
/* 0FB1EC 001FB0EC CC00A2AF */  sw          $2, 0xCC($29)
/* 0FB1F0 001FB0F0 FF008730 */  andi        $7, $4, 0xFF
/* 0FB1F4 001FB0F4 2846E070 */  paddub      $8, $7, $0
/* 0FB1F8 001FB0F8 284EE070 */  paddub      $9, $7, $0
/* 0FB1FC 001FB0FC 2C95848F */  lw          $4, -0x6AD4($28)
/* 0FB200 001FB100 C000A527 */  addiu       $5, $29, 0xC0
/* 0FB204 001FB104 D000A627 */  addiu       $6, $29, 0xD0
/* 0FB208 001FB108 28564072 */  paddub      $10, $18, $0
/* 0FB20C 001FB10C E4B3080C */  jal         DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci
/* 0FB210 001FB110 00000000 */   nop
/* 0FB214 001FB114 A000A38F */  lw          $3, 0xA0($29)
/* 0FB218 001FB118 21882302 */  addu        $17, $17, $3
/* 0FB21C 001FB11C 0100DE27 */  addiu       $30, $30, 0x1
.L001FB120:
/* 0FB220 001FB120 0300C32B */  slti        $3, $30, 0x3
/* 0FB224 001FB124 CCFF6014 */  bnez        $3, .L001FB058
/* 0FB228 001FB128 00000000 */   nop
/* 0FB22C 001FB12C 27006012 */  beqz        $19, .L001FB1CC
/* 0FB230 001FB130 00000000 */   nop
/* 0FB234 001FB134 02000324 */  addiu       $3, $0, 0x2
/* 0FB238 001FB138 1C000312 */  beq         $16, $3, .L001FB1AC
/* 0FB23C 001FB13C 00000000 */   nop
/* 0FB240 001FB140 01000324 */  addiu       $3, $0, 0x1
/* 0FB244 001FB144 0F000312 */  beq         $16, $3, .L001FB184
/* 0FB248 001FB148 00000000 */   nop
/* 0FB24C 001FB14C 03000012 */  beqz        $16, .L001FB15C
/* 0FB250 001FB150 00000000 */   nop
/* 0FB254 001FB154 1D000010 */  b           .L001FB1CC
/* 0FB258 001FB158 00000000 */   nop
.L001FB15C:
/* 0FB25C 001FB15C 2826A072 */  paddub      $4, $21, $0
/* 0FB260 001FB160 282E8072 */  paddub      $5, $20, $0
/* 0FB264 001FB164 28366072 */  paddub      $6, $19, $0
/* 0FB268 001FB168 283EC072 */  paddub      $7, $22, $0
/* 0FB26C 001FB16C 2846E072 */  paddub      $8, $23, $0
/* 0FB270 001FB170 284E4072 */  paddub      $9, $18, $0
/* 0FB274 001FB174 2CE8070C */  jal         DrawWeaponStatusTag__FiiP11WEAPON_HAVEiii
/* 0FB278 001FB178 00000000 */   nop
/* 0FB27C 001FB17C 13000010 */  b           .L001FB1CC
/* 0FB280 001FB180 00000000 */   nop
.L001FB184:
/* 0FB284 001FB184 2826A072 */  paddub      $4, $21, $0
/* 0FB288 001FB188 282E8072 */  paddub      $5, $20, $0
/* 0FB28C 001FB18C 28366072 */  paddub      $6, $19, $0
/* 0FB290 001FB190 283EC072 */  paddub      $7, $22, $0
/* 0FB294 001FB194 2846E072 */  paddub      $8, $23, $0
/* 0FB298 001FB198 284E4072 */  paddub      $9, $18, $0
/* 0FB29C 001FB19C 1CEA070C */  jal         DrawWeaponElemTag__FiiP11WEAPON_HAVEiii
/* 0FB2A0 001FB1A0 00000000 */   nop
/* 0FB2A4 001FB1A4 09000010 */  b           .L001FB1CC
/* 0FB2A8 001FB1A8 00000000 */   nop
.L001FB1AC:
/* 0FB2AC 001FB1AC 2826A072 */  paddub      $4, $21, $0
/* 0FB2B0 001FB1B0 282E8072 */  paddub      $5, $20, $0
/* 0FB2B4 001FB1B4 28366072 */  paddub      $6, $19, $0
/* 0FB2B8 001FB1B8 283EC072 */  paddub      $7, $22, $0
/* 0FB2BC 001FB1BC 2846E072 */  paddub      $8, $23, $0
/* 0FB2C0 001FB1C0 284E4072 */  paddub      $9, $18, $0
/* 0FB2C4 001FB1C4 28EB070C */  jal         DrawWeaponVsMonster__FiiP11WEAPON_HAVEiii
/* 0FB2C8 001FB1C8 00000000 */   nop
.L001FB1CC:
/* 0FB2CC 001FB1CC 9000BF7B */  lq          $31, 0x90($29)
/* 0FB2D0 001FB1D0 8000BE7B */  lq          $30, 0x80($29)
/* 0FB2D4 001FB1D4 7000B77B */  lq          $23, 0x70($29)
/* 0FB2D8 001FB1D8 6000B67B */  lq          $22, 0x60($29)
/* 0FB2DC 001FB1DC 5000B57B */  lq          $21, 0x50($29)
/* 0FB2E0 001FB1E0 4000B47B */  lq          $20, 0x40($29)
/* 0FB2E4 001FB1E4 3000B37B */  lq          $19, 0x30($29)
/* 0FB2E8 001FB1E8 2000B27B */  lq          $18, 0x20($29)
/* 0FB2EC 001FB1EC 1000B17B */  lq          $17, 0x10($29)
/* 0FB2F0 001FB1F0 0000B07B */  lq          $16, 0x0($29)
/* 0FB2F4 001FB1F4 E000BD27 */  addiu       $29, $29, 0xE0
/* 0FB2F8 001FB1F8 0800E003 */  jr          $31
/* 0FB2FC 001FB1FC 00000000 */   nop
