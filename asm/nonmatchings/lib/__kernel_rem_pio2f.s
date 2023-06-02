.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __kernel_rem_pio2f
/* 1BFD0 0011BED0 FDFFCC24 */  addiu      $12, $6, -0x3
/* 1BFD4 0011BED4 FFFF0B24 */  addiu      $11, $0, -0x1
/* 1BFD8 0011BED8 F0FDBD27 */  addiu      $sp, $sp, -0x210
/* 1BFDC 0011BEDC 0400C224 */  addiu      $2, $6, 0x4
/* 1BFE0 0011BEE0 2A506C01 */  slt        $10, $11, $12
/* 1BFE4 0011BEE4 C001B6FF */  sd         $22, 0x1C0($sp)
/* 1BFE8 0011BEE8 0B108A01 */  movn       $2, $12, $10
/* 1BFEC 0011BEEC 4401A8AF */  sw         $8, 0x144($sp)
/* 1BFF0 0011BEF0 C3B00200 */  sra        $22, $2, 3
/* 1BFF4 0011BEF4 2A00033C */  lui        $3, %hi(init_jk_2)
/* 1BFF8 0011BEF8 D8886324 */  addiu      $3, $3, %lo(init_jk_2)
/* 1BFFC 0011BEFC 2A587601 */  slt        $11, $11, $22
/* 1C000 0011BF00 80100800 */  sll        $2, $8, 2
/* 1C004 0011BF04 D001B7FF */  sd         $23, 0x1D0($sp)
/* 1C008 0011BF08 8001B2FF */  sd         $18, 0x180($sp)
/* 1C00C 0011BF0C 21104300 */  addu       $2, $2, $3
/* 1C010 0011BF10 7001B1FF */  sd         $17, 0x170($sp)
/* 1C014 0011BF14 0AB00B00 */  movz       $22, $0, $11
/* 1C018 0011BF18 F001BFFF */  sd         $31, 0x1F0($sp)
/* 1C01C 0011BF1C 0100C326 */  addiu      $3, $22, 0x1
/* 1C020 0011BF20 E001BEFF */  sd         $fp, 0x1E0($sp)
/* 1C024 0011BF24 C0180300 */  sll        $3, $3, 3
/* 1C028 0011BF28 B001B5FF */  sd         $21, 0x1B0($sp)
/* 1C02C 0011BF2C FFFFF124 */  addiu      $17, $7, -0x1
/* 1C030 0011BF30 9001B3FF */  sd         $19, 0x190($sp)
/* 1C034 0011BF34 2390C300 */  subu       $18, $6, $3
/* 1C038 0011BF38 6001B0FF */  sd         $16, 0x160($sp)
/* 1C03C 0011BF3C 2DB8A000 */  daddu      $23, $5, $0
/* 1C040 0011BF40 0002B4E7 */  swc1       $f20, 0x200($sp)
/* 1C044 0011BF44 2328D102 */  subu       $5, $22, $17
/* 1C048 0011BF48 A001B4FF */  sd         $20, 0x1A0($sp)
/* 1C04C 0011BF4C 2D300000 */  daddu      $6, $0, $0
/* 1C050 0011BF50 0000548C */  lw         $20, 0x0($2)
/* 1C054 0011BF54 4001A4AF */  sw         $4, 0x140($sp)
/* 1C058 0011BF58 21383402 */  addu       $7, $17, $20
/* 1C05C 0011BF5C 1900E004 */  bltz       $7, .L0011BFC4
/* 1C060 0011BF60 4801A9AF */   sw        $9, 0x148($sp)
/* 1C064 0011BF64 0000822A */  slti       $2, $20, 0x0
/* 1C068 0011BF68 03000329 */  slti       $3, $8, 0x3
/* 1C06C 0011BF6C 5401A2AF */  sw         $2, 0x154($sp)
/* 1C070 0011BF70 5000A927 */  addiu      $9, $sp, 0x50
/* 1C074 0011BF74 5001A3AF */  sw         $3, 0x150($sp)
/* 1C078 0011BF78 F000B527 */  addiu      $21, $sp, 0xF0
/* 1C07C 0011BF7C 00000000 */  nop
.L0011BF80:
/* 1C080 0011BF80 80100600 */  sll        $2, $6, 2
/* 1C084 0011BF84 0800A004 */  bltz       $5, .L0011BFA8
/* 1C088 0011BF88 21182201 */   addu      $3, $9, $2
/* 1C08C 0011BF8C 4801A48F */  lw         $4, 0x148($sp)
/* 1C090 0011BF90 80100500 */  sll        $2, $5, 2
/* 1C094 0011BF94 21104400 */  addu       $2, $2, $4
/* 1C098 0011BF98 000040C4 */  lwc1       $f0, 0x0($2)
/* 1C09C 0011BF9C 20008046 */  cvt.s.w    $f0, $f0
/* 1C0A0 0011BFA0 02000010 */  b          .L0011BFAC
/* 1C0A4 0011BFA4 000060E4 */   swc1      $f0, 0x0($3)
.L0011BFA8:
/* 1C0A8 0011BFA8 000060AC */  sw         $0, 0x0($3)
.L0011BFAC:
/* 1C0AC 0011BFAC 0100C624 */  addiu      $6, $6, 0x1
/* 1C0B0 0011BFB0 2A10E600 */  slt        $2, $7, $6
/* 1C0B4 0011BFB4 F2FF4010 */  beqz       $2, .L0011BF80
/* 1C0B8 0011BFB8 0100A524 */   addiu     $5, $5, 0x1
/* 1C0BC 0011BFBC 08000010 */  b          .L0011BFE0
/* 1C0C0 0011BFC0 5401A88F */   lw        $8, 0x154($sp)
.L0011BFC4:
/* 1C0C4 0011BFC4 4401A68F */  lw         $6, 0x144($sp)
/* 1C0C8 0011BFC8 0000852A */  slti       $5, $20, 0x0
/* 1C0CC 0011BFCC 5401A5AF */  sw         $5, 0x154($sp)
/* 1C0D0 0011BFD0 F000B527 */  addiu      $21, $sp, 0xF0
/* 1C0D4 0011BFD4 0300C628 */  slti       $6, $6, 0x3
/* 1C0D8 0011BFD8 5001A6AF */  sw         $6, 0x150($sp)
/* 1C0DC 0011BFDC 5401A88F */  lw         $8, 0x154($sp)
.L0011BFE0:
/* 1C0E0 0011BFE0 21000015 */  bnez       $8, .L0011C068
/* 1C0E4 0011BFE4 2D300000 */   daddu     $6, $0, $0
/* 1C0E8 0011BFE8 00002B2A */  slti       $11, $17, 0x0
/* 1C0EC 0011BFEC 00000000 */  nop
.L0011BFF0:
/* 1C0F0 0011BFF0 00108044 */  mtc1       $0, $f2
/* 1C0F4 0011BFF4 15006015 */  bnez       $11, .L0011C04C
/* 1C0F8 0011BFF8 2D280000 */   daddu     $5, $0, $0
/* 1C0FC 0011BFFC 21202602 */  addu       $4, $17, $6
/* 1C100 0011C000 80380600 */  sll        $7, $6, 2
/* 1C104 0011C004 5000A927 */  addiu      $9, $sp, 0x50
/* 1C108 0011C008 0100C824 */  addiu      $8, $6, 0x1
/* 1C10C 0011C00C 00000000 */  nop
.L0011C010:
/* 1C110 0011C010 23108500 */  subu       $2, $4, $5
/* 1C114 0011C014 4001A68F */  lw         $6, 0x140($sp)
/* 1C118 0011C018 80180500 */  sll        $3, $5, 2
/* 1C11C 0011C01C 80100200 */  sll        $2, $2, 2
/* 1C120 0011C020 21102201 */  addu       $2, $9, $2
/* 1C124 0011C024 21186600 */  addu       $3, $3, $6
/* 1C128 0011C028 000041C4 */  lwc1       $f1, 0x0($2)
/* 1C12C 0011C02C 0100A524 */  addiu      $5, $5, 0x1
/* 1C130 0011C030 000060C4 */  lwc1       $f0, 0x0($3)
/* 1C134 0011C034 2A102502 */  slt        $2, $17, $5
/* 1C138 0011C038 02000146 */  mul.s      $f0, $f0, $f1
/* 1C13C 0011C03C F4FF4010 */  beqz       $2, .L0011C010
/* 1C140 0011C040 80100046 */   add.s     $f2, $f2, $f0
/* 1C144 0011C044 04000010 */  b          .L0011C058
/* 1C148 0011C048 2118A702 */   addu      $3, $21, $7
.L0011C04C:
/* 1C14C 0011C04C 0100C824 */  addiu      $8, $6, 0x1
/* 1C150 0011C050 80380600 */  sll        $7, $6, 2
/* 1C154 0011C054 2118A702 */  addu       $3, $21, $7
.L0011C058:
/* 1C158 0011C058 2D300001 */  daddu      $6, $8, $0
/* 1C15C 0011C05C 2A108602 */  slt        $2, $20, $6
/* 1C160 0011C060 E3FF4010 */  beqz       $2, .L0011BFF0
/* 1C164 0011C064 000062E4 */   swc1      $f2, 0x0($3)
.L0011C068:
/* 1C168 0011C068 2D808002 */  daddu      $16, $20, $0
.L0011C06C:
/* 1C16C 0011C06C 80F01000 */  sll        $fp, $16, 2
/* 1C170 0011C070 2D280002 */  daddu      $5, $16, $0
/* 1C174 0011C074 2110BE02 */  addu       $2, $21, $fp
/* 1C178 0011C078 1800001A */  blez       $16, .L0011C0DC
/* 1C17C 0011C07C 000054C4 */   lwc1      $f20, 0x0($2)
/* 1C180 0011C080 FCFFC227 */  addiu      $2, $fp, -0x4
/* 1C184 0011C084 803B013C */  lui        $at, (0x3B800000 >> 16)
/* 1C188 0011C088 00208144 */  mtc1       $at, $f4
/* 1C18C 0011C08C 8043013C */  lui        $at, (0x43800000 >> 16)
/* 1C190 0011C090 00188144 */  mtc1       $at, $f3
/* 1C194 0011C094 21205500 */  addu       $4, $2, $21
/* 1C198 0011C098 2D18A003 */  daddu      $3, $sp, $0
/* 1C19C 0011C09C 00000000 */  nop
.L0011C0A0:
/* 1C1A0 0011C0A0 02A00446 */  mul.s      $f0, $f20, $f4
/* 1C1A4 0011C0A4 000081C4 */  lwc1       $f1, 0x0($4)
/* 1C1A8 0011C0A8 FCFF8424 */  addiu      $4, $4, -0x4
/* 1C1AC 0011C0AC FFFFA524 */  addiu      $5, $5, -0x1
/* 1C1B0 0011C0B0 A4000046 */  .word      0x460000A4                    # cvt.w.s    $f2, $f0 # 00000000
/* 1C1B4 0011C0B4 00100244 */  mfc1       $2, $f2
/* 1C1B8 0011C0B8 00108244 */  mtc1       $2, $f2
/* 1C1BC 0011C0BC A0108046 */  cvt.s.w    $f2, $f2
/* 1C1C0 0011C0C0 02100346 */  mul.s      $f0, $f2, $f3
/* 1C1C4 0011C0C4 01A00046 */  sub.s      $f0, $f20, $f0
/* 1C1C8 0011C0C8 000D0246 */  add.s      $f20, $f1, $f2
/* 1C1CC 0011C0CC 64000046 */  .word      0x46000064                    # cvt.w.s    $f1, $f0 # 00000000
/* 1C1D0 0011C0D0 000061E4 */  swc1       $f1, 0x0($3)
/* 1C1D4 0011C0D4 F2FFA01C */  bgtz       $5, .L0011C0A0
/* 1C1D8 0011C0D8 04006324 */   addiu     $3, $3, 0x4
.L0011C0DC:
/* 1C1DC 0011C0DC 06A30046 */  mov.s      $f12, $f20
/* 1C1E0 0011C0E0 B012040C */  jal        scalbnf
/* 1C1E4 0011C0E4 2D204002 */   daddu     $4, $18, $0
/* 1C1E8 0011C0E8 003E013C */  lui        $at, (0x3E000000 >> 16)
/* 1C1EC 0011C0EC 00608144 */  mtc1       $at, $f12
/* 1C1F0 0011C0F0 06050046 */  mov.s      $f20, $f0
/* 1C1F4 0011C0F4 4C01A0AF */  sw         $0, 0x14C($sp)
/* 1C1F8 0011C0F8 EE75040C */  jal        floorf
/* 1C1FC 0011C0FC 02A30C46 */   mul.s     $f12, $f20, $f12
/* 1C200 0011C100 0041013C */  lui        $at, (0x41000000 >> 16)
/* 1C204 0011C104 00088144 */  mtc1       $at, $f1
/* 1C208 0011C108 02000146 */  mul.s      $f0, $f0, $f1
/* 1C20C 0011C10C 01A50046 */  sub.s      $f20, $f20, $f0
/* 1C210 0011C110 24A00046 */  .word      0x4600A024                    # cvt.w.s    $f0, $f20 # 00000000
/* 1C214 0011C114 00001344 */  mfc1       $19, $f0
/* 1C218 0011C118 00009344 */  mtc1       $19, $f0
/* 1C21C 0011C11C 20008046 */  cvt.s.w    $f0, $f0
/* 1C220 0011C120 1100401A */  blez       $18, .L0011C168
/* 1C224 0011C124 01A50046 */   sub.s     $f20, $f20, $f0
/* 1C228 0011C128 FFFF0226 */  addiu      $2, $16, -0x1
/* 1C22C 0011C12C 08000324 */  addiu      $3, $0, 0x8
/* 1C230 0011C130 80100200 */  sll        $2, $2, 2
/* 1C234 0011C134 23187200 */  subu       $3, $3, $18
/* 1C238 0011C138 2128A203 */  addu       $5, $sp, $2
/* 1C23C 0011C13C 07000424 */  addiu      $4, $0, 0x7
/* 1C240 0011C140 0000A28C */  lw         $2, 0x0($5)
/* 1C244 0011C144 23209200 */  subu       $4, $4, $18
/* 1C248 0011C148 07306200 */  srav       $6, $2, $3
/* 1C24C 0011C14C 04186600 */  sllv       $3, $6, $3
/* 1C250 0011C150 21986602 */  addu       $19, $19, $6
/* 1C254 0011C154 23104300 */  subu       $2, $2, $3
/* 1C258 0011C158 07208200 */  srav       $4, $2, $4
/* 1C25C 0011C15C 4C01A4AF */  sw         $4, 0x14C($sp)
/* 1C260 0011C160 10000010 */  b          .L0011C1A4
/* 1C264 0011C164 0000A2AC */   sw        $2, 0x0($5)
.L0011C168:
/* 1C268 0011C168 07004016 */  bnez       $18, .L0011C188
/* 1C26C 0011C16C FFFF0226 */   addiu     $2, $16, -0x1
/* 1C270 0011C170 80100200 */  sll        $2, $2, 2
/* 1C274 0011C174 2118A203 */  addu       $3, $sp, $2
/* 1C278 0011C178 0000648C */  lw         $4, 0x0($3)
/* 1C27C 0011C17C 03220400 */  sra        $4, $4, 8
/* 1C280 0011C180 08000010 */  b          .L0011C1A4
/* 1C284 0011C184 4C01A4AF */   sw        $4, 0x14C($sp)
.L0011C188:
/* 1C288 0011C188 003F013C */  lui        $at, (0x3F000000 >> 16)
/* 1C28C 0011C18C 00008144 */  mtc1       $at, $f0
/* 1C290 0011C190 36001446 */  c.le.s     $f0, $f20
/* 1C294 0011C194 00000000 */  nop
/* 1C298 0011C198 02000045 */  bc1f       .L0011C1A4
/* 1C29C 0011C19C 02000224 */   addiu     $2, $0, 0x2
/* 1C2A0 0011C1A0 4C01A2AF */  sw         $2, 0x14C($sp)
.L0011C1A4:
/* 1C2A4 0011C1A4 4C01A38F */  lw         $3, 0x14C($sp)
/* 1C2A8 0011C1A8 33006018 */  blez       $3, .L0011C278
/* 1C2AC 0011C1AC 00000000 */   nop
/* 1C2B0 0011C1B0 01007326 */  addiu      $19, $19, 0x1
/* 1C2B4 0011C1B4 1100001A */  blez       $16, .L0011C1FC
/* 1C2B8 0011C1B8 2D380000 */   daddu     $7, $0, $0
/* 1C2BC 0011C1BC 00010824 */  addiu      $8, $0, 0x100
/* 1C2C0 0011C1C0 FF000424 */  addiu      $4, $0, 0xFF
/* 1C2C4 0011C1C4 2D18A003 */  daddu      $3, $sp, $0
/* 1C2C8 0011C1C8 2D300002 */  daddu      $6, $16, $0
/* 1C2CC 0011C1CC 00000000 */  nop
.L0011C1D0:
/* 1C2D0 0011C1D0 0500E014 */  bnez       $7, .L0011C1E8
/* 1C2D4 0011C1D4 0000658C */   lw        $5, 0x0($3)
/* 1C2D8 0011C1D8 0500A010 */  beqz       $5, .L0011C1F0
/* 1C2DC 0011C1DC 23100501 */   subu      $2, $8, $5
/* 1C2E0 0011C1E0 02000010 */  b          .L0011C1EC
/* 1C2E4 0011C1E4 01000724 */   addiu     $7, $0, 0x1
.L0011C1E8:
/* 1C2E8 0011C1E8 23108500 */  subu       $2, $4, $5
.L0011C1EC:
/* 1C2EC 0011C1EC 000062AC */  sw         $2, 0x0($3)
.L0011C1F0:
/* 1C2F0 0011C1F0 FFFFC624 */  addiu      $6, $6, -0x1
/* 1C2F4 0011C1F4 F6FFC014 */  bnez       $6, .L0011C1D0
/* 1C2F8 0011C1F8 04006324 */   addiu     $3, $3, 0x4
.L0011C1FC:
/* 1C2FC 0011C1FC 1300401A */  blez       $18, .L0011C24C
/* 1C300 0011C200 01000224 */   addiu     $2, $0, 0x1
/* 1C304 0011C204 05004212 */  beq        $18, $2, .L0011C21C
/* 1C308 0011C208 02000224 */   addiu     $2, $0, 0x2
/* 1C30C 0011C20C 09004212 */  beq        $18, $2, .L0011C234
/* 1C310 0011C210 4C01A48F */   lw        $4, 0x14C($sp)
/* 1C314 0011C214 0F000010 */  b          .L0011C254
/* 1C318 0011C218 00000000 */   nop
.L0011C21C:
/* 1C31C 0011C21C FFFF0226 */  addiu      $2, $16, -0x1
/* 1C320 0011C220 80100200 */  sll        $2, $2, 2
/* 1C324 0011C224 2120A203 */  addu       $4, $sp, $2
/* 1C328 0011C228 0000838C */  lw         $3, 0x0($4)
/* 1C32C 0011C22C 06000010 */  b          .L0011C248
/* 1C330 0011C230 7F006330 */   andi      $3, $3, 0x7F
.L0011C234:
/* 1C334 0011C234 FFFF0226 */  addiu      $2, $16, -0x1
/* 1C338 0011C238 80100200 */  sll        $2, $2, 2
/* 1C33C 0011C23C 2120A203 */  addu       $4, $sp, $2
/* 1C340 0011C240 0000838C */  lw         $3, 0x0($4)
/* 1C344 0011C244 3F006330 */  andi       $3, $3, 0x3F
.L0011C248:
/* 1C348 0011C248 000083AC */  sw         $3, 0x0($4)
.L0011C24C:
/* 1C34C 0011C24C 4C01A48F */  lw         $4, 0x14C($sp)
/* 1C350 0011C250 02000224 */  addiu      $2, $0, 0x2
.L0011C254:
/* 1C354 0011C254 08008214 */  bne        $4, $2, .L0011C278
/* 1C358 0011C258 00000000 */   nop
/* 1C35C 0011C25C 803F013C */  lui        $at, (0x3F800000 >> 16)
/* 1C360 0011C260 00608144 */  mtc1       $at, $f12
/* 1C364 0011C264 0400E010 */  beqz       $7, .L0011C278
/* 1C368 0011C268 01651446 */   sub.s     $f20, $f12, $f20
/* 1C36C 0011C26C B012040C */  jal        scalbnf
/* 1C370 0011C270 2D204002 */   daddu     $4, $18, $0
/* 1C374 0011C274 01A50046 */  sub.s      $f20, $f20, $f0
.L0011C278:
/* 1C378 0011C278 00008044 */  mtc1       $0, $f0
/* 1C37C 0011C27C 32A00046 */  c.eq.s     $f20, $f0
/* 1C380 0011C280 00000000 */  nop
/* 1C384 0011C284 53000045 */  bc1f       .L0011C3D4
/* 1C388 0011C288 FFFF0626 */   addiu     $6, $16, -0x1
/* 1C38C 0011C28C 2A10D400 */  slt        $2, $6, $20
/* 1C390 0011C290 0A004014 */  bnez       $2, .L0011C2BC
/* 1C394 0011C294 2D280000 */   daddu     $5, $0, $0
/* 1C398 0011C298 80100600 */  sll        $2, $6, 2
/* 1C39C 0011C29C 21205D00 */  addu       $4, $2, $sp
.L0011C2A0:
/* 1C3A0 0011C2A0 0000838C */  lw         $3, 0x0($4)
/* 1C3A4 0011C2A4 FFFFC624 */  addiu      $6, $6, -0x1
/* 1C3A8 0011C2A8 FCFF8424 */  addiu      $4, $4, -0x4
/* 1C3AC 0011C2AC 2A10D400 */  slt        $2, $6, $20
/* 1C3B0 0011C2B0 2528A300 */  or         $5, $5, $3
/* 1C3B4 0011C2B4 FAFF4010 */  beqz       $2, .L0011C2A0
/* 1C3B8 0011C2B8 00000000 */   nop
.L0011C2BC:
/* 1C3BC 0011C2BC 4200A014 */  bnez       $5, .L0011C3C8
/* 1C3C0 0011C2C0 FFFF8226 */   addiu     $2, $20, -0x1
/* 1C3C4 0011C2C4 80100200 */  sll        $2, $2, 2
/* 1C3C8 0011C2C8 2118A203 */  addu       $3, $sp, $2
/* 1C3CC 0011C2CC 0000648C */  lw         $4, 0x0($3)
/* 1C3D0 0011C2D0 0C008014 */  bnez       $4, .L0011C304
/* 1C3D4 0011C2D4 01000824 */   addiu     $8, $0, 0x1
/* 1C3D8 0011C2D8 01000526 */  addiu      $5, $16, 0x1
/* 1C3DC 0011C2DC 00000000 */  nop
.L0011C2E0:
/* 1C3E0 0011C2E0 01000825 */  addiu      $8, $8, 0x1
/* 1C3E4 0011C2E4 23108802 */  subu       $2, $20, $8
/* 1C3E8 0011C2E8 80100200 */  sll        $2, $2, 2
/* 1C3EC 0011C2EC 2118A203 */  addu       $3, $sp, $2
/* 1C3F0 0011C2F0 0000648C */  lw         $4, 0x0($3)
/* 1C3F4 0011C2F4 FAFF8010 */  beqz       $4, .L0011C2E0
/* 1C3F8 0011C2F8 00000000 */   nop
/* 1C3FC 0011C2FC 03000010 */  b          .L0011C30C
/* 1C400 0011C300 21200802 */   addu      $4, $16, $8
.L0011C304:
/* 1C404 0011C304 01000526 */  addiu      $5, $16, 0x1
/* 1C408 0011C308 21200802 */  addu       $4, $16, $8
.L0011C30C:
/* 1C40C 0011C30C 2D30A000 */  daddu      $6, $5, $0
/* 1C410 0011C310 2A108600 */  slt        $2, $4, $6
/* 1C414 0011C314 55FF4014 */  bnez       $2, .L0011C06C
/* 1C418 0011C318 2D808000 */   daddu     $16, $4, $0
/* 1C41C 0011C31C 5000A927 */  addiu      $9, $sp, 0x50
/* 1C420 0011C320 00002B2A */  slti       $11, $17, 0x0
/* 1C424 0011C324 00000000 */  nop
.L0011C328:
/* 1C428 0011C328 4801A58F */  lw         $5, 0x148($sp)
/* 1C42C 0011C32C 2110C602 */  addu       $2, $22, $6
/* 1C430 0011C330 80100200 */  sll        $2, $2, 2
/* 1C434 0011C334 21502602 */  addu       $10, $17, $6
/* 1C438 0011C338 21104500 */  addu       $2, $2, $5
/* 1C43C 0011C33C 80180A00 */  sll        $3, $10, 2
/* 1C440 0011C340 000040C4 */  lwc1       $f0, 0x0($2)
/* 1C444 0011C344 20008046 */  cvt.s.w    $f0, $f0
/* 1C448 0011C348 21182301 */  addu       $3, $9, $3
/* 1C44C 0011C34C 2D280000 */  daddu      $5, $0, $0
/* 1C450 0011C350 00108044 */  mtc1       $0, $f2
/* 1C454 0011C354 13006015 */  bnez       $11, .L0011C3A4
/* 1C458 0011C358 000060E4 */   swc1      $f0, 0x0($3)
/* 1C45C 0011C35C 0100C824 */  addiu      $8, $6, 0x1
/* 1C460 0011C360 80380600 */  sll        $7, $6, 2
/* 1C464 0011C364 00000000 */  nop
.L0011C368:
/* 1C468 0011C368 23104501 */  subu       $2, $10, $5
/* 1C46C 0011C36C 4001A68F */  lw         $6, 0x140($sp)
/* 1C470 0011C370 80180500 */  sll        $3, $5, 2
/* 1C474 0011C374 80100200 */  sll        $2, $2, 2
/* 1C478 0011C378 21102201 */  addu       $2, $9, $2
/* 1C47C 0011C37C 21186600 */  addu       $3, $3, $6
/* 1C480 0011C380 000041C4 */  lwc1       $f1, 0x0($2)
/* 1C484 0011C384 0100A524 */  addiu      $5, $5, 0x1
/* 1C488 0011C388 000060C4 */  lwc1       $f0, 0x0($3)
/* 1C48C 0011C38C 2A102502 */  slt        $2, $17, $5
/* 1C490 0011C390 02000146 */  mul.s      $f0, $f0, $f1
/* 1C494 0011C394 F4FF4010 */  beqz       $2, .L0011C368
/* 1C498 0011C398 80100046 */   add.s     $f2, $f2, $f0
/* 1C49C 0011C39C 04000010 */  b          .L0011C3B0
/* 1C4A0 0011C3A0 2118A702 */   addu      $3, $21, $7
.L0011C3A4:
/* 1C4A4 0011C3A4 0100C824 */  addiu      $8, $6, 0x1
/* 1C4A8 0011C3A8 80380600 */  sll        $7, $6, 2
/* 1C4AC 0011C3AC 2118A702 */  addu       $3, $21, $7
.L0011C3B0:
/* 1C4B0 0011C3B0 2D300001 */  daddu      $6, $8, $0
/* 1C4B4 0011C3B4 2A108600 */  slt        $2, $4, $6
/* 1C4B8 0011C3B8 DBFF4010 */  beqz       $2, .L0011C328
/* 1C4BC 0011C3BC 000062E4 */   swc1      $f2, 0x0($3)
/* 1C4C0 0011C3C0 2AFF0010 */  b          .L0011C06C
/* 1C4C4 0011C3C4 2D808000 */   daddu     $16, $4, $0
.L0011C3C8:
/* 1C4C8 0011C3C8 00008044 */  mtc1       $0, $f0
/* 1C4CC 0011C3CC 32A00046 */  c.eq.s     $f20, $f0
/* 1C4D0 0011C3D0 00000000 */  nop
.L0011C3D4:
/* 1C4D4 0011C3D4 11000045 */  bc1f       .L0011C41C
/* 1C4D8 0011C3D8 06A30046 */   mov.s     $f12, $f20
/* 1C4DC 0011C3DC FFFF1026 */  addiu      $16, $16, -0x1
/* 1C4E0 0011C3E0 80101000 */  sll        $2, $16, 2
/* 1C4E4 0011C3E4 2118A203 */  addu       $3, $sp, $2
/* 1C4E8 0011C3E8 0000648C */  lw         $4, 0x0($3)
/* 1C4EC 0011C3EC 2C008014 */  bnez       $4, .L0011C4A0
/* 1C4F0 0011C3F0 F8FF5226 */   addiu     $18, $18, -0x8
/* 1C4F4 0011C3F4 07007132 */  andi       $17, $19, 0x7
.L0011C3F8:
/* 1C4F8 0011C3F8 FFFF1026 */  addiu      $16, $16, -0x1
/* 1C4FC 0011C3FC F8FF5226 */  addiu      $18, $18, -0x8
/* 1C500 0011C400 80101000 */  sll        $2, $16, 2
/* 1C504 0011C404 2118A203 */  addu       $3, $sp, $2
/* 1C508 0011C408 0000648C */  lw         $4, 0x0($3)
/* 1C50C 0011C40C FAFF8010 */  beqz       $4, .L0011C3F8
/* 1C510 0011C410 00000000 */   nop
/* 1C514 0011C414 23000010 */  b          .L0011C4A4
/* 1C518 0011C418 00000000 */   nop
.L0011C41C:
/* 1C51C 0011C41C B012040C */  jal        scalbnf
/* 1C520 0011C420 23201200 */   negu      $4, $18
/* 1C524 0011C424 8043013C */  lui        $at, (0x43800000 >> 16)
/* 1C528 0011C428 00088144 */  mtc1       $at, $f1
/* 1C52C 0011C42C 06050046 */  mov.s      $f20, $f0
/* 1C530 0011C430 36081446 */  c.le.s     $f1, $f20
/* 1C534 0011C434 00000000 */  nop
/* 1C538 0011C438 14000045 */  bc1f       .L0011C48C
/* 1C53C 0011C43C 2120BE03 */   addu      $4, $sp, $fp
/* 1C540 0011C440 803B013C */  lui        $at, (0x3B800000 >> 16)
/* 1C544 0011C444 00008144 */  mtc1       $at, $f0
/* 1C548 0011C448 01001026 */  addiu      $16, $16, 0x1
/* 1C54C 0011C44C 80101000 */  sll        $2, $16, 2
/* 1C550 0011C450 02A00046 */  mul.s      $f0, $f20, $f0
/* 1C554 0011C454 2118A203 */  addu       $3, $sp, $2
/* 1C558 0011C458 07007132 */  andi       $17, $19, 0x7
/* 1C55C 0011C45C A4000046 */  .word      0x460000A4                    # cvt.w.s    $f2, $f0 # 00000000
/* 1C560 0011C460 00100244 */  mfc1       $2, $f2
/* 1C564 0011C464 00108244 */  mtc1       $2, $f2
/* 1C568 0011C468 A0108046 */  cvt.s.w    $f2, $f2
/* 1C56C 0011C46C 02100146 */  mul.s      $f0, $f2, $f1
/* 1C570 0011C470 01A00046 */  sub.s      $f0, $f20, $f0
/* 1C574 0011C474 64000046 */  .word      0x46000064                    # cvt.w.s    $f1, $f0 # 00000000
/* 1C578 0011C478 000081E4 */  swc1       $f1, 0x0($4)
/* 1C57C 0011C47C 24100046 */  .word      0x46001024                    # cvt.w.s    $f0, $f2 # 00000000
/* 1C580 0011C480 000060E4 */  swc1       $f0, 0x0($3)
/* 1C584 0011C484 07000010 */  b          .L0011C4A4
/* 1C588 0011C488 08005226 */   addiu     $18, $18, 0x8
.L0011C48C:
/* 1C58C 0011C48C 2110BE03 */  addu       $2, $sp, $fp
/* 1C590 0011C490 24A00046 */  .word      0x4600A024                    # cvt.w.s    $f0, $f20 # 00000000
/* 1C594 0011C494 000040E4 */  swc1       $f0, 0x0($2)
/* 1C598 0011C498 02000010 */  b          .L0011C4A4
/* 1C59C 0011C49C 07007132 */   andi      $17, $19, 0x7
.L0011C4A0:
/* 1C5A0 0011C4A0 07007132 */  andi       $17, $19, 0x7
.L0011C4A4:
/* 1C5A4 0011C4A4 803F013C */  lui        $at, (0x3F800000 >> 16)
/* 1C5A8 0011C4A8 00608144 */  mtc1       $at, $f12
/* 1C5AC 0011C4AC B012040C */  jal        scalbnf
/* 1C5B0 0011C4B0 2D204002 */   daddu     $4, $18, $0
/* 1C5B4 0011C4B4 2D300002 */  daddu      $6, $16, $0
/* 1C5B8 0011C4B8 1100C004 */  bltz       $6, .L0011C500
/* 1C5BC 0011C4BC 86000046 */   mov.s     $f2, $f0
/* 1C5C0 0011C4C0 80100600 */  sll        $2, $6, 2
/* 1C5C4 0011C4C4 803B013C */  lui        $at, (0x3B800000 >> 16)
/* 1C5C8 0011C4C8 00088144 */  mtc1       $at, $f1
/* 1C5CC 0011C4CC 21185D00 */  addu       $3, $2, $sp
/* 1C5D0 0011C4D0 21105500 */  addu       $2, $2, $21
/* 1C5D4 0011C4D4 00000000 */  nop
.L0011C4D8:
/* 1C5D8 0011C4D8 000060C4 */  lwc1       $f0, 0x0($3)
/* 1C5DC 0011C4DC 20008046 */  cvt.s.w    $f0, $f0
/* 1C5E0 0011C4E0 FFFFC624 */  addiu      $6, $6, -0x1
/* 1C5E4 0011C4E4 FCFF6324 */  addiu      $3, $3, -0x4
/* 1C5E8 0011C4E8 02100046 */  mul.s      $f0, $f2, $f0
/* 1C5EC 0011C4EC 82100146 */  mul.s      $f2, $f2, $f1
/* 1C5F0 0011C4F0 000040E4 */  swc1       $f0, 0x0($2)
/* 1C5F4 0011C4F4 F8FFC104 */  bgez       $6, .L0011C4D8
/* 1C5F8 0011C4F8 FCFF4224 */   addiu     $2, $2, -0x4
/* 1C5FC 0011C4FC 2D300002 */  daddu      $6, $16, $0
.L0011C500:
/* 1C600 0011C500 2700C204 */  bltzl      $6, .L0011C5A0
/* 1C604 0011C504 5001A38F */   lw        $3, 0x150($sp)
/* 1C608 0011C508 A000A727 */  addiu      $7, $sp, 0xA0
/* 1C60C 0011C50C 00000000 */  nop
.L0011C510:
/* 1C610 0011C510 5401A28F */  lw         $2, 0x154($sp)
/* 1C614 0011C514 00108044 */  mtc1       $0, $f2
/* 1C618 0011C518 19004014 */  bnez       $2, .L0011C580
/* 1C61C 0011C51C 2D400000 */   daddu     $8, $0, $0
/* 1C620 0011C520 23480602 */  subu       $9, $16, $6
/* 1C624 0011C524 17002005 */  bltz       $9, .L0011C584
/* 1C628 0011C528 2D502001 */   daddu     $10, $9, $0
/* 1C62C 0011C52C FFFFC524 */  addiu      $5, $6, -0x1
/* 1C630 0011C530 2A000B3C */  lui        $11, %hi(PIo2_4)
/* 1C634 0011C534 00000000 */  nop
.L0011C538:
/* 1C638 0011C538 2118C800 */  addu       $3, $6, $8
/* 1C63C 0011C53C 80200800 */  sll        $4, $8, 2
/* 1C640 0011C540 E8886225 */  addiu      $2, $11, %lo(PIo2_4)
/* 1C644 0011C544 80180300 */  sll        $3, $3, 2
/* 1C648 0011C548 21208200 */  addu       $4, $4, $2
/* 1C64C 0011C54C 2118A302 */  addu       $3, $21, $3
/* 1C650 0011C550 000080C4 */  lwc1       $f0, 0x0($4)
/* 1C654 0011C554 01000825 */  addiu      $8, $8, 0x1
/* 1C658 0011C558 000061C4 */  lwc1       $f1, 0x0($3)
/* 1C65C 0011C55C 2A108802 */  slt        $2, $20, $8
/* 1C660 0011C560 02000146 */  mul.s      $f0, $f0, $f1
/* 1C664 0011C564 08004014 */  bnez       $2, .L0011C588
/* 1C668 0011C568 80100046 */   add.s     $f2, $f2, $f0
/* 1C66C 0011C56C 2A104801 */  slt        $2, $10, $8
/* 1C670 0011C570 F1FF4010 */  beqz       $2, .L0011C538
/* 1C674 0011C574 80100900 */   sll       $2, $9, 2
/* 1C678 0011C578 05000010 */  b          .L0011C590
/* 1C67C 0011C57C 2D30A000 */   daddu     $6, $5, $0
.L0011C580:
/* 1C680 0011C580 23480602 */  subu       $9, $16, $6
.L0011C584:
/* 1C684 0011C584 FFFFC524 */  addiu      $5, $6, -0x1
.L0011C588:
/* 1C688 0011C588 80100900 */  sll        $2, $9, 2
/* 1C68C 0011C58C 2D30A000 */  daddu      $6, $5, $0
.L0011C590:
/* 1C690 0011C590 2110E200 */  addu       $2, $7, $2
/* 1C694 0011C594 DEFFC104 */  bgez       $6, .L0011C510
/* 1C698 0011C598 000042E4 */   swc1      $f2, 0x0($2)
/* 1C69C 0011C59C 5001A38F */  lw         $3, 0x150($sp)
.L0011C5A0:
/* 1C6A0 0011C5A0 07006010 */  beqz       $3, .L0011C5C0
/* 1C6A4 0011C5A4 4401A48F */   lw        $4, 0x144($sp)
/* 1C6A8 0011C5A8 1F00805C */  bgtzl      $4, .L0011C628
/* 1C6AC 0011C5AC 2D300002 */   daddu     $6, $16, $0
/* 1C6B0 0011C5B0 09008010 */  beqz       $4, .L0011C5D8
/* 1C6B4 0011C5B4 2D102002 */   daddu     $2, $17, $0
/* 1C6B8 0011C5B8 8C000010 */  b          .L0011C7EC
/* 1C6BC 0011C5BC F001BFDF */   ld        $31, 0x1F0($sp)
.L0011C5C0:
/* 1C6C0 0011C5C0 4401A58F */  lw         $5, 0x144($sp)
/* 1C6C4 0011C5C4 03000224 */  addiu      $2, $0, 0x3
/* 1C6C8 0011C5C8 4000A210 */  beq        $5, $2, .L0011C6CC
/* 1C6CC 0011C5CC 2D102002 */   daddu     $2, $17, $0
/* 1C6D0 0011C5D0 86000010 */  b          .L0011C7EC
/* 1C6D4 0011C5D4 F001BFDF */   ld        $31, 0x1F0($sp)
.L0011C5D8:
/* 1C6D8 0011C5D8 2D300002 */  daddu      $6, $16, $0
/* 1C6DC 0011C5DC 00108044 */  mtc1       $0, $f2
/* 1C6E0 0011C5E0 0B00C204 */  bltzl      $6, .L0011C610
/* 1C6E4 0011C5E4 0000E2E6 */   swc1      $f2, 0x0($23)
/* 1C6E8 0011C5E8 A000A727 */  addiu      $7, $sp, 0xA0
/* 1C6EC 0011C5EC 00000000 */  nop
.L0011C5F0:
/* 1C6F0 0011C5F0 80100600 */  sll        $2, $6, 2
/* 1C6F4 0011C5F4 2110E200 */  addu       $2, $7, $2
/* 1C6F8 0011C5F8 FFFFC624 */  addiu      $6, $6, -0x1
/* 1C6FC 0011C5FC 000040C4 */  lwc1       $f0, 0x0($2)
/* 1C700 0011C600 80100046 */  add.s      $f2, $f2, $f0
/* 1C704 0011C604 FAFFC104 */  bgez       $6, .L0011C5F0
/* 1C708 0011C608 00000000 */   nop
/* 1C70C 0011C60C 0000E2E6 */  swc1       $f2, 0x0($23)
.L0011C610:
/* 1C710 0011C610 4C01A68F */  lw         $6, 0x14C($sp)
/* 1C714 0011C614 7400C010 */  beqz       $6, .L0011C7E8
/* 1C718 0011C618 2D102002 */   daddu     $2, $17, $0
/* 1C71C 0011C61C 07100046 */  neg.s      $f0, $f2
/* 1C720 0011C620 71000010 */  b          .L0011C7E8
/* 1C724 0011C624 0000E0E6 */   swc1      $f0, 0x0($23)
.L0011C628:
/* 1C728 0011C628 00108044 */  mtc1       $0, $f2
/* 1C72C 0011C62C 0D00C004 */  bltz       $6, .L0011C664
/* 1C730 0011C630 A000A3C7 */   lwc1      $f3, 0xA0($sp)
/* 1C734 0011C634 A000A727 */  addiu      $7, $sp, 0xA0
/* 1C738 0011C638 0100C328 */  slti       $3, $6, 0x1
/* 1C73C 0011C63C 00000000 */  nop
.L0011C640:
/* 1C740 0011C640 80100600 */  sll        $2, $6, 2
/* 1C744 0011C644 2110E200 */  addu       $2, $7, $2
/* 1C748 0011C648 FFFFC624 */  addiu      $6, $6, -0x1
/* 1C74C 0011C64C 000040C4 */  lwc1       $f0, 0x0($2)
/* 1C750 0011C650 80100046 */  add.s      $f2, $f2, $f0
/* 1C754 0011C654 FAFFC104 */  bgez       $6, .L0011C640
/* 1C758 0011C658 00000000 */   nop
/* 1C75C 0011C65C 03000010 */  b          .L0011C66C
/* 1C760 0011C660 0000E2E6 */   swc1      $f2, 0x0($23)
.L0011C664:
/* 1C764 0011C664 0100C328 */  slti       $3, $6, 0x1
/* 1C768 0011C668 0000E2E6 */  swc1       $f2, 0x0($23)
.L0011C66C:
/* 1C76C 0011C66C 4C01A88F */  lw         $8, 0x14C($sp)
/* 1C770 0011C670 04000051 */  beql       $8, $0, .L0011C684
/* 1C774 0011C674 81180246 */   sub.s     $f2, $f3, $f2
/* 1C778 0011C678 07100046 */  neg.s      $f0, $f2
/* 1C77C 0011C67C 0000E0E6 */  swc1       $f0, 0x0($23)
/* 1C780 0011C680 81180246 */  sub.s      $f2, $f3, $f2
.L0011C684:
/* 1C784 0011C684 0A006014 */  bnez       $3, .L0011C6B0
/* 1C788 0011C688 01000624 */   addiu     $6, $0, 0x1
/* 1C78C 0011C68C A000A727 */  addiu      $7, $sp, 0xA0
.L0011C690:
/* 1C790 0011C690 80100600 */  sll        $2, $6, 2
/* 1C794 0011C694 2110E200 */  addu       $2, $7, $2
/* 1C798 0011C698 0100C624 */  addiu      $6, $6, 0x1
/* 1C79C 0011C69C 000040C4 */  lwc1       $f0, 0x0($2)
/* 1C7A0 0011C6A0 2A180602 */  slt        $3, $16, $6
/* 1C7A4 0011C6A4 80100046 */  add.s      $f2, $f2, $f0
/* 1C7A8 0011C6A8 F9FF6010 */  beqz       $3, .L0011C690
/* 1C7AC 0011C6AC 00000000 */   nop
.L0011C6B0:
/* 1C7B0 0011C6B0 0400E2E6 */  swc1       $f2, 0x4($23)
/* 1C7B4 0011C6B4 4C01A28F */  lw         $2, 0x14C($sp)
/* 1C7B8 0011C6B8 4B004010 */  beqz       $2, .L0011C7E8
/* 1C7BC 0011C6BC 2D102002 */   daddu     $2, $17, $0
/* 1C7C0 0011C6C0 07100046 */  neg.s      $f0, $f2
/* 1C7C4 0011C6C4 48000010 */  b          .L0011C7E8
/* 1C7C8 0011C6C8 0400E0E6 */   swc1      $f0, 0x4($23)
.L0011C6CC:
/* 1C7CC 0011C6CC 2D300002 */  daddu      $6, $16, $0
/* 1C7D0 0011C6D0 1300C018 */  blez       $6, .L0011C720
/* 1C7D4 0011C6D4 0200C228 */   slti      $2, $6, 0x2
/* 1C7D8 0011C6D8 A000A727 */  addiu      $7, $sp, 0xA0
/* 1C7DC 0011C6DC 00000000 */  nop
.L0011C6E0:
/* 1C7E0 0011C6E0 FFFFC424 */  addiu      $4, $6, -0x1
/* 1C7E4 0011C6E4 80100600 */  sll        $2, $6, 2
/* 1C7E8 0011C6E8 80180400 */  sll        $3, $4, 2
/* 1C7EC 0011C6EC 2110E200 */  addu       $2, $7, $2
/* 1C7F0 0011C6F0 2118E300 */  addu       $3, $7, $3
/* 1C7F4 0011C6F4 000041C4 */  lwc1       $f1, 0x0($2)
/* 1C7F8 0011C6F8 000060C4 */  lwc1       $f0, 0x0($3)
/* 1C7FC 0011C6FC 2D308000 */  daddu      $6, $4, $0
/* 1C800 0011C700 80000146 */  add.s      $f2, $f0, $f1
/* 1C804 0011C704 01000246 */  sub.s      $f0, $f0, $f2
/* 1C808 0011C708 40080046 */  add.s      $f1, $f1, $f0
/* 1C80C 0011C70C 000041E4 */  swc1       $f1, 0x0($2)
/* 1C810 0011C710 F3FFC01C */  bgtz       $6, .L0011C6E0
/* 1C814 0011C714 000062E4 */   swc1      $f2, 0x0($3)
/* 1C818 0011C718 2D300002 */  daddu      $6, $16, $0
/* 1C81C 0011C71C 0200C228 */  slti       $2, $6, 0x2
.L0011C720:
/* 1C820 0011C720 13004054 */  bnel       $2, $0, .L0011C770
/* 1C824 0011C724 2D300002 */   daddu     $6, $16, $0
/* 1C828 0011C728 A000A727 */  addiu      $7, $sp, 0xA0
/* 1C82C 0011C72C 00000000 */  nop
.L0011C730:
/* 1C830 0011C730 FFFFC424 */  addiu      $4, $6, -0x1
/* 1C834 0011C734 80100600 */  sll        $2, $6, 2
/* 1C838 0011C738 80180400 */  sll        $3, $4, 2
/* 1C83C 0011C73C 2110E200 */  addu       $2, $7, $2
/* 1C840 0011C740 2118E300 */  addu       $3, $7, $3
/* 1C844 0011C744 000041C4 */  lwc1       $f1, 0x0($2)
/* 1C848 0011C748 000060C4 */  lwc1       $f0, 0x0($3)
/* 1C84C 0011C74C 2D308000 */  daddu      $6, $4, $0
/* 1C850 0011C750 0200C528 */  slti       $5, $6, 0x2
/* 1C854 0011C754 80000146 */  add.s      $f2, $f0, $f1
/* 1C858 0011C758 01000246 */  sub.s      $f0, $f0, $f2
/* 1C85C 0011C75C 40080046 */  add.s      $f1, $f1, $f0
/* 1C860 0011C760 000041E4 */  swc1       $f1, 0x0($2)
/* 1C864 0011C764 F2FFA010 */  beqz       $5, .L0011C730
/* 1C868 0011C768 000062E4 */   swc1      $f2, 0x0($3)
/* 1C86C 0011C76C 2D300002 */  daddu      $6, $16, $0
.L0011C770:
/* 1C870 0011C770 00108044 */  mtc1       $0, $f2
/* 1C874 0011C774 0200C228 */  slti       $2, $6, 0x2
/* 1C878 0011C778 0D004014 */  bnez       $2, .L0011C7B0
/* 1C87C 0011C77C A000A3C7 */   lwc1      $f3, 0xA0($sp)
/* 1C880 0011C780 A000A727 */  addiu      $7, $sp, 0xA0
/* 1C884 0011C784 A400A1C7 */  lwc1       $f1, 0xA4($sp)
.L0011C788:
/* 1C888 0011C788 80100600 */  sll        $2, $6, 2
/* 1C88C 0011C78C 2110E200 */  addu       $2, $7, $2
/* 1C890 0011C790 FFFFC624 */  addiu      $6, $6, -0x1
/* 1C894 0011C794 000040C4 */  lwc1       $f0, 0x0($2)
/* 1C898 0011C798 0200C328 */  slti       $3, $6, 0x2
/* 1C89C 0011C79C 80100046 */  add.s      $f2, $f2, $f0
/* 1C8A0 0011C7A0 F9FF6010 */  beqz       $3, .L0011C788
/* 1C8A4 0011C7A4 00000000 */   nop
/* 1C8A8 0011C7A8 03000010 */  b          .L0011C7B8
/* 1C8AC 0011C7AC 4C01A38F */   lw        $3, 0x14C($sp)
.L0011C7B0:
/* 1C8B0 0011C7B0 A400A1C7 */  lwc1       $f1, 0xA4($sp)
/* 1C8B4 0011C7B4 4C01A38F */  lw         $3, 0x14C($sp)
.L0011C7B8:
/* 1C8B8 0011C7B8 05006054 */  bnel       $3, $0, .L0011C7D0
/* 1C8BC 0011C7BC 07180046 */   neg.s     $f0, $f3
/* 1C8C0 0011C7C0 0800E2E6 */  swc1       $f2, 0x8($23)
/* 1C8C4 0011C7C4 0000E3E6 */  swc1       $f3, 0x0($23)
/* 1C8C8 0011C7C8 06000010 */  b          .L0011C7E4
/* 1C8CC 0011C7CC 0400E1E6 */   swc1      $f1, 0x4($23)
.L0011C7D0:
/* 1C8D0 0011C7D0 47080046 */  neg.s      $f1, $f1
/* 1C8D4 0011C7D4 87100046 */  neg.s      $f2, $f2
/* 1C8D8 0011C7D8 0000E0E6 */  swc1       $f0, 0x0($23)
/* 1C8DC 0011C7DC 0400E1E6 */  swc1       $f1, 0x4($23)
/* 1C8E0 0011C7E0 0800E2E6 */  swc1       $f2, 0x8($23)
.L0011C7E4:
/* 1C8E4 0011C7E4 2D102002 */  daddu      $2, $17, $0
.L0011C7E8:
/* 1C8E8 0011C7E8 F001BFDF */  ld         $31, 0x1F0($sp)
.L0011C7EC:
/* 1C8EC 0011C7EC E001BEDF */  ld         $fp, 0x1E0($sp)
/* 1C8F0 0011C7F0 D001B7DF */  ld         $23, 0x1D0($sp)
/* 1C8F4 0011C7F4 C001B6DF */  ld         $22, 0x1C0($sp)
/* 1C8F8 0011C7F8 B001B5DF */  ld         $21, 0x1B0($sp)
/* 1C8FC 0011C7FC A001B4DF */  ld         $20, 0x1A0($sp)
/* 1C900 0011C800 9001B3DF */  ld         $19, 0x190($sp)
/* 1C904 0011C804 8001B2DF */  ld         $18, 0x180($sp)
/* 1C908 0011C808 7001B1DF */  ld         $17, 0x170($sp)
/* 1C90C 0011C80C 6001B0DF */  ld         $16, 0x160($sp)
/* 1C910 0011C810 0002B4C7 */  lwc1       $f20, 0x200($sp)
/* 1C914 0011C814 0800E003 */  jr         $31
/* 1C918 0011C818 1002BD27 */   addiu     $sp, $sp, 0x210
/* 1C91C 0011C81C 00000000 */  nop