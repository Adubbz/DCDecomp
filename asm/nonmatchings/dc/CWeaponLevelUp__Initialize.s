.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__14CWeaponLevelUpFv
/* 1362F0 002361F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1362F4 002361F4 1000BF7F */  sq         $31, 0x10($sp)
/* 1362F8 002361F8 0000B07F */  sq         $16, 0x0($sp)
/* 1362FC 002361FC 28868070 */  paddub     $16, $4, $0
/* 136300 00236200 FFFF0524 */  addiu      $5, $0, -0x1
/* 136304 00236204 F8000624 */  addiu      $6, $0, 0xF8
/* 136308 00236208 5A0D040C */  jal        memset
/* 13630C 0023620C 00000000 */   nop
/* 136310 00236210 F8000426 */  addiu      $4, $16, 0xF8
/* 136314 00236214 282E0070 */  paddub     $5, $0, $0
/* 136318 00236218 20000624 */  addiu      $6, $0, 0x20
/* 13631C 0023621C 5A0D040C */  jal        memset
/* 136320 00236220 00000000 */   nop
/* 136324 00236224 DC0100AE */  sw         $0, 0x1DC($16)
/* 136328 00236228 281300AE */  sw         $0, 0x1328($16)
/* 13632C 0023622C D41200AE */  sw         $0, 0x12D4($16)
/* 136330 00236230 D01200AE */  sw         $0, 0x12D0($16)
/* 136334 00236234 001300A6 */  sh         $0, 0x1300($16)
/* 136338 00236238 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* 13633C 0023623C 101303AE */  sw         $3, 0x1310($16)
/* 136340 00236240 141300A6 */  sh         $0, 0x1314($16)
/* 136344 00236244 FFFF0324 */  addiu      $3, $0, -0x1
/* 136348 00236248 021303A6 */  sh         $3, 0x1302($16)
/* 13634C 0023624C 041303A6 */  sh         $3, 0x1304($16)
/* 136350 00236250 DE1203A6 */  sh         $3, 0x12DE($16)
/* 136354 00236254 E21200A6 */  sh         $0, 0x12E2($16)
/* 136358 00236258 E41200AE */  sw         $0, 0x12E4($16)
/* 13635C 0023625C E81200A6 */  sh         $0, 0x12E8($16)
/* 136360 00236260 EA1200A6 */  sh         $0, 0x12EA($16)
/* 136364 00236264 E01200A2 */  sb         $0, 0x12E0($16)
/* 136368 00236268 E11200A2 */  sb         $0, 0x12E1($16)
/* 13636C 0023626C 1000BF7B */  lq         $31, 0x10($sp)
/* 136370 00236270 0000B07B */  lq         $16, 0x0($sp)
/* 136374 00236274 2000BD27 */  addiu      $sp, $sp, 0x20
/* 136378 00236278 0800E003 */  jr         $31
/* 13637C 0023627C 00000000 */   nop