.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel NeedMesWinWH__6ClsMesFiPi
/* 4FE60 0014FD60 50FEBD27 */  addiu      $sp, $sp, -0x1B0
/* 4FE64 0014FD64 9000BF7F */  sq         $31, 0x90($sp)
/* 4FE68 0014FD68 8000BE7F */  sq         $fp, 0x80($sp)
/* 4FE6C 0014FD6C 7000B77F */  sq         $23, 0x70($sp)
/* 4FE70 0014FD70 6000B67F */  sq         $22, 0x60($sp)
/* 4FE74 0014FD74 5000B57F */  sq         $21, 0x50($sp)
/* 4FE78 0014FD78 4000B47F */  sq         $20, 0x40($sp)
/* 4FE7C 0014FD7C 3000B37F */  sq         $19, 0x30($sp)
/* 4FE80 0014FD80 2000B27F */  sq         $18, 0x20($sp)
/* 4FE84 0014FD84 1000B17F */  sq         $17, 0x10($sp)
/* 4FE88 0014FD88 0000B07F */  sq         $16, 0x0($sp)
/* 4FE8C 0014FD8C 28B68070 */  paddub     $22, $4, $0
/* 4FE90 0014FD90 28AEC070 */  paddub     $21, $6, $0
/* 4FE94 0014FD94 A017838C */  lw         $3, 0x17A0($4)
/* 4FE98 0014FD98 8E016010 */  beqz       $3, .L001503D4
/* 4FE9C 0014FD9C 00000000 */   nop
/* 4FEA0 0014FDA0 2C3D050C */  jal        GetTextLineDataTop__6ClsMesFi
/* 4FEA4 0014FDA4 00000000 */   nop
/* 4FEA8 0014FDA8 28864070 */  paddub     $16, $2, $0
/* 4FEAC 0014FDAC 89010012 */  beqz       $16, .L001503D4
/* 4FEB0 0014FDB0 00000000 */   nop
/* 4FEB4 0014FDB4 0400BE26 */  addiu      $fp, $21, 0x4
/* 4FEB8 0014FDB8 0800B126 */  addiu      $17, $21, 0x8
/* 4FEBC 0014FDBC 0C00B726 */  addiu      $23, $21, 0xC
/* 4FEC0 0014FDC0 0000A0AE */  sw         $0, 0x0($21)
/* 4FEC4 0014FDC4 0400A0AE */  sw         $0, 0x4($21)
/* 4FEC8 0014FDC8 0800A0AE */  sw         $0, 0x8($21)
/* 4FECC 0014FDCC 0C00A0AE */  sw         $0, 0xC($21)
/* 4FED0 0014FDD0 A801A0AF */  sw         $0, 0x1A8($sp)
/* 4FED4 0014FDD4 28960070 */  paddub     $18, $0, $0
/* 4FED8 0014FDD8 AC01A0AF */  sw         $0, 0x1AC($sp)
/* 4FEDC 0014FDDC 289E0070 */  paddub     $19, $0, $0
/* 4FEE0 0014FDE0 28A60070 */  paddub     $20, $0, $0
.L0014FDE4:
/* 4FEE4 0014FDE4 01009426 */  addiu      $20, $20, 0x1
/* 4FEE8 0014FDE8 00000586 */  lh         $5, 0x0($16)
/* 4FEEC 0014FDEC 02001026 */  addiu      $16, $16, 0x2
/* 4FEF0 0014FDF0 03FF0324 */  addiu      $3, $0, -0xFD
/* 4FEF4 0014FDF4 0500A310 */  beq        $5, $3, .L0014FE0C
/* 4FEF8 0014FDF8 00000000 */   nop
/* 4FEFC 0014FDFC 0001A324 */  addiu      $3, $5, 0x100
/* 4FF00 0014FE00 0200612C */  sltiu      $at, $3, 0x2
/* 4FF04 0014FE04 04002010 */  beqz       $at, .L0014FE18
/* 4FF08 0014FE08 00000000 */   nop
.L0014FE0C:
/* 4FF0C 0014FE0C FFFF0324 */  addiu      $3, $0, -0x1
/* 4FF10 0014FE10 3817C3AE */  sw         $3, 0x1738($22)
/* 4FF14 0014FE14 3C17C3AE */  sw         $3, 0x173C($22)
.L0014FE18:
/* 4FF18 0014FE18 03FF0324 */  addiu      $3, $0, -0xFD
/* 4FF1C 0014FE1C 4000A310 */  beq        $5, $3, .L0014FF20
/* 4FF20 0014FE20 00000000 */   nop
/* 4FF24 0014FE24 00FF0324 */  addiu      $3, $0, -0x100
/* 4FF28 0014FE28 2C00A310 */  beq        $5, $3, .L0014FEDC
/* 4FF2C 0014FE2C 00000000 */   nop
/* 4FF30 0014FE30 02FF0324 */  addiu      $3, $0, -0xFE
/* 4FF34 0014FE34 0800A310 */  beq        $5, $3, .L0014FE58
/* 4FF38 0014FE38 00000000 */   nop
/* 4FF3C 0014FE3C 01FF0324 */  addiu      $3, $0, -0xFF
/* 4FF40 0014FE40 0300A310 */  beq        $5, $3, .L0014FE50
/* 4FF44 0014FE44 00000000 */   nop
/* 4FF48 0014FE48 3B000010 */  b          .L0014FF38
/* 4FF4C 0014FE4C 00000000 */   nop
.L0014FE50:
/* 4FF50 0014FE50 60010010 */  b          .L001503D4
/* 4FF54 0014FE54 00000000 */   nop
.L0014FE58:
/* 4FF58 0014FE58 A801A38F */  lw         $3, 0x1A8($sp)
/* 4FF5C 0014FE5C 01006324 */  addiu      $3, $3, 0x1
/* 4FF60 0014FE60 A801A3AF */  sw         $3, 0x1A8($sp)
/* 4FF64 0014FE64 0000A38E */  lw         $3, 0x0($21)
/* 4FF68 0014FE68 A801A48F */  lw         $4, 0x1A8($sp)
/* 4FF6C 0014FE6C 2A086400 */  slt        $at, $3, $4
/* 4FF70 0014FE70 02002010 */  beqz       $at, .L0014FE7C
/* 4FF74 0014FE74 00000000 */   nop
/* 4FF78 0014FE78 0000A4AE */  sw         $4, 0x0($21)
.L0014FE7C:
/* 4FF7C 0014FE7C 3C17C38E */  lw         $3, 0x173C($22)
/* 4FF80 0014FE80 04006104 */  bgez       $3, .L0014FE94
/* 4FF84 0014FE84 00000000 */   nop
/* 4FF88 0014FE88 3817C38E */  lw         $3, 0x1738($22)
/* 4FF8C 0014FE8C 07006004 */  bltz       $3, .L0014FEAC
/* 4FF90 0014FE90 00000000 */   nop
.L0014FE94:
/* 4FF94 0014FE94 AC01A48F */  lw         $4, 0x1AC($sp)
/* 4FF98 0014FE98 3817C38E */  lw         $3, 0x1738($22)
/* 4FF9C 0014FE9C 21188300 */  addu       $3, $4, $3
/* 4FFA0 0014FEA0 AC01A3AF */  sw         $3, 0x1AC($sp)
/* 4FFA4 0014FEA4 05000010 */  b          .L0014FEBC
/* 4FFA8 0014FEA8 00000000 */   nop
.L0014FEAC:
/* 4FFAC 0014FEAC AC01A48F */  lw         $4, 0x1AC($sp)
/* 4FFB0 0014FEB0 0800C38E */  lw         $3, 0x8($22)
/* 4FFB4 0014FEB4 21188300 */  addu       $3, $4, $3
/* 4FFB8 0014FEB8 AC01A3AF */  sw         $3, 0x1AC($sp)
.L0014FEBC:
/* 4FFBC 0014FEBC 0000238E */  lw         $3, 0x0($17)
/* 4FFC0 0014FEC0 AC01A48F */  lw         $4, 0x1AC($sp)
/* 4FFC4 0014FEC4 2A086400 */  slt        $at, $3, $4
/* 4FFC8 0014FEC8 C6FF2010 */  beqz       $at, .L0014FDE4
/* 4FFCC 0014FECC 00000000 */   nop
/* 4FFD0 0014FED0 000024AE */  sw         $4, 0x0($17)
/* 4FFD4 0014FED4 C3FF0010 */  b          .L0014FDE4
/* 4FFD8 0014FED8 00000000 */   nop
.L0014FEDC:
/* 4FFDC 0014FEDC A801A0AF */  sw         $0, 0x1A8($sp)
/* 4FFE0 0014FEE0 01005226 */  addiu      $18, $18, 0x1
/* 4FFE4 0014FEE4 0000C38F */  lw         $3, 0x0($fp)
/* 4FFE8 0014FEE8 2A087200 */  slt        $at, $3, $18
/* 4FFEC 0014FEEC 02002010 */  beqz       $at, .L0014FEF8
/* 4FFF0 0014FEF0 00000000 */   nop
/* 4FFF4 0014FEF4 0000D2AF */  sw         $18, 0x0($fp)
.L0014FEF8:
/* 4FFF8 0014FEF8 AC01A0AF */  sw         $0, 0x1AC($sp)
/* 4FFFC 0014FEFC 0C00C38E */  lw         $3, 0xC($22)
/* 50000 0014FF00 21986302 */  addu       $19, $19, $3
/* 50004 0014FF04 0000E38E */  lw         $3, 0x0($23)
/* 50008 0014FF08 2A087300 */  slt        $at, $3, $19
/* 5000C 0014FF0C B5FF2010 */  beqz       $at, .L0014FDE4
/* 50010 0014FF10 00000000 */   nop
/* 50014 0014FF14 0000F3AE */  sw         $19, 0x0($23)
/* 50018 0014FF18 B2FF0010 */  b          .L0014FDE4
/* 5001C 0014FF1C 00000000 */   nop
.L0014FF20:
/* 50020 0014FF20 A801A0AF */  sw         $0, 0x1A8($sp)
/* 50024 0014FF24 28960070 */  paddub     $18, $0, $0
/* 50028 0014FF28 AC01A0AF */  sw         $0, 0x1AC($sp)
/* 5002C 0014FF2C 289E0070 */  paddub     $19, $0, $0
/* 50030 0014FF30 ACFF0010 */  b          .L0014FDE4
/* 50034 0014FF34 00000000 */   nop
.L0014FF38:
/* 50038 0014FF38 00FEA328 */  slti       $3, $5, -0x200
/* 5003C 0014FF3C 04006014 */  bnez       $3, .L0014FF50
/* 50040 0014FF40 00000000 */   nop
/* 50044 0014FF44 00FFA128 */  slti       $at, $5, -0x100
/* 50048 0014FF48 A6FF2014 */  bnez       $at, .L0014FDE4
/* 5004C 0014FF4C 00000000 */   nop
.L0014FF50:
/* 50050 0014FF50 00FCA328 */  slti       $3, $5, -0x400
/* 50054 0014FF54 04006014 */  bnez       $3, .L0014FF68
/* 50058 0014FF58 00000000 */   nop
/* 5005C 0014FF5C 00FDA128 */  slti       $at, $5, -0x300
/* 50060 0014FF60 A0FF2014 */  bnez       $at, .L0014FDE4
/* 50064 0014FF64 00000000 */   nop
.L0014FF68:
/* 50068 0014FF68 00F6A328 */  slti       $3, $5, -0xA00
/* 5006C 0014FF6C 04006014 */  bnez       $3, .L0014FF80
/* 50070 0014FF70 00000000 */   nop
/* 50074 0014FF74 00F7A128 */  slti       $at, $5, -0x900
/* 50078 0014FF78 9AFF2014 */  bnez       $at, .L0014FDE4
/* 5007C 0014FF7C 00000000 */   nop
.L0014FF80:
/* 50080 0014FF80 00F7A328 */  slti       $3, $5, -0x900
/* 50084 0014FF84 10006014 */  bnez       $3, .L0014FFC8
/* 50088 0014FF88 00000000 */   nop
/* 5008C 0014FF8C 00F8A128 */  slti       $at, $5, -0x800
/* 50090 0014FF90 0D002010 */  beqz       $at, .L0014FFC8
/* 50094 0014FF94 00000000 */   nop
/* 50098 0014FF98 0009A224 */  addiu      $2, $5, 0x900
/* 5009C 0014FF9C 80100200 */  sll        $2, $2, 2
/* 500A0 0014FFA0 3C17C2AE */  sw         $2, 0x173C($22)
/* 500A4 0014FFA4 2826C072 */  paddub     $4, $22, $0
/* 500A8 0014FFA8 3C17C58E */  lw         $5, 0x173C($22)
/* 500AC 0014FFAC 0800C68E */  lw         $6, 0x8($22)
/* 500B0 0014FFB0 FEFF0726 */  addiu      $7, $16, -0x2
/* 500B4 0014FFB4 E03D050C */  jal        CalcSpaceW__6ClsMesFiiPs
/* 500B8 0014FFB8 00000000 */   nop
/* 500BC 0014FFBC 3817C2AE */  sw         $2, 0x1738($22)
/* 500C0 0014FFC0 88FF0010 */  b          .L0014FDE4
/* 500C4 0014FFC4 00000000 */   nop
.L0014FFC8:
/* 500C8 0014FFC8 00F8A328 */  slti       $3, $5, -0x800
/* 500CC 0014FFCC 08006014 */  bnez       $3, .L0014FFF0
/* 500D0 0014FFD0 00000000 */   nop
/* 500D4 0014FFD4 00F9A128 */  slti       $at, $5, -0x700
/* 500D8 0014FFD8 05002010 */  beqz       $at, .L0014FFF0
/* 500DC 0014FFDC 00000000 */   nop
/* 500E0 0014FFE0 0008A324 */  addiu      $3, $5, 0x800
/* 500E4 0014FFE4 3817C3AE */  sw         $3, 0x1738($22)
/* 500E8 0014FFE8 7EFF0010 */  b          .L0014FDE4
/* 500EC 0014FFEC 00000000 */   nop
.L0014FFF0:
/* 500F0 0014FFF0 00F9A328 */  slti       $3, $5, -0x700
/* 500F4 0014FFF4 19006014 */  bnez       $3, .L0015005C
/* 500F8 0014FFF8 00000000 */   nop
/* 500FC 0014FFFC 00FAA128 */  slti       $at, $5, -0x600
/* 50100 00150000 16002010 */  beqz       $at, .L0015005C
/* 50104 00150004 00000000 */   nop
/* 50108 00150008 A801A38F */  lw         $3, 0x1A8($sp)
/* 5010C 0015000C 01006324 */  addiu      $3, $3, 0x1
/* 50110 00150010 A801A3AF */  sw         $3, 0x1A8($sp)
/* 50114 00150014 0000A38E */  lw         $3, 0x0($21)
/* 50118 00150018 A801A48F */  lw         $4, 0x1A8($sp)
/* 5011C 0015001C 2A086400 */  slt        $at, $3, $4
/* 50120 00150020 02002010 */  beqz       $at, .L0015002C
/* 50124 00150024 00000000 */   nop
/* 50128 00150028 0000A4AE */  sw         $4, 0x0($21)
.L0015002C:
/* 5012C 0015002C 0007A424 */  addiu      $4, $5, 0x700
/* 50130 00150030 AC01A38F */  lw         $3, 0x1AC($sp)
/* 50134 00150034 21186400 */  addu       $3, $3, $4
/* 50138 00150038 AC01A3AF */  sw         $3, 0x1AC($sp)
/* 5013C 0015003C 0000238E */  lw         $3, 0x0($17)
/* 50140 00150040 AC01A48F */  lw         $4, 0x1AC($sp)
/* 50144 00150044 2A086400 */  slt        $at, $3, $4
/* 50148 00150048 66FF2010 */  beqz       $at, .L0014FDE4
/* 5014C 0015004C 00000000 */   nop
/* 50150 00150050 000024AE */  sw         $4, 0x0($17)
/* 50154 00150054 63FF0010 */  b          .L0014FDE4
/* 50158 00150058 00000000 */   nop
.L0015005C:
/* 5015C 0015005C FFFB0324 */  addiu      $3, $0, -0x401
/* 50160 00150060 3A00A314 */  bne        $5, $3, .L0015014C
/* 50164 00150064 00000000 */   nop
/* 50168 00150068 3017C38E */  lw         $3, 0x1730($22)
/* 5016C 0015006C 04006014 */  bnez       $3, .L00150080
/* 50170 00150070 00000000 */   nop
/* 50174 00150074 2817C38E */  lw         $3, 0x1728($22)
/* 50178 00150078 5AFF6010 */  beqz       $3, .L0014FDE4
/* 5017C 0015007C 00000000 */   nop
.L00150080:
/* 50180 00150080 2C17C28E */  lw         $2, 0x172C($22)
/* 50184 00150084 0B004010 */  beqz       $2, .L001500B4
/* 50188 00150088 00000000 */   nop
/* 5018C 0015008C 2817C68E */  lw         $6, 0x1728($22)
/* 50190 00150090 0800C018 */  blez       $6, .L001500B4
/* 50194 00150094 00000000 */   nop
/* 50198 00150098 A000A427 */  addiu      $4, $sp, 0xA0
/* 5019C 0015009C 2A00023C */  lui        $2, %hi(_821)
/* 501A0 001500A0 689A4524 */  addiu      $5, $2, %lo(_821)
/* 501A4 001500A4 1614040C */  jal        sprintf
/* 501A8 001500A8 00000000 */   nop
/* 501AC 001500AC 07000010 */  b          .L001500CC
/* 501B0 001500B0 00000000 */   nop
.L001500B4:
/* 501B4 001500B4 A000A427 */  addiu      $4, $sp, 0xA0
/* 501B8 001500B8 2A00023C */  lui        $2, %hi(_822)
/* 501BC 001500BC 709A4524 */  addiu      $5, $2, %lo(_822)
/* 501C0 001500C0 2817C68E */  lw         $6, 0x1728($22)
/* 501C4 001500C4 1614040C */  jal        sprintf
/* 501C8 001500C8 00000000 */   nop
.L001500CC:
/* 501CC 001500CC 3417C28E */  lw         $2, 0x1734($22)
/* 501D0 001500D0 11004010 */  beqz       $2, .L00150118
/* 501D4 001500D4 00000000 */   nop
/* 501D8 001500D8 A000A427 */  addiu      $4, $sp, 0xA0
/* 501DC 001500DC A015040C */  jal        strlen
/* 501E0 001500E0 00000000 */   nop
/* 501E4 001500E4 FFFF4924 */  addiu      $9, $2, -0x1
/* 501E8 001500E8 0800C28E */  lw         $2, 0x8($22)
/* 501EC 001500EC 83180200 */  sra        $3, $2, 2
/* 501F0 001500F0 40100300 */  sll        $2, $3, 1
/* 501F4 001500F4 21404300 */  addu       $8, $2, $3
/* 501F8 001500F8 A801A427 */  addiu      $4, $sp, 0x1A8
/* 501FC 001500FC 282EA072 */  paddub     $5, $21, $0
/* 50200 00150100 AC01A627 */  addiu      $6, $sp, 0x1AC
/* 50204 00150104 283E2072 */  paddub     $7, $17, $0
/* 50208 00150108 403F050C */  jal        NeedMesWinWH_sub__FPiPiPiPiii
/* 5020C 0015010C 00000000 */   nop
/* 50210 00150110 34FF0010 */  b          .L0014FDE4
/* 50214 00150114 00000000 */   nop
.L00150118:
/* 50218 00150118 A000A427 */  addiu      $4, $sp, 0xA0
/* 5021C 0015011C A015040C */  jal        strlen
/* 50220 00150120 00000000 */   nop
/* 50224 00150124 FFFF4924 */  addiu      $9, $2, -0x1
/* 50228 00150128 A801A427 */  addiu      $4, $sp, 0x1A8
/* 5022C 0015012C 282EA072 */  paddub     $5, $21, $0
/* 50230 00150130 AC01A627 */  addiu      $6, $sp, 0x1AC
/* 50234 00150134 283E2072 */  paddub     $7, $17, $0
/* 50238 00150138 0800C88E */  lw         $8, 0x8($22)
/* 5023C 0015013C 403F050C */  jal        NeedMesWinWH_sub__FPiPiPiPiii
/* 50240 00150140 00000000 */   nop
/* 50244 00150144 27FF0010 */  b          .L0014FDE4
/* 50248 00150148 00000000 */   nop
.L0015014C:
/* 5024C 0015014C F3FBA328 */  slti       $3, $5, -0x40D
/* 50250 00150150 49006014 */  bnez       $3, .L00150278
/* 50254 00150154 00000000 */   nop
/* 50258 00150158 FBFBA128 */  slti       $at, $5, -0x405
/* 5025C 0015015C 46002010 */  beqz       $at, .L00150278
/* 50260 00150160 00000000 */   nop
/* 50264 00150164 3017C38E */  lw         $3, 0x1730($22)
/* 50268 00150168 08006014 */  bnez       $3, .L0015018C
/* 5026C 0015016C 00000000 */   nop
/* 50270 00150170 FAFB0324 */  addiu      $3, $0, -0x406
/* 50274 00150174 23186500 */  subu       $3, $3, $5
/* 50278 00150178 80180300 */  sll        $3, $3, 2
/* 5027C 0015017C 21187600 */  addu       $3, $3, $22
/* 50280 00150180 0817638C */  lw         $3, 0x1708($3)
/* 50284 00150184 17FF6010 */  beqz       $3, .L0014FDE4
/* 50288 00150188 00000000 */   nop
.L0015018C:
/* 5028C 0015018C 2C17C28E */  lw         $2, 0x172C($22)
/* 50290 00150190 0F004010 */  beqz       $2, .L001501D0
/* 50294 00150194 00000000 */   nop
/* 50298 00150198 FAFB0224 */  addiu      $2, $0, -0x406
/* 5029C 0015019C 23104500 */  subu       $2, $2, $5
/* 502A0 001501A0 80100200 */  sll        $2, $2, 2
/* 502A4 001501A4 21105600 */  addu       $2, $2, $22
/* 502A8 001501A8 0817468C */  lw         $6, 0x1708($2)
/* 502AC 001501AC 0800C018 */  blez       $6, .L001501D0
/* 502B0 001501B0 00000000 */   nop
/* 502B4 001501B4 2001A427 */  addiu      $4, $sp, 0x120
/* 502B8 001501B8 2A00023C */  lui        $2, %hi(_821)
/* 502BC 001501BC 689A4524 */  addiu      $5, $2, %lo(_821)
/* 502C0 001501C0 1614040C */  jal        sprintf
/* 502C4 001501C4 00000000 */   nop
/* 502C8 001501C8 0B000010 */  b          .L001501F8
/* 502CC 001501CC 00000000 */   nop
.L001501D0:
/* 502D0 001501D0 FAFB0224 */  addiu      $2, $0, -0x406
/* 502D4 001501D4 23104500 */  subu       $2, $2, $5
/* 502D8 001501D8 80100200 */  sll        $2, $2, 2
/* 502DC 001501DC 21185600 */  addu       $3, $2, $22
/* 502E0 001501E0 2001A427 */  addiu      $4, $sp, 0x120
/* 502E4 001501E4 2A00023C */  lui        $2, %hi(_822)
/* 502E8 001501E8 709A4524 */  addiu      $5, $2, %lo(_822)
/* 502EC 001501EC 0817668C */  lw         $6, 0x1708($3)
/* 502F0 001501F0 1614040C */  jal        sprintf
/* 502F4 001501F4 00000000 */   nop
.L001501F8:
/* 502F8 001501F8 3417C28E */  lw         $2, 0x1734($22)
/* 502FC 001501FC 11004010 */  beqz       $2, .L00150244
/* 50300 00150200 00000000 */   nop
/* 50304 00150204 2001A427 */  addiu      $4, $sp, 0x120
/* 50308 00150208 A015040C */  jal        strlen
/* 5030C 0015020C 00000000 */   nop
/* 50310 00150210 FFFF4924 */  addiu      $9, $2, -0x1
/* 50314 00150214 0800C28E */  lw         $2, 0x8($22)
/* 50318 00150218 83180200 */  sra        $3, $2, 2
/* 5031C 0015021C 40100300 */  sll        $2, $3, 1
/* 50320 00150220 21404300 */  addu       $8, $2, $3
/* 50324 00150224 A801A427 */  addiu      $4, $sp, 0x1A8
/* 50328 00150228 282EA072 */  paddub     $5, $21, $0
/* 5032C 0015022C AC01A627 */  addiu      $6, $sp, 0x1AC
/* 50330 00150230 283E2072 */  paddub     $7, $17, $0
/* 50334 00150234 403F050C */  jal        NeedMesWinWH_sub__FPiPiPiPiii
/* 50338 00150238 00000000 */   nop
/* 5033C 0015023C E9FE0010 */  b          .L0014FDE4
/* 50340 00150240 00000000 */   nop
.L00150244:
/* 50344 00150244 2001A427 */  addiu      $4, $sp, 0x120
/* 50348 00150248 A015040C */  jal        strlen
/* 5034C 0015024C 00000000 */   nop
/* 50350 00150250 FFFF4924 */  addiu      $9, $2, -0x1
/* 50354 00150254 A801A427 */  addiu      $4, $sp, 0x1A8
/* 50358 00150258 282EA072 */  paddub     $5, $21, $0
/* 5035C 0015025C AC01A627 */  addiu      $6, $sp, 0x1AC
/* 50360 00150260 283E2072 */  paddub     $7, $17, $0
/* 50364 00150264 0800C88E */  lw         $8, 0x8($22)
/* 50368 00150268 403F050C */  jal        NeedMesWinWH_sub__FPiPiPiPiii
/* 5036C 0015026C 00000000 */   nop
/* 50370 00150270 DCFE0010 */  b          .L0014FDE4
/* 50374 00150274 00000000 */   nop
.L00150278:
/* 50378 00150278 0504A224 */  addiu      $2, $5, 0x405
/* 5037C 0015027C 0400412C */  sltiu      $at, $2, 0x4
/* 50380 00150280 05002014 */  bnez       $at, .L00150298
/* 50384 00150284 00000000 */   nop
/* 50388 00150288 1104A224 */  addiu      $2, $5, 0x411
/* 5038C 0015028C 0400412C */  sltiu      $at, $2, 0x4
/* 50390 00150290 0E002010 */  beqz       $at, .L001502CC
/* 50394 00150294 00000000 */   nop
.L00150298:
/* 50398 00150298 2826C072 */  paddub     $4, $22, $0
/* 5039C 0015029C FC3B050C */  jal        GetMesLen_system__6ClsMesFi
/* 503A0 001502A0 00000000 */   nop
/* 503A4 001502A4 A801A427 */  addiu      $4, $sp, 0x1A8
/* 503A8 001502A8 282EA072 */  paddub     $5, $21, $0
/* 503AC 001502AC AC01A627 */  addiu      $6, $sp, 0x1AC
/* 503B0 001502B0 283E2072 */  paddub     $7, $17, $0
/* 503B4 001502B4 0800C88E */  lw         $8, 0x8($22)
/* 503B8 001502B8 284E4070 */  paddub     $9, $2, $0
/* 503BC 001502BC 403F050C */  jal        NeedMesWinWH_sub__FPiPiPiPiii
/* 503C0 001502C0 00000000 */   nop
/* 503C4 001502C4 C7FE0010 */  b          .L0014FDE4
/* 503C8 001502C8 00000000 */   nop
.L001502CC:
/* 503CC 001502CC FAFAA228 */  slti       $2, $5, -0x506
/* 503D0 001502D0 12004014 */  bnez       $2, .L0015031C
/* 503D4 001502D4 00000000 */   nop
/* 503D8 001502D8 00FBA128 */  slti       $at, $5, -0x500
/* 503DC 001502DC 0F002010 */  beqz       $at, .L0015031C
/* 503E0 001502E0 00000000 */   nop
/* 503E4 001502E4 0605A524 */  addiu      $5, $5, 0x506
/* 503E8 001502E8 2826C072 */  paddub     $4, $22, $0
/* 503EC 001502EC F432050C */  jal        GetNameLen__6ClsMesFi
/* 503F0 001502F0 00000000 */   nop
/* 503F4 001502F4 A801A427 */  addiu      $4, $sp, 0x1A8
/* 503F8 001502F8 282EA072 */  paddub     $5, $21, $0
/* 503FC 001502FC AC01A627 */  addiu      $6, $sp, 0x1AC
/* 50400 00150300 283E2072 */  paddub     $7, $17, $0
/* 50404 00150304 0800C88E */  lw         $8, 0x8($22)
/* 50408 00150308 284E4070 */  paddub     $9, $2, $0
/* 5040C 0015030C 403F050C */  jal        NeedMesWinWH_sub__FPiPiPiPiii
/* 50410 00150310 00000000 */   nop
/* 50414 00150314 B3FE0010 */  b          .L0014FDE4
/* 50418 00150318 00000000 */   nop
.L0015031C:
/* 5041C 0015031C 00FDA228 */  slti       $2, $5, -0x300
/* 50420 00150320 22004014 */  bnez       $2, .L001503AC
/* 50424 00150324 00000000 */   nop
/* 50428 00150328 9DFDA128 */  slti       $at, $5, -0x263
/* 5042C 0015032C 1F002010 */  beqz       $at, .L001503AC
/* 50430 00150330 00000000 */   nop
/* 50434 00150334 40190500 */  sll        $3, $5, 5
/* 50438 00150338 2600023C */  lui        $2, %hi(EditPartsData + 0x491C)
/* 5043C 0015033C EC894224 */  addiu      $2, $2, %lo(EditPartsData + 0x491C)
/* 50440 00150340 21104300 */  addu       $2, $2, $3
/* 50444 00150344 A801A38F */  lw         $3, 0x1A8($sp)
/* 50448 00150348 0000428C */  lw         $2, 0x0($2)
/* 5044C 0015034C 21106200 */  addu       $2, $3, $2
/* 50450 00150350 A801A2AF */  sw         $2, 0x1A8($sp)
/* 50454 00150354 2826C072 */  paddub     $4, $22, $0
/* 50458 00150358 CC32050C */  jal        GetGaijiW__6ClsMesFi
/* 5045C 0015035C 00000000 */   nop
/* 50460 00150360 3C240200 */  dsll32     $4, $2, 16
/* 50464 00150364 3F240400 */  dsra32     $4, $4, 16
/* 50468 00150368 AC01A38F */  lw         $3, 0x1AC($sp)
/* 5046C 0015036C 21186400 */  addu       $3, $3, $4
/* 50470 00150370 AC01A3AF */  sw         $3, 0x1AC($sp)
/* 50474 00150374 0000A38E */  lw         $3, 0x0($21)
/* 50478 00150378 A801A48F */  lw         $4, 0x1A8($sp)
/* 5047C 0015037C 2A086400 */  slt        $at, $3, $4
/* 50480 00150380 02002010 */  beqz       $at, .L0015038C
/* 50484 00150384 00000000 */   nop
/* 50488 00150388 0000A4AE */  sw         $4, 0x0($21)
.L0015038C:
/* 5048C 0015038C 0000238E */  lw         $3, 0x0($17)
/* 50490 00150390 AC01A48F */  lw         $4, 0x1AC($sp)
/* 50494 00150394 2A086400 */  slt        $at, $3, $4
/* 50498 00150398 92FE2010 */  beqz       $at, .L0014FDE4
/* 5049C 0015039C 00000000 */   nop
/* 504A0 001503A0 000024AE */  sw         $4, 0x0($17)
/* 504A4 001503A4 8FFE0010 */  b          .L0014FDE4
/* 504A8 001503A8 00000000 */   nop
.L001503AC:
/* 504AC 001503AC A801A427 */  addiu      $4, $sp, 0x1A8
/* 504B0 001503B0 282EA072 */  paddub     $5, $21, $0
/* 504B4 001503B4 AC01A627 */  addiu      $6, $sp, 0x1AC
/* 504B8 001503B8 283E2072 */  paddub     $7, $17, $0
/* 504BC 001503BC 0800C88E */  lw         $8, 0x8($22)
/* 504C0 001503C0 01000924 */  addiu      $9, $0, 0x1
/* 504C4 001503C4 403F050C */  jal        NeedMesWinWH_sub__FPiPiPiPiii
/* 504C8 001503C8 00000000 */   nop
/* 504CC 001503CC 85FE0010 */  b          .L0014FDE4
/* 504D0 001503D0 00000000 */   nop
.L001503D4:
/* 504D4 001503D4 9000BF7B */  lq         $31, 0x90($sp)
/* 504D8 001503D8 8000BE7B */  lq         $fp, 0x80($sp)
/* 504DC 001503DC 7000B77B */  lq         $23, 0x70($sp)
/* 504E0 001503E0 6000B67B */  lq         $22, 0x60($sp)
/* 504E4 001503E4 5000B57B */  lq         $21, 0x50($sp)
/* 504E8 001503E8 4000B47B */  lq         $20, 0x40($sp)
/* 504EC 001503EC 3000B37B */  lq         $19, 0x30($sp)
/* 504F0 001503F0 2000B27B */  lq         $18, 0x20($sp)
/* 504F4 001503F4 1000B17B */  lq         $17, 0x10($sp)
/* 504F8 001503F8 0000B07B */  lq         $16, 0x0($sp)
/* 504FC 001503FC B001BD27 */  addiu      $sp, $sp, 0x1B0
/* 50500 00150400 0800E003 */  jr         $31
/* 50504 00150404 00000000 */   nop
/* 50508 00150408 00000000 */  nop
/* 5050C 0015040C 00000000 */  nop
