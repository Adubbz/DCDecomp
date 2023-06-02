.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Init_Holy__14CWeaponElementFPf
/* B7BA0 001B7AA0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* B7BA4 001B7AA4 5000BF7F */  sq         $31, 0x50($sp)
/* B7BA8 001B7AA8 4000B37F */  sq         $19, 0x40($sp)
/* B7BAC 001B7AAC 3000B27F */  sq         $18, 0x30($sp)
/* B7BB0 001B7AB0 2000B17F */  sq         $17, 0x20($sp)
/* B7BB4 001B7AB4 1000B07F */  sq         $16, 0x10($sp)
/* B7BB8 001B7AB8 0000B4E7 */  swc1       $f20, 0x0($sp)
/* B7BBC 001B7ABC 289E8070 */  paddub     $19, $4, $0
/* B7BC0 001B7AC0 4041023C */  lui        $2, (0x41400000 >> 16)
/* B7BC4 001B7AC4 00088244 */  mtc1       $2, $f1
/* B7BC8 001B7AC8 A80580C4 */  lwc1       $f0, 0x5A8($4)
/* B7BCC 001B7ACC 020B0046 */  mul.s      $f12, $f1, $f0
/* B7BD0 001B7AD0 2C44040C */  jal        fptosi
/* B7BD4 001B7AD4 00000000 */   nop
/* B7BD8 001B7AD8 02004224 */  addiu      $2, $2, 0x2
/* B7BDC 001B7ADC AE0562A6 */  sh         $2, 0x5AE($19)
/* B7BE0 001B7AE0 A041023C */  lui        $2, (0x41A00000 >> 16)
/* B7BE4 001B7AE4 00088244 */  mtc1       $2, $f1
/* B7BE8 001B7AE8 A80560C6 */  lwc1       $f0, 0x5A8($19)
/* B7BEC 001B7AEC 020B0046 */  mul.s      $f12, $f1, $f0
/* B7BF0 001B7AF0 2C44040C */  jal        fptosi
/* B7BF4 001B7AF4 00000000 */   nop
/* B7BF8 001B7AF8 0A004224 */  addiu      $2, $2, 0xA
/* B7BFC 001B7AFC B80662A6 */  sh         $2, 0x6B8($19)
/* B7C00 001B7B00 4040023C */  lui        $2, (0x40400000 >> 16)
/* B7C04 001B7B04 00088244 */  mtc1       $2, $f1
/* B7C08 001B7B08 A80560C6 */  lwc1       $f0, 0x5A8($19)
/* B7C0C 001B7B0C 020B0046 */  mul.s      $f12, $f1, $f0
/* B7C10 001B7B10 2C44040C */  jal        fptosi
/* B7C14 001B7B14 00000000 */   nop
/* B7C18 001B7B18 06000324 */  addiu      $3, $0, 0x6
/* B7C1C 001B7B1C 23106200 */  subu       $2, $3, $2
/* B7C20 001B7B20 B40662A6 */  sh         $2, 0x6B4($19)
/* B7C24 001B7B24 B60660A6 */  sh         $0, 0x6B6($19)
/* B7C28 001B7B28 04000224 */  addiu      $2, $0, 0x4
/* B7C2C 001B7B2C 3A0762A6 */  sh         $2, 0x73A($19)
/* B7C30 001B7B30 6C8381C7 */  lwc1       $f1, -0x7C94($gp)
/* B7C34 001B7B34 A80560C6 */  lwc1       $f0, 0x5A8($19)
/* B7C38 001B7B38 020B0046 */  mul.s      $f12, $f1, $f0
/* B7C3C 001B7B3C 9044040C */  jal        fptodp
/* B7C40 001B7B40 00000000 */   nop
/* B7C44 001B7B44 688084DF */  ld         $4, -0x7F98($gp)
/* B7C48 001B7B48 282E4070 */  paddub     $5, $2, $0
/* B7C4C 001B7B4C 6E3F040C */  jal        dpadd
/* B7C50 001B7B50 00000000 */   nop
/* B7C54 001B7B54 28264070 */  paddub     $4, $2, $0
/* B7C58 001B7B58 9241040C */  jal        dptofp
/* B7C5C 001B7B5C 00000000 */   nop
/* B7C60 001B7B60 A00561C6 */  lwc1       $f1, 0x5A0($19)
/* B7C64 001B7B64 02080046 */  mul.s      $f0, $f1, $f0
/* B7C68 001B7B68 A00560E6 */  swc1       $f0, 0x5A0($19)
/* B7C6C 001B7B6C D48081C7 */  lwc1       $f1, -0x7F2C($gp)
/* B7C70 001B7B70 A80560C6 */  lwc1       $f0, 0x5A8($19)
/* B7C74 001B7B74 42080046 */  mul.s      $f1, $f1, $f0
/* B7C78 001B7B78 003F033C */  lui        $3, (0x3F000000 >> 16)
/* B7C7C 001B7B7C 00008344 */  mtc1       $3, $f0
/* B7C80 001B7B80 00000000 */  nop
/* B7C84 001B7B84 00000146 */  add.s      $f0, $f0, $f1
/* B7C88 001B7B88 B00560E6 */  swc1       $f0, 0x5B0($19)
/* B7C8C 001B7B8C 28260070 */  paddub     $4, $0, $0
/* B7C90 001B7B90 06000010 */  b          .L001B7BAC
/* B7C94 001B7B94 00000000 */   nop
.L001B7B98:
/* B7C98 001B7B98 80180400 */  sll        $3, $4, 2
/* B7C9C 001B7B9C 21187300 */  addu       $3, $3, $19
/* B7CA0 001B7BA0 A00460AC */  sw         $0, 0x4A0($3)
/* B7CA4 001B7BA4 200560AC */  sw         $0, 0x520($3)
/* B7CA8 001B7BA8 01008424 */  addiu      $4, $4, 0x1
.L001B7BAC:
/* B7CAC 001B7BAC 20008328 */  slti       $3, $4, 0x20
/* B7CB0 001B7BB0 F9FF6014 */  bnez       $3, .L001B7B98
/* B7CB4 001B7BB4 00000000 */   nop
/* B7CB8 001B7BB8 28860070 */  paddub     $16, $0, $0
/* B7CBC 001B7BBC 7B000010 */  b          .L001B7DAC
/* B7CC0 001B7BC0 00000000 */   nop
.L001B7BC4:
/* B7CC4 001B7BC4 BE11040C */  jal        rand
/* B7CC8 001B7BC8 00000000 */   nop
/* B7CCC 001B7BCC 00008244 */  mtc1       $2, $f0
/* B7CD0 001B7BD0 00000000 */  nop
/* B7CD4 001B7BD4 60008046 */  cvt.s.w    $f1, $f0
/* B7CD8 001B7BD8 C040023C */  lui        $2, (0x40C00000 >> 16)
/* B7CDC 001B7BDC 00008244 */  mtc1       $2, $f0
/* B7CE0 001B7BE0 00000000 */  nop
/* B7CE4 001B7BE4 42000146 */  mul.s      $f1, $f0, $f1
/* B7CE8 001B7BE8 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B7CEC 001B7BEC 00008244 */  mtc1       $2, $f0
/* B7CF0 001B7BF0 00000000 */  nop
/* B7CF4 001B7BF4 43080046 */  div.s      $f1, $f1, $f0
/* B7CF8 001B7BF8 0040023C */  lui        $2, (0x40000000 >> 16)
/* B7CFC 001B7BFC 00008244 */  mtc1       $2, $f0
/* B7D00 001B7C00 00000000 */  nop
/* B7D04 001B7C04 00000146 */  add.s      $f0, $f0, $f1
/* B7D08 001B7C08 80881000 */  sll        $17, $16, 2
/* B7D0C 001B7C0C 21183302 */  addu       $3, $17, $19
/* B7D10 001B7C10 200460E4 */  swc1       $f0, 0x420($3)
/* B7D14 001B7C14 803F023C */  lui        $2, (0x3F800000 >> 16)
/* B7D18 001B7C18 A00462AC */  sw         $2, 0x4A0($3)
/* B7D1C 001B7C1C BE11040C */  jal        rand
/* B7D20 001B7C20 00000000 */   nop
/* B7D24 001B7C24 00008244 */  mtc1       $2, $f0
/* B7D28 001B7C28 00000000 */  nop
/* B7D2C 001B7C2C 60008046 */  cvt.s.w    $f1, $f0
/* B7D30 001B7C30 4042023C */  lui        $2, (0x42400000 >> 16)
/* B7D34 001B7C34 00008244 */  mtc1       $2, $f0
/* B7D38 001B7C38 00000000 */  nop
/* B7D3C 001B7C3C 42000146 */  mul.s      $f1, $f0, $f1
/* B7D40 001B7C40 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B7D44 001B7C44 00008244 */  mtc1       $2, $f0
/* B7D48 001B7C48 00000000 */  nop
/* B7D4C 001B7C4C 43080046 */  div.s      $f1, $f1, $f0
/* B7D50 001B7C50 803F023C */  lui        $2, (0x3F800000 >> 16)
/* B7D54 001B7C54 00008244 */  mtc1       $2, $f0
/* B7D58 001B7C58 00000000 */  nop
/* B7D5C 001B7C5C 00000146 */  add.s      $f0, $f0, $f1
/* B7D60 001B7C60 21103302 */  addu       $2, $17, $19
/* B7D64 001B7C64 200540E4 */  swc1       $f0, 0x520($2)
/* B7D68 001B7C68 40901000 */  sll        $18, $16, 1
/* B7D6C 001B7C6C 21105302 */  addu       $2, $18, $19
/* B7D70 001B7C70 BA0640A4 */  sh         $0, 0x6BA($2)
/* B7D74 001B7C74 A00574C6 */  lwc1       $f20, 0x5A0($19)
/* B7D78 001B7C78 BE11040C */  jal        rand
/* B7D7C 001B7C7C 00000000 */   nop
/* B7D80 001B7C80 00008244 */  mtc1       $2, $f0
/* B7D84 001B7C84 00000000 */  nop
/* B7D88 001B7C88 20008046 */  cvt.s.w    $f0, $f0
/* B7D8C 001B7C8C 42A00046 */  mul.s      $f1, $f20, $f0
/* B7D90 001B7C90 0040023C */  lui        $2, (0x40000000 >> 16)
/* B7D94 001B7C94 00008244 */  mtc1       $2, $f0
/* B7D98 001B7C98 00000000 */  nop
/* B7D9C 001B7C9C 42000146 */  mul.s      $f1, $f0, $f1
/* B7DA0 001B7CA0 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B7DA4 001B7CA4 00008244 */  mtc1       $2, $f0
/* B7DA8 001B7CA8 00000000 */  nop
/* B7DAC 001B7CAC 03080046 */  div.s      $f0, $f1, $f0
/* B7DB0 001B7CB0 01001446 */  sub.s      $f0, $f0, $f20
/* B7DB4 001B7CB4 00891000 */  sll        $17, $16, 4
/* B7DB8 001B7CB8 21103302 */  addu       $2, $17, $19
/* B7DBC 001B7CBC 200040E4 */  swc1       $f0, 0x20($2)
/* B7DC0 001B7CC0 A00574C6 */  lwc1       $f20, 0x5A0($19)
/* B7DC4 001B7CC4 BE11040C */  jal        rand
/* B7DC8 001B7CC8 00000000 */   nop
/* B7DCC 001B7CCC 00008244 */  mtc1       $2, $f0
/* B7DD0 001B7CD0 00000000 */  nop
/* B7DD4 001B7CD4 20008046 */  cvt.s.w    $f0, $f0
/* B7DD8 001B7CD8 42A00046 */  mul.s      $f1, $f20, $f0
/* B7DDC 001B7CDC 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B7DE0 001B7CE0 00008244 */  mtc1       $2, $f0
/* B7DE4 001B7CE4 00000000 */  nop
/* B7DE8 001B7CE8 43080046 */  div.s      $f1, $f1, $f0
/* B7DEC 001B7CEC 0040023C */  lui        $2, (0x40000000 >> 16)
/* B7DF0 001B7CF0 00008244 */  mtc1       $2, $f0
/* B7DF4 001B7CF4 00000000 */  nop
/* B7DF8 001B7CF8 03A00046 */  div.s      $f0, $f20, $f0
/* B7DFC 001B7CFC 01080046 */  sub.s      $f0, $f1, $f0
/* B7E00 001B7D00 21103302 */  addu       $2, $17, $19
/* B7E04 001B7D04 240040E4 */  swc1       $f0, 0x24($2)
/* B7E08 001B7D08 A00574C6 */  lwc1       $f20, 0x5A0($19)
/* B7E0C 001B7D0C BE11040C */  jal        rand
/* B7E10 001B7D10 00000000 */   nop
/* B7E14 001B7D14 00008244 */  mtc1       $2, $f0
/* B7E18 001B7D18 00000000 */  nop
/* B7E1C 001B7D1C 20008046 */  cvt.s.w    $f0, $f0
/* B7E20 001B7D20 42A00046 */  mul.s      $f1, $f20, $f0
/* B7E24 001B7D24 0040023C */  lui        $2, (0x40000000 >> 16)
/* B7E28 001B7D28 00008244 */  mtc1       $2, $f0
/* B7E2C 001B7D2C 00000000 */  nop
/* B7E30 001B7D30 42000146 */  mul.s      $f1, $f0, $f1
/* B7E34 001B7D34 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B7E38 001B7D38 00008244 */  mtc1       $2, $f0
/* B7E3C 001B7D3C 00000000 */  nop
/* B7E40 001B7D40 03080046 */  div.s      $f0, $f1, $f0
/* B7E44 001B7D44 01001446 */  sub.s      $f0, $f0, $f20
/* B7E48 001B7D48 21183302 */  addu       $3, $17, $19
/* B7E4C 001B7D4C 280060E4 */  swc1       $f0, 0x28($3)
/* B7E50 001B7D50 803F023C */  lui        $2, (0x3F800000 >> 16)
/* B7E54 001B7D54 2C0062AC */  sw         $2, 0x2C($3)
/* B7E58 001B7D58 BE11040C */  jal        rand
/* B7E5C 001B7D5C 00000000 */   nop
/* B7E60 001B7D60 00008244 */  mtc1       $2, $f0
/* B7E64 001B7D64 00000000 */  nop
/* B7E68 001B7D68 60008046 */  cvt.s.w    $f1, $f0
/* B7E6C 001B7D6C A040023C */  lui        $2, (0x40A00000 >> 16)
/* B7E70 001B7D70 00008244 */  mtc1       $2, $f0
/* B7E74 001B7D74 00000000 */  nop
/* B7E78 001B7D78 42000146 */  mul.s      $f1, $f0, $f1
/* B7E7C 001B7D7C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B7E80 001B7D80 00008244 */  mtc1       $2, $f0
/* B7E84 001B7D84 00000000 */  nop
/* B7E88 001B7D88 030B0046 */  div.s      $f12, $f1, $f0
/* B7E8C 001B7D8C 2C44040C */  jal        fptosi
/* B7E90 001B7D90 00000000 */   nop
/* B7E94 001B7D94 40180200 */  sll        $3, $2, 1
/* B7E98 001B7D98 21186200 */  addu       $3, $3, $2
/* B7E9C 001B7D9C 00210300 */  sll        $4, $3, 4
/* B7EA0 001B7DA0 21185302 */  addu       $3, $18, $19
/* B7EA4 001B7DA4 FA0664A4 */  sh         $4, 0x6FA($3)
/* B7EA8 001B7DA8 01001026 */  addiu      $16, $16, 0x1
.L001B7DAC:
/* B7EAC 001B7DAC AE056386 */  lh         $3, 0x5AE($19)
/* B7EB0 001B7DB0 2A180302 */  slt        $3, $16, $3
/* B7EB4 001B7DB4 83FF6014 */  bnez       $3, .L001B7BC4
/* B7EB8 001B7DB8 00000000 */   nop
/* B7EBC 001B7DBC 5000BF7B */  lq         $31, 0x50($sp)
/* B7EC0 001B7DC0 4000B37B */  lq         $19, 0x40($sp)
/* B7EC4 001B7DC4 3000B27B */  lq         $18, 0x30($sp)
/* B7EC8 001B7DC8 2000B17B */  lq         $17, 0x20($sp)
/* B7ECC 001B7DCC 1000B07B */  lq         $16, 0x10($sp)
/* B7ED0 001B7DD0 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* B7ED4 001B7DD4 6000BD27 */  addiu      $sp, $sp, 0x60
/* B7ED8 001B7DD8 0800E003 */  jr         $31
/* B7EDC 001B7DDC 00000000 */   nop
