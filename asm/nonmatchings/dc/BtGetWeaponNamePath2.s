.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtGetWeaponNamePath2__FPcPcii
/* B7350 001B7250 70FFBD27 */  addiu      $sp, $sp, -0x90
/* B7354 001B7254 4000BF7F */  sq         $31, 0x40($sp)
/* B7358 001B7258 3000B37F */  sq         $19, 0x30($sp)
/* B735C 001B725C 2000B27F */  sq         $18, 0x20($sp)
/* B7360 001B7260 1000B17F */  sq         $17, 0x10($sp)
/* B7364 001B7264 0000B07F */  sq         $16, 0x0($sp)
/* B7368 001B7268 28968070 */  paddub     $18, $4, $0
/* B736C 001B726C 288EA070 */  paddub     $17, $5, $0
/* B7370 001B7270 2886E070 */  paddub     $16, $7, $0
/* B7374 001B7274 2700023C */  lui        $2, %hi(_940)
/* B7378 001B7278 30B24224 */  addiu      $2, $2, %lo(_940)
/* B737C 001B727C 5000A427 */  addiu      $4, $sp, 0x50
/* B7380 001B7280 00004378 */  lq         $3, 0x0($2)
/* B7384 001B7284 100042DC */  ld         $2, 0x10($2)
/* B7388 001B7288 0000837C */  sq         $3, 0x0($4)
/* B738C 001B728C 100082FC */  sd         $2, 0x10($4)
/* B7390 001B7290 80100600 */  sll        $2, $6, 2
/* B7394 001B7294 21105D00 */  addu       $2, $2, $sp
/* B7398 001B7298 5000538C */  lw         $19, 0x50($2)
/* B739C 001B729C D501023C */  lui        $2, %hi(nameWepBuff_mds)
/* B73A0 001B72A0 C0664424 */  addiu      $4, $2, %lo(nameWepBuff_mds)
/* B73A4 001B72A4 282E6072 */  paddub     $5, $19, $0
/* B73A8 001B72A8 5A15040C */  jal        strcpy
/* B73AC 001B72AC 00000000 */   nop
/* B73B0 001B72B0 D501023C */  lui        $2, %hi(nameWepBuff_img)
/* B73B4 001B72B4 00674424 */  addiu      $4, $2, %lo(nameWepBuff_img)
/* B73B8 001B72B8 282E6072 */  paddub     $5, $19, $0
/* B73BC 001B72BC 5A15040C */  jal        strcpy
/* B73C0 001B72C0 00000000 */   nop
/* B73C4 001B72C4 0A00012A */  slti       $at, $16, 0xA
/* B73C8 001B72C8 09002010 */  beqz       $at, .L001B72F0
/* B73CC 001B72CC 00000000 */   nop
/* B73D0 001B72D0 7000A427 */  addiu      $4, $sp, 0x70
/* B73D4 001B72D4 2A00023C */  lui        $2, %hi(_920_2)
/* B73D8 001B72D8 F8BB4524 */  addiu      $5, $2, %lo(_920_2)
/* B73DC 001B72DC 28360072 */  paddub     $6, $16, $0
/* B73E0 001B72E0 1614040C */  jal        sprintf
/* B73E4 001B72E4 00000000 */   nop
/* B73E8 001B72E8 07000010 */  b          .L001B7308
/* B73EC 001B72EC 00000000 */   nop
.L001B72F0:
/* B73F0 001B72F0 7000A427 */  addiu      $4, $sp, 0x70
/* B73F4 001B72F4 2A00023C */  lui        $2, %hi(_921_2)
/* B73F8 001B72F8 00BC4524 */  addiu      $5, $2, %lo(_921_2)
/* B73FC 001B72FC 28360072 */  paddub     $6, $16, $0
/* B7400 001B7300 1614040C */  jal        sprintf
/* B7404 001B7304 00000000 */   nop
.L001B7308:
/* B7408 001B7308 D501023C */  lui        $2, %hi(nameWepBuff_mds)
/* B740C 001B730C C0664424 */  addiu      $4, $2, %lo(nameWepBuff_mds)
/* B7410 001B7310 7000A527 */  addiu      $5, $sp, 0x70
/* B7414 001B7314 BC14040C */  jal        strcat
/* B7418 001B7318 00000000 */   nop
/* B741C 001B731C D501023C */  lui        $2, %hi(nameWepBuff_mds)
/* B7420 001B7320 C0664424 */  addiu      $4, $2, %lo(nameWepBuff_mds)
/* B7424 001B7324 2A00023C */  lui        $2, %hi(_946)
/* B7428 001B7328 50BC4524 */  addiu      $5, $2, %lo(_946)
/* B742C 001B732C BC14040C */  jal        strcat
/* B7430 001B7330 00000000 */   nop
/* B7434 001B7334 D501023C */  lui        $2, %hi(nameWepBuff_img)
/* B7438 001B7338 00674424 */  addiu      $4, $2, %lo(nameWepBuff_img)
/* B743C 001B733C 7000A527 */  addiu      $5, $sp, 0x70
/* B7440 001B7340 BC14040C */  jal        strcat
/* B7444 001B7344 00000000 */   nop
/* B7448 001B7348 D501023C */  lui        $2, %hi(nameWepBuff_img)
/* B744C 001B734C 00674424 */  addiu      $4, $2, %lo(nameWepBuff_img)
/* B7450 001B7350 2A00023C */  lui        $2, %hi(_947)
/* B7454 001B7354 58BC4524 */  addiu      $5, $2, %lo(_947)
/* B7458 001B7358 BC14040C */  jal        strcat
/* B745C 001B735C 00000000 */   nop
/* B7460 001B7360 28264072 */  paddub     $4, $18, $0
/* B7464 001B7364 D501023C */  lui        $2, %hi(nameWepBuff_mds)
/* B7468 001B7368 C0664524 */  addiu      $5, $2, %lo(nameWepBuff_mds)
/* B746C 001B736C 5A15040C */  jal        strcpy
/* B7470 001B7370 00000000 */   nop
/* B7474 001B7374 28262072 */  paddub     $4, $17, $0
/* B7478 001B7378 D501023C */  lui        $2, %hi(nameWepBuff_img)
/* B747C 001B737C 00674524 */  addiu      $5, $2, %lo(nameWepBuff_img)
/* B7480 001B7380 5A15040C */  jal        strcpy
/* B7484 001B7384 00000000 */   nop
/* B7488 001B7388 4000BF7B */  lq         $31, 0x40($sp)
/* B748C 001B738C 3000B37B */  lq         $19, 0x30($sp)
/* B7490 001B7390 2000B27B */  lq         $18, 0x20($sp)
/* B7494 001B7394 1000B17B */  lq         $17, 0x10($sp)
/* B7498 001B7398 0000B07B */  lq         $16, 0x0($sp)
/* B749C 001B739C 9000BD27 */  addiu      $sp, $sp, 0x90
/* B74A0 001B73A0 0800E003 */  jr         $31
/* B74A4 001B73A4 00000000 */   nop
/* B74A8 001B73A8 00000000 */  nop
/* B74AC 001B73AC 00000000 */  nop
