.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__11CHealEffectFv
/* B2C00 001B2B00 F0FEBD27 */  addiu      $sp, $sp, -0x110
/* B2C04 001B2B04 7000BF7F */  sq         $31, 0x70($sp)
/* B2C08 001B2B08 6000B57F */  sq         $21, 0x60($sp)
/* B2C0C 001B2B0C 5000B47F */  sq         $20, 0x50($sp)
/* B2C10 001B2B10 4000B37F */  sq         $19, 0x40($sp)
/* B2C14 001B2B14 3000B27F */  sq         $18, 0x30($sp)
/* B2C18 001B2B18 2000B17F */  sq         $17, 0x20($sp)
/* B2C1C 001B2B1C 1000B07F */  sq         $16, 0x10($sp)
/* B2C20 001B2B20 0000B4E7 */  swc1       $f20, 0x0($sp)
/* B2C24 001B2B24 28AE8070 */  paddub     $21, $4, $0
/* B2C28 001B2B28 1005838C */  lw         $3, 0x510($4)
/* B2C2C 001B2B2C 7A006010 */  beqz       $3, .L001B2D18
/* B2C30 001B2B30 00000000 */   nop
/* B2C34 001B2B34 2700033C */  lui        $3, %hi(_1390)
/* B2C38 001B2B38 C0B06324 */  addiu      $3, $3, %lo(_1390)
/* B2C3C 001B2B3C 8000A427 */  addiu      $4, $sp, 0x80
/* B2C40 001B2B40 00006378 */  lq         $3, 0x0($3)
/* B2C44 001B2B44 0000837C */  sq         $3, 0x0($4)
/* B2C48 001B2B48 28860070 */  paddub     $16, $0, $0
/* B2C4C 001B2B4C 288E0070 */  paddub     $17, $0, $0
/* B2C50 001B2B50 6E000010 */  b          .L001B2D0C
/* B2C54 001B2B54 00000000 */   nop
.L001B2B58:
/* B2C58 001B2B58 80901100 */  sll        $18, $17, 2
/* B2C5C 001B2B5C 21185502 */  addu       $3, $18, $21
/* B2C60 001B2B60 10047324 */  addiu      $19, $3, 0x410
/* B2C64 001B2B64 10046CC4 */  lwc1       $f12, 0x410($3)
/* B2C68 001B2B68 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* B2C6C 001B2B6C 34600046 */  c.lt.s     $f12, $f0
/* B2C70 001B2B70 00000000 */  nop
/* B2C74 001B2B74 5B000045 */  bc1f       .L001B2CE4
/* B2C78 001B2B78 00000000 */   nop
/* B2C7C 001B2B7C 2876040C */  jal        sinf
/* B2C80 001B2B80 00000000 */   nop
/* B2C84 001B2B84 06050046 */  mov.s      $f20, $f0
/* B2C88 001B2B88 000061C6 */  lwc1       $f1, 0x0($19)
/* B2C8C 001B2B8C 9C8580C7 */  lwc1       $f0, -0x7A64($gp)
/* B2C90 001B2B90 00080046 */  add.s      $f0, $f1, $f0
/* B2C94 001B2B94 000060E6 */  swc1       $f0, 0x0($19)
/* B2C98 001B2B98 0043023C */  lui        $2, (0x43000000 >> 16)
/* B2C9C 001B2B9C 00008244 */  mtc1       $2, $f0
/* B2CA0 001B2BA0 00000000 */  nop
/* B2CA4 001B2BA4 42001446 */  mul.s      $f1, $f0, $f20
/* B2CA8 001B2BA8 0042023C */  lui        $2, (0x42000000 >> 16)
/* B2CAC 001B2BAC 00008244 */  mtc1       $2, $f0
/* B2CB0 001B2BB0 00000000 */  nop
/* B2CB4 001B2BB4 41080046 */  sub.s      $f1, $f1, $f0
/* B2CB8 001B2BB8 21105502 */  addu       $2, $18, $21
/* B2CBC 001B2BBC 90034324 */  addiu      $3, $2, 0x390
/* B2CC0 001B2BC0 900341E4 */  swc1       $f1, 0x390($2)
/* B2CC4 001B2BC4 00008044 */  mtc1       $0, $f0
/* B2CC8 001B2BC8 00000000 */  nop
/* B2CCC 001B2BCC 36080046 */  c.le.s     $f1, $f0
/* B2CD0 001B2BD0 00000000 */  nop
/* B2CD4 001B2BD4 02000045 */  bc1f       .L001B2BE0
/* B2CD8 001B2BD8 00000000 */   nop
/* B2CDC 001B2BDC 000060AC */  sw         $0, 0x0($3)
.L001B2BE0:
/* B2CE0 001B2BE0 21105502 */  addu       $2, $18, $21
/* B2CE4 001B2BE4 900241C4 */  lwc1       $f1, 0x290($2)
/* B2CE8 001B2BE8 10025324 */  addiu      $19, $2, 0x210
/* B2CEC 001B2BEC 100240C4 */  lwc1       $f0, 0x210($2)
/* B2CF0 001B2BF0 40000146 */  add.s      $f1, $f0, $f1
/* B2CF4 001B2BF4 100241E4 */  swc1       $f1, 0x210($2)
/* B2CF8 001B2BF8 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* B2CFC 001B2BFC 36080046 */  c.le.s     $f1, $f0
/* B2D00 001B2C00 00000000 */  nop
/* B2D04 001B2C04 05000145 */  bc1t       .L001B2C1C
/* B2D08 001B2C08 00000000 */   nop
/* B2D0C 001B2C0C 000061C6 */  lwc1       $f1, 0x0($19)
/* B2D10 001B2C10 808580C7 */  lwc1       $f0, -0x7A80($gp)
/* B2D14 001B2C14 01080046 */  sub.s      $f0, $f1, $f0
/* B2D18 001B2C18 000060E6 */  swc1       $f0, 0x0($19)
.L001B2C1C:
/* B2D1C 001B2C1C 000061C6 */  lwc1       $f1, 0x0($19)
/* B2D20 001B2C20 C88580C7 */  lwc1       $f0, -0x7A38($gp)
/* B2D24 001B2C24 34080046 */  c.lt.s     $f1, $f0
/* B2D28 001B2C28 00000000 */  nop
/* B2D2C 001B2C2C 04000045 */  bc1f       .L001B2C40
/* B2D30 001B2C30 00000000 */   nop
/* B2D34 001B2C34 CC8580C7 */  lwc1       $f0, -0x7A34($gp)
/* B2D38 001B2C38 00080046 */  add.s      $f0, $f1, $f0
/* B2D3C 001B2C3C 000060E6 */  swc1       $f0, 0x0($19)
.L001B2C40:
/* B2D40 001B2C40 8000A0AF */  sw         $0, 0x80($sp)
/* B2D44 001B2C44 BE11040C */  jal        rand
/* B2D48 001B2C48 00000000 */   nop
/* B2D4C 001B2C4C 00008244 */  mtc1       $2, $f0
/* B2D50 001B2C50 00000000 */  nop
/* B2D54 001B2C54 60008046 */  cvt.s.w    $f1, $f0
/* B2D58 001B2C58 908280C7 */  lwc1       $f0, -0x7D70($gp)
/* B2D5C 001B2C5C 42000146 */  mul.s      $f1, $f0, $f1
/* B2D60 001B2C60 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B2D64 001B2C64 00008244 */  mtc1       $2, $f0
/* B2D68 001B2C68 00000000 */  nop
/* B2D6C 001B2C6C 43080046 */  div.s      $f1, $f1, $f0
/* B2D70 001B2C70 00A11100 */  sll        $20, $17, 4
/* B2D74 001B2C74 21109502 */  addu       $2, $20, $21
/* B2D78 001B2C78 140040C4 */  lwc1       $f0, 0x14($2)
/* B2D7C 001B2C7C 00000146 */  add.s      $f0, $f0, $f1
/* B2D80 001B2C80 8400A0E7 */  swc1       $f0, 0x84($sp)
/* B2D84 001B2C84 21105502 */  addu       $2, $18, $21
/* B2D88 001B2C88 100340C4 */  lwc1       $f0, 0x310($2)
/* B2D8C 001B2C8C 02A00046 */  mul.s      $f0, $f20, $f0
/* B2D90 001B2C90 8800A0E7 */  swc1       $f0, 0x88($sp)
/* B2D94 001B2C94 9000A427 */  addiu      $4, $sp, 0x90
/* B2D98 001B2C98 2A86040C */  jal        sceVu0UnitMatrix
/* B2D9C 001B2C9C 00000000 */   nop
/* B2DA0 001B2CA0 D000A427 */  addiu      $4, $sp, 0xD0
/* B2DA4 001B2CA4 9000A527 */  addiu      $5, $sp, 0x90
/* B2DA8 001B2CA8 00006CC6 */  lwc1       $f12, 0x0($19)
/* B2DAC 001B2CAC A686040C */  jal        sceVu0RotMatrixY
/* B2DB0 001B2CB0 00000000 */   nop
/* B2DB4 001B2CB4 8000A427 */  addiu      $4, $sp, 0x80
/* B2DB8 001B2CB8 D000A527 */  addiu      $5, $sp, 0xD0
/* B2DBC 001B2CBC 28368070 */  paddub     $6, $4, $0
/* B2DC0 001B2CC0 6285040C */  jal        sceVu0ApplyMatrix
/* B2DC4 001B2CC4 00000000 */   nop
/* B2DC8 001B2CC8 2110B402 */  addu       $2, $21, $20
/* B2DCC 001B2CCC 10004424 */  addiu      $4, $2, 0x10
/* B2DD0 001B2CD0 8000A527 */  addiu      $5, $sp, 0x80
/* B2DD4 001B2CD4 0C86040C */  jal        sceVu0CopyVector
/* B2DD8 001B2CD8 00000000 */   nop
/* B2DDC 001B2CDC 0A000010 */  b          .L001B2D08
/* B2DE0 001B2CE0 00000000 */   nop
.L001B2CE4:
/* B2DE4 001B2CE4 01001026 */  addiu      $16, $16, 0x1
/* B2DE8 001B2CE8 20000324 */  addiu      $3, $0, 0x20
/* B2DEC 001B2CEC 06000316 */  bne        $16, $3, .L001B2D08
/* B2DF0 001B2CF0 00000000 */   nop
/* B2DF4 001B2CF4 1005A0AE */  sw         $0, 0x510($21)
/* B2DF8 001B2CF8 2A00023C */  lui        $2, %hi(_1415)
/* B2DFC 001B2CFC F0B64424 */  addiu      $4, $2, %lo(_1415)
/* B2E00 001B2D00 A611040C */  jal        printf
/* B2E04 001B2D04 00000000 */   nop
.L001B2D08:
/* B2E08 001B2D08 01003126 */  addiu      $17, $17, 0x1
.L001B2D0C:
/* B2E0C 001B2D0C 2000232A */  slti       $3, $17, 0x20
/* B2E10 001B2D10 91FF6014 */  bnez       $3, .L001B2B58
/* B2E14 001B2D14 00000000 */   nop
.L001B2D18:
/* B2E18 001B2D18 7000BF7B */  lq         $31, 0x70($sp)
/* B2E1C 001B2D1C 6000B57B */  lq         $21, 0x60($sp)
/* B2E20 001B2D20 5000B47B */  lq         $20, 0x50($sp)
/* B2E24 001B2D24 4000B37B */  lq         $19, 0x40($sp)
/* B2E28 001B2D28 3000B27B */  lq         $18, 0x30($sp)
/* B2E2C 001B2D2C 2000B17B */  lq         $17, 0x20($sp)
/* B2E30 001B2D30 1000B07B */  lq         $16, 0x10($sp)
/* B2E34 001B2D34 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* B2E38 001B2D38 1001BD27 */  addiu      $sp, $sp, 0x110
/* B2E3C 001B2D3C 0800E003 */  jr         $31
/* B2E40 001B2D40 00000000 */   nop
/* B2E44 001B2D44 00000000 */  nop
/* B2E48 001B2D48 00000000 */  nop
/* B2E4C 001B2D4C 00000000 */  nop
