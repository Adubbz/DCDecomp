.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetKey__12CMonstorUnitFv
/* D7D80 001D7C80 70FFBD27 */  addiu      $sp, $sp, -0x90
/* D7D84 001D7C84 7000BF7F */  sq         $31, 0x70($sp)
/* D7D88 001D7C88 6000B67F */  sq         $22, 0x60($sp)
/* D7D8C 001D7C8C 5000B57F */  sq         $21, 0x50($sp)
/* D7D90 001D7C90 4000B47F */  sq         $20, 0x40($sp)
/* D7D94 001D7C94 3000B37F */  sq         $19, 0x30($sp)
/* D7D98 001D7C98 2000B27F */  sq         $18, 0x20($sp)
/* D7D9C 001D7C9C 1000B17F */  sq         $17, 0x10($sp)
/* D7DA0 001D7CA0 0000B07F */  sq         $16, 0x0($sp)
/* D7DA4 001D7CA4 28AE8070 */  paddub     $21, $4, $0
/* D7DA8 001D7CA8 288E0070 */  paddub     $17, $0, $0
/* D7DAC 001D7CAC 2900033C */  lui        $3, %hi(_606_4)
/* D7DB0 001D7CB0 F0176624 */  addiu      $6, $3, %lo(_606_4)
/* D7DB4 001D7CB4 8000A527 */  addiu      $5, $sp, 0x80
/* D7DB8 001D7CB8 0000C3DC */  ld         $3, 0x0($6)
/* D7DBC 001D7CBC 0800C0C4 */  lwc1       $f0, 0x8($6)
/* D7DC0 001D7CC0 0000A3FC */  sd         $3, 0x0($5)
/* D7DC4 001D7CC4 0800A0E4 */  swc1       $f0, 0x8($5)
/* D7DC8 001D7CC8 4400838C */  lw         $3, 0x44($4)
/* D7DCC 001D7CCC 8A006014 */  bnez       $3, .L001D7EF8
/* D7DD0 001D7CD0 00000000 */   nop
/* D7DD4 001D7CD4 A49D858F */  lw         $5, -0x625C($gp)
/* D7DD8 001D7CD8 02000324 */  addiu      $3, $0, 0x2
/* D7DDC 001D7CDC 0600A314 */  bne        $5, $3, .L001D7CF8
/* D7DE0 001D7CE0 00000000 */   nop
/* D7DE4 001D7CE4 789C838F */  lw         $3, -0x6388($gp)
/* D7DE8 001D7CE8 02006480 */  lb         $4, 0x2($3)
/* D7DEC 001D7CEC 10000324 */  addiu      $3, $0, 0x10
/* D7DF0 001D7CF0 81008310 */  beq        $4, $3, .L001D7EF8
/* D7DF4 001D7CF4 00000000 */   nop
.L001D7CF8:
/* D7DF8 001D7CF8 01001224 */  addiu      $18, $0, 0x1
/* D7DFC 001D7CFC 0200B214 */  bne        $5, $18, .L001D7D08
/* D7E00 001D7D00 00000000 */   nop
/* D7E04 001D7D04 03001224 */  addiu      $18, $0, 0x3
.L001D7D08:
/* D7E08 001D7D08 4C00A38E */  lw         $3, 0x4C($21)
/* D7E0C 001D7D0C 02006128 */  slti       $at, $3, 0x2
/* D7E10 001D7D10 79002014 */  bnez       $at, .L001D7EF8
/* D7E14 001D7D14 00000000 */   nop
/* D7E18 001D7D18 289E0070 */  paddub     $19, $0, $0
.L001D7D1C:
/* D7E1C 001D7D1C BE11040C */  jal        rand
/* D7E20 001D7D20 00000000 */   nop
/* D7E24 001D7D24 00008244 */  mtc1       $2, $f0
/* D7E28 001D7D28 00000000 */  nop
/* D7E2C 001D7D2C 60008046 */  cvt.s.w    $f1, $f0
/* D7E30 001D7D30 4C00B08E */  lw         $16, 0x4C($21)
/* D7E34 001D7D34 00009044 */  mtc1       $16, $f0
/* D7E38 001D7D38 00000000 */  nop
/* D7E3C 001D7D3C 20008046 */  cvt.s.w    $f0, $f0
/* D7E40 001D7D40 42000146 */  mul.s      $f1, $f0, $f1
/* D7E44 001D7D44 004F023C */  lui        $2, (0x4F000000 >> 16)
/* D7E48 001D7D48 00008244 */  mtc1       $2, $f0
/* D7E4C 001D7D4C 00000000 */  nop
/* D7E50 001D7D50 030B0046 */  div.s      $f12, $f1, $f0
/* D7E54 001D7D54 2C44040C */  jal        fptosi
/* D7E58 001D7D58 00000000 */   nop
/* D7E5C 001D7D5C 04004004 */  bltz       $2, .L001D7D70
/* D7E60 001D7D60 00000000 */   nop
/* D7E64 001D7D64 2A185000 */  slt        $3, $2, $16
/* D7E68 001D7D68 02006014 */  bnez       $3, .L001D7D74
/* D7E6C 001D7D6C 00000000 */   nop
.L001D7D70:
/* D7E70 001D7D70 28160070 */  paddub     $2, $0, $0
.L001D7D74:
/* D7E74 001D7D74 80180200 */  sll        $3, $2, 2
/* D7E78 001D7D78 21186200 */  addu       $3, $3, $2
/* D7E7C 001D7D7C 80100300 */  sll        $2, $3, 2
/* D7E80 001D7D80 21106200 */  addu       $2, $3, $2
/* D7E84 001D7D84 00A10200 */  sll        $20, $2, 4
/* D7E88 001D7D88 21109502 */  addu       $2, $20, $21
/* D7E8C 001D7D8C 0200013C */  lui        $at, (0x20000 >> 16)
/* D7E90 001D7D90 21084100 */  addu       $at, $2, $at
/* D7E94 001D7D94 D0E3238C */  lw         $3, -0x1C30($at)
/* D7E98 001D7D98 FFFF0224 */  addiu      $2, $0, -0x1
/* D7E9C 001D7D9C DFFF6210 */  beq        $3, $2, .L001D7D1C
/* D7EA0 001D7DA0 00000000 */   nop
/* D7EA4 001D7DA4 A49D848F */  lw         $4, -0x625C($gp)
/* D7EA8 001D7DA8 0700812C */  sltiu      $at, $4, 0x7
/* D7EAC 001D7DAC 1F002010 */  beqz       $at, .L001D7E2C
/* D7EB0 001D7DB0 00000000 */   nop
/* D7EB4 001D7DB4 2A00023C */  lui        $2, %hi(_654_3)
/* D7EB8 001D7DB8 20CF4324 */  addiu      $3, $2, %lo(_654_3)
/* D7EBC 001D7DBC 80100400 */  sll        $2, $4, 2
/* D7EC0 001D7DC0 21104300 */  addu       $2, $2, $3
/* D7EC4 001D7DC4 0000428C */  lw         $2, 0x0($2)
/* D7EC8 001D7DC8 08004000 */  jr         $2
/* D7ECC 001D7DCC 00000000 */   nop
/* D7ED0 001D7DD0 C3001024 */  addiu      $16, $0, 0xC3
/* D7ED4 001D7DD4 16000010 */  b          .L001D7E30
/* D7ED8 001D7DD8 00000000 */   nop
/* D7EDC 001D7DDC 80101100 */  sll        $2, $17, 2
/* D7EE0 001D7DE0 21105D00 */  addu       $2, $2, $sp
/* D7EE4 001D7DE4 8000508C */  lw         $16, 0x80($2)
/* D7EE8 001D7DE8 11000010 */  b          .L001D7E30
/* D7EEC 001D7DEC 00000000 */   nop
/* D7EF0 001D7DF0 C9001024 */  addiu      $16, $0, 0xC9
/* D7EF4 001D7DF4 0E000010 */  b          .L001D7E30
/* D7EF8 001D7DF8 00000000 */   nop
/* D7EFC 001D7DFC CA001024 */  addiu      $16, $0, 0xCA
/* D7F00 001D7E00 0B000010 */  b          .L001D7E30
/* D7F04 001D7E04 00000000 */   nop
/* D7F08 001D7E08 CB001024 */  addiu      $16, $0, 0xCB
/* D7F0C 001D7E0C 08000010 */  b          .L001D7E30
/* D7F10 001D7E10 00000000 */   nop
/* D7F14 001D7E14 CC001024 */  addiu      $16, $0, 0xCC
/* D7F18 001D7E18 05000010 */  b          .L001D7E30
/* D7F1C 001D7E1C 00000000 */   nop
/* D7F20 001D7E20 CE001024 */  addiu      $16, $0, 0xCE
/* D7F24 001D7E24 02000010 */  b          .L001D7E30
/* D7F28 001D7E28 00000000 */   nop
.L001D7E2C:
/* D7F2C 001D7E2C FFFF1024 */  addiu      $16, $0, -0x1
.L001D7E30:
/* D7F30 001D7E30 21209502 */  addu       $4, $20, $21
/* D7F34 001D7E34 0100013C */  lui        $at, (0x1E470 >> 16)
/* D7F38 001D7E38 70E42134 */  ori        $at, $at, (0x1E470 & 0xFFFF)
/* D7F3C 001D7E3C 21B08100 */  addu       $22, $4, $at
/* D7F40 001D7E40 0000C386 */  lh         $3, 0x0($22)
/* D7F44 001D7E44 FFFF0224 */  addiu      $2, $0, -0x1
/* D7F48 001D7E48 20006214 */  bne        $3, $2, .L001D7ECC
/* D7F4C 001D7E4C 00000000 */   nop
/* D7F50 001D7E50 0200013C */  lui        $at, (0x20000 >> 16)
/* D7F54 001D7E54 21088100 */  addu       $at, $4, $at
/* D7F58 001D7E58 AAE42284 */  lh         $2, -0x1B56($at)
/* D7F5C 001D7E5C 1B004010 */  beqz       $2, .L001D7ECC
/* D7F60 001D7E60 00000000 */   nop
/* D7F64 001D7E64 789C848F */  lw         $4, -0x6388($gp)
/* D7F68 001D7E68 282E0072 */  paddub     $5, $16, $0
/* D7F6C 001D7E6C 50F6060C */  jal        SearchItemIndexNo__14CDngStatusDataFi
/* D7F70 001D7E70 00000000 */   nop
/* D7F74 001D7E74 2A00033C */  lui        $3, %hi(_653_3)
/* D7F78 001D7E78 10CF6424 */  addiu      $4, $3, %lo(_653_3)
/* D7F7C 001D7E7C 282E4070 */  paddub     $5, $2, $0
/* D7F80 001D7E80 A611040C */  jal        printf
/* D7F84 001D7E84 00000000 */   nop
/* D7F88 001D7E88 789C848F */  lw         $4, -0x6388($gp)
/* D7F8C 001D7E8C 282E0072 */  paddub     $5, $16, $0
/* D7F90 001D7E90 50F6060C */  jal        SearchItemIndexNo__14CDngStatusDataFi
/* D7F94 001D7E94 00000000 */   nop
/* D7F98 001D7E98 08004104 */  bgez       $2, .L001D7EBC
/* D7F9C 001D7E9C 00000000 */   nop
/* D7FA0 001D7EA0 089D848F */  lw         $4, -0x62F8($gp)
/* D7FA4 001D7EA4 282E0072 */  paddub     $5, $16, $0
/* D7FA8 001D7EA8 C85C070C */  jal        CheckItemNo__11CRandomItemFi
/* D7FAC 001D7EAC 00000000 */   nop
/* D7FB0 001D7EB0 02004014 */  bnez       $2, .L001D7EBC
/* D7FB4 001D7EB4 00000000 */   nop
/* D7FB8 001D7EB8 0000D0A6 */  sh         $16, 0x0($22)
.L001D7EBC:
/* D7FBC 001D7EBC 01003126 */  addiu      $17, $17, 0x1
/* D7FC0 001D7EC0 FFFF5226 */  addiu      $18, $18, -0x1
/* D7FC4 001D7EC4 0C00401A */  blez       $18, .L001D7EF8
/* D7FC8 001D7EC8 00000000 */   nop
.L001D7ECC:
/* D7FCC 001D7ECC 01007326 */  addiu      $19, $19, 0x1
/* D7FD0 001D7ED0 0F27622A */  slti       $2, $19, 0x270F
/* D7FD4 001D7ED4 91FF4014 */  bnez       $2, .L001D7D1C
/* D7FD8 001D7ED8 00000000 */   nop
/* D7FDC 001D7EDC 01000324 */  addiu      $3, $0, 0x1
/* D7FE0 001D7EE0 21109502 */  addu       $2, $20, $21
/* D7FE4 001D7EE4 0200013C */  lui        $at, (0x20000 >> 16)
/* D7FE8 001D7EE8 21084100 */  addu       $at, $2, $at
/* D7FEC 001D7EEC AAE423A4 */  sh         $3, -0x1B56($at)
/* D7FF0 001D7EF0 8AFF0010 */  b          .L001D7D1C
/* D7FF4 001D7EF4 00000000 */   nop
.L001D7EF8:
/* D7FF8 001D7EF8 7000BF7B */  lq         $31, 0x70($sp)
/* D7FFC 001D7EFC 6000B67B */  lq         $22, 0x60($sp)
/* D8000 001D7F00 5000B57B */  lq         $21, 0x50($sp)
/* D8004 001D7F04 4000B47B */  lq         $20, 0x40($sp)
/* D8008 001D7F08 3000B37B */  lq         $19, 0x30($sp)
/* D800C 001D7F0C 2000B27B */  lq         $18, 0x20($sp)
/* D8010 001D7F10 1000B17B */  lq         $17, 0x10($sp)
/* D8014 001D7F14 0000B07B */  lq         $16, 0x0($sp)
/* D8018 001D7F18 9000BD27 */  addiu      $sp, $sp, 0x90
/* D801C 001D7F1C 0800E003 */  jr         $31
/* D8020 001D7F20 00000000 */   nop
/* D8024 001D7F24 00000000 */  nop
/* D8028 001D7F28 00000000 */  nop
/* D802C 001D7F2C 00000000 */  nop
