.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMainMenuIcon__Fiiiiii
/* 12E0A0 0022DFA0 30FFBD27 */  addiu      $sp, $sp, -0xD0
/* 12E0A4 0022DFA4 7000BF7F */  sq         $31, 0x70($sp)
/* 12E0A8 0022DFA8 6000B67F */  sq         $22, 0x60($sp)
/* 12E0AC 0022DFAC 5000B57F */  sq         $21, 0x50($sp)
/* 12E0B0 0022DFB0 4000B47F */  sq         $20, 0x40($sp)
/* 12E0B4 0022DFB4 3000B37F */  sq         $19, 0x30($sp)
/* 12E0B8 0022DFB8 2000B27F */  sq         $18, 0x20($sp)
/* 12E0BC 0022DFBC 1000B17F */  sq         $17, 0x10($sp)
/* 12E0C0 0022DFC0 0000B07F */  sq         $16, 0x0($sp)
/* 12E0C4 0022DFC4 28AE8070 */  paddub     $21, $4, $0
/* 12E0C8 0022DFC8 28A6A070 */  paddub     $20, $5, $0
/* 12E0CC 0022DFCC 289EC070 */  paddub     $19, $6, $0
/* 12E0D0 0022DFD0 2896E070 */  paddub     $18, $7, $0
/* 12E0D4 0022DFD4 288E0071 */  paddub     $17, $8, $0
/* 12E0D8 0022DFD8 28B62071 */  paddub     $22, $9, $0
/* 12E0DC 0022DFDC A096828F */  lw         $2, -0x6960($gp)
/* 12E0E0 0022DFE0 0C004014 */  bnez       $2, .L0022E014
/* 12E0E4 0022DFE4 00000000 */   nop
/* 12E0E8 0022DFE8 C701023C */  lui        $2, %hi(TexManager)
/* 12E0EC 0022DFEC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 12E0F0 0022DFF0 2A00023C */  lui        $2, %hi(_981)
/* 12E0F4 0022DFF4 B0F14524 */  addiu      $5, $2, %lo(_981)
/* 12E0F8 0022DFF8 FFFF0624 */  addiu      $6, $0, -0x1
/* 12E0FC 0022DFFC B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 12E100 0022E000 00000000 */   nop
/* 12E104 0022E004 A09682AF */  sw         $2, -0x6960($gp)
/* 12E108 0022E008 A096838F */  lw         $3, -0x6960($gp)
/* 12E10C 0022E00C 50006010 */  beqz       $3, .L0022E150
/* 12E110 0022E010 00000000 */   nop
.L0022E014:
/* 12E114 0022E014 28266072 */  paddub     $4, $19, $0
/* 12E118 0022E018 D0B7080C */  jal        GetMenuIconInfo__Fi
/* 12E11C 0022E01C 00000000 */   nop
/* 12E120 0022E020 28864070 */  paddub     $16, $2, $0
/* 12E124 0022E024 4A000012 */  beqz       $16, .L0022E150
/* 12E128 0022E028 00000000 */   nop
/* 12E12C 0022E02C 0C00048E */  lw         $4, 0xC($16)
/* 12E130 0022E030 1000058E */  lw         $5, 0x10($16)
/* 12E134 0022E034 C800A327 */  addiu      $3, $sp, 0xC8
/* 12E138 0022E038 B88982DF */  ld         $2, -0x7648($gp)
/* 12E13C 0022E03C 000062FC */  sd         $2, 0x0($3)
/* 12E140 0022E040 80101200 */  sll        $2, $18, 2
/* 12E144 0022E044 21105D00 */  addu       $2, $2, $sp
/* 12E148 0022E048 C8004384 */  lh         $3, 0xC8($2)
/* 12E14C 0022E04C CA004684 */  lh         $6, 0xCA($2)
/* 12E150 0022E050 07004012 */  beqz       $18, .L0022E070
/* 12E154 0022E054 00000000 */   nop
/* 12E158 0022E058 0400048E */  lw         $4, 0x4($16)
/* 12E15C 0022E05C 0800058E */  lw         $5, 0x8($16)
/* 12E160 0022E060 00000286 */  lh         $2, 0x0($16)
/* 12E164 0022E064 02006216 */  bne        $19, $2, .L0022E070
/* 12E168 0022E068 00000000 */   nop
/* 12E16C 0022E06C 38000324 */  addiu      $3, $0, 0x38
.L0022E070:
/* 12E170 0022E070 9000A4AF */  sw         $4, 0x90($sp)
/* 12E174 0022E074 9400A5AF */  sw         $5, 0x94($sp)
/* 12E178 0022E078 9800A3AF */  sw         $3, 0x98($sp)
/* 12E17C 0022E07C 9C00A6AF */  sw         $6, 0x9C($sp)
/* 12E180 0022E080 8000B5AF */  sw         $21, 0x80($sp)
/* 12E184 0022E084 8400B4AF */  sw         $20, 0x84($sp)
/* 12E188 0022E088 8800A3AF */  sw         $3, 0x88($sp)
/* 12E18C 0022E08C FFFFC224 */  addiu      $2, $6, -0x1
/* 12E190 0022E090 8C00A2AF */  sw         $2, 0x8C($sp)
/* 12E194 0022E094 A0B8040C */  jal        GetVif1Packet__Fv
/* 12E198 0022E098 00000000 */   nop
/* 12E19C 0022E09C FF002832 */  andi       $8, $17, 0xFF
/* 12E1A0 0022E0A0 284E0071 */  paddub     $9, $8, $0
/* 12E1A4 0022E0A4 28560071 */  paddub     $10, $8, $0
/* 12E1A8 0022E0A8 FF00CB32 */  andi       $11, $22, 0xFF
/* 12E1AC 0022E0AC 28264070 */  paddub     $4, $2, $0
/* 12E1B0 0022E0B0 A096858F */  lw         $5, -0x6960($gp)
/* 12E1B4 0022E0B4 8000A627 */  addiu      $6, $sp, 0x80
/* 12E1B8 0022E0B8 9000A727 */  addiu      $7, $sp, 0x90
/* 12E1BC 0022E0BC 8C71050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 12E1C0 0022E0C0 00000000 */   nop
/* 12E1C4 0022E0C4 05004012 */  beqz       $18, .L0022E0DC
/* 12E1C8 0022E0C8 00000000 */   nop
/* 12E1CC 0022E0CC 4400B526 */  addiu      $21, $21, 0x44
/* 12E1D0 0022E0D0 01009426 */  addiu      $20, $20, 0x1
/* 12E1D4 0022E0D4 03000010 */  b          .L0022E0E4
/* 12E1D8 0022E0D8 00000000 */   nop
.L0022E0DC:
/* 12E1DC 0022E0DC 4000B526 */  addiu      $21, $21, 0x40
/* 12E1E0 0022E0E0 FFFF9426 */  addiu      $20, $20, -0x1
.L0022E0E4:
/* 12E1E4 0022E0E4 2000048E */  lw         $4, 0x20($16)
/* 12E1E8 0022E0E8 1C00038E */  lw         $3, 0x1C($16)
/* 12E1EC 0022E0EC 1800028E */  lw         $2, 0x18($16)
/* 12E1F0 0022E0F0 1400058E */  lw         $5, 0x14($16)
/* 12E1F4 0022E0F4 B000A5AF */  sw         $5, 0xB0($sp)
/* 12E1F8 0022E0F8 B400A2AF */  sw         $2, 0xB4($sp)
/* 12E1FC 0022E0FC B800A3AF */  sw         $3, 0xB8($sp)
/* 12E200 0022E100 BC00A4AF */  sw         $4, 0xBC($sp)
/* 12E204 0022E104 2000028E */  lw         $2, 0x20($16)
/* 12E208 0022E108 FFFF4324 */  addiu      $3, $2, -0x1
/* 12E20C 0022E10C 1C00028E */  lw         $2, 0x1C($16)
/* 12E210 0022E110 A000B5AF */  sw         $21, 0xA0($sp)
/* 12E214 0022E114 A400B4AF */  sw         $20, 0xA4($sp)
/* 12E218 0022E118 A800A2AF */  sw         $2, 0xA8($sp)
/* 12E21C 0022E11C AC00A3AF */  sw         $3, 0xAC($sp)
/* 12E220 0022E120 A0B8040C */  jal        GetVif1Packet__Fv
/* 12E224 0022E124 00000000 */   nop
/* 12E228 0022E128 FF002832 */  andi       $8, $17, 0xFF
/* 12E22C 0022E12C 284E0071 */  paddub     $9, $8, $0
/* 12E230 0022E130 28560071 */  paddub     $10, $8, $0
/* 12E234 0022E134 FF00CB32 */  andi       $11, $22, 0xFF
/* 12E238 0022E138 28264070 */  paddub     $4, $2, $0
/* 12E23C 0022E13C A096858F */  lw         $5, -0x6960($gp)
/* 12E240 0022E140 A000A627 */  addiu      $6, $sp, 0xA0
/* 12E244 0022E144 B000A727 */  addiu      $7, $sp, 0xB0
/* 12E248 0022E148 8C71050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 12E24C 0022E14C 00000000 */   nop
.L0022E150:
/* 12E250 0022E150 7000BF7B */  lq         $31, 0x70($sp)
/* 12E254 0022E154 6000B67B */  lq         $22, 0x60($sp)
/* 12E258 0022E158 5000B57B */  lq         $21, 0x50($sp)
/* 12E25C 0022E15C 4000B47B */  lq         $20, 0x40($sp)
/* 12E260 0022E160 3000B37B */  lq         $19, 0x30($sp)
/* 12E264 0022E164 2000B27B */  lq         $18, 0x20($sp)
/* 12E268 0022E168 1000B17B */  lq         $17, 0x10($sp)
/* 12E26C 0022E16C 0000B07B */  lq         $16, 0x0($sp)
/* 12E270 0022E170 D000BD27 */  addiu      $sp, $sp, 0xD0
/* 12E274 0022E174 0800E003 */  jr         $31
/* 12E278 0022E178 00000000 */   nop
/* 12E27C 0022E17C 00000000 */  nop
