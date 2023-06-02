.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __sbprintf_2
/* 7C50 00107B50 70FBBD27 */  addiu      $sp, $sp, -0x490
/* 7C54 00107B54 00040A24 */  addiu      $10, $0, 0x400
/* 7C58 00107B58 7004B1FF */  sd         $17, 0x470($sp)
/* 7C5C 00107B5C 6000AB27 */  addiu      $11, $sp, 0x60
/* 7C60 00107B60 6004B0FF */  sd         $16, 0x460($sp)
/* 7C64 00107B64 2D888000 */  daddu      $17, $4, $0
/* 7C68 00107B68 8004BFFF */  sd         $31, 0x480($sp)
/* 7C6C 00107B6C 2D20A003 */  daddu      $4, $sp, $0
/* 7C70 00107B70 0C002296 */  lhu        $2, 0xC($17)
/* 7C74 00107B74 5400288E */  lw         $8, 0x54($17)
/* 7C78 00107B78 0E002996 */  lhu        $9, 0xE($17)
/* 7C7C 00107B7C FDFF4230 */  andi       $2, $2, 0xFFFD
/* 7C80 00107B80 1C00278E */  lw         $7, 0x1C($17)
/* 7C84 00107B84 2400238E */  lw         $3, 0x24($17)
/* 7C88 00107B88 5400A8AF */  sw         $8, 0x54($sp)
/* 7C8C 00107B8C 0C00A2A7 */  sh         $2, 0xC($sp)
/* 7C90 00107B90 0E00A9A7 */  sh         $9, 0xE($sp)
/* 7C94 00107B94 1C00A7AF */  sw         $7, 0x1C($sp)
/* 7C98 00107B98 2400A3AF */  sw         $3, 0x24($sp)
/* 7C9C 00107B9C 1000ABAF */  sw         $11, 0x10($sp)
/* 7CA0 00107BA0 1400AAAF */  sw         $10, 0x14($sp)
/* 7CA4 00107BA4 0000ABAF */  sw         $11, 0x0($sp)
/* 7CA8 00107BA8 0800AAAF */  sw         $10, 0x8($sp)
/* 7CAC 00107BAC 021F040C */  jal        vfprintf
/* 7CB0 00107BB0 1800A0AF */   sw        $0, 0x18($sp)
/* 7CB4 00107BB4 2D804000 */  daddu      $16, $2, $0
/* 7CB8 00107BB8 06000006 */  bltz       $16, .L00107BD4
/* 7CBC 00107BBC 0C00A297 */   lhu       $2, 0xC($sp)
/* 7CC0 00107BC0 0806040C */  jal        fflush
/* 7CC4 00107BC4 2D20A003 */   daddu     $4, $sp, $0
/* 7CC8 00107BC8 FFFF0324 */  addiu      $3, $0, -0x1
/* 7CCC 00107BCC 0B806200 */  movn       $16, $3, $2
/* 7CD0 00107BD0 0C00A297 */  lhu        $2, 0xC($sp)
.L00107BD4:
/* 7CD4 00107BD4 40004230 */  andi       $2, $2, 0x40
/* 7CD8 00107BD8 05004010 */  beqz       $2, .L00107BF0
/* 7CDC 00107BDC 2D100002 */   daddu     $2, $16, $0
/* 7CE0 00107BE0 0C002296 */  lhu        $2, 0xC($17)
/* 7CE4 00107BE4 40004234 */  ori        $2, $2, 0x40
/* 7CE8 00107BE8 0C0022A6 */  sh         $2, 0xC($17)
/* 7CEC 00107BEC 2D100002 */  daddu      $2, $16, $0
.L00107BF0:
/* 7CF0 00107BF0 8004BFDF */  ld         $31, 0x480($sp)
/* 7CF4 00107BF4 7004B1DF */  ld         $17, 0x470($sp)
/* 7CF8 00107BF8 6004B0DF */  ld         $16, 0x460($sp)
/* 7CFC 00107BFC 0800E003 */  jr         $31
/* 7D00 00107C00 9004BD27 */   addiu     $sp, $sp, 0x490
/* 7D04 00107C04 00000000 */  nop
