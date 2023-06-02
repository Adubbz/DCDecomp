.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Init_Fire__14CWeaponElementFPf
/* B9BC0 001B9AC0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* B9BC4 001B9AC4 5000BF7F */  sq         $31, 0x50($sp)
/* B9BC8 001B9AC8 4000B37F */  sq         $19, 0x40($sp)
/* B9BCC 001B9ACC 3000B27F */  sq         $18, 0x30($sp)
/* B9BD0 001B9AD0 2000B17F */  sq         $17, 0x20($sp)
/* B9BD4 001B9AD4 1000B07F */  sq         $16, 0x10($sp)
/* B9BD8 001B9AD8 0000B4E7 */  swc1       $f20, 0x0($sp)
/* B9BDC 001B9ADC 289E8070 */  paddub     $19, $4, $0
/* B9BE0 001B9AE0 2886A070 */  paddub     $16, $5, $0
/* B9BE4 001B9AE4 4041023C */  lui        $2, (0x41400000 >> 16)
/* B9BE8 001B9AE8 00088244 */  mtc1       $2, $f1
/* B9BEC 001B9AEC A80580C4 */  lwc1       $f0, 0x5A8($4)
/* B9BF0 001B9AF0 020B0046 */  mul.s      $f12, $f1, $f0
/* B9BF4 001B9AF4 2C44040C */  jal        fptosi
/* B9BF8 001B9AF8 00000000 */   nop
/* B9BFC 001B9AFC 02004224 */  addiu      $2, $2, 0x2
/* B9C00 001B9B00 AE0562A6 */  sh         $2, 0x5AE($19)
/* B9C04 001B9B04 A041023C */  lui        $2, (0x41A00000 >> 16)
/* B9C08 001B9B08 00088244 */  mtc1       $2, $f1
/* B9C0C 001B9B0C A80560C6 */  lwc1       $f0, 0x5A8($19)
/* B9C10 001B9B10 020B0046 */  mul.s      $f12, $f1, $f0
/* B9C14 001B9B14 2C44040C */  jal        fptosi
/* B9C18 001B9B18 00000000 */   nop
/* B9C1C 001B9B1C 0A004224 */  addiu      $2, $2, 0xA
/* B9C20 001B9B20 B80662A6 */  sh         $2, 0x6B8($19)
/* B9C24 001B9B24 4040023C */  lui        $2, (0x40400000 >> 16)
/* B9C28 001B9B28 00088244 */  mtc1       $2, $f1
/* B9C2C 001B9B2C A80560C6 */  lwc1       $f0, 0x5A8($19)
/* B9C30 001B9B30 020B0046 */  mul.s      $f12, $f1, $f0
/* B9C34 001B9B34 2C44040C */  jal        fptosi
/* B9C38 001B9B38 00000000 */   nop
/* B9C3C 001B9B3C 06000324 */  addiu      $3, $0, 0x6
/* B9C40 001B9B40 23106200 */  subu       $2, $3, $2
/* B9C44 001B9B44 B40662A6 */  sh         $2, 0x6B4($19)
/* B9C48 001B9B48 B60660A6 */  sh         $0, 0x6B6($19)
/* B9C4C 001B9B4C 04000224 */  addiu      $2, $0, 0x4
/* B9C50 001B9B50 3A0762A6 */  sh         $2, 0x73A($19)
/* B9C54 001B9B54 6C8381C7 */  lwc1       $f1, -0x7C94($gp)
/* B9C58 001B9B58 A80560C6 */  lwc1       $f0, 0x5A8($19)
/* B9C5C 001B9B5C 020B0046 */  mul.s      $f12, $f1, $f0
/* B9C60 001B9B60 9044040C */  jal        fptodp
/* B9C64 001B9B64 00000000 */   nop
/* B9C68 001B9B68 688084DF */  ld         $4, -0x7F98($gp)
/* B9C6C 001B9B6C 282E4070 */  paddub     $5, $2, $0
/* B9C70 001B9B70 6E3F040C */  jal        dpadd
/* B9C74 001B9B74 00000000 */   nop
/* B9C78 001B9B78 28264070 */  paddub     $4, $2, $0
/* B9C7C 001B9B7C 9241040C */  jal        dptofp
/* B9C80 001B9B80 00000000 */   nop
/* B9C84 001B9B84 A00561C6 */  lwc1       $f1, 0x5A0($19)
/* B9C88 001B9B88 02080046 */  mul.s      $f0, $f1, $f0
/* B9C8C 001B9B8C A00560E6 */  swc1       $f0, 0x5A0($19)
/* B9C90 001B9B90 D48081C7 */  lwc1       $f1, -0x7F2C($gp)
/* B9C94 001B9B94 A80560C6 */  lwc1       $f0, 0x5A8($19)
/* B9C98 001B9B98 42080046 */  mul.s      $f1, $f1, $f0
/* B9C9C 001B9B9C 003F023C */  lui        $2, (0x3F000000 >> 16)
/* B9CA0 001B9BA0 00008244 */  mtc1       $2, $f0
/* B9CA4 001B9BA4 00000000 */  nop
/* B9CA8 001B9BA8 00000146 */  add.s      $f0, $f0, $f1
/* B9CAC 001B9BAC B00560E6 */  swc1       $f0, 0x5B0($19)
/* B9CB0 001B9BB0 10006426 */  addiu      $4, $19, 0x10
/* B9CB4 001B9BB4 282E0072 */  paddub     $5, $16, $0
/* B9CB8 001B9BB8 0C86040C */  jal        sceVu0CopyVector
/* B9CBC 001B9BBC 00000000 */   nop
/* B9CC0 001B9BC0 28260070 */  paddub     $4, $0, $0
/* B9CC4 001B9BC4 06000010 */  b          .L001B9BE0
/* B9CC8 001B9BC8 00000000 */   nop
.L001B9BCC:
/* B9CCC 001B9BCC 80180400 */  sll        $3, $4, 2
/* B9CD0 001B9BD0 21187300 */  addu       $3, $3, $19
/* B9CD4 001B9BD4 A00460AC */  sw         $0, 0x4A0($3)
/* B9CD8 001B9BD8 200560AC */  sw         $0, 0x520($3)
/* B9CDC 001B9BDC 01008424 */  addiu      $4, $4, 0x1
.L001B9BE0:
/* B9CE0 001B9BE0 20008328 */  slti       $3, $4, 0x20
/* B9CE4 001B9BE4 F9FF6014 */  bnez       $3, .L001B9BCC
/* B9CE8 001B9BE8 00000000 */   nop
/* B9CEC 001B9BEC 28860070 */  paddub     $16, $0, $0
/* B9CF0 001B9BF0 7B000010 */  b          .L001B9DE0
/* B9CF4 001B9BF4 00000000 */   nop
.L001B9BF8:
/* B9CF8 001B9BF8 BE11040C */  jal        rand
/* B9CFC 001B9BFC 00000000 */   nop
/* B9D00 001B9C00 00008244 */  mtc1       $2, $f0
/* B9D04 001B9C04 00000000 */  nop
/* B9D08 001B9C08 60008046 */  cvt.s.w    $f1, $f0
/* B9D0C 001B9C0C C040023C */  lui        $2, (0x40C00000 >> 16)
/* B9D10 001B9C10 00008244 */  mtc1       $2, $f0
/* B9D14 001B9C14 00000000 */  nop
/* B9D18 001B9C18 42000146 */  mul.s      $f1, $f0, $f1
/* B9D1C 001B9C1C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B9D20 001B9C20 00008244 */  mtc1       $2, $f0
/* B9D24 001B9C24 00000000 */  nop
/* B9D28 001B9C28 43080046 */  div.s      $f1, $f1, $f0
/* B9D2C 001B9C2C 0040023C */  lui        $2, (0x40000000 >> 16)
/* B9D30 001B9C30 00008244 */  mtc1       $2, $f0
/* B9D34 001B9C34 00000000 */  nop
/* B9D38 001B9C38 00000146 */  add.s      $f0, $f0, $f1
/* B9D3C 001B9C3C 80881000 */  sll        $17, $16, 2
/* B9D40 001B9C40 21183302 */  addu       $3, $17, $19
/* B9D44 001B9C44 200460E4 */  swc1       $f0, 0x420($3)
/* B9D48 001B9C48 803F023C */  lui        $2, (0x3F800000 >> 16)
/* B9D4C 001B9C4C A00462AC */  sw         $2, 0x4A0($3)
/* B9D50 001B9C50 BE11040C */  jal        rand
/* B9D54 001B9C54 00000000 */   nop
/* B9D58 001B9C58 00008244 */  mtc1       $2, $f0
/* B9D5C 001B9C5C 00000000 */  nop
/* B9D60 001B9C60 60008046 */  cvt.s.w    $f1, $f0
/* B9D64 001B9C64 4042023C */  lui        $2, (0x42400000 >> 16)
/* B9D68 001B9C68 00008244 */  mtc1       $2, $f0
/* B9D6C 001B9C6C 00000000 */  nop
/* B9D70 001B9C70 42000146 */  mul.s      $f1, $f0, $f1
/* B9D74 001B9C74 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B9D78 001B9C78 00008244 */  mtc1       $2, $f0
/* B9D7C 001B9C7C 00000000 */  nop
/* B9D80 001B9C80 43080046 */  div.s      $f1, $f1, $f0
/* B9D84 001B9C84 803F023C */  lui        $2, (0x3F800000 >> 16)
/* B9D88 001B9C88 00008244 */  mtc1       $2, $f0
/* B9D8C 001B9C8C 00000000 */  nop
/* B9D90 001B9C90 00000146 */  add.s      $f0, $f0, $f1
/* B9D94 001B9C94 21103302 */  addu       $2, $17, $19
/* B9D98 001B9C98 200540E4 */  swc1       $f0, 0x520($2)
/* B9D9C 001B9C9C 40901000 */  sll        $18, $16, 1
/* B9DA0 001B9CA0 21105302 */  addu       $2, $18, $19
/* B9DA4 001B9CA4 BA0640A4 */  sh         $0, 0x6BA($2)
/* B9DA8 001B9CA8 A00574C6 */  lwc1       $f20, 0x5A0($19)
/* B9DAC 001B9CAC BE11040C */  jal        rand
/* B9DB0 001B9CB0 00000000 */   nop
/* B9DB4 001B9CB4 00008244 */  mtc1       $2, $f0
/* B9DB8 001B9CB8 00000000 */  nop
/* B9DBC 001B9CBC 20008046 */  cvt.s.w    $f0, $f0
/* B9DC0 001B9CC0 42A00046 */  mul.s      $f1, $f20, $f0
/* B9DC4 001B9CC4 0040023C */  lui        $2, (0x40000000 >> 16)
/* B9DC8 001B9CC8 00008244 */  mtc1       $2, $f0
/* B9DCC 001B9CCC 00000000 */  nop
/* B9DD0 001B9CD0 42000146 */  mul.s      $f1, $f0, $f1
/* B9DD4 001B9CD4 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B9DD8 001B9CD8 00008244 */  mtc1       $2, $f0
/* B9DDC 001B9CDC 00000000 */  nop
/* B9DE0 001B9CE0 03080046 */  div.s      $f0, $f1, $f0
/* B9DE4 001B9CE4 01001446 */  sub.s      $f0, $f0, $f20
/* B9DE8 001B9CE8 00891000 */  sll        $17, $16, 4
/* B9DEC 001B9CEC 21103302 */  addu       $2, $17, $19
/* B9DF0 001B9CF0 200040E4 */  swc1       $f0, 0x20($2)
/* B9DF4 001B9CF4 A00574C6 */  lwc1       $f20, 0x5A0($19)
/* B9DF8 001B9CF8 BE11040C */  jal        rand
/* B9DFC 001B9CFC 00000000 */   nop
/* B9E00 001B9D00 00008244 */  mtc1       $2, $f0
/* B9E04 001B9D04 00000000 */  nop
/* B9E08 001B9D08 20008046 */  cvt.s.w    $f0, $f0
/* B9E0C 001B9D0C 42A00046 */  mul.s      $f1, $f20, $f0
/* B9E10 001B9D10 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B9E14 001B9D14 00008244 */  mtc1       $2, $f0
/* B9E18 001B9D18 00000000 */  nop
/* B9E1C 001B9D1C 43080046 */  div.s      $f1, $f1, $f0
/* B9E20 001B9D20 0040023C */  lui        $2, (0x40000000 >> 16)
/* B9E24 001B9D24 00008244 */  mtc1       $2, $f0
/* B9E28 001B9D28 00000000 */  nop
/* B9E2C 001B9D2C 03A00046 */  div.s      $f0, $f20, $f0
/* B9E30 001B9D30 01080046 */  sub.s      $f0, $f1, $f0
/* B9E34 001B9D34 21103302 */  addu       $2, $17, $19
/* B9E38 001B9D38 240040E4 */  swc1       $f0, 0x24($2)
/* B9E3C 001B9D3C A00574C6 */  lwc1       $f20, 0x5A0($19)
/* B9E40 001B9D40 BE11040C */  jal        rand
/* B9E44 001B9D44 00000000 */   nop
/* B9E48 001B9D48 00008244 */  mtc1       $2, $f0
/* B9E4C 001B9D4C 00000000 */  nop
/* B9E50 001B9D50 20008046 */  cvt.s.w    $f0, $f0
/* B9E54 001B9D54 42A00046 */  mul.s      $f1, $f20, $f0
/* B9E58 001B9D58 0040023C */  lui        $2, (0x40000000 >> 16)
/* B9E5C 001B9D5C 00008244 */  mtc1       $2, $f0
/* B9E60 001B9D60 00000000 */  nop
/* B9E64 001B9D64 42000146 */  mul.s      $f1, $f0, $f1
/* B9E68 001B9D68 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B9E6C 001B9D6C 00008244 */  mtc1       $2, $f0
/* B9E70 001B9D70 00000000 */  nop
/* B9E74 001B9D74 03080046 */  div.s      $f0, $f1, $f0
/* B9E78 001B9D78 01001446 */  sub.s      $f0, $f0, $f20
/* B9E7C 001B9D7C 21183302 */  addu       $3, $17, $19
/* B9E80 001B9D80 280060E4 */  swc1       $f0, 0x28($3)
/* B9E84 001B9D84 803F023C */  lui        $2, (0x3F800000 >> 16)
/* B9E88 001B9D88 2C0062AC */  sw         $2, 0x2C($3)
/* B9E8C 001B9D8C BE11040C */  jal        rand
/* B9E90 001B9D90 00000000 */   nop
/* B9E94 001B9D94 00008244 */  mtc1       $2, $f0
/* B9E98 001B9D98 00000000 */  nop
/* B9E9C 001B9D9C 60008046 */  cvt.s.w    $f1, $f0
/* B9EA0 001B9DA0 A040023C */  lui        $2, (0x40A00000 >> 16)
/* B9EA4 001B9DA4 00008244 */  mtc1       $2, $f0
/* B9EA8 001B9DA8 00000000 */  nop
/* B9EAC 001B9DAC 42000146 */  mul.s      $f1, $f0, $f1
/* B9EB0 001B9DB0 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B9EB4 001B9DB4 00008244 */  mtc1       $2, $f0
/* B9EB8 001B9DB8 00000000 */  nop
/* B9EBC 001B9DBC 030B0046 */  div.s      $f12, $f1, $f0
/* B9EC0 001B9DC0 2C44040C */  jal        fptosi
/* B9EC4 001B9DC4 00000000 */   nop
/* B9EC8 001B9DC8 40180200 */  sll        $3, $2, 1
/* B9ECC 001B9DCC 21186200 */  addu       $3, $3, $2
/* B9ED0 001B9DD0 00210300 */  sll        $4, $3, 4
/* B9ED4 001B9DD4 21185302 */  addu       $3, $18, $19
/* B9ED8 001B9DD8 FA0664A4 */  sh         $4, 0x6FA($3)
/* B9EDC 001B9DDC 01001026 */  addiu      $16, $16, 0x1
.L001B9DE0:
/* B9EE0 001B9DE0 AE056386 */  lh         $3, 0x5AE($19)
/* B9EE4 001B9DE4 2A180302 */  slt        $3, $16, $3
/* B9EE8 001B9DE8 83FF6014 */  bnez       $3, .L001B9BF8
/* B9EEC 001B9DEC 00000000 */   nop
/* B9EF0 001B9DF0 5000BF7B */  lq         $31, 0x50($sp)
/* B9EF4 001B9DF4 4000B37B */  lq         $19, 0x40($sp)
/* B9EF8 001B9DF8 3000B27B */  lq         $18, 0x30($sp)
/* B9EFC 001B9DFC 2000B17B */  lq         $17, 0x20($sp)
/* B9F00 001B9E00 1000B07B */  lq         $16, 0x10($sp)
/* B9F04 001B9E04 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* B9F08 001B9E08 6000BD27 */  addiu      $sp, $sp, 0x60
/* B9F0C 001B9E0C 0800E003 */  jr         $31
/* B9F10 001B9E10 00000000 */   nop
/* B9F14 001B9E14 00000000 */  nop
/* B9F18 001B9E18 00000000 */  nop
/* B9F1C 001B9E1C 00000000 */  nop
