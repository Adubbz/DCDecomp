.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtAtraFloorCyoice__FiiPi
/* C0E20 001C0D20 70F9BD27 */  addiu      $sp, $sp, -0x690
/* C0E24 001C0D24 6000BF7F */  sq         $31, 0x60($sp)
/* C0E28 001C0D28 5000B57F */  sq         $21, 0x50($sp)
/* C0E2C 001C0D2C 4000B47F */  sq         $20, 0x40($sp)
/* C0E30 001C0D30 3000B37F */  sq         $19, 0x30($sp)
/* C0E34 001C0D34 2000B27F */  sq         $18, 0x20($sp)
/* C0E38 001C0D38 1000B17F */  sq         $17, 0x10($sp)
/* C0E3C 001C0D3C 0000B07F */  sq         $16, 0x0($sp)
/* C0E40 001C0D40 28968070 */  paddub     $18, $4, $0
/* C0E44 001C0D44 289EA070 */  paddub     $19, $5, $0
/* C0E48 001C0D48 2886C070 */  paddub     $16, $6, $0
/* C0E4C 001C0D4C 0600422A */  slti       $2, $18, 0x6
/* C0E50 001C0D50 04004014 */  bnez       $2, .L001C0D64
/* C0E54 001C0D54 00000000 */   nop
/* C0E58 001C0D58 28160070 */  paddub     $2, $0, $0
/* C0E5C 001C0D5C 8E000010 */  b          .L001C0F98
/* C0E60 001C0D60 00000000 */   nop
.L001C0D64:
/* C0E64 001C0D64 789C848F */  lw         $4, -0x6388($gp)
/* C0E68 001C0D68 282E4072 */  paddub     $5, $18, $0
/* C0E6C 001C0D6C 28366072 */  paddub     $6, $19, $0
/* C0E70 001C0D70 FCFD060C */  jal        GetMaxAtraNum__14CDngStatusDataFii
/* C0E74 001C0D74 00000000 */   nop
/* C0E78 001C0D78 80181200 */  sll        $3, $18, 2
/* C0E7C 001C0D7C 2800023C */  lui        $2, %hi(CenterFloorTbl)
/* C0E80 001C0D80 209E4224 */  addiu      $2, $2, %lo(CenterFloorTbl)
/* C0E84 001C0D84 21104300 */  addu       $2, $2, $3
/* C0E88 001C0D88 0000518C */  lw         $17, 0x0($2)
/* C0E8C 001C0D8C 789C848F */  lw         $4, -0x6388($gp)
/* C0E90 001C0D90 282E4072 */  paddub     $5, $18, $0
/* C0E94 001C0D94 28366072 */  paddub     $6, $19, $0
/* C0E98 001C0D98 283E0072 */  paddub     $7, $16, $0
/* C0E9C 001C0D9C 3CFE060C */  jal        SetCopyAtraList__14CDngStatusDataFiiPi
/* C0EA0 001C0DA0 00000000 */   nop
/* C0EA4 001C0DA4 282E0070 */  paddub     $5, $0, $0
/* C0EA8 001C0DA8 14000010 */  b          .L001C0DFC
/* C0EAC 001C0DAC 00000000 */   nop
.L001C0DB0:
/* C0EB0 001C0DB0 40100500 */  sll        $2, $5, 1
/* C0EB4 001C0DB4 21104500 */  addu       $2, $2, $5
/* C0EB8 001C0DB8 80300200 */  sll        $6, $2, 2
/* C0EBC 001C0DBC 789C848F */  lw         $4, -0x6388($gp)
/* C0EC0 001C0DC0 00111200 */  sll        $2, $18, 4
/* C0EC4 001C0DC4 23185200 */  subu       $3, $2, $18
/* C0EC8 001C0DC8 80100300 */  sll        $2, $3, 2
/* C0ECC 001C0DCC 21106200 */  addu       $2, $3, $2
/* C0ED0 001C0DD0 00110200 */  sll        $2, $2, 4
/* C0ED4 001C0DD4 21104400 */  addu       $2, $2, $4
/* C0ED8 001C0DD8 2120C200 */  addu       $4, $6, $2
/* C0EDC 001C0DDC 7820828C */  lw         $2, 0x2078($4)
/* C0EE0 001C0DE0 2118DD00 */  addu       $3, $6, $sp
/* C0EE4 001C0DE4 700062AC */  sw         $2, 0x70($3)
/* C0EE8 001C0DE8 7C20828C */  lw         $2, 0x207C($4)
/* C0EEC 001C0DEC 740062AC */  sw         $2, 0x74($3)
/* C0EF0 001C0DF0 8020828C */  lw         $2, 0x2080($4)
/* C0EF4 001C0DF4 780062AC */  sw         $2, 0x78($3)
/* C0EF8 001C0DF8 0100A524 */  addiu      $5, $5, 0x1
.L001C0DFC:
/* C0EFC 001C0DFC 6400A228 */  slti       $2, $5, 0x64
/* C0F00 001C0E00 EBFF4014 */  bnez       $2, .L001C0DB0
/* C0F04 001C0E04 00000000 */   nop
/* C0F08 001C0E08 FFFF1224 */  addiu      $18, $0, -0x1
/* C0F0C 001C0E0C FFFF2226 */  addiu      $2, $17, -0x1
/* C0F10 001C0E10 2A085300 */  slt        $at, $2, $19
/* C0F14 001C0E14 02002010 */  beqz       $at, .L001C0E20
/* C0F18 001C0E18 00000000 */   nop
/* C0F1C 001C0E1C FEFF1224 */  addiu      $18, $0, -0x2
.L001C0E20:
/* C0F20 001C0E20 288E0070 */  paddub     $17, $0, $0
/* C0F24 001C0E24 289E0070 */  paddub     $19, $0, $0
/* C0F28 001C0E28 36000010 */  b          .L001C0F04
/* C0F2C 001C0E2C 00000000 */   nop
.L001C0E30:
/* C0F30 001C0E30 80101300 */  sll        $2, $19, 2
/* C0F34 001C0E34 21A80202 */  addu       $21, $16, $2
/* C0F38 001C0E38 0000A38E */  lw         $3, 0x0($21)
/* C0F3C 001C0E3C 04006004 */  bltz       $3, .L001C0E50
/* C0F40 001C0E40 00000000 */   nop
/* C0F44 001C0E44 01003126 */  addiu      $17, $17, 0x1
/* C0F48 001C0E48 2D000010 */  b          .L001C0F00
/* C0F4C 001C0E4C 00000000 */   nop
.L001C0E50:
/* C0F50 001C0E50 FEFF0224 */  addiu      $2, $0, -0x2
/* C0F54 001C0E54 2A006214 */  bne        $3, $2, .L001C0F00
/* C0F58 001C0E58 00000000 */   nop
/* C0F5C 001C0E5C 28A60070 */  paddub     $20, $0, $0
/* C0F60 001C0E60 24000010 */  b          .L001C0EF4
/* C0F64 001C0E64 00000000 */   nop
.L001C0E68:
/* C0F68 001C0E68 BE11040C */  jal        rand
/* C0F6C 001C0E6C 00000000 */   nop
/* C0F70 001C0E70 00008244 */  mtc1       $2, $f0
/* C0F74 001C0E74 00000000 */  nop
/* C0F78 001C0E78 60008046 */  cvt.s.w    $f1, $f0
/* C0F7C 001C0E7C C842023C */  lui        $2, (0x42C80000 >> 16)
/* C0F80 001C0E80 00008244 */  mtc1       $2, $f0
/* C0F84 001C0E84 00000000 */  nop
/* C0F88 001C0E88 42000146 */  mul.s      $f1, $f0, $f1
/* C0F8C 001C0E8C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* C0F90 001C0E90 00008244 */  mtc1       $2, $f0
/* C0F94 001C0E94 00000000 */  nop
/* C0F98 001C0E98 030B0046 */  div.s      $f12, $f1, $f0
/* C0F9C 001C0E9C 2C44040C */  jal        fptosi
/* C0FA0 001C0EA0 00000000 */   nop
/* C0FA4 001C0EA4 40180200 */  sll        $3, $2, 1
/* C0FA8 001C0EA8 21186200 */  addu       $3, $3, $2
/* C0FAC 001C0EAC 80180300 */  sll        $3, $3, 2
/* C0FB0 001C0EB0 21287D00 */  addu       $5, $3, $sp
/* C0FB4 001C0EB4 7000A48C */  lw         $4, 0x70($5)
/* C0FB8 001C0EB8 FFFF0324 */  addiu      $3, $0, -0x1
/* C0FBC 001C0EBC 0D008310 */  beq        $4, $3, .L001C0EF4
/* C0FC0 001C0EC0 00000000 */   nop
/* C0FC4 001C0EC4 7800A424 */  addiu      $4, $5, 0x78
/* C0FC8 001C0EC8 0000838C */  lw         $3, 0x0($4)
/* C0FCC 001C0ECC 09006018 */  blez       $3, .L001C0EF4
/* C0FD0 001C0ED0 00000000 */   nop
/* C0FD4 001C0ED4 7400A38C */  lw         $3, 0x74($5)
/* C0FD8 001C0ED8 06004316 */  bne        $18, $3, .L001C0EF4
/* C0FDC 001C0EDC 00000000 */   nop
/* C0FE0 001C0EE0 0000A2AE */  sw         $2, 0x0($21)
/* C0FE4 001C0EE4 0000828C */  lw         $2, 0x0($4)
/* C0FE8 001C0EE8 FFFF4224 */  addiu      $2, $2, -0x1
/* C0FEC 001C0EEC 000082AC */  sw         $2, 0x0($4)
/* C0FF0 001C0EF0 01001424 */  addiu      $20, $0, 0x1
.L001C0EF4:
/* C0FF4 001C0EF4 DCFF8012 */  beqz       $20, .L001C0E68
/* C0FF8 001C0EF8 00000000 */   nop
/* C0FFC 001C0EFC 01003126 */  addiu      $17, $17, 0x1
.L001C0F00:
/* C1000 001C0F00 01007326 */  addiu      $19, $19, 0x1
.L001C0F04:
/* C1004 001C0F04 0800622A */  slti       $2, $19, 0x8
/* C1008 001C0F08 C9FF4014 */  bnez       $2, .L001C0E30
/* C100C 001C0F0C 00000000 */   nop
/* C1010 001C0F10 28260070 */  paddub     $4, $0, $0
/* C1014 001C0F14 06000010 */  b          .L001C0F30
/* C1018 001C0F18 00000000 */   nop
.L001C0F1C:
/* C101C 001C0F1C FFFF0324 */  addiu      $3, $0, -0x1
/* C1020 001C0F20 80100400 */  sll        $2, $4, 2
/* C1024 001C0F24 21105D00 */  addu       $2, $2, $sp
/* C1028 001C0F28 700643AC */  sw         $3, 0x670($2)
/* C102C 001C0F2C 01008424 */  addiu      $4, $4, 0x1
.L001C0F30:
/* C1030 001C0F30 08008228 */  slti       $2, $4, 0x8
/* C1034 001C0F34 F9FF4014 */  bnez       $2, .L001C0F1C
/* C1038 001C0F38 00000000 */   nop
/* C103C 001C0F3C 281E0070 */  paddub     $3, $0, $0
/* C1040 001C0F40 28260070 */  paddub     $4, $0, $0
/* C1044 001C0F44 0B000010 */  b          .L001C0F74
/* C1048 001C0F48 00000000 */   nop
.L001C0F4C:
/* C104C 001C0F4C 80100400 */  sll        $2, $4, 2
/* C1050 001C0F50 21100202 */  addu       $2, $16, $2
/* C1054 001C0F54 0000458C */  lw         $5, 0x0($2)
/* C1058 001C0F58 0500A004 */  bltz       $5, .L001C0F70
/* C105C 001C0F5C 00000000 */   nop
/* C1060 001C0F60 80100300 */  sll        $2, $3, 2
/* C1064 001C0F64 21105D00 */  addu       $2, $2, $sp
/* C1068 001C0F68 700645AC */  sw         $5, 0x670($2)
/* C106C 001C0F6C 01006324 */  addiu      $3, $3, 0x1
.L001C0F70:
/* C1070 001C0F70 01008424 */  addiu      $4, $4, 0x1
.L001C0F74:
/* C1074 001C0F74 08008228 */  slti       $2, $4, 0x8
/* C1078 001C0F78 F4FF4014 */  bnez       $2, .L001C0F4C
/* C107C 001C0F7C 00000000 */   nop
/* C1080 001C0F80 28260072 */  paddub     $4, $16, $0
/* C1084 001C0F84 7006A527 */  addiu      $5, $sp, 0x670
/* C1088 001C0F88 20000624 */  addiu      $6, $0, 0x20
/* C108C 001C0F8C EC0C040C */  jal        memcpy
/* C1090 001C0F90 00000000 */   nop
/* C1094 001C0F94 28162072 */  paddub     $2, $17, $0
.L001C0F98:
/* C1098 001C0F98 6000BF7B */  lq         $31, 0x60($sp)
/* C109C 001C0F9C 5000B57B */  lq         $21, 0x50($sp)
/* C10A0 001C0FA0 4000B47B */  lq         $20, 0x40($sp)
/* C10A4 001C0FA4 3000B37B */  lq         $19, 0x30($sp)
/* C10A8 001C0FA8 2000B27B */  lq         $18, 0x20($sp)
/* C10AC 001C0FAC 1000B17B */  lq         $17, 0x10($sp)
/* C10B0 001C0FB0 0000B07B */  lq         $16, 0x0($sp)
/* C10B4 001C0FB4 9006BD27 */  addiu      $sp, $sp, 0x690
/* C10B8 001C0FB8 0800E003 */  jr         $31
/* C10BC 001C0FBC 00000000 */   nop
