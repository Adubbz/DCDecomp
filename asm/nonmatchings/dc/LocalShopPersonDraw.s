.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LocalShopPersonDraw__Fv
/* E83B0 001E82B0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* E83B4 001E82B4 0000BF7F */  sq         $31, 0x0($sp)
/* E83B8 001E82B8 2900023C */  lui        $2, %hi(_839_2)
/* E83BC 001E82BC 50274224 */  addiu      $2, $2, %lo(_839_2)
/* E83C0 001E82C0 1000A527 */  addiu      $5, $sp, 0x10
/* E83C4 001E82C4 00004278 */  lq         $2, 0x0($2)
/* E83C8 001E82C8 0000A27C */  sq         $2, 0x0($5)
/* E83CC 001E82CC 2900023C */  lui        $2, %hi(_840)
/* E83D0 001E82D0 60274224 */  addiu      $2, $2, %lo(_840)
/* E83D4 001E82D4 2000A327 */  addiu      $3, $sp, 0x20
/* E83D8 001E82D8 00004278 */  lq         $2, 0x0($2)
/* E83DC 001E82DC 0000627C */  sq         $2, 0x0($3)
/* E83E0 001E82E0 DA01023C */  lui        $2, %hi(MenuCamera)
/* E83E4 001E82E4 D0084424 */  addiu      $4, $2, %lo(MenuCamera)
/* E83E8 001E82E8 C490040C */  jal        SetRef__7CCameraFPf
/* E83EC 001E82EC 00000000 */   nop
/* E83F0 001E82F0 DA01023C */  lui        $2, %hi(MenuCamera)
/* E83F4 001E82F4 D0084424 */  addiu      $4, $2, %lo(MenuCamera)
/* E83F8 001E82F8 2000A527 */  addiu      $5, $sp, 0x20
/* E83FC 001E82FC A490040C */  jal        SetPos__7CCameraFPf
/* E8400 001E8300 00000000 */   nop
/* E8404 001E8304 28260070 */  paddub     $4, $0, $0
/* E8408 001E8308 ECA0070C */  jal        ShopMasterVectorSet__Fi
/* E840C 001E830C 00000000 */   nop
/* E8410 001E8310 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* E8414 001E8314 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* E8418 001E8318 4CE1040C */  jal        Step__10CCharacterFv
/* E841C 001E831C 00000000 */   nop
/* E8420 001E8320 D901013C */  lui        $at, (0x1D90270 >> 16)
/* E8424 001E8324 7002238C */  lw         $3, (0x1D90270 & 0xFFFF)($at)
/* E8428 001E8328 04006128 */  slti       $at, $3, 0x4
/* E842C 001E832C 06002010 */  beqz       $at, .L001E8348
/* E8430 001E8330 00000000 */   nop
/* E8434 001E8334 01006324 */  addiu      $3, $3, 0x1
/* E8438 001E8338 D901013C */  lui        $at, (0x1D90270 >> 16)
/* E843C 001E833C 700223AC */  sw         $3, (0x1D90270 & 0xFFFF)($at)
/* E8440 001E8340 05000010 */  b          .L001E8358
/* E8444 001E8344 00000000 */   nop
.L001E8348:
/* E8448 001E8348 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* E844C 001E834C 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* E8450 001E8350 C4E4040C */  jal        Draw__10CCharacterFv
/* E8454 001E8354 00000000 */   nop
.L001E8358:
/* E8458 001E8358 0000BF7B */  lq         $31, 0x0($sp)
/* E845C 001E835C 3000BD27 */  addiu      $sp, $sp, 0x30
/* E8460 001E8360 0800E003 */  jr         $31
/* E8464 001E8364 00000000 */   nop
/* E8468 001E8368 00000000 */  nop
/* E846C 001E836C 00000000 */  nop
