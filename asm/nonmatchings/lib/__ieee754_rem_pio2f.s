.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ieee754_rem_pio2f
/* 1A9D0 0011A8D0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 1A9D4 0011A8D4 2000B1FF */  sd         $17, 0x20($sp)
/* 1A9D8 0011A8D8 4000BFFF */  sd         $31, 0x40($sp)
/* 1A9DC 0011A8DC 3000B2FF */  sd         $18, 0x30($sp)
/* 1A9E0 0011A8E0 1000B0FF */  sd         $16, 0x10($sp)
/* 1A9E4 0011A8E4 00600244 */  mfc1       $2, $f12
/* 1A9E8 0011A8E8 2D904000 */  daddu      $18, $2, $0
/* 1A9EC 0011A8EC FF7F033C */  lui        $3, (0x7FFFFFFF >> 16)
/* 1A9F0 0011A8F0 FFFF6334 */  ori        $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 1A9F4 0011A8F4 493F023C */  lui        $2, (0x3F490FD8 >> 16)
/* 1A9F8 0011A8F8 24804302 */  and        $16, $18, $3
/* 1A9FC 0011A8FC D80F4234 */  ori        $2, $2, (0x3F490FD8 & 0xFFFF)
/* 1AA00 0011A900 2A105000 */  slt        $2, $2, $16
/* 1AA04 0011A904 06004014 */  bnez       $2, .L0011A920
/* 1AA08 0011A908 2D888000 */   daddu     $17, $4, $0
/* 1AA0C 0011A90C 00002CE6 */  swc1       $f12, 0x0($17)
/* 1AA10 0011A910 2D100000 */  daddu      $2, $0, $0
/* 1AA14 0011A914 E0000010 */  b          .L0011AC98
/* 1AA18 0011A918 040020AE */   sw        $0, 0x4($17)
/* 1AA1C 0011A91C 00000000 */  nop
.L0011A920:
/* 1AA20 0011A920 1640023C */  lui        $2, (0x4016CBE3 >> 16)
/* 1AA24 0011A924 E3CB4234 */  ori        $2, $2, (0x4016CBE3 & 0xFFFF)
/* 1AA28 0011A928 2A105000 */  slt        $2, $2, $16
/* 1AA2C 0011A92C 3B004014 */  bnez       $2, .L0011AA1C
/* 1AA30 0011A930 4943023C */   lui       $2, (0x43490F80 >> 16)
/* 1AA34 0011A934 1D00401A */  blez       $18, .L0011A9AC
/* 1AA38 0011A938 C93F033C */   lui       $3, (0x3FC90FD0 >> 16)
/* 1AA3C 0011A93C C93F013C */  lui        $at, (0x3FC90F80 >> 16)
/* 1AA40 0011A940 800F2134 */  ori        $at, $at, (0x3FC90F80 & 0xFFFF)
/* 1AA44 0011A944 00008144 */  mtc1       $at, $f0
/* 1AA48 0011A948 FFFF023C */  lui        $2, (0xFFFFFFF0 >> 16)
/* 1AA4C 0011A94C F0FF4234 */  ori        $2, $2, (0xFFFFFFF0 & 0xFFFF)
/* 1AA50 0011A950 24100202 */  and        $2, $16, $2
/* 1AA54 0011A954 D00F6334 */  ori        $3, $3, (0x3FC90FD0 & 0xFFFF)
/* 1AA58 0011A958 06004310 */  beq        $2, $3, .L0011A974
/* 1AA5C 0011A95C 01630046 */   sub.s     $f12, $f12, $f0
/* 1AA60 0011A960 3537013C */  lui        $at, (0x37354443 >> 16)
/* 1AA64 0011A964 43442134 */  ori        $at, $at, (0x37354443 & 0xFFFF)
/* 1AA68 0011A968 00108144 */  mtc1       $at, $f2
/* 1AA6C 0011A96C 09000010 */  b          .L0011A994
/* 1AA70 0011A970 41600246 */   sub.s     $f1, $f12, $f2
.L0011A974:
/* 1AA74 0011A974 3537013C */  lui        $at, (0x37354400 >> 16)
/* 1AA78 0011A978 00442134 */  ori        $at, $at, (0x37354400 & 0xFFFF)
/* 1AA7C 0011A97C 00008144 */  mtc1       $at, $f0
/* 1AA80 0011A980 852E013C */  lui        $at, (0x2E85A308 >> 16)
/* 1AA84 0011A984 08A32134 */  ori        $at, $at, (0x2E85A308 & 0xFFFF)
/* 1AA88 0011A988 00108144 */  mtc1       $at, $f2
/* 1AA8C 0011A98C 01630046 */  sub.s      $f12, $f12, $f0
/* 1AA90 0011A990 41600246 */  sub.s      $f1, $f12, $f2
.L0011A994:
/* 1AA94 0011A994 01600146 */  sub.s      $f0, $f12, $f1
/* 1AA98 0011A998 000021E6 */  swc1       $f1, 0x0($17)
/* 1AA9C 0011A99C 01000246 */  sub.s      $f0, $f0, $f2
/* 1AAA0 0011A9A0 040020E6 */  swc1       $f0, 0x4($17)
/* 1AAA4 0011A9A4 BC000010 */  b          .L0011AC98
/* 1AAA8 0011A9A8 01000224 */   addiu     $2, $0, 0x1
.L0011A9AC:
/* 1AAAC 0011A9AC C93F013C */  lui        $at, (0x3FC90F80 >> 16)
/* 1AAB0 0011A9B0 800F2134 */  ori        $at, $at, (0x3FC90F80 & 0xFFFF)
/* 1AAB4 0011A9B4 00008144 */  mtc1       $at, $f0
/* 1AAB8 0011A9B8 FFFF023C */  lui        $2, (0xFFFFFFF0 >> 16)
/* 1AABC 0011A9BC F0FF4234 */  ori        $2, $2, (0xFFFFFFF0 & 0xFFFF)
/* 1AAC0 0011A9C0 24100202 */  and        $2, $16, $2
/* 1AAC4 0011A9C4 D00F6334 */  ori        $3, $3, (0x3FC90FD0 & 0xFFFF)
/* 1AAC8 0011A9C8 06004310 */  beq        $2, $3, .L0011A9E4
/* 1AACC 0011A9CC 00630046 */   add.s     $f12, $f12, $f0
/* 1AAD0 0011A9D0 3537013C */  lui        $at, (0x37354443 >> 16)
/* 1AAD4 0011A9D4 43442134 */  ori        $at, $at, (0x37354443 & 0xFFFF)
/* 1AAD8 0011A9D8 00108144 */  mtc1       $at, $f2
/* 1AADC 0011A9DC 09000010 */  b          .L0011AA04
/* 1AAE0 0011A9E0 40600246 */   add.s     $f1, $f12, $f2
.L0011A9E4:
/* 1AAE4 0011A9E4 3537013C */  lui        $at, (0x37354400 >> 16)
/* 1AAE8 0011A9E8 00442134 */  ori        $at, $at, (0x37354400 & 0xFFFF)
/* 1AAEC 0011A9EC 00008144 */  mtc1       $at, $f0
/* 1AAF0 0011A9F0 852E013C */  lui        $at, (0x2E85A308 >> 16)
/* 1AAF4 0011A9F4 08A32134 */  ori        $at, $at, (0x2E85A308 & 0xFFFF)
/* 1AAF8 0011A9F8 00108144 */  mtc1       $at, $f2
/* 1AAFC 0011A9FC 00630046 */  add.s      $f12, $f12, $f0
/* 1AB00 0011AA00 40600246 */  add.s      $f1, $f12, $f2
.L0011AA04:
/* 1AB04 0011AA04 01600146 */  sub.s      $f0, $f12, $f1
/* 1AB08 0011AA08 000021E6 */  swc1       $f1, 0x0($17)
/* 1AB0C 0011AA0C 00000246 */  add.s      $f0, $f0, $f2
/* 1AB10 0011AA10 040020E6 */  swc1       $f0, 0x4($17)
/* 1AB14 0011AA14 A0000010 */  b          .L0011AC98
/* 1AB18 0011AA18 FFFF0224 */   addiu     $2, $0, -0x1
.L0011AA1C:
/* 1AB1C 0011AA1C 800F4234 */  ori        $2, $2, (0x43490F80 & 0xFFFF)
/* 1AB20 0011AA20 2A105000 */  slt        $2, $2, $16
/* 1AB24 0011AA24 5E004014 */  bnez       $2, .L0011ABA0
/* 1AB28 0011AA28 7F7F023C */   lui       $2, (0x7F7FFFFF >> 16)
/* 1AB2C 0011AA2C E675040C */  jal        fabsf
/* 1AB30 0011AA30 00000000 */   nop
/* 1AB34 0011AA34 223F013C */  lui        $at, (0x3F22F984 >> 16)
/* 1AB38 0011AA38 84F92134 */  ori        $at, $at, (0x3F22F984 & 0xFFFF)
/* 1AB3C 0011AA3C 00088144 */  mtc1       $at, $f1
/* 1AB40 0011AA40 46010046 */  mov.s      $f5, $f0
/* 1AB44 0011AA44 003F013C */  lui        $at, (0x3F000000 >> 16)
/* 1AB48 0011AA48 00108144 */  mtc1       $at, $f2
/* 1AB4C 0011AA4C 42280146 */  mul.s      $f1, $f5, $f1
/* 1AB50 0011AA50 C93F013C */  lui        $at, (0x3FC90F80 >> 16)
/* 1AB54 0011AA54 800F2134 */  ori        $at, $at, (0x3FC90F80 & 0xFFFF)
/* 1AB58 0011AA58 00008144 */  mtc1       $at, $f0
/* 1AB5C 0011AA5C 3537013C */  lui        $at, (0x37354443 >> 16)
/* 1AB60 0011AA60 43442134 */  ori        $at, $at, (0x37354443 & 0xFFFF)
/* 1AB64 0011AA64 00188144 */  mtc1       $at, $f3
/* 1AB68 0011AA68 40080246 */  add.s      $f1, $f1, $f2
/* 1AB6C 0011AA6C A4080046 */  .word      0x460008A4                    # cvt.w.s    $f2, $f1 # 00000000
/* 1AB70 0011AA70 00100544 */  mfc1       $5, $f2
/* 1AB74 0011AA74 00308544 */  mtc1       $5, $f6
/* 1AB78 0011AA78 A0318046 */  cvt.s.w    $f6, $f6
/* 1AB7C 0011AA7C 2000A228 */  slti       $2, $5, 0x20
/* 1AB80 0011AA80 02300046 */  mul.s      $f0, $f6, $f0
/* 1AB84 0011AA84 C2300346 */  mul.s      $f3, $f6, $f3
/* 1AB88 0011AA88 0E004010 */  beqz       $2, .L0011AAC4
/* 1AB8C 0011AA8C 01290046 */   sub.s     $f4, $f5, $f0
/* 1AB90 0011AA90 2A00043C */  lui        $4, %hi(npio2_hw_2)
/* 1AB94 0011AA94 FFFFA324 */  addiu      $3, $5, -0x1
/* 1AB98 0011AA98 E8868424 */  addiu      $4, $4, %lo(npio2_hw_2)
/* 1AB9C 0011AA9C 80180300 */  sll        $3, $3, 2
/* 1ABA0 0011AAA0 21186400 */  addu       $3, $3, $4
/* 1ABA4 0011AAA4 FFFF023C */  lui        $2, (0xFFFFFF00 >> 16)
/* 1ABA8 0011AAA8 00FF4234 */  ori        $2, $2, (0xFFFFFF00 & 0xFFFF)
/* 1ABAC 0011AAAC 0000648C */  lw         $4, 0x0($3)
/* 1ABB0 0011AAB0 24100202 */  and        $2, $16, $2
/* 1ABB4 0011AAB4 04004410 */  beq        $2, $4, .L0011AAC8
/* 1ABB8 0011AAB8 01200346 */   sub.s     $f0, $f4, $f3
/* 1ABBC 0011AABC 30000010 */  b          .L0011AB80
/* 1ABC0 0011AAC0 000020E6 */   swc1      $f0, 0x0($17)
.L0011AAC4:
/* 1ABC4 0011AAC4 01200346 */  sub.s      $f0, $f4, $f3
.L0011AAC8:
/* 1ABC8 0011AAC8 C3251000 */  sra        $4, $16, 23
/* 1ABCC 0011AACC 00000244 */  mfc1       $2, $f0
/* 1ABD0 0011AAD0 000022AE */  sw         $2, 0x0($17)
/* 1ABD4 0011AAD4 C21D0200 */  srl        $3, $2, 23
/* 1ABD8 0011AAD8 FF006330 */  andi       $3, $3, 0xFF
/* 1ABDC 0011AADC 23188300 */  subu       $3, $4, $3
/* 1ABE0 0011AAE0 09006228 */  slti       $2, $3, 0x9
/* 1ABE4 0011AAE4 27004054 */  bnel       $2, $0, .L0011AB84
/* 1ABE8 0011AAE8 000021C6 */   lwc1      $f1, 0x0($17)
/* 1ABEC 0011AAEC 3537013C */  lui        $at, (0x37354400 >> 16)
/* 1ABF0 0011AAF0 00442134 */  ori        $at, $at, (0x37354400 & 0xFFFF)
/* 1ABF4 0011AAF4 00008144 */  mtc1       $at, $f0
/* 1ABF8 0011AAF8 46210046 */  mov.s      $f5, $f4
/* 1ABFC 0011AAFC 852E013C */  lui        $at, (0x2E85A308 >> 16)
/* 1AC00 0011AB00 08A32134 */  ori        $at, $at, (0x2E85A308 & 0xFFFF)
/* 1AC04 0011AB04 00088144 */  mtc1       $at, $f1
/* 1AC08 0011AB08 C2300046 */  mul.s      $f3, $f6, $f0
/* 1AC0C 0011AB0C 42300146 */  mul.s      $f1, $f6, $f1
/* 1AC10 0011AB10 01210346 */  sub.s      $f4, $f4, $f3
/* 1AC14 0011AB14 01280446 */  sub.s      $f0, $f5, $f4
/* 1AC18 0011AB18 01000346 */  sub.s      $f0, $f0, $f3
/* 1AC1C 0011AB1C C1080046 */  sub.s      $f3, $f1, $f0
/* 1AC20 0011AB20 81200346 */  sub.s      $f2, $f4, $f3
/* 1AC24 0011AB24 00100244 */  mfc1       $2, $f2
/* 1AC28 0011AB28 000022AE */  sw         $2, 0x0($17)
/* 1AC2C 0011AB2C C21D0200 */  srl        $3, $2, 23
/* 1AC30 0011AB30 FF006330 */  andi       $3, $3, 0xFF
/* 1AC34 0011AB34 23188300 */  subu       $3, $4, $3
/* 1AC38 0011AB38 1A006228 */  slti       $2, $3, 0x1A
/* 1AC3C 0011AB3C 11004054 */  bnel       $2, $0, .L0011AB84
/* 1AC40 0011AB40 000021C6 */   lwc1      $f1, 0x0($17)
/* 1AC44 0011AB44 852E013C */  lui        $at, (0x2E85A300 >> 16)
/* 1AC48 0011AB48 00A32134 */  ori        $at, $at, (0x2E85A300 & 0xFFFF)
/* 1AC4C 0011AB4C 00008144 */  mtc1       $at, $f0
/* 1AC50 0011AB50 46210046 */  mov.s      $f5, $f4
/* 1AC54 0011AB54 8D24013C */  lui        $at, (0x248D3132 >> 16)
/* 1AC58 0011AB58 32312134 */  ori        $at, $at, (0x248D3132 & 0xFFFF)
/* 1AC5C 0011AB5C 00108144 */  mtc1       $at, $f2
/* 1AC60 0011AB60 C2300046 */  mul.s      $f3, $f6, $f0
/* 1AC64 0011AB64 82300246 */  mul.s      $f2, $f6, $f2
/* 1AC68 0011AB68 01210346 */  sub.s      $f4, $f4, $f3
/* 1AC6C 0011AB6C 01280446 */  sub.s      $f0, $f5, $f4
/* 1AC70 0011AB70 01000346 */  sub.s      $f0, $f0, $f3
/* 1AC74 0011AB74 C1100046 */  sub.s      $f3, $f2, $f0
/* 1AC78 0011AB78 41200346 */  sub.s      $f1, $f4, $f3
/* 1AC7C 0011AB7C 000021E6 */  swc1       $f1, 0x0($17)
.L0011AB80:
/* 1AC80 0011AB80 000021C6 */  lwc1       $f1, 0x0($17)
.L0011AB84:
/* 1AC84 0011AB84 01200146 */  sub.s      $f0, $f4, $f1
/* 1AC88 0011AB88 01000346 */  sub.s      $f0, $f0, $f3
/* 1AC8C 0011AB8C 41004106 */  bgez       $18, .L0011AC94
/* 1AC90 0011AB90 040020E6 */   swc1      $f0, 0x4($17)
/* 1AC94 0011AB94 47080046 */  neg.s      $f1, $f1
/* 1AC98 0011AB98 3A000010 */  b          .L0011AC84
/* 1AC9C 0011AB9C 23100500 */   negu      $2, $5
.L0011ABA0:
/* 1ACA0 0011ABA0 FFFF4234 */  ori        $2, $2, (0x7F7FFFFF & 0xFFFF)
/* 1ACA4 0011ABA4 2A105000 */  slt        $2, $2, $16
/* 1ACA8 0011ABA8 05004010 */  beqz       $2, .L0011ABC0
/* 1ACAC 0011ABAC 2D100000 */   daddu     $2, $0, $0
/* 1ACB0 0011ABB0 01600C46 */  sub.s      $f0, $f12, $f12
/* 1ACB4 0011ABB4 000020E6 */  swc1       $f0, 0x0($17)
/* 1ACB8 0011ABB8 37000010 */  b          .L0011AC98
/* 1ACBC 0011ABBC 040020E6 */   swc1      $f0, 0x4($17)
.L0011ABC0:
/* 1ACC0 0011ABC0 C31D1000 */  sra        $3, $16, 23
/* 1ACC4 0011ABC4 7AFF6624 */  addiu      $6, $3, -0x86
/* 1ACC8 0011ABC8 C0150600 */  sll        $2, $6, 23
/* 1ACCC 0011ABCC 23800202 */  subu       $16, $16, $2
/* 1ACD0 0011ABD0 00609044 */  mtc1       $16, $f12
/* 1ACD4 0011ABD4 8043013C */  lui        $at, (0x43800000 >> 16)
/* 1ACD8 0011ABD8 00108144 */  mtc1       $at, $f2
/* 1ACDC 0011ABDC 01000324 */  addiu      $3, $0, 0x1
/* 1ACE0 0011ABE0 2D20A003 */  daddu      $4, $sp, $0
/* 1ACE4 0011ABE4 00000000 */  nop
.L0011ABE8:
/* 1ACE8 0011ABE8 24600046 */  .word      0x46006024                    # cvt.w.s    $f0, $f12 # 00000000
/* 1ACEC 0011ABEC 00000244 */  mfc1       $2, $f0
/* 1ACF0 0011ABF0 FFFF6324 */  addiu      $3, $3, -0x1
/* 1ACF4 0011ABF4 00008244 */  mtc1       $2, $f0
/* 1ACF8 0011ABF8 20008046 */  cvt.s.w    $f0, $f0
/* 1ACFC 0011ABFC 41600046 */  sub.s      $f1, $f12, $f0
/* 1AD00 0011AC00 000080E4 */  swc1       $f0, 0x0($4)
/* 1AD04 0011AC04 04008424 */  addiu      $4, $4, 0x4
/* 1AD08 0011AC08 F7FF6104 */  bgez       $3, .L0011ABE8
/* 1AD0C 0011AC0C 020B0246 */   mul.s     $f12, $f1, $f2
/* 1AD10 0011AC10 00088044 */  mtc1       $0, $f1
/* 1AD14 0011AC14 03000724 */  addiu      $7, $0, 0x3
/* 1AD18 0011AC18 32600146 */  c.eq.s     $f12, $f1
/* 1AD1C 0011AC1C 00000000 */  nop
/* 1AD20 0011AC20 0C000045 */  bc1f       .L0011AC54
/* 1AD24 0011AC24 0800ACE7 */   swc1      $f12, 0x8($sp)
/* 1AD28 0011AC28 02000424 */  addiu      $4, $0, 0x2
/* 1AD2C 0011AC2C 2D388000 */  daddu      $7, $4, $0
.L0011AC30:
/* 1AD30 0011AC30 FFFFE224 */  addiu      $2, $7, -0x1
/* 1AD34 0011AC34 2D204000 */  daddu      $4, $2, $0
/* 1AD38 0011AC38 80180400 */  sll        $3, $4, 2
/* 1AD3C 0011AC3C 2110A303 */  addu       $2, $sp, $3
/* 1AD40 0011AC40 000040C4 */  lwc1       $f0, 0x0($2)
/* 1AD44 0011AC44 32000146 */  c.eq.s     $f0, $f1
/* 1AD48 0011AC48 00000000 */  nop
/* 1AD4C 0011AC4C F8FF0345 */  bc1tl      .L0011AC30
/* 1AD50 0011AC50 2D388000 */   daddu     $7, $4, $0
.L0011AC54:
/* 1AD54 0011AC54 2A00093C */  lui        $9, %hi(two_over_pi_2)
/* 1AD58 0011AC58 2D20A003 */  daddu      $4, $sp, $0
/* 1AD5C 0011AC5C D0832925 */  addiu      $9, $9, %lo(two_over_pi_2)
/* 1AD60 0011AC60 2D282002 */  daddu      $5, $17, $0
/* 1AD64 0011AC64 B46F040C */  jal        __kernel_rem_pio2f
/* 1AD68 0011AC68 02000824 */   addiu     $8, $0, 0x2
/* 1AD6C 0011AC6C 09004106 */  bgez       $18, .L0011AC94
/* 1AD70 0011AC70 2D284000 */   daddu     $5, $2, $0
/* 1AD74 0011AC74 000021C6 */  lwc1       $f1, 0x0($17)
/* 1AD78 0011AC78 23100500 */  negu       $2, $5
/* 1AD7C 0011AC7C 040020C6 */  lwc1       $f0, 0x4($17)
/* 1AD80 0011AC80 47080046 */  neg.s      $f1, $f1
.L0011AC84:
/* 1AD84 0011AC84 07000046 */  neg.s      $f0, $f0
/* 1AD88 0011AC88 000021E6 */  swc1       $f1, 0x0($17)
/* 1AD8C 0011AC8C 02000010 */  b          .L0011AC98
/* 1AD90 0011AC90 040020E6 */   swc1      $f0, 0x4($17)
.L0011AC94:
/* 1AD94 0011AC94 2D10A000 */  daddu      $2, $5, $0
.L0011AC98:
/* 1AD98 0011AC98 4000BFDF */  ld         $31, 0x40($sp)
/* 1AD9C 0011AC9C 3000B2DF */  ld         $18, 0x30($sp)
/* 1ADA0 0011ACA0 2000B1DF */  ld         $17, 0x20($sp)
/* 1ADA4 0011ACA4 1000B0DF */  ld         $16, 0x10($sp)
/* 1ADA8 0011ACA8 0800E003 */  jr         $31
/* 1ADAC 0011ACAC 5000BD27 */   addiu     $sp, $sp, 0x50
