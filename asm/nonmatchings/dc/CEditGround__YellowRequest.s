.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel YellowRequest__11CEditGroundFPA64_P9CMapParts
/* A8040 001A7F40 30FEBD27 */  addiu      $sp, $sp, -0x1D0
/* A8044 001A7F44 5000BF7F */  sq         $31, 0x50($sp)
/* A8048 001A7F48 4000B47F */  sq         $20, 0x40($sp)
/* A804C 001A7F4C 3000B37F */  sq         $19, 0x30($sp)
/* A8050 001A7F50 2000B27F */  sq         $18, 0x20($sp)
/* A8054 001A7F54 1000B17F */  sq         $17, 0x10($sp)
/* A8058 001A7F58 0000B07F */  sq         $16, 0x0($sp)
/* A805C 001A7F5C 28A68070 */  paddub     $20, $4, $0
/* A8060 001A7F60 289EA070 */  paddub     $19, $5, $0
/* A8064 001A7F64 0D000524 */  addiu      $5, $0, 0xD
/* A8068 001A7F68 0100013C */  lui        $at, (0x15030 >> 16)
/* A806C 001A7F6C 21088100 */  addu       $at, $4, $at
/* A8070 001A7F70 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A8074 001A7F74 000065AC */  sw         $5, 0x0($3)
/* A8078 001A7F78 0400838C */  lw         $3, 0x4($4)
/* A807C 001A7F7C 0F026010 */  beqz       $3, .L001A87BC
/* A8080 001A7F80 00000000 */   nop
/* A8084 001A7F84 281E0070 */  paddub     $3, $0, $0
/* A8088 001A7F88 05000010 */  b          .L001A7FA0
/* A808C 001A7F8C 00000000 */   nop
.L001A7F90:
/* A8090 001A7F90 80100300 */  sll        $2, $3, 2
/* A8094 001A7F94 21105D00 */  addu       $2, $2, $sp
/* A8098 001A7F98 600040AC */  sw         $0, 0x60($2)
/* A809C 001A7F9C 01006324 */  addiu      $3, $3, 0x1
.L001A7FA0:
/* A80A0 001A7FA0 18006228 */  slti       $2, $3, 0x18
/* A80A4 001A7FA4 FAFF4014 */  bnez       $2, .L001A7F90
/* A80A8 001A7FA8 00000000 */   nop
/* A80AC 001A7FAC 0000648E */  lw         $4, 0x0($19)
/* A80B0 001A7FB0 0007658E */  lw         $5, 0x700($19)
/* A80B4 001A7FB4 28360070 */  paddub     $6, $0, $0
/* A80B8 001A7FB8 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A80BC 001A7FBC 00000000 */   nop
/* A80C0 001A7FC0 2C004010 */  beqz       $2, .L001A8074
/* A80C4 001A7FC4 00000000 */   nop
/* A80C8 001A7FC8 CC00A0AF */  sw         $0, 0xCC($sp)
/* A80CC 001A7FCC C800A0AF */  sw         $0, 0xC8($sp)
/* A80D0 001A7FD0 C400A0AF */  sw         $0, 0xC4($sp)
/* A80D4 001A7FD4 C000A0AF */  sw         $0, 0xC0($sp)
/* A80D8 001A7FD8 DC00A0AF */  sw         $0, 0xDC($sp)
/* A80DC 001A7FDC D800A0AF */  sw         $0, 0xD8($sp)
/* A80E0 001A7FE0 D400A0AF */  sw         $0, 0xD4($sp)
/* A80E4 001A7FE4 D000A0AF */  sw         $0, 0xD0($sp)
/* A80E8 001A7FE8 28268072 */  paddub     $4, $20, $0
/* A80EC 001A7FEC C000A527 */  addiu      $5, $sp, 0xC0
/* A80F0 001A7FF0 0000668E */  lw         $6, 0x0($19)
/* A80F4 001A7FF4 283E0070 */  paddub     $7, $0, $0
/* A80F8 001A7FF8 02000824 */  addiu      $8, $0, 0x2
/* A80FC 001A7FFC 0499060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A8100 001A8000 00000000 */   nop
/* A8104 001A8004 28268072 */  paddub     $4, $20, $0
/* A8108 001A8008 D000A527 */  addiu      $5, $sp, 0xD0
/* A810C 001A800C 0000668E */  lw         $6, 0x0($19)
/* A8110 001A8010 01000724 */  addiu      $7, $0, 0x1
/* A8114 001A8014 02000824 */  addiu      $8, $0, 0x2
/* A8118 001A8018 0499060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A811C 001A801C 00000000 */   nop
/* A8120 001A8020 28268072 */  paddub     $4, $20, $0
/* A8124 001A8024 07000524 */  addiu      $5, $0, 0x7
/* A8128 001A8028 28360070 */  paddub     $6, $0, $0
/* A812C 001A802C C000A727 */  addiu      $7, $sp, 0xC0
/* A8130 001A8030 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A8134 001A8034 00000000 */   nop
/* A8138 001A8038 0E004010 */  beqz       $2, .L001A8074
/* A813C 001A803C 00000000 */   nop
/* A8140 001A8040 28268072 */  paddub     $4, $20, $0
/* A8144 001A8044 07000524 */  addiu      $5, $0, 0x7
/* A8148 001A8048 28360070 */  paddub     $6, $0, $0
/* A814C 001A804C D000A727 */  addiu      $7, $sp, 0xD0
/* A8150 001A8050 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A8154 001A8054 00000000 */   nop
/* A8158 001A8058 06004010 */  beqz       $2, .L001A8074
/* A815C 001A805C 00000000 */   nop
/* A8160 001A8060 01000324 */  addiu      $3, $0, 0x1
/* A8164 001A8064 0100013C */  lui        $at, (0x15030 >> 16)
/* A8168 001A8068 21088102 */  addu       $at, $20, $at
/* A816C 001A806C 3050228C */  lw         $2, (0x15030 & 0xFFFF)($at)
/* A8170 001A8070 040043AC */  sw         $3, 0x4($2)
.L001A8074:
/* A8174 001A8074 0001648E */  lw         $4, 0x100($19)
/* A8178 001A8078 0005658E */  lw         $5, 0x500($19)
/* A817C 001A807C 28360070 */  paddub     $6, $0, $0
/* A8180 001A8080 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A8184 001A8084 00000000 */   nop
/* A8188 001A8088 19004010 */  beqz       $2, .L001A80F0
/* A818C 001A808C 00000000 */   nop
/* A8190 001A8090 EC00A0AF */  sw         $0, 0xEC($sp)
/* A8194 001A8094 E800A0AF */  sw         $0, 0xE8($sp)
/* A8198 001A8098 E400A0AF */  sw         $0, 0xE4($sp)
/* A819C 001A809C E000A0AF */  sw         $0, 0xE0($sp)
/* A81A0 001A80A0 28268072 */  paddub     $4, $20, $0
/* A81A4 001A80A4 E000A527 */  addiu      $5, $sp, 0xE0
/* A81A8 001A80A8 0001668E */  lw         $6, 0x100($19)
/* A81AC 001A80AC 283E0070 */  paddub     $7, $0, $0
/* A81B0 001A80B0 FFFF0824 */  addiu      $8, $0, -0x1
/* A81B4 001A80B4 0499060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A81B8 001A80B8 00000000 */   nop
/* A81BC 001A80BC 28268072 */  paddub     $4, $20, $0
/* A81C0 001A80C0 05000524 */  addiu      $5, $0, 0x5
/* A81C4 001A80C4 28360070 */  paddub     $6, $0, $0
/* A81C8 001A80C8 E000A727 */  addiu      $7, $sp, 0xE0
/* A81CC 001A80CC 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A81D0 001A80D0 00000000 */   nop
/* A81D4 001A80D4 06004010 */  beqz       $2, .L001A80F0
/* A81D8 001A80D8 00000000 */   nop
/* A81DC 001A80DC 01000324 */  addiu      $3, $0, 0x1
/* A81E0 001A80E0 0100013C */  lui        $at, (0x15030 >> 16)
/* A81E4 001A80E4 21088102 */  addu       $at, $20, $at
/* A81E8 001A80E8 3050228C */  lw         $2, (0x15030 & 0xFFFF)($at)
/* A81EC 001A80EC 080043AC */  sw         $3, 0x8($2)
.L001A80F0:
/* A81F0 001A80F0 0002648E */  lw         $4, 0x200($19)
/* A81F4 001A80F4 0006658E */  lw         $5, 0x600($19)
/* A81F8 001A80F8 28360070 */  paddub     $6, $0, $0
/* A81FC 001A80FC 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A8200 001A8100 00000000 */   nop
/* A8204 001A8104 19004010 */  beqz       $2, .L001A816C
/* A8208 001A8108 00000000 */   nop
/* A820C 001A810C FC00A0AF */  sw         $0, 0xFC($sp)
/* A8210 001A8110 F800A0AF */  sw         $0, 0xF8($sp)
/* A8214 001A8114 F400A0AF */  sw         $0, 0xF4($sp)
/* A8218 001A8118 F000A0AF */  sw         $0, 0xF0($sp)
/* A821C 001A811C 28268072 */  paddub     $4, $20, $0
/* A8220 001A8120 F000A527 */  addiu      $5, $sp, 0xF0
/* A8224 001A8124 0002668E */  lw         $6, 0x200($19)
/* A8228 001A8128 283E0070 */  paddub     $7, $0, $0
/* A822C 001A812C FFFF0824 */  addiu      $8, $0, -0x1
/* A8230 001A8130 0499060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A8234 001A8134 00000000 */   nop
/* A8238 001A8138 28268072 */  paddub     $4, $20, $0
/* A823C 001A813C 06000524 */  addiu      $5, $0, 0x6
/* A8240 001A8140 28360070 */  paddub     $6, $0, $0
/* A8244 001A8144 F000A727 */  addiu      $7, $sp, 0xF0
/* A8248 001A8148 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A824C 001A814C 00000000 */   nop
/* A8250 001A8150 06004010 */  beqz       $2, .L001A816C
/* A8254 001A8154 00000000 */   nop
/* A8258 001A8158 01000324 */  addiu      $3, $0, 0x1
/* A825C 001A815C 0100013C */  lui        $at, (0x15030 >> 16)
/* A8260 001A8160 21088102 */  addu       $at, $20, $at
/* A8264 001A8164 3050228C */  lw         $2, (0x15030 & 0xFFFF)($at)
/* A8268 001A8168 0C0043AC */  sw         $3, 0xC($2)
.L001A816C:
/* A826C 001A816C 0003648E */  lw         $4, 0x300($19)
/* A8270 001A8170 0007658E */  lw         $5, 0x700($19)
/* A8274 001A8174 28360070 */  paddub     $6, $0, $0
/* A8278 001A8178 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A827C 001A817C 00000000 */   nop
/* A8280 001A8180 2C004010 */  beqz       $2, .L001A8234
/* A8284 001A8184 00000000 */   nop
/* A8288 001A8188 0C01A0AF */  sw         $0, 0x10C($sp)
/* A828C 001A818C 0801A0AF */  sw         $0, 0x108($sp)
/* A8290 001A8190 0401A0AF */  sw         $0, 0x104($sp)
/* A8294 001A8194 0001A0AF */  sw         $0, 0x100($sp)
/* A8298 001A8198 1C01A0AF */  sw         $0, 0x11C($sp)
/* A829C 001A819C 1801A0AF */  sw         $0, 0x118($sp)
/* A82A0 001A81A0 1401A0AF */  sw         $0, 0x114($sp)
/* A82A4 001A81A4 1001A0AF */  sw         $0, 0x110($sp)
/* A82A8 001A81A8 28268072 */  paddub     $4, $20, $0
/* A82AC 001A81AC 0001A527 */  addiu      $5, $sp, 0x100
/* A82B0 001A81B0 0003668E */  lw         $6, 0x300($19)
/* A82B4 001A81B4 02000724 */  addiu      $7, $0, 0x2
/* A82B8 001A81B8 01000824 */  addiu      $8, $0, 0x1
/* A82BC 001A81BC 0499060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A82C0 001A81C0 00000000 */   nop
/* A82C4 001A81C4 28268072 */  paddub     $4, $20, $0
/* A82C8 001A81C8 1001A527 */  addiu      $5, $sp, 0x110
/* A82CC 001A81CC 0003668E */  lw         $6, 0x300($19)
/* A82D0 001A81D0 02000724 */  addiu      $7, $0, 0x2
/* A82D4 001A81D4 28460070 */  paddub     $8, $0, $0
/* A82D8 001A81D8 0499060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A82DC 001A81DC 00000000 */   nop
/* A82E0 001A81E0 28268072 */  paddub     $4, $20, $0
/* A82E4 001A81E4 07000524 */  addiu      $5, $0, 0x7
/* A82E8 001A81E8 28360070 */  paddub     $6, $0, $0
/* A82EC 001A81EC 0001A727 */  addiu      $7, $sp, 0x100
/* A82F0 001A81F0 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A82F4 001A81F4 00000000 */   nop
/* A82F8 001A81F8 0E004010 */  beqz       $2, .L001A8234
/* A82FC 001A81FC 00000000 */   nop
/* A8300 001A8200 28268072 */  paddub     $4, $20, $0
/* A8304 001A8204 07000524 */  addiu      $5, $0, 0x7
/* A8308 001A8208 28360070 */  paddub     $6, $0, $0
/* A830C 001A820C 1001A727 */  addiu      $7, $sp, 0x110
/* A8310 001A8210 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A8314 001A8214 00000000 */   nop
/* A8318 001A8218 06004014 */  bnez       $2, .L001A8234
/* A831C 001A821C 00000000 */   nop
/* A8320 001A8220 01000324 */  addiu      $3, $0, 0x1
/* A8324 001A8224 0100013C */  lui        $at, (0x15030 >> 16)
/* A8328 001A8228 21088102 */  addu       $at, $20, $at
/* A832C 001A822C 3050228C */  lw         $2, (0x15030 & 0xFFFF)($at)
/* A8330 001A8230 100043AC */  sw         $3, 0x10($2)
.L001A8234:
/* A8334 001A8234 0004648E */  lw         $4, 0x400($19)
/* A8338 001A8238 0007658E */  lw         $5, 0x700($19)
/* A833C 001A823C 28360070 */  paddub     $6, $0, $0
/* A8340 001A8240 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A8344 001A8244 00000000 */   nop
/* A8348 001A8248 2C004010 */  beqz       $2, .L001A82FC
/* A834C 001A824C 00000000 */   nop
/* A8350 001A8250 2C01A0AF */  sw         $0, 0x12C($sp)
/* A8354 001A8254 2801A0AF */  sw         $0, 0x128($sp)
/* A8358 001A8258 2401A0AF */  sw         $0, 0x124($sp)
/* A835C 001A825C 2001A0AF */  sw         $0, 0x120($sp)
/* A8360 001A8260 3C01A0AF */  sw         $0, 0x13C($sp)
/* A8364 001A8264 3801A0AF */  sw         $0, 0x138($sp)
/* A8368 001A8268 3401A0AF */  sw         $0, 0x134($sp)
/* A836C 001A826C 3001A0AF */  sw         $0, 0x130($sp)
/* A8370 001A8270 28268072 */  paddub     $4, $20, $0
/* A8374 001A8274 2001A527 */  addiu      $5, $sp, 0x120
/* A8378 001A8278 0004668E */  lw         $6, 0x400($19)
/* A837C 001A827C FFFF0724 */  addiu      $7, $0, -0x1
/* A8380 001A8280 01000824 */  addiu      $8, $0, 0x1
/* A8384 001A8284 0499060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A8388 001A8288 00000000 */   nop
/* A838C 001A828C 28268072 */  paddub     $4, $20, $0
/* A8390 001A8290 3001A527 */  addiu      $5, $sp, 0x130
/* A8394 001A8294 0004668E */  lw         $6, 0x400($19)
/* A8398 001A8298 FFFF0724 */  addiu      $7, $0, -0x1
/* A839C 001A829C 28460070 */  paddub     $8, $0, $0
/* A83A0 001A82A0 0499060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A83A4 001A82A4 00000000 */   nop
/* A83A8 001A82A8 28268072 */  paddub     $4, $20, $0
/* A83AC 001A82AC 07000524 */  addiu      $5, $0, 0x7
/* A83B0 001A82B0 28360070 */  paddub     $6, $0, $0
/* A83B4 001A82B4 2001A727 */  addiu      $7, $sp, 0x120
/* A83B8 001A82B8 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A83BC 001A82BC 00000000 */   nop
/* A83C0 001A82C0 0E004010 */  beqz       $2, .L001A82FC
/* A83C4 001A82C4 00000000 */   nop
/* A83C8 001A82C8 28268072 */  paddub     $4, $20, $0
/* A83CC 001A82CC 07000524 */  addiu      $5, $0, 0x7
/* A83D0 001A82D0 28360070 */  paddub     $6, $0, $0
/* A83D4 001A82D4 3001A727 */  addiu      $7, $sp, 0x130
/* A83D8 001A82D8 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A83DC 001A82DC 00000000 */   nop
/* A83E0 001A82E0 06004014 */  bnez       $2, .L001A82FC
/* A83E4 001A82E4 00000000 */   nop
/* A83E8 001A82E8 01000324 */  addiu      $3, $0, 0x1
/* A83EC 001A82EC 0100013C */  lui        $at, (0x15030 >> 16)
/* A83F0 001A82F0 21088102 */  addu       $at, $20, $at
/* A83F4 001A82F4 3050228C */  lw         $2, (0x15030 & 0xFFFF)($at)
/* A83F8 001A82F8 140043AC */  sw         $3, 0x14($2)
.L001A82FC:
/* A83FC 001A82FC 0005648E */  lw         $4, 0x500($19)
/* A8400 001A8300 0003658E */  lw         $5, 0x300($19)
/* A8404 001A8304 28360070 */  paddub     $6, $0, $0
/* A8408 001A8308 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A840C 001A830C 00000000 */   nop
/* A8410 001A8310 19004010 */  beqz       $2, .L001A8378
/* A8414 001A8314 00000000 */   nop
/* A8418 001A8318 4C01A0AF */  sw         $0, 0x14C($sp)
/* A841C 001A831C 4801A0AF */  sw         $0, 0x148($sp)
/* A8420 001A8320 4401A0AF */  sw         $0, 0x144($sp)
/* A8424 001A8324 4001A0AF */  sw         $0, 0x140($sp)
/* A8428 001A8328 28268072 */  paddub     $4, $20, $0
/* A842C 001A832C 4001A527 */  addiu      $5, $sp, 0x140
/* A8430 001A8330 0003668E */  lw         $6, 0x300($19)
/* A8434 001A8334 01000724 */  addiu      $7, $0, 0x1
/* A8438 001A8338 02000824 */  addiu      $8, $0, 0x2
/* A843C 001A833C 0499060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A8440 001A8340 00000000 */   nop
/* A8444 001A8344 28268072 */  paddub     $4, $20, $0
/* A8448 001A8348 05000524 */  addiu      $5, $0, 0x5
/* A844C 001A834C 28360070 */  paddub     $6, $0, $0
/* A8450 001A8350 4001A727 */  addiu      $7, $sp, 0x140
/* A8454 001A8354 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A8458 001A8358 00000000 */   nop
/* A845C 001A835C 06004010 */  beqz       $2, .L001A8378
/* A8460 001A8360 00000000 */   nop
/* A8464 001A8364 01000324 */  addiu      $3, $0, 0x1
/* A8468 001A8368 0100013C */  lui        $at, (0x15030 >> 16)
/* A846C 001A836C 21088102 */  addu       $at, $20, $at
/* A8470 001A8370 3050228C */  lw         $2, (0x15030 & 0xFFFF)($at)
/* A8474 001A8374 180043AC */  sw         $3, 0x18($2)
.L001A8378:
/* A8478 001A8378 0006648E */  lw         $4, 0x600($19)
/* A847C 001A837C 0004658E */  lw         $5, 0x400($19)
/* A8480 001A8380 28360070 */  paddub     $6, $0, $0
/* A8484 001A8384 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A8488 001A8388 00000000 */   nop
/* A848C 001A838C 19004010 */  beqz       $2, .L001A83F4
/* A8490 001A8390 00000000 */   nop
/* A8494 001A8394 5C01A0AF */  sw         $0, 0x15C($sp)
/* A8498 001A8398 5801A0AF */  sw         $0, 0x158($sp)
/* A849C 001A839C 5401A0AF */  sw         $0, 0x154($sp)
/* A84A0 001A83A0 5001A0AF */  sw         $0, 0x150($sp)
/* A84A4 001A83A4 28268072 */  paddub     $4, $20, $0
/* A84A8 001A83A8 5001A527 */  addiu      $5, $sp, 0x150
/* A84AC 001A83AC 0004668E */  lw         $6, 0x400($19)
/* A84B0 001A83B0 283E0070 */  paddub     $7, $0, $0
/* A84B4 001A83B4 02000824 */  addiu      $8, $0, 0x2
/* A84B8 001A83B8 0499060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A84BC 001A83BC 00000000 */   nop
/* A84C0 001A83C0 28268072 */  paddub     $4, $20, $0
/* A84C4 001A83C4 06000524 */  addiu      $5, $0, 0x6
/* A84C8 001A83C8 28360070 */  paddub     $6, $0, $0
/* A84CC 001A83CC 5001A727 */  addiu      $7, $sp, 0x150
/* A84D0 001A83D0 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A84D4 001A83D4 00000000 */   nop
/* A84D8 001A83D8 06004010 */  beqz       $2, .L001A83F4
/* A84DC 001A83DC 00000000 */   nop
/* A84E0 001A83E0 01000324 */  addiu      $3, $0, 0x1
/* A84E4 001A83E4 0100013C */  lui        $at, (0x15030 >> 16)
/* A84E8 001A83E8 21088102 */  addu       $at, $20, $at
/* A84EC 001A83EC 3050228C */  lw         $2, (0x15030 & 0xFFFF)($at)
/* A84F0 001A83F0 1C0043AC */  sw         $3, 0x1C($2)
.L001A83F4:
/* A84F4 001A83F4 0007628E */  lw         $2, 0x700($19)
/* A84F8 001A83F8 06004010 */  beqz       $2, .L001A8414
/* A84FC 001A83FC 00000000 */   nop
/* A8500 001A8400 01000324 */  addiu      $3, $0, 0x1
/* A8504 001A8404 0100013C */  lui        $at, (0x15030 >> 16)
/* A8508 001A8408 21088102 */  addu       $at, $20, $at
/* A850C 001A840C 3050228C */  lw         $2, (0x15030 & 0xFFFF)($at)
/* A8510 001A8410 200043AC */  sw         $3, 0x20($2)
.L001A8414:
/* A8514 001A8414 0008648E */  lw         $4, 0x800($19)
/* A8518 001A8418 0007658E */  lw         $5, 0x700($19)
/* A851C 001A841C 28360070 */  paddub     $6, $0, $0
/* A8520 001A8420 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A8524 001A8424 00000000 */   nop
/* A8528 001A8428 2C004010 */  beqz       $2, .L001A84DC
/* A852C 001A842C 00000000 */   nop
/* A8530 001A8430 6C01A0AF */  sw         $0, 0x16C($sp)
/* A8534 001A8434 6801A0AF */  sw         $0, 0x168($sp)
/* A8538 001A8438 6401A0AF */  sw         $0, 0x164($sp)
/* A853C 001A843C 6001A0AF */  sw         $0, 0x160($sp)
/* A8540 001A8440 7C01A0AF */  sw         $0, 0x17C($sp)
/* A8544 001A8444 7801A0AF */  sw         $0, 0x178($sp)
/* A8548 001A8448 7401A0AF */  sw         $0, 0x174($sp)
/* A854C 001A844C 7001A0AF */  sw         $0, 0x170($sp)
/* A8550 001A8450 28268072 */  paddub     $4, $20, $0
/* A8554 001A8454 6001A527 */  addiu      $5, $sp, 0x160
/* A8558 001A8458 0008668E */  lw         $6, 0x800($19)
/* A855C 001A845C 283E0070 */  paddub     $7, $0, $0
/* A8560 001A8460 FFFF0824 */  addiu      $8, $0, -0x1
/* A8564 001A8464 0499060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A8568 001A8468 00000000 */   nop
/* A856C 001A846C 28268072 */  paddub     $4, $20, $0
/* A8570 001A8470 7001A527 */  addiu      $5, $sp, 0x170
/* A8574 001A8474 0008668E */  lw         $6, 0x800($19)
/* A8578 001A8478 01000724 */  addiu      $7, $0, 0x1
/* A857C 001A847C FFFF0824 */  addiu      $8, $0, -0x1
/* A8580 001A8480 0499060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A8584 001A8484 00000000 */   nop
/* A8588 001A8488 28268072 */  paddub     $4, $20, $0
/* A858C 001A848C 07000524 */  addiu      $5, $0, 0x7
/* A8590 001A8490 28360070 */  paddub     $6, $0, $0
/* A8594 001A8494 6001A727 */  addiu      $7, $sp, 0x160
/* A8598 001A8498 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A859C 001A849C 00000000 */   nop
/* A85A0 001A84A0 0E004010 */  beqz       $2, .L001A84DC
/* A85A4 001A84A4 00000000 */   nop
/* A85A8 001A84A8 28268072 */  paddub     $4, $20, $0
/* A85AC 001A84AC 07000524 */  addiu      $5, $0, 0x7
/* A85B0 001A84B0 28360070 */  paddub     $6, $0, $0
/* A85B4 001A84B4 7001A727 */  addiu      $7, $sp, 0x170
/* A85B8 001A84B8 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A85BC 001A84BC 00000000 */   nop
/* A85C0 001A84C0 06004010 */  beqz       $2, .L001A84DC
/* A85C4 001A84C4 00000000 */   nop
/* A85C8 001A84C8 01000324 */  addiu      $3, $0, 0x1
/* A85CC 001A84CC 0100013C */  lui        $at, (0x15030 >> 16)
/* A85D0 001A84D0 21088102 */  addu       $at, $20, $at
/* A85D4 001A84D4 3050228C */  lw         $2, (0x15030 & 0xFFFF)($at)
/* A85D8 001A84D8 240043AC */  sw         $3, 0x24($2)
.L001A84DC:
/* A85DC 001A84DC 0009648E */  lw         $4, 0x900($19)
/* A85E0 001A84E0 0008658E */  lw         $5, 0x800($19)
/* A85E4 001A84E4 28360070 */  paddub     $6, $0, $0
/* A85E8 001A84E8 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A85EC 001A84EC 00000000 */   nop
/* A85F0 001A84F0 19004010 */  beqz       $2, .L001A8558
/* A85F4 001A84F4 00000000 */   nop
/* A85F8 001A84F8 8C01A0AF */  sw         $0, 0x18C($sp)
/* A85FC 001A84FC 8801A0AF */  sw         $0, 0x188($sp)
/* A8600 001A8500 8401A0AF */  sw         $0, 0x184($sp)
/* A8604 001A8504 8001A0AF */  sw         $0, 0x180($sp)
/* A8608 001A8508 28268072 */  paddub     $4, $20, $0
/* A860C 001A850C 8001A527 */  addiu      $5, $sp, 0x180
/* A8610 001A8510 0008668E */  lw         $6, 0x800($19)
/* A8614 001A8514 283E0070 */  paddub     $7, $0, $0
/* A8618 001A8518 01000824 */  addiu      $8, $0, 0x1
/* A861C 001A851C 0499060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A8620 001A8520 00000000 */   nop
/* A8624 001A8524 28268072 */  paddub     $4, $20, $0
/* A8628 001A8528 09000524 */  addiu      $5, $0, 0x9
/* A862C 001A852C 28360070 */  paddub     $6, $0, $0
/* A8630 001A8530 8001A727 */  addiu      $7, $sp, 0x180
/* A8634 001A8534 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A8638 001A8538 00000000 */   nop
/* A863C 001A853C 06004010 */  beqz       $2, .L001A8558
/* A8640 001A8540 00000000 */   nop
/* A8644 001A8544 01000324 */  addiu      $3, $0, 0x1
/* A8648 001A8548 0100013C */  lui        $at, (0x15030 >> 16)
/* A864C 001A854C 21088102 */  addu       $at, $20, $at
/* A8650 001A8550 3050228C */  lw         $2, (0x15030 & 0xFFFF)($at)
/* A8654 001A8554 280043AC */  sw         $3, 0x28($2)
.L001A8558:
/* A8658 001A8558 000A648E */  lw         $4, 0xA00($19)
/* A865C 001A855C 0008658E */  lw         $5, 0x800($19)
/* A8660 001A8560 28360070 */  paddub     $6, $0, $0
/* A8664 001A8564 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A8668 001A8568 00000000 */   nop
/* A866C 001A856C 19004010 */  beqz       $2, .L001A85D4
/* A8670 001A8570 00000000 */   nop
/* A8674 001A8574 9C01A0AF */  sw         $0, 0x19C($sp)
/* A8678 001A8578 9801A0AF */  sw         $0, 0x198($sp)
/* A867C 001A857C 9401A0AF */  sw         $0, 0x194($sp)
/* A8680 001A8580 9001A0AF */  sw         $0, 0x190($sp)
/* A8684 001A8584 28268072 */  paddub     $4, $20, $0
/* A8688 001A8588 9001A527 */  addiu      $5, $sp, 0x190
/* A868C 001A858C 0008668E */  lw         $6, 0x800($19)
/* A8690 001A8590 01000724 */  addiu      $7, $0, 0x1
/* A8694 001A8594 2846E070 */  paddub     $8, $7, $0
/* A8698 001A8598 0499060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A869C 001A859C 00000000 */   nop
/* A86A0 001A85A0 28268072 */  paddub     $4, $20, $0
/* A86A4 001A85A4 0A000524 */  addiu      $5, $0, 0xA
/* A86A8 001A85A8 28360070 */  paddub     $6, $0, $0
/* A86AC 001A85AC 9001A727 */  addiu      $7, $sp, 0x190
/* A86B0 001A85B0 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A86B4 001A85B4 00000000 */   nop
/* A86B8 001A85B8 06004010 */  beqz       $2, .L001A85D4
/* A86BC 001A85BC 00000000 */   nop
/* A86C0 001A85C0 01000324 */  addiu      $3, $0, 0x1
/* A86C4 001A85C4 0100013C */  lui        $at, (0x15030 >> 16)
/* A86C8 001A85C8 21088102 */  addu       $at, $20, $at
/* A86CC 001A85CC 3050228C */  lw         $2, (0x15030 & 0xFFFF)($at)
/* A86D0 001A85D0 2C0043AC */  sw         $3, 0x2C($2)
.L001A85D4:
/* A86D4 001A85D4 000B648E */  lw         $4, 0xB00($19)
/* A86D8 001A85D8 0009658E */  lw         $5, 0x900($19)
/* A86DC 001A85DC 28360070 */  paddub     $6, $0, $0
/* A86E0 001A85E0 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A86E4 001A85E4 00000000 */   nop
/* A86E8 001A85E8 19004010 */  beqz       $2, .L001A8650
/* A86EC 001A85EC 00000000 */   nop
/* A86F0 001A85F0 AC01A0AF */  sw         $0, 0x1AC($sp)
/* A86F4 001A85F4 A801A0AF */  sw         $0, 0x1A8($sp)
/* A86F8 001A85F8 A401A0AF */  sw         $0, 0x1A4($sp)
/* A86FC 001A85FC A001A0AF */  sw         $0, 0x1A0($sp)
/* A8700 001A8600 28268072 */  paddub     $4, $20, $0
/* A8704 001A8604 A001A527 */  addiu      $5, $sp, 0x1A0
/* A8708 001A8608 000B668E */  lw         $6, 0xB00($19)
/* A870C 001A860C 283E0070 */  paddub     $7, $0, $0
/* A8710 001A8610 FFFF0824 */  addiu      $8, $0, -0x1
/* A8714 001A8614 0499060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A8718 001A8618 00000000 */   nop
/* A871C 001A861C 28268072 */  paddub     $4, $20, $0
/* A8720 001A8620 09000524 */  addiu      $5, $0, 0x9
/* A8724 001A8624 28360070 */  paddub     $6, $0, $0
/* A8728 001A8628 A001A727 */  addiu      $7, $sp, 0x1A0
/* A872C 001A862C 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A8730 001A8630 00000000 */   nop
/* A8734 001A8634 06004010 */  beqz       $2, .L001A8650
/* A8738 001A8638 00000000 */   nop
/* A873C 001A863C 01000324 */  addiu      $3, $0, 0x1
/* A8740 001A8640 0100013C */  lui        $at, (0x15030 >> 16)
/* A8744 001A8644 21088102 */  addu       $at, $20, $at
/* A8748 001A8648 3050228C */  lw         $2, (0x15030 & 0xFFFF)($at)
/* A874C 001A864C 300043AC */  sw         $3, 0x30($2)
.L001A8650:
/* A8750 001A8650 000C648E */  lw         $4, 0xC00($19)
/* A8754 001A8654 000A658E */  lw         $5, 0xA00($19)
/* A8758 001A8658 28360070 */  paddub     $6, $0, $0
/* A875C 001A865C 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A8760 001A8660 00000000 */   nop
/* A8764 001A8664 19004010 */  beqz       $2, .L001A86CC
/* A8768 001A8668 00000000 */   nop
/* A876C 001A866C BC01A0AF */  sw         $0, 0x1BC($sp)
/* A8770 001A8670 B801A0AF */  sw         $0, 0x1B8($sp)
/* A8774 001A8674 B401A0AF */  sw         $0, 0x1B4($sp)
/* A8778 001A8678 B001A0AF */  sw         $0, 0x1B0($sp)
/* A877C 001A867C 28268072 */  paddub     $4, $20, $0
/* A8780 001A8680 B001A527 */  addiu      $5, $sp, 0x1B0
/* A8784 001A8684 000C668E */  lw         $6, 0xC00($19)
/* A8788 001A8688 283E0070 */  paddub     $7, $0, $0
/* A878C 001A868C FFFF0824 */  addiu      $8, $0, -0x1
/* A8790 001A8690 0499060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A8794 001A8694 00000000 */   nop
/* A8798 001A8698 28268072 */  paddub     $4, $20, $0
/* A879C 001A869C 0A000524 */  addiu      $5, $0, 0xA
/* A87A0 001A86A0 28360070 */  paddub     $6, $0, $0
/* A87A4 001A86A4 B001A727 */  addiu      $7, $sp, 0x1B0
/* A87A8 001A86A8 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A87AC 001A86AC 00000000 */   nop
/* A87B0 001A86B0 06004010 */  beqz       $2, .L001A86CC
/* A87B4 001A86B4 00000000 */   nop
/* A87B8 001A86B8 01000424 */  addiu      $4, $0, 0x1
/* A87BC 001A86BC 0100013C */  lui        $at, (0x15030 >> 16)
/* A87C0 001A86C0 21088102 */  addu       $at, $20, $at
/* A87C4 001A86C4 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A87C8 001A86C8 340064AC */  sw         $4, 0x34($3)
.L001A86CC:
/* A87CC 001A86CC 28860070 */  paddub     $16, $0, $0
/* A87D0 001A86D0 37000010 */  b          .L001A87B0
/* A87D4 001A86D4 00000000 */   nop
.L001A86D8:
/* A87D8 001A86D8 02001124 */  addiu      $17, $0, 0x2
/* A87DC 001A86DC C0101000 */  sll        $2, $16, 3
/* A87E0 001A86E0 23185000 */  subu       $3, $2, $16
/* A87E4 001A86E4 80100300 */  sll        $2, $3, 2
/* A87E8 001A86E8 23104300 */  subu       $2, $2, $3
/* A87EC 001A86EC 40910200 */  sll        $18, $2, 5
/* A87F0 001A86F0 0100013C */  lui        $at, (0x15F30 >> 16)
/* A87F4 001A86F4 21088102 */  addu       $at, $20, $at
/* A87F8 001A86F8 305F228C */  lw         $2, (0x15F30 & 0xFFFF)($at)
/* A87FC 001A86FC 21205200 */  addu       $4, $2, $18
/* A8800 001A8700 2A00023C */  lui        $2, %hi(_2120)
/* A8804 001A8704 60B44524 */  addiu      $5, $2, %lo(_2120)
/* A8808 001A8708 28362072 */  paddub     $6, $17, $0
/* A880C 001A870C A000998C */  lw         $25, 0xA0($4)
/* A8810 001A8710 9000398F */  lw         $25, 0x90($25)
/* A8814 001A8714 09F82003 */  jalr       $25
/* A8818 001A8718 00000000 */   nop
/* A881C 001A871C 001A1000 */  sll        $3, $16, 8
/* A8820 001A8720 21186302 */  addu       $3, $19, $3
/* A8824 001A8724 0000648C */  lw         $4, 0x0($3)
/* A8828 001A8728 20008010 */  beqz       $4, .L001A87AC
/* A882C 001A872C 00000000 */   nop
/* A8830 001A8730 C001A527 */  addiu      $5, $sp, 0x1C0
/* A8834 001A8734 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* A8838 001A8738 00000000 */   nop
/* A883C 001A873C 0100013C */  lui        $at, (0x15030 >> 16)
/* A8840 001A8740 21088102 */  addu       $at, $20, $at
/* A8844 001A8744 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A8848 001A8748 80101000 */  sll        $2, $16, 2
/* A884C 001A874C 21104300 */  addu       $2, $2, $3
/* A8850 001A8750 0400428C */  lw         $2, 0x4($2)
/* A8854 001A8754 0A004010 */  beqz       $2, .L001A8780
/* A8858 001A8758 00000000 */   nop
/* A885C 001A875C C401A1C7 */  lwc1       $f1, 0x1C4($sp)
/* A8860 001A8760 803F023C */  lui        $2, (0x3F800000 >> 16)
/* A8864 001A8764 00008244 */  mtc1       $2, $f0
/* A8868 001A8768 00000000 */  nop
/* A886C 001A876C 34080046 */  c.lt.s     $f1, $f0
/* A8870 001A8770 00000000 */  nop
/* A8874 001A8774 02000045 */  bc1f       .L001A8780
/* A8878 001A8778 00000000 */   nop
/* A887C 001A877C 01001124 */  addiu      $17, $0, 0x1
.L001A8780:
/* A8880 001A8780 0100013C */  lui        $at, (0x15F30 >> 16)
/* A8884 001A8784 21088102 */  addu       $at, $20, $at
/* A8888 001A8788 305F228C */  lw         $2, (0x15F30 & 0xFFFF)($at)
/* A888C 001A878C 21205200 */  addu       $4, $2, $18
/* A8890 001A8790 2A00023C */  lui        $2, %hi(_2120)
/* A8894 001A8794 60B44524 */  addiu      $5, $2, %lo(_2120)
/* A8898 001A8798 28362072 */  paddub     $6, $17, $0
/* A889C 001A879C A000998C */  lw         $25, 0xA0($4)
/* A88A0 001A87A0 9000398F */  lw         $25, 0x90($25)
/* A88A4 001A87A4 09F82003 */  jalr       $25
/* A88A8 001A87A8 00000000 */   nop
.L001A87AC:
/* A88AC 001A87AC 01001026 */  addiu      $16, $16, 0x1
.L001A87B0:
/* A88B0 001A87B0 1800032A */  slti       $3, $16, 0x18
/* A88B4 001A87B4 C8FF6014 */  bnez       $3, .L001A86D8
/* A88B8 001A87B8 00000000 */   nop
.L001A87BC:
/* A88BC 001A87BC 5000BF7B */  lq         $31, 0x50($sp)
/* A88C0 001A87C0 4000B47B */  lq         $20, 0x40($sp)
/* A88C4 001A87C4 3000B37B */  lq         $19, 0x30($sp)
/* A88C8 001A87C8 2000B27B */  lq         $18, 0x20($sp)
/* A88CC 001A87CC 1000B17B */  lq         $17, 0x10($sp)
/* A88D0 001A87D0 0000B07B */  lq         $16, 0x0($sp)
/* A88D4 001A87D4 D001BD27 */  addiu      $sp, $sp, 0x1D0
/* A88D8 001A87D8 0800E003 */  jr         $31
/* A88DC 001A87DC 00000000 */   nop
