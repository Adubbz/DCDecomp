.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtAtraListMake__Fi
/* C0AC0 001C09C0 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* C0AC4 001C09C4 9000BF7F */  sq         $31, 0x90($sp)
/* C0AC8 001C09C8 8000BE7F */  sq         $fp, 0x80($sp)
/* C0ACC 001C09CC 7000B77F */  sq         $23, 0x70($sp)
/* C0AD0 001C09D0 6000B67F */  sq         $22, 0x60($sp)
/* C0AD4 001C09D4 5000B57F */  sq         $21, 0x50($sp)
/* C0AD8 001C09D8 4000B47F */  sq         $20, 0x40($sp)
/* C0ADC 001C09DC 3000B37F */  sq         $19, 0x30($sp)
/* C0AE0 001C09E0 2000B27F */  sq         $18, 0x20($sp)
/* C0AE4 001C09E4 1000B17F */  sq         $17, 0x10($sp)
/* C0AE8 001C09E8 0000B07F */  sq         $16, 0x0($sp)
/* C0AEC 001C09EC 28AE8070 */  paddub     $21, $4, $0
/* C0AF0 001C09F0 0600A12A */  slti       $at, $21, 0x6
/* C0AF4 001C09F4 BB002010 */  beqz       $at, .L001C0CE4
/* C0AF8 001C09F8 00000000 */   nop
/* C0AFC 001C09FC 80201500 */  sll        $4, $21, 2
/* C0B00 001C0A00 2600033C */  lui        $3, %hi(AtraAppearData)
/* C0B04 001C0A04 30DF6324 */  addiu      $3, $3, %lo(AtraAppearData)
/* C0B08 001C0A08 21186400 */  addu       $3, $3, $4
/* C0B0C 001C0A0C 0000708C */  lw         $16, 0x0($3)
/* C0B10 001C0A10 2800033C */  lui        $3, %hi(CenterFloorTbl)
/* C0B14 001C0A14 209E6324 */  addiu      $3, $3, %lo(CenterFloorTbl)
/* C0B18 001C0A18 21186400 */  addu       $3, $3, $4
/* C0B1C 001C0A1C 0000778C */  lw         $23, 0x0($3)
/* C0B20 001C0A20 2800033C */  lui        $3, %hi(MaxFloorTbl_2)
/* C0B24 001C0A24 409E6324 */  addiu      $3, $3, %lo(MaxFloorTbl_2)
/* C0B28 001C0A28 21186400 */  addu       $3, $3, $4
/* C0B2C 001C0A2C 0000638C */  lw         $3, 0x0($3)
/* C0B30 001C0A30 A000A3AF */  sw         $3, 0xA0($sp)
/* C0B34 001C0A34 288E0070 */  paddub     $17, $0, $0
/* C0B38 001C0A38 28B60070 */  paddub     $22, $0, $0
/* C0B3C 001C0A3C 28960070 */  paddub     $18, $0, $0
/* C0B40 001C0A40 1B000010 */  b          .L001C0AB0
/* C0B44 001C0A44 00000000 */   nop
.L001C0A48:
/* C0B48 001C0A48 2120B000 */  addu       $4, $5, $16
/* C0B4C 001C0A4C 0400868C */  lw         $6, 0x4($4)
/* C0B50 001C0A50 FFFF0324 */  addiu      $3, $0, -0x1
/* C0B54 001C0A54 0300C314 */  bne        $6, $3, .L001C0A64
/* C0B58 001C0A58 00000000 */   nop
/* C0B5C 001C0A5C 0800838C */  lw         $3, 0x8($4)
/* C0B60 001C0A60 21B0C302 */  addu       $22, $22, $3
.L001C0A64:
/* C0B64 001C0A64 FEFF0324 */  addiu      $3, $0, -0x2
/* C0B68 001C0A68 0400C314 */  bne        $6, $3, .L001C0A7C
/* C0B6C 001C0A6C 00000000 */   nop
/* C0B70 001C0A70 2118B000 */  addu       $3, $5, $16
/* C0B74 001C0A74 0800638C */  lw         $3, 0x8($3)
/* C0B78 001C0A78 21904302 */  addu       $18, $18, $3
.L001C0A7C:
/* C0B7C 001C0A7C FFFF0324 */  addiu      $3, $0, -0x1
/* C0B80 001C0A80 0A00C310 */  beq        $6, $3, .L001C0AAC
/* C0B84 001C0A84 00000000 */   nop
/* C0B88 001C0A88 FEFF0324 */  addiu      $3, $0, -0x2
/* C0B8C 001C0A8C 0700C310 */  beq        $6, $3, .L001C0AAC
/* C0B90 001C0A90 00000000 */   nop
/* C0B94 001C0A94 FFFFC624 */  addiu      $6, $6, -0x1
/* C0B98 001C0A98 789C848F */  lw         $4, -0x6388($gp)
/* C0B9C 001C0A9C 282EA072 */  paddub     $5, $21, $0
/* C0BA0 001C0AA0 283E2072 */  paddub     $7, $17, $0
/* C0BA4 001C0AA4 1CFE060C */  jal        SetGetAtra__14CDngStatusDataFiii
/* C0BA8 001C0AA8 00000000 */   nop
.L001C0AAC:
/* C0BAC 001C0AAC 01003126 */  addiu      $17, $17, 0x1
.L001C0AB0:
/* C0BB0 001C0AB0 40181100 */  sll        $3, $17, 1
/* C0BB4 001C0AB4 21187100 */  addu       $3, $3, $17
/* C0BB8 001C0AB8 80280300 */  sll        $5, $3, 2
/* C0BBC 001C0ABC 21180502 */  addu       $3, $16, $5
/* C0BC0 001C0AC0 0000648C */  lw         $4, 0x0($3)
/* C0BC4 001C0AC4 FFFF0324 */  addiu      $3, $0, -0x1
/* C0BC8 001C0AC8 DFFF8314 */  bne        $4, $3, .L001C0A48
/* C0BCC 001C0ACC 00000000 */   nop
/* C0BD0 001C0AD0 289E0070 */  paddub     $19, $0, $0
/* C0BD4 001C0AD4 2D000010 */  b          .L001C0B8C
/* C0BD8 001C0AD8 00000000 */   nop
.L001C0ADC:
/* C0BDC 001C0ADC 28F60070 */  paddub     $fp, $0, $0
/* C0BE0 001C0AE0 27000010 */  b          .L001C0B80
/* C0BE4 001C0AE4 00000000 */   nop
.L001C0AE8:
/* C0BE8 001C0AE8 BE11040C */  jal        rand
/* C0BEC 001C0AEC 00000000 */   nop
/* C0BF0 001C0AF0 00008244 */  mtc1       $2, $f0
/* C0BF4 001C0AF4 00000000 */  nop
/* C0BF8 001C0AF8 60008046 */  cvt.s.w    $f1, $f0
/* C0BFC 001C0AFC FFFFE226 */  addiu      $2, $23, -0x1
/* C0C00 001C0B00 00008244 */  mtc1       $2, $f0
/* C0C04 001C0B04 00000000 */  nop
/* C0C08 001C0B08 20008046 */  cvt.s.w    $f0, $f0
/* C0C0C 001C0B0C 42000146 */  mul.s      $f1, $f0, $f1
/* C0C10 001C0B10 004F023C */  lui        $2, (0x4F000000 >> 16)
/* C0C14 001C0B14 00008244 */  mtc1       $2, $f0
/* C0C18 001C0B18 00000000 */  nop
/* C0C1C 001C0B1C 030B0046 */  div.s      $f12, $f1, $f0
/* C0C20 001C0B20 2C44040C */  jal        fptosi
/* C0C24 001C0B24 00000000 */   nop
/* C0C28 001C0B28 28A64070 */  paddub     $20, $2, $0
/* C0C2C 001C0B2C 789C848F */  lw         $4, -0x6388($gp)
/* C0C30 001C0B30 282EA072 */  paddub     $5, $21, $0
/* C0C34 001C0B34 28368072 */  paddub     $6, $20, $0
/* C0C38 001C0B38 FCFD060C */  jal        GetMaxAtraNum__14CDngStatusDataFii
/* C0C3C 001C0B3C 00000000 */   nop
/* C0C40 001C0B40 08004128 */  slti       $at, $2, 0x8
/* C0C44 001C0B44 0E002010 */  beqz       $at, .L001C0B80
/* C0C48 001C0B48 00000000 */   nop
/* C0C4C 001C0B4C 01008526 */  addiu      $5, $20, 0x1
/* C0C50 001C0B50 2826A072 */  paddub     $4, $21, $0
/* C0C54 001C0B54 5002070C */  jal        chkAtraFloor__Fii
/* C0C58 001C0B58 00000000 */   nop
/* C0C5C 001C0B5C 08004010 */  beqz       $2, .L001C0B80
/* C0C60 001C0B60 00000000 */   nop
/* C0C64 001C0B64 789C848F */  lw         $4, -0x6388($gp)
/* C0C68 001C0B68 282EA072 */  paddub     $5, $21, $0
/* C0C6C 001C0B6C 28368072 */  paddub     $6, $20, $0
/* C0C70 001C0B70 FEFF0724 */  addiu      $7, $0, -0x2
/* C0C74 001C0B74 1CFE060C */  jal        SetGetAtra__14CDngStatusDataFiii
/* C0C78 001C0B78 00000000 */   nop
/* C0C7C 001C0B7C 01001E24 */  addiu      $fp, $0, 0x1
.L001C0B80:
/* C0C80 001C0B80 D9FFC013 */  beqz       $fp, .L001C0AE8
/* C0C84 001C0B84 00000000 */   nop
/* C0C88 001C0B88 01007326 */  addiu      $19, $19, 0x1
.L001C0B8C:
/* C0C8C 001C0B8C 2A187602 */  slt        $3, $19, $22
/* C0C90 001C0B90 D2FF6014 */  bnez       $3, .L001C0ADC
/* C0C94 001C0B94 00000000 */   nop
/* C0C98 001C0B98 289E0070 */  paddub     $19, $0, $0
/* C0C9C 001C0B9C 2F000010 */  b          .L001C0C5C
/* C0CA0 001C0BA0 00000000 */   nop
.L001C0BA4:
/* C0CA4 001C0BA4 28B60070 */  paddub     $22, $0, $0
/* C0CA8 001C0BA8 29000010 */  b          .L001C0C50
/* C0CAC 001C0BAC 00000000 */   nop
.L001C0BB0:
/* C0CB0 001C0BB0 BE11040C */  jal        rand
/* C0CB4 001C0BB4 00000000 */   nop
/* C0CB8 001C0BB8 00008244 */  mtc1       $2, $f0
/* C0CBC 001C0BBC 00000000 */  nop
/* C0CC0 001C0BC0 60008046 */  cvt.s.w    $f1, $f0
/* C0CC4 001C0BC4 A000A28F */  lw         $2, 0xA0($sp)
/* C0CC8 001C0BC8 23105700 */  subu       $2, $2, $23
/* C0CCC 001C0BCC FFFF4224 */  addiu      $2, $2, -0x1
/* C0CD0 001C0BD0 00008244 */  mtc1       $2, $f0
/* C0CD4 001C0BD4 00000000 */  nop
/* C0CD8 001C0BD8 20008046 */  cvt.s.w    $f0, $f0
/* C0CDC 001C0BDC 42000146 */  mul.s      $f1, $f0, $f1
/* C0CE0 001C0BE0 004F023C */  lui        $2, (0x4F000000 >> 16)
/* C0CE4 001C0BE4 00008244 */  mtc1       $2, $f0
/* C0CE8 001C0BE8 00000000 */  nop
/* C0CEC 001C0BEC 030B0046 */  div.s      $f12, $f1, $f0
/* C0CF0 001C0BF0 2C44040C */  jal        fptosi
/* C0CF4 001C0BF4 00000000 */   nop
/* C0CF8 001C0BF8 21A05700 */  addu       $20, $2, $23
/* C0CFC 001C0BFC 789C848F */  lw         $4, -0x6388($gp)
/* C0D00 001C0C00 282EA072 */  paddub     $5, $21, $0
/* C0D04 001C0C04 28368072 */  paddub     $6, $20, $0
/* C0D08 001C0C08 FCFD060C */  jal        GetMaxAtraNum__14CDngStatusDataFii
/* C0D0C 001C0C0C 00000000 */   nop
/* C0D10 001C0C10 08004128 */  slti       $at, $2, 0x8
/* C0D14 001C0C14 0E002010 */  beqz       $at, .L001C0C50
/* C0D18 001C0C18 00000000 */   nop
/* C0D1C 001C0C1C 01008526 */  addiu      $5, $20, 0x1
/* C0D20 001C0C20 2826A072 */  paddub     $4, $21, $0
/* C0D24 001C0C24 5002070C */  jal        chkAtraFloor__Fii
/* C0D28 001C0C28 00000000 */   nop
/* C0D2C 001C0C2C 08004010 */  beqz       $2, .L001C0C50
/* C0D30 001C0C30 00000000 */   nop
/* C0D34 001C0C34 789C848F */  lw         $4, -0x6388($gp)
/* C0D38 001C0C38 282EA072 */  paddub     $5, $21, $0
/* C0D3C 001C0C3C 28368072 */  paddub     $6, $20, $0
/* C0D40 001C0C40 FEFF0724 */  addiu      $7, $0, -0x2
/* C0D44 001C0C44 1CFE060C */  jal        SetGetAtra__14CDngStatusDataFiii
/* C0D48 001C0C48 00000000 */   nop
/* C0D4C 001C0C4C 01001624 */  addiu      $22, $0, 0x1
.L001C0C50:
/* C0D50 001C0C50 D7FFC012 */  beqz       $22, .L001C0BB0
/* C0D54 001C0C54 00000000 */   nop
/* C0D58 001C0C58 01007326 */  addiu      $19, $19, 0x1
.L001C0C5C:
/* C0D5C 001C0C5C 2A187202 */  slt        $3, $19, $18
/* C0D60 001C0C60 D0FF6014 */  bnez       $3, .L001C0BA4
/* C0D64 001C0C64 00000000 */   nop
/* C0D68 001C0C68 28460070 */  paddub     $8, $0, $0
/* C0D6C 001C0C6C 1A000010 */  b          .L001C0CD8
/* C0D70 001C0C70 00000000 */   nop
.L001C0C74:
/* C0D74 001C0C74 40180800 */  sll        $3, $8, 1
/* C0D78 001C0C78 21186800 */  addu       $3, $3, $8
/* C0D7C 001C0C7C 80480300 */  sll        $9, $3, 2
/* C0D80 001C0C80 21380902 */  addu       $7, $16, $9
/* C0D84 001C0C84 0000E68C */  lw         $6, 0x0($7)
/* C0D88 001C0C88 789C858F */  lw         $5, -0x6388($gp)
/* C0D8C 001C0C8C 00191500 */  sll        $3, $21, 4
/* C0D90 001C0C90 23207500 */  subu       $4, $3, $21
/* C0D94 001C0C94 80180400 */  sll        $3, $4, 2
/* C0D98 001C0C98 21188300 */  addu       $3, $4, $3
/* C0D9C 001C0C9C 00510300 */  sll        $10, $3, 4
/* C0DA0 001C0CA0 21184501 */  addu       $3, $10, $5
/* C0DA4 001C0CA4 21182301 */  addu       $3, $9, $3
/* C0DA8 001C0CA8 782066AC */  sw         $6, 0x2078($3)
/* C0DAC 001C0CAC 0400E48C */  lw         $4, 0x4($7)
/* C0DB0 001C0CB0 789C838F */  lw         $3, -0x6388($gp)
/* C0DB4 001C0CB4 21184301 */  addu       $3, $10, $3
/* C0DB8 001C0CB8 21182301 */  addu       $3, $9, $3
/* C0DBC 001C0CBC 7C2064AC */  sw         $4, 0x207C($3)
/* C0DC0 001C0CC0 0800E48C */  lw         $4, 0x8($7)
/* C0DC4 001C0CC4 789C838F */  lw         $3, -0x6388($gp)
/* C0DC8 001C0CC8 21184301 */  addu       $3, $10, $3
/* C0DCC 001C0CCC 21182301 */  addu       $3, $9, $3
/* C0DD0 001C0CD0 802064AC */  sw         $4, 0x2080($3)
/* C0DD4 001C0CD4 01000825 */  addiu      $8, $8, 0x1
.L001C0CD8:
/* C0DD8 001C0CD8 2A181101 */  slt        $3, $8, $17
/* C0DDC 001C0CDC E5FF6014 */  bnez       $3, .L001C0C74
/* C0DE0 001C0CE0 00000000 */   nop
.L001C0CE4:
/* C0DE4 001C0CE4 9000BF7B */  lq         $31, 0x90($sp)
/* C0DE8 001C0CE8 8000BE7B */  lq         $fp, 0x80($sp)
/* C0DEC 001C0CEC 7000B77B */  lq         $23, 0x70($sp)
/* C0DF0 001C0CF0 6000B67B */  lq         $22, 0x60($sp)
/* C0DF4 001C0CF4 5000B57B */  lq         $21, 0x50($sp)
/* C0DF8 001C0CF8 4000B47B */  lq         $20, 0x40($sp)
/* C0DFC 001C0CFC 3000B37B */  lq         $19, 0x30($sp)
/* C0E00 001C0D00 2000B27B */  lq         $18, 0x20($sp)
/* C0E04 001C0D04 1000B17B */  lq         $17, 0x10($sp)
/* C0E08 001C0D08 0000B07B */  lq         $16, 0x0($sp)
/* C0E0C 001C0D0C B000BD27 */  addiu      $sp, $sp, 0xB0
/* C0E10 001C0D10 0800E003 */  jr         $31
/* C0E14 001C0D14 00000000 */   nop
/* C0E18 001C0D18 00000000 */  nop
/* C0E1C 001C0D1C 00000000 */  nop
