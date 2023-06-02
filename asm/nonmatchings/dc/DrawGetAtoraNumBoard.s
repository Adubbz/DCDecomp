.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawGetAtoraNumBoard__Fiiiiii
/* 128120 00228020 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* 128124 00228024 6000BF7F */  sq         $31, 0x60($sp)
/* 128128 00228028 5000B57F */  sq         $21, 0x50($sp)
/* 12812C 0022802C 4000B47F */  sq         $20, 0x40($sp)
/* 128130 00228030 3000B37F */  sq         $19, 0x30($sp)
/* 128134 00228034 2000B27F */  sq         $18, 0x20($sp)
/* 128138 00228038 1000B17F */  sq         $17, 0x10($sp)
/* 12813C 0022803C 0000B07F */  sq         $16, 0x0($sp)
/* 128140 00228040 28868070 */  paddub     $16, $4, $0
/* 128144 00228044 28AEA070 */  paddub     $21, $5, $0
/* 128148 00228048 28A6C070 */  paddub     $20, $6, $0
/* 12814C 0022804C 289EE070 */  paddub     $19, $7, $0
/* 128150 00228050 28960071 */  paddub     $18, $8, $0
/* 128154 00228054 288E2071 */  paddub     $17, $9, $0
/* 128158 00228058 B400B4AF */  sw         $20, 0xB4($sp)
/* 12815C 0022805C 20000324 */  addiu      $3, $0, 0x20
/* 128160 00228060 B800A3AF */  sw         $3, 0xB8($sp)
/* 128164 00228064 24000324 */  addiu      $3, $0, 0x24
/* 128168 00228068 BC00A3AF */  sw         $3, 0xBC($sp)
/* 12816C 0022806C 24008326 */  addiu      $3, $20, 0x24
/* 128170 00228070 2A086302 */  slt        $at, $19, $3
/* 128174 00228074 04002010 */  beqz       $at, .L00228088
/* 128178 00228078 00000000 */   nop
/* 12817C 0022807C 2A089202 */  slt        $at, $20, $18
/* 128180 00228080 03002014 */  bnez       $at, .L00228090
/* 128184 00228084 00000000 */   nop
.L00228088:
/* 128188 00228088 6D000010 */  b          .L00228240
/* 12818C 0022808C 00000000 */   nop
.L00228090:
/* 128190 00228090 B400A427 */  addiu      $4, $sp, 0xB4
/* 128194 00228094 B800A527 */  addiu      $5, $sp, 0xB8
/* 128198 00228098 BC00A627 */  addiu      $6, $sp, 0xBC
/* 12819C 0022809C A0B7080C */  jal        MenuTextureClip__FRiRiRiii
/* 1281A0 002280A0 00000000 */   nop
/* 1281A4 002280A4 BC00A48F */  lw         $4, 0xBC($sp)
/* 1281A8 002280A8 B800A38F */  lw         $3, 0xB8($sp)
/* 1281AC 002280AC 88000224 */  addiu      $2, $0, 0x88
/* 1281B0 002280B0 8000A2AF */  sw         $2, 0x80($sp)
/* 1281B4 002280B4 8400A3AF */  sw         $3, 0x84($sp)
/* 1281B8 002280B8 2B000224 */  addiu      $2, $0, 0x2B
/* 1281BC 002280BC 8800A2AF */  sw         $2, 0x88($sp)
/* 1281C0 002280C0 8C00A4AF */  sw         $4, 0x8C($sp)
/* 1281C4 002280C4 B400A38F */  lw         $3, 0xB4($sp)
/* 1281C8 002280C8 7000B5AF */  sw         $21, 0x70($sp)
/* 1281CC 002280CC 7400A3AF */  sw         $3, 0x74($sp)
/* 1281D0 002280D0 7800A2AF */  sw         $2, 0x78($sp)
/* 1281D4 002280D4 7C00A4AF */  sw         $4, 0x7C($sp)
/* 1281D8 002280D8 6497848F */  lw         $4, -0x689C($gp)
/* 1281DC 002280DC 7000A527 */  addiu      $5, $sp, 0x70
/* 1281E0 002280E0 8000A627 */  addiu      $6, $sp, 0x80
/* 1281E4 002280E4 283E2072 */  paddub     $7, $17, $0
/* 1281E8 002280E8 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 1281EC 002280EC 00000000 */   nop
/* 1281F0 002280F0 08008226 */  addiu      $2, $20, 0x8
/* 1281F4 002280F4 B400A2AF */  sw         $2, 0xB4($sp)
/* 1281F8 002280F8 DB01023C */  lui        $2, %hi(D_1DA8BF5)
/* 1281FC 002280FC F58B4224 */  addiu      $2, $2, %lo(D_1DA8BF5)
/* 128200 00228100 21105000 */  addu       $2, $2, $16
/* 128204 00228104 00004890 */  lbu        $8, 0x0($2)
/* 128208 00228108 B400A58F */  lw         $5, 0xB4($sp)
/* 12820C 0022810C 2A086502 */  slt        $at, $19, $5
/* 128210 00228110 07002010 */  beqz       $at, .L00228130
/* 128214 00228114 00000000 */   nop
/* 128218 00228118 0500A426 */  addiu      $4, $21, 0x5
/* 12821C 0022811C 28366072 */  paddub     $6, $19, $0
/* 128220 00228120 283E4072 */  paddub     $7, $18, $0
/* 128224 00228124 284E2072 */  paddub     $9, $17, $0
/* 128228 00228128 9CA0080C */  jal        DrawDunNumberClip__Fiiiiii
/* 12822C 0022812C 00000000 */   nop
.L00228130:
/* 128230 00228130 10008226 */  addiu      $2, $20, 0x10
/* 128234 00228134 B400A2AF */  sw         $2, 0xB4($sp)
/* 128238 00228138 DB01023C */  lui        $2, %hi(D_1DA8B91)
/* 12823C 0022813C 918B4224 */  addiu      $2, $2, %lo(D_1DA8B91)
/* 128240 00228140 21105000 */  addu       $2, $2, $16
/* 128244 00228144 00004890 */  lbu        $8, 0x0($2)
/* 128248 00228148 1B00A426 */  addiu      $4, $21, 0x1B
/* 12824C 0022814C B400A58F */  lw         $5, 0xB4($sp)
/* 128250 00228150 28366072 */  paddub     $6, $19, $0
/* 128254 00228154 283E4072 */  paddub     $7, $18, $0
/* 128258 00228158 284E2072 */  paddub     $9, $17, $0
/* 12825C 0022815C 9CA0080C */  jal        DrawDunNumberClip__Fiiiiii
/* 128260 00228160 00000000 */   nop
/* 128264 00228164 40181000 */  sll        $3, $16, 1
/* 128268 00228168 DB01023C */  lui        $2, %hi(D_1DA8C5A)
/* 12826C 0022816C 5A8C4224 */  addiu      $2, $2, %lo(D_1DA8C5A)
/* 128270 00228170 21104300 */  addu       $2, $2, $3
/* 128274 00228174 00005084 */  lh         $16, 0x0($2)
/* 128278 00228178 3600B526 */  addiu      $21, $21, 0x36
/* 12827C 0022817C 01008226 */  addiu      $2, $20, 0x1
/* 128280 00228180 B400A2AF */  sw         $2, 0xB4($sp)
/* 128284 00228184 20000224 */  addiu      $2, $0, 0x20
/* 128288 00228188 B800A2AF */  sw         $2, 0xB8($sp)
/* 12828C 0022818C 23000224 */  addiu      $2, $0, 0x23
/* 128290 00228190 BC00A2AF */  sw         $2, 0xBC($sp)
/* 128294 00228194 B400A427 */  addiu      $4, $sp, 0xB4
/* 128298 00228198 B800A527 */  addiu      $5, $sp, 0xB8
/* 12829C 0022819C BC00A627 */  addiu      $6, $sp, 0xBC
/* 1282A0 002281A0 283E6072 */  paddub     $7, $19, $0
/* 1282A4 002281A4 28464072 */  paddub     $8, $18, $0
/* 1282A8 002281A8 A0B7080C */  jal        MenuTextureClip__FRiRiRiii
/* 1282AC 002281AC 00000000 */   nop
/* 1282B0 002281B0 B400A58F */  lw         $5, 0xB4($sp)
/* 1282B4 002281B4 2A08B200 */  slt        $at, $5, $18
/* 1282B8 002281B8 13002010 */  beqz       $at, .L00228208
/* 1282BC 002281BC 00000000 */   nop
/* 1282C0 002281C0 BC00A48F */  lw         $4, 0xBC($sp)
/* 1282C4 002281C4 B800A38F */  lw         $3, 0xB8($sp)
/* 1282C8 002281C8 B3000224 */  addiu      $2, $0, 0xB3
/* 1282CC 002281CC A000A2AF */  sw         $2, 0xA0($sp)
/* 1282D0 002281D0 A400A3AF */  sw         $3, 0xA4($sp)
/* 1282D4 002281D4 1E000224 */  addiu      $2, $0, 0x1E
/* 1282D8 002281D8 A800A2AF */  sw         $2, 0xA8($sp)
/* 1282DC 002281DC AC00A4AF */  sw         $4, 0xAC($sp)
/* 1282E0 002281E0 9000B5AF */  sw         $21, 0x90($sp)
/* 1282E4 002281E4 9400A5AF */  sw         $5, 0x94($sp)
/* 1282E8 002281E8 9800A2AF */  sw         $2, 0x98($sp)
/* 1282EC 002281EC 9C00A4AF */  sw         $4, 0x9C($sp)
/* 1282F0 002281F0 6497848F */  lw         $4, -0x689C($gp)
/* 1282F4 002281F4 9000A527 */  addiu      $5, $sp, 0x90
/* 1282F8 002281F8 A000A627 */  addiu      $6, $sp, 0xA0
/* 1282FC 002281FC 283E2072 */  paddub     $7, $17, $0
/* 128300 00228200 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 128304 00228204 00000000 */   nop
.L00228208:
/* 128308 00228208 10008326 */  addiu      $3, $20, 0x10
/* 12830C 0022820C B400A3AF */  sw         $3, 0xB4($sp)
/* 128310 00228210 B400A58F */  lw         $5, 0xB4($sp)
/* 128314 00228214 FCFF4326 */  addiu      $3, $18, -0x4
/* 128318 00228218 2A08A300 */  slt        $at, $5, $3
/* 12831C 0022821C 08002010 */  beqz       $at, .L00228240
/* 128320 00228220 00000000 */   nop
/* 128324 00228224 4400A426 */  addiu      $4, $21, 0x44
/* 128328 00228228 FAFF4726 */  addiu      $7, $18, -0x6
/* 12832C 0022822C 28366072 */  paddub     $6, $19, $0
/* 128330 00228230 28460072 */  paddub     $8, $16, $0
/* 128334 00228234 284E2072 */  paddub     $9, $17, $0
/* 128338 00228238 B09F080C */  jal        DrawEnemyNum__Fiiiiii
/* 12833C 0022823C 00000000 */   nop
.L00228240:
/* 128340 00228240 6000BF7B */  lq         $31, 0x60($sp)
/* 128344 00228244 5000B57B */  lq         $21, 0x50($sp)
/* 128348 00228248 4000B47B */  lq         $20, 0x40($sp)
/* 12834C 0022824C 3000B37B */  lq         $19, 0x30($sp)
/* 128350 00228250 2000B27B */  lq         $18, 0x20($sp)
/* 128354 00228254 1000B17B */  lq         $17, 0x10($sp)
/* 128358 00228258 0000B07B */  lq         $16, 0x0($sp)
/* 12835C 0022825C C000BD27 */  addiu      $sp, $sp, 0xC0
/* 128360 00228260 0800E003 */  jr         $31
/* 128364 00228264 00000000 */   nop
/* 128368 00228268 00000000 */  nop
/* 12836C 0022826C 00000000 */  nop
