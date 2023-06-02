.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Load__11CEditGroundFPc
/* A4A10 001A4910 00F0BD27 */  addiu      $sp, $sp, -0x1000
/* A4A14 001A4914 5000BF7F */  sq         $31, 0x50($sp)
/* A4A18 001A4918 4000B47F */  sq         $20, 0x40($sp)
/* A4A1C 001A491C 3000B37F */  sq         $19, 0x30($sp)
/* A4A20 001A4920 2000B27F */  sq         $18, 0x20($sp)
/* A4A24 001A4924 1000B17F */  sq         $17, 0x10($sp)
/* A4A28 001A4928 0000B07F */  sq         $16, 0x0($sp)
/* A4A2C 001A492C 28A68070 */  paddub     $20, $4, $0
/* A4A30 001A4930 288EA070 */  paddub     $17, $5, $0
/* A4A34 001A4934 4495060C */  jal        Clear__11CEditGroundFv
/* A4A38 001A4938 00000000 */   nop
/* A4A3C 001A493C 6000B027 */  addiu      $16, $sp, 0x60
/* A4A40 001A4940 0C002016 */  bnez       $17, .L001A4974
/* A4A44 001A4944 00000000 */   nop
/* A4A48 001A4948 2A00023C */  lui        $2, %hi(_1325)
/* A4A4C 001A494C 50B44424 */  addiu      $4, $2, %lo(_1325)
/* A4A50 001A4950 282E0072 */  paddub     $5, $16, $0
/* A4A54 001A4954 28360070 */  paddub     $6, $0, $0
/* A4A58 001A4958 283E0070 */  paddub     $7, $0, $0
/* A4A5C 001A495C F4FC040C */  jal        LoadFile2__FPcPvPii
/* A4A60 001A4960 00000000 */   nop
/* A4A64 001A4964 04004014 */  bnez       $2, .L001A4978
/* A4A68 001A4968 00000000 */   nop
/* A4A6C 001A496C BC000010 */  b          .L001A4C60
/* A4A70 001A4970 00000000 */   nop
.L001A4974:
/* A4A74 001A4974 28862072 */  paddub     $16, $17, $0
.L001A4978:
/* A4A78 001A4978 04000386 */  lh         $3, 0x4($16)
/* A4A7C 001A497C 21900302 */  addu       $18, $16, $3
/* A4A80 001A4980 288E4072 */  paddub     $17, $18, $0
/* A4A84 001A4984 289E0070 */  paddub     $19, $0, $0
/* A4A88 001A4988 23000010 */  b          .L001A4A18
/* A4A8C 001A498C 00000000 */   nop
.L001A4990:
/* A4A90 001A4990 00002386 */  lh         $3, 0x0($17)
/* A4A94 001A4994 24006004 */  bltz       $3, .L001A4A28
/* A4A98 001A4998 00000000 */   nop
/* A4A9C 001A499C 18006128 */  slti       $at, $3, 0x18
/* A4AA0 001A49A0 21002010 */  beqz       $at, .L001A4A28
/* A4AA4 001A49A4 00000000 */   nop
/* A4AA8 001A49A8 C0100300 */  sll        $2, $3, 3
/* A4AAC 001A49AC 23184300 */  subu       $3, $2, $3
/* A4AB0 001A49B0 80100300 */  sll        $2, $3, 2
/* A4AB4 001A49B4 23104300 */  subu       $2, $2, $3
/* A4AB8 001A49B8 40190200 */  sll        $3, $2, 5
/* A4ABC 001A49BC 0100013C */  lui        $at, (0x15F30 >> 16)
/* A4AC0 001A49C0 21088102 */  addu       $at, $20, $at
/* A4AC4 001A49C4 305F228C */  lw         $2, (0x15F30 & 0xFFFF)($at)
/* A4AC8 001A49C8 21204300 */  addu       $4, $2, $3
/* A4ACC 001A49CC 106B060C */  jal        ChangeAltData__9CMapPartsFv
/* A4AD0 001A49D0 00000000 */   nop
/* A4AD4 001A49D4 0E004010 */  beqz       $2, .L001A4A10
/* A4AD8 001A49D8 00000000 */   nop
/* A4ADC 001A49DC 040020C6 */  lwc1       $f0, 0x4($17)
/* A4AE0 001A49E0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* A4AE4 001A49E4 00088244 */  mtc1       $2, $f1
/* A4AE8 001A49E8 00000000 */  nop
/* A4AEC 001A49EC 000B0046 */  add.s      $f12, $f1, $f0
/* A4AF0 001A49F0 0C0020C6 */  lwc1       $f0, 0xC($17)
/* A4AF4 001A49F4 800B0046 */  add.s      $f14, $f1, $f0
/* A4AF8 001A49F8 00002586 */  lh         $5, 0x0($17)
/* A4AFC 001A49FC 02002686 */  lh         $6, 0x2($17)
/* A4B00 001A4A00 28268072 */  paddub     $4, $20, $0
/* A4B04 001A4A04 08002DC6 */  lwc1       $f13, 0x8($17)
/* A4B08 001A4A08 1C81060C */  jal        SetMapParts__11CEditGroundFifffi
/* A4B0C 001A4A0C 00000000 */   nop
.L001A4A10:
/* A4B10 001A4A10 01007326 */  addiu      $19, $19, 0x1
/* A4B14 001A4A14 10003126 */  addiu      $17, $17, 0x10
.L001A4A18:
/* A4B18 001A4A18 00000386 */  lh         $3, 0x0($16)
/* A4B1C 001A4A1C 2A186302 */  slt        $3, $19, $3
/* A4B20 001A4A20 DBFF6014 */  bnez       $3, .L001A4990
/* A4B24 001A4A24 00000000 */   nop
.L001A4A28:
/* A4B28 001A4A28 288E4072 */  paddub     $17, $18, $0
/* A4B2C 001A4A2C 289E0070 */  paddub     $19, $0, $0
/* A4B30 001A4A30 47000010 */  b          .L001A4B50
/* A4B34 001A4A34 00000000 */   nop
.L001A4A38:
/* A4B38 001A4A38 00002586 */  lh         $5, 0x0($17)
/* A4B3C 001A4A3C 4800A004 */  bltz       $5, .L001A4B60
/* A4B40 001A4A40 00000000 */   nop
/* A4B44 001A4A44 1800A128 */  slti       $at, $5, 0x18
/* A4B48 001A4A48 45002010 */  beqz       $at, .L001A4B60
/* A4B4C 001A4A4C 00000000 */   nop
/* A4B50 001A4A50 0100013C */  lui        $at, (0x15F30 >> 16)
/* A4B54 001A4A54 21088102 */  addu       $at, $20, $at
/* A4B58 001A4A58 305F238C */  lw         $3, (0x15F30 & 0xFFFF)($at)
/* A4B5C 001A4A5C 18016324 */  addiu      $3, $3, 0x118
/* A4B60 001A4A60 C0200500 */  sll        $4, $5, 3
/* A4B64 001A4A64 23308500 */  subu       $6, $4, $5
/* A4B68 001A4A68 80200600 */  sll        $4, $6, 2
/* A4B6C 001A4A6C 23208600 */  subu       $4, $4, $6
/* A4B70 001A4A70 40210400 */  sll        $4, $4, 5
/* A4B74 001A4A74 21206400 */  addu       $4, $3, $4
/* A4B78 001A4A78 0000868C */  lw         $6, 0x0($4)
/* A4B7C 001A4A7C 03000424 */  addiu      $4, $0, 0x3
/* A4B80 001A4A80 0400C410 */  beq        $6, $4, .L001A4A94
/* A4B84 001A4A84 00000000 */   nop
/* A4B88 001A4A88 05000424 */  addiu      $4, $0, 0x5
/* A4B8C 001A4A8C 2200C414 */  bne        $6, $4, .L001A4B18
/* A4B90 001A4A90 00000000 */   nop
.L001A4A94:
/* A4B94 001A4A94 282E0070 */  paddub     $5, $0, $0
/* A4B98 001A4A98 1A000010 */  b          .L001A4B04
/* A4B9C 001A4A9C 00000000 */   nop
.L001A4AA0:
/* A4BA0 001A4AA0 C0200500 */  sll        $4, $5, 3
/* A4BA4 001A4AA4 23308500 */  subu       $6, $4, $5
/* A4BA8 001A4AA8 80200600 */  sll        $4, $6, 2
/* A4BAC 001A4AAC 23208600 */  subu       $4, $4, $6
/* A4BB0 001A4AB0 40210400 */  sll        $4, $4, 5
/* A4BB4 001A4AB4 21206400 */  addu       $4, $3, $4
/* A4BB8 001A4AB8 0000868C */  lw         $6, 0x0($4)
/* A4BBC 001A4ABC 02000424 */  addiu      $4, $0, 0x2
/* A4BC0 001A4AC0 0F00C414 */  bne        $6, $4, .L001A4B00
/* A4BC4 001A4AC4 00000000 */   nop
/* A4BC8 001A4AC8 040020C6 */  lwc1       $f0, 0x4($17)
/* A4BCC 001A4ACC 803F023C */  lui        $2, (0x3F800000 >> 16)
/* A4BD0 001A4AD0 00088244 */  mtc1       $2, $f1
/* A4BD4 001A4AD4 00000000 */  nop
/* A4BD8 001A4AD8 000B0046 */  add.s      $f12, $f1, $f0
/* A4BDC 001A4ADC 0C0020C6 */  lwc1       $f0, 0xC($17)
/* A4BE0 001A4AE0 800B0046 */  add.s      $f14, $f1, $f0
/* A4BE4 001A4AE4 02002686 */  lh         $6, 0x2($17)
/* A4BE8 001A4AE8 28268072 */  paddub     $4, $20, $0
/* A4BEC 001A4AEC 08002DC6 */  lwc1       $f13, 0x8($17)
/* A4BF0 001A4AF0 1C81060C */  jal        SetMapParts__11CEditGroundFifffi
/* A4BF4 001A4AF4 00000000 */   nop
/* A4BF8 001A4AF8 13000010 */  b          .L001A4B48
/* A4BFC 001A4AFC 00000000 */   nop
.L001A4B00:
/* A4C00 001A4B00 0100A524 */  addiu      $5, $5, 0x1
.L001A4B04:
/* A4C04 001A4B04 1800A428 */  slti       $4, $5, 0x18
/* A4C08 001A4B08 E5FF8014 */  bnez       $4, .L001A4AA0
/* A4C0C 001A4B0C 00000000 */   nop
/* A4C10 001A4B10 0D000010 */  b          .L001A4B48
/* A4C14 001A4B14 00000000 */   nop
.L001A4B18:
/* A4C18 001A4B18 040020C6 */  lwc1       $f0, 0x4($17)
/* A4C1C 001A4B1C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* A4C20 001A4B20 00088244 */  mtc1       $2, $f1
/* A4C24 001A4B24 00000000 */  nop
/* A4C28 001A4B28 000B0046 */  add.s      $f12, $f1, $f0
/* A4C2C 001A4B2C 0C0020C6 */  lwc1       $f0, 0xC($17)
/* A4C30 001A4B30 800B0046 */  add.s      $f14, $f1, $f0
/* A4C34 001A4B34 02002686 */  lh         $6, 0x2($17)
/* A4C38 001A4B38 28268072 */  paddub     $4, $20, $0
/* A4C3C 001A4B3C 08002DC6 */  lwc1       $f13, 0x8($17)
/* A4C40 001A4B40 1C81060C */  jal        SetMapParts__11CEditGroundFifffi
/* A4C44 001A4B44 00000000 */   nop
.L001A4B48:
/* A4C48 001A4B48 01007326 */  addiu      $19, $19, 0x1
/* A4C4C 001A4B4C 10003126 */  addiu      $17, $17, 0x10
.L001A4B50:
/* A4C50 001A4B50 00000386 */  lh         $3, 0x0($16)
/* A4C54 001A4B54 2A186302 */  slt        $3, $19, $3
/* A4C58 001A4B58 B7FF6014 */  bnez       $3, .L001A4A38
/* A4C5C 001A4B5C 00000000 */   nop
.L001A4B60:
/* A4C60 001A4B60 288E4072 */  paddub     $17, $18, $0
/* A4C64 001A4B64 289E0070 */  paddub     $19, $0, $0
/* A4C68 001A4B68 27000010 */  b          .L001A4C08
/* A4C6C 001A4B6C 00000000 */   nop
.L001A4B70:
/* A4C70 001A4B70 00002586 */  lh         $5, 0x0($17)
/* A4C74 001A4B74 2800A004 */  bltz       $5, .L001A4C18
/* A4C78 001A4B78 00000000 */   nop
/* A4C7C 001A4B7C 1800A128 */  slti       $at, $5, 0x18
/* A4C80 001A4B80 25002010 */  beqz       $at, .L001A4C18
/* A4C84 001A4B84 00000000 */   nop
/* A4C88 001A4B88 0100013C */  lui        $at, (0x15F30 >> 16)
/* A4C8C 001A4B8C 21088102 */  addu       $at, $20, $at
/* A4C90 001A4B90 305F268C */  lw         $6, (0x15F30 & 0xFFFF)($at)
/* A4C94 001A4B94 C0180500 */  sll        $3, $5, 3
/* A4C98 001A4B98 23206500 */  subu       $4, $3, $5
/* A4C9C 001A4B9C 80180400 */  sll        $3, $4, 2
/* A4CA0 001A4BA0 23186400 */  subu       $3, $3, $4
/* A4CA4 001A4BA4 40190300 */  sll        $3, $3, 5
/* A4CA8 001A4BA8 21186600 */  addu       $3, $3, $6
/* A4CAC 001A4BAC 1801648C */  lw         $4, 0x118($3)
/* A4CB0 001A4BB0 05000324 */  addiu      $3, $0, 0x5
/* A4CB4 001A4BB4 06008310 */  beq        $4, $3, .L001A4BD0
/* A4CB8 001A4BB8 00000000 */   nop
/* A4CBC 001A4BBC 03000324 */  addiu      $3, $0, 0x3
/* A4CC0 001A4BC0 03008310 */  beq        $4, $3, .L001A4BD0
/* A4CC4 001A4BC4 00000000 */   nop
/* A4CC8 001A4BC8 0D000010 */  b          .L001A4C00
/* A4CCC 001A4BCC 00000000 */   nop
.L001A4BD0:
/* A4CD0 001A4BD0 040020C6 */  lwc1       $f0, 0x4($17)
/* A4CD4 001A4BD4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* A4CD8 001A4BD8 00088244 */  mtc1       $2, $f1
/* A4CDC 001A4BDC 00000000 */  nop
/* A4CE0 001A4BE0 000B0046 */  add.s      $f12, $f1, $f0
/* A4CE4 001A4BE4 0C0020C6 */  lwc1       $f0, 0xC($17)
/* A4CE8 001A4BE8 800B0046 */  add.s      $f14, $f1, $f0
/* A4CEC 001A4BEC 02002686 */  lh         $6, 0x2($17)
/* A4CF0 001A4BF0 28268072 */  paddub     $4, $20, $0
/* A4CF4 001A4BF4 08002DC6 */  lwc1       $f13, 0x8($17)
/* A4CF8 001A4BF8 1C81060C */  jal        SetMapParts__11CEditGroundFifffi
/* A4CFC 001A4BFC 00000000 */   nop
.L001A4C00:
/* A4D00 001A4C00 01007326 */  addiu      $19, $19, 0x1
/* A4D04 001A4C04 10003126 */  addiu      $17, $17, 0x10
.L001A4C08:
/* A4D08 001A4C08 00000386 */  lh         $3, 0x0($16)
/* A4D0C 001A4C0C 2A186302 */  slt        $3, $19, $3
/* A4D10 001A4C10 D7FF6014 */  bnez       $3, .L001A4B70
/* A4D14 001A4C14 00000000 */   nop
.L001A4C18:
/* A4D18 001A4C18 289E0070 */  paddub     $19, $0, $0
/* A4D1C 001A4C1C 0D000010 */  b          .L001A4C54
/* A4D20 001A4C20 00000000 */   nop
.L001A4C24:
/* A4D24 001A4C24 80181300 */  sll        $3, $19, 2
/* A4D28 001A4C28 21187400 */  addu       $3, $3, $20
/* A4D2C 001A4C2C 04007024 */  addiu      $16, $3, 0x4
/* A4D30 001A4C30 0400648C */  lw         $4, 0x4($3)
/* A4D34 001A4C34 06008010 */  beqz       $4, .L001A4C50
/* A4D38 001A4C38 00000000 */   nop
/* A4D3C 001A4C3C 3CBB050C */  jal        RemakeGrid__9CEditAreaFv
/* A4D40 001A4C40 00000000 */   nop
/* A4D44 001A4C44 0000048E */  lw         $4, 0x0($16)
/* A4D48 001A4C48 3CBB050C */  jal        RemakeGrid__9CEditAreaFv
/* A4D4C 001A4C4C 00000000 */   nop
.L001A4C50:
/* A4D50 001A4C50 01007326 */  addiu      $19, $19, 0x1
.L001A4C54:
/* A4D54 001A4C54 0400632A */  slti       $3, $19, 0x4
/* A4D58 001A4C58 F2FF6014 */  bnez       $3, .L001A4C24
/* A4D5C 001A4C5C 00000000 */   nop
.L001A4C60:
/* A4D60 001A4C60 5000BF7B */  lq         $31, 0x50($sp)
/* A4D64 001A4C64 4000B47B */  lq         $20, 0x40($sp)
/* A4D68 001A4C68 3000B37B */  lq         $19, 0x30($sp)
/* A4D6C 001A4C6C 2000B27B */  lq         $18, 0x20($sp)
/* A4D70 001A4C70 1000B17B */  lq         $17, 0x10($sp)
/* A4D74 001A4C74 0000B07B */  lq         $16, 0x0($sp)
/* A4D78 001A4C78 0010BD27 */  addiu      $sp, $sp, 0x1000
/* A4D7C 001A4C7C 0800E003 */  jr         $31
/* A4D80 001A4C80 00000000 */   nop
/* A4D84 001A4C84 00000000 */  nop
/* A4D88 001A4C88 00000000 */  nop
/* A4D8C 001A4C8C 00000000 */  nop
