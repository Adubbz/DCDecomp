.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MakeMcIconSysInfo__17CMemoryCardAccessFv
/* 113B00 00213A00 30FFBD27 */  addiu      $sp, $sp, -0xD0
/* 113B04 00213A04 1000BF7F */  sq         $31, 0x10($sp)
/* 113B08 00213A08 0000B07F */  sq         $16, 0x0($sp)
/* 113B0C 00213A0C 28868070 */  paddub     $16, $4, $0
/* 113B10 00213A10 2900023C */  lui        $2, %hi(_399_2)
/* 113B14 00213A14 503D4524 */  addiu      $5, $2, %lo(_399_2)
/* 113B18 00213A18 2000A427 */  addiu      $4, $sp, 0x20
/* 113B1C 00213A1C 04000324 */  addiu      $3, $0, 0x4
.L00213A20:
/* 113B20 00213A20 0000A278 */  lq         $2, 0x0($5)
/* 113B24 00213A24 1000A524 */  addiu      $5, $5, 0x10
/* 113B28 00213A28 FFFF6324 */  addiu      $3, $3, -0x1
/* 113B2C 00213A2C 0000827C */  sq         $2, 0x0($4)
/* 113B30 00213A30 10008424 */  addiu      $4, $4, 0x10
/* 113B34 00213A34 FAFF601C */  bgtz       $3, .L00213A20
/* 113B38 00213A38 00000000 */   nop
/* 113B3C 00213A3C 2900023C */  lui        $2, %hi(_400)
/* 113B40 00213A40 903D4524 */  addiu      $5, $2, %lo(_400)
/* 113B44 00213A44 6000A427 */  addiu      $4, $sp, 0x60
/* 113B48 00213A48 03000324 */  addiu      $3, $0, 0x3
.L00213A4C:
/* 113B4C 00213A4C 0000A278 */  lq         $2, 0x0($5)
/* 113B50 00213A50 1000A524 */  addiu      $5, $5, 0x10
/* 113B54 00213A54 FFFF6324 */  addiu      $3, $3, -0x1
/* 113B58 00213A58 0000827C */  sq         $2, 0x0($4)
/* 113B5C 00213A5C 10008424 */  addiu      $4, $4, 0x10
/* 113B60 00213A60 FAFF601C */  bgtz       $3, .L00213A4C
/* 113B64 00213A64 00000000 */   nop
/* 113B68 00213A68 2900023C */  lui        $2, %hi(_401)
/* 113B6C 00213A6C C03D4524 */  addiu      $5, $2, %lo(_401)
/* 113B70 00213A70 9000A427 */  addiu      $4, $sp, 0x90
/* 113B74 00213A74 03000324 */  addiu      $3, $0, 0x3
.L00213A78:
/* 113B78 00213A78 0000A278 */  lq         $2, 0x0($5)
/* 113B7C 00213A7C 1000A524 */  addiu      $5, $5, 0x10
/* 113B80 00213A80 FFFF6324 */  addiu      $3, $3, -0x1
/* 113B84 00213A84 0000827C */  sq         $2, 0x0($4)
/* 113B88 00213A88 10008424 */  addiu      $4, $4, 0x10
/* 113B8C 00213A8C FAFF601C */  bgtz       $3, .L00213A78
/* 113B90 00213A90 00000000 */   nop
/* 113B94 00213A94 2900023C */  lui        $2, %hi(_402)
/* 113B98 00213A98 F03D4224 */  addiu      $2, $2, %lo(_402)
/* 113B9C 00213A9C C000A327 */  addiu      $3, $sp, 0xC0
/* 113BA0 00213AA0 00004278 */  lq         $2, 0x0($2)
/* 113BA4 00213AA4 0000627C */  sq         $2, 0x0($3)
/* 113BA8 00213AA8 EC000426 */  addiu      $4, $16, 0xEC
/* 113BAC 00213AAC 282E0070 */  paddub     $5, $0, $0
/* 113BB0 00213AB0 C4030624 */  addiu      $6, $0, 0x3C4
/* 113BB4 00213AB4 5A0D040C */  jal        memset
/* 113BB8 00213AB8 00000000 */   nop
/* 113BBC 00213ABC EC000426 */  addiu      $4, $16, 0xEC
/* 113BC0 00213AC0 2A00023C */  lui        $2, %hi(_404)
/* 113BC4 00213AC4 D8E54524 */  addiu      $5, $2, %lo(_404)
/* 113BC8 00213AC8 5A15040C */  jal        strcpy
/* 113BCC 00213ACC 00000000 */   nop
/* 113BD0 00213AD0 AC010426 */  addiu      $4, $16, 0x1AC
/* 113BD4 00213AD4 2A00023C */  lui        $2, %hi(_405_2)
/* 113BD8 00213AD8 E0E54524 */  addiu      $5, $2, %lo(_405_2)
/* 113BDC 00213ADC 5A15040C */  jal        strcpy
/* 113BE0 00213AE0 00000000 */   nop
/* 113BE4 00213AE4 14000224 */  addiu      $2, $0, 0x14
/* 113BE8 00213AE8 F20002A6 */  sh         $2, 0xF2($16)
/* 113BEC 00213AEC 60000224 */  addiu      $2, $0, 0x60
/* 113BF0 00213AF0 F80002AE */  sw         $2, 0xF8($16)
/* 113BF4 00213AF4 FC000426 */  addiu      $4, $16, 0xFC
/* 113BF8 00213AF8 2000A527 */  addiu      $5, $sp, 0x20
/* 113BFC 00213AFC 10000624 */  addiu      $6, $0, 0x10
/* 113C00 00213B00 EC0C040C */  jal        memcpy
/* 113C04 00213B04 00000000 */   nop
/* 113C08 00213B08 3C010426 */  addiu      $4, $16, 0x13C
/* 113C0C 00213B0C 6000A527 */  addiu      $5, $sp, 0x60
/* 113C10 00213B10 10000624 */  addiu      $6, $0, 0x10
/* 113C14 00213B14 EC0C040C */  jal        memcpy
/* 113C18 00213B18 00000000 */   nop
/* 113C1C 00213B1C 6C010426 */  addiu      $4, $16, 0x16C
/* 113C20 00213B20 9000A527 */  addiu      $5, $sp, 0x90
/* 113C24 00213B24 10000624 */  addiu      $6, $0, 0x10
/* 113C28 00213B28 EC0C040C */  jal        memcpy
/* 113C2C 00213B2C 00000000 */   nop
/* 113C30 00213B30 9C010426 */  addiu      $4, $16, 0x19C
/* 113C34 00213B34 C000A527 */  addiu      $5, $sp, 0xC0
/* 113C38 00213B38 10000624 */  addiu      $6, $0, 0x10
/* 113C3C 00213B3C EC0C040C */  jal        memcpy
/* 113C40 00213B40 00000000 */   nop
/* 113C44 00213B44 F0010426 */  addiu      $4, $16, 0x1F0
/* 113C48 00213B48 B004058E */  lw         $5, 0x4B0($16)
/* 113C4C 00213B4C 5A15040C */  jal        strcpy
/* 113C50 00213B50 00000000 */   nop
/* 113C54 00213B54 30020426 */  addiu      $4, $16, 0x230
/* 113C58 00213B58 BC04058E */  lw         $5, 0x4BC($16)
/* 113C5C 00213B5C 5A15040C */  jal        strcpy
/* 113C60 00213B60 00000000 */   nop
/* 113C64 00213B64 70020426 */  addiu      $4, $16, 0x270
/* 113C68 00213B68 C804058E */  lw         $5, 0x4C8($16)
/* 113C6C 00213B6C 5A15040C */  jal        strcpy
/* 113C70 00213B70 00000000 */   nop
/* 113C74 00213B74 1000BF7B */  lq         $31, 0x10($sp)
/* 113C78 00213B78 0000B07B */  lq         $16, 0x0($sp)
/* 113C7C 00213B7C D000BD27 */  addiu      $sp, $sp, 0xD0
/* 113C80 00213B80 0800E003 */  jr         $31
/* 113C84 00213B84 00000000 */   nop
/* 113C88 00213B88 00000000 */  nop
/* 113C8C 00213B8C 00000000 */  nop
