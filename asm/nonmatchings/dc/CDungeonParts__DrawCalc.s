.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawCalc__13CDungeonPartsFiiii
/* C1950 001C1850 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* C1954 001C1854 8000BF7F */  sq         $31, 0x80($sp)
/* C1958 001C1858 7000B77F */  sq         $23, 0x70($sp)
/* C195C 001C185C 6000B67F */  sq         $22, 0x60($sp)
/* C1960 001C1860 5000B57F */  sq         $21, 0x50($sp)
/* C1964 001C1864 4000B47F */  sq         $20, 0x40($sp)
/* C1968 001C1868 3000B37F */  sq         $19, 0x30($sp)
/* C196C 001C186C 2000B27F */  sq         $18, 0x20($sp)
/* C1970 001C1870 1000B17F */  sq         $17, 0x10($sp)
/* C1974 001C1874 0000B07F */  sq         $16, 0x0($sp)
/* C1978 001C1878 28AE8070 */  paddub     $21, $4, $0
/* C197C 001C187C 28A6A070 */  paddub     $20, $5, $0
/* C1980 001C1880 289EC070 */  paddub     $19, $6, $0
/* C1984 001C1884 2896E070 */  paddub     $18, $7, $0
/* C1988 001C1888 28B60071 */  paddub     $22, $8, $0
/* C198C 001C188C 28860070 */  paddub     $16, $0, $0
/* C1990 001C1890 48000010 */  b          .L001C19B4
/* C1994 001C1894 00000000 */   nop
.L001C1898:
/* C1998 001C1898 80181000 */  sll        $3, $16, 2
/* C199C 001C189C 21187500 */  addu       $3, $3, $21
/* C19A0 001C18A0 B0017724 */  addiu      $23, $3, 0x1B0
/* C19A4 001C18A4 B001718C */  lw         $17, 0x1B0($3)
/* C19A8 001C18A8 41002012 */  beqz       $17, .L001C19B0
/* C19AC 001C18AC 00000000 */   nop
/* C19B0 001C18B0 0001A286 */  lh         $2, 0x100($21)
/* C19B4 001C18B4 00008244 */  mtc1       $2, $f0
/* C19B8 001C18B8 00000000 */  nop
/* C19BC 001C18BC 60008046 */  cvt.s.w    $f1, $f0
/* C19C0 001C18C0 700160C4 */  lwc1       $f0, 0x170($3)
/* C19C4 001C18C4 000B0046 */  add.s      $f12, $f1, $f0
/* C19C8 001C18C8 2C44040C */  jal        fptosi
/* C19CC 001C18CC 00000000 */   nop
/* C19D0 001C18D0 04004128 */  slti       $at, $2, 0x4
/* C19D4 001C18D4 02002014 */  bnez       $at, .L001C18E0
/* C19D8 001C18D8 00000000 */   nop
/* C19DC 001C18DC FDFF4224 */  addiu      $2, $2, -0x3
.L001C18E0:
/* C19E0 001C18E0 00008244 */  mtc1       $2, $f0
/* C19E4 001C18E4 00000000 */  nop
/* C19E8 001C18E8 60038046 */  cvt.s.w    $f13, $f0
/* C19EC 001C18EC 4040023C */  lui        $2, (0x40400000 >> 16)
/* C19F0 001C18F0 00008244 */  mtc1       $2, $f0
/* C19F4 001C18F4 00000000 */  nop
/* C19F8 001C18F8 32000D46 */  c.eq.s     $f0, $f13
/* C19FC 001C18FC 00000000 */  nop
/* C1A00 001C1900 03000045 */  bc1f       .L001C1910
/* C1A04 001C1904 00000000 */   nop
/* C1A08 001C1908 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* C1A0C 001C190C 00688244 */  mtc1       $2, $f13
.L001C1910:
/* C1A10 001C1910 B4C2023C */  lui        $2, (0xC2B40000 >> 16)
/* C1A14 001C1914 00008244 */  mtc1       $2, $f0
/* C1A18 001C1918 00000000 */  nop
/* C1A1C 001C191C 42000D46 */  mul.s      $f1, $f0, $f13
/* C1A20 001C1920 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* C1A24 001C1924 42000146 */  mul.s      $f1, $f0, $f1
/* C1A28 001C1928 3443023C */  lui        $2, (0x43340000 >> 16)
/* C1A2C 001C192C 00008244 */  mtc1       $2, $f0
/* C1A30 001C1930 00000000 */  nop
/* C1A34 001C1934 430B0046 */  div.s      $f13, $f1, $f0
/* C1A38 001C1938 00608044 */  mtc1       $0, $f12
/* C1A3C 001C193C 00000000 */  nop
/* C1A40 001C1940 86630046 */  mov.s      $f14, $f12
/* C1A44 001C1944 28262072 */  paddub     $4, $17, $0
/* C1A48 001C1948 70A3040C */  jal        SetRotation__6CFrameFfff
/* C1A4C 001C194C 00000000 */   nop
/* C1A50 001C1950 9000A427 */  addiu      $4, $sp, 0x90
/* C1A54 001C1954 F000A526 */  addiu      $5, $21, 0xF0
/* C1A58 001C1958 0C86040C */  jal        sceVu0CopyVector
/* C1A5C 001C195C 00000000 */   nop
/* C1A60 001C1960 00111000 */  sll        $2, $16, 4
/* C1A64 001C1964 21105500 */  addu       $2, $2, $21
/* C1A68 001C1968 100141C4 */  lwc1       $f1, 0x110($2)
/* C1A6C 001C196C 9000A0C7 */  lwc1       $f0, 0x90($sp)
/* C1A70 001C1970 00000146 */  add.s      $f0, $f0, $f1
/* C1A74 001C1974 9000A0E7 */  swc1       $f0, 0x90($sp)
/* C1A78 001C1978 140141C4 */  lwc1       $f1, 0x114($2)
/* C1A7C 001C197C 9400A0C7 */  lwc1       $f0, 0x94($sp)
/* C1A80 001C1980 00000146 */  add.s      $f0, $f0, $f1
/* C1A84 001C1984 9400A0E7 */  swc1       $f0, 0x94($sp)
/* C1A88 001C1988 180141C4 */  lwc1       $f1, 0x118($2)
/* C1A8C 001C198C 9800A0C7 */  lwc1       $f0, 0x98($sp)
/* C1A90 001C1990 00000146 */  add.s      $f0, $f0, $f1
/* C1A94 001C1994 9800A0E7 */  swc1       $f0, 0x98($sp)
/* C1A98 001C1998 803F023C */  lui        $2, (0x3F800000 >> 16)
/* C1A9C 001C199C 9C00A2AF */  sw         $2, 0x9C($sp)
/* C1AA0 001C19A0 0000E48E */  lw         $4, 0x0($23)
/* C1AA4 001C19A4 9000A527 */  addiu      $5, $sp, 0x90
/* C1AA8 001C19A8 B89F040C */  jal        SetPosition__6CFrameFPf
/* C1AAC 001C19AC 00000000 */   nop
.L001C19B0:
/* C1AB0 001C19B0 01001026 */  addiu      $16, $16, 0x1
.L001C19B4:
/* C1AB4 001C19B4 0600032A */  slti       $3, $16, 0x6
/* C1AB8 001C19B8 B7FF6014 */  bnez       $3, .L001C1898
/* C1ABC 001C19BC 00000000 */   nop
/* C1AC0 001C19C0 0C00B08E */  lw         $16, 0xC($21)
/* C1AC4 001C19C4 68000012 */  beqz       $16, .L001C1B68
/* C1AC8 001C19C8 00000000 */   nop
/* C1ACC 001C19CC 01000224 */  addiu      $2, $0, 0x1
/* C1AD0 001C19D0 2D00C216 */  bne        $22, $2, .L001C1A88
/* C1AD4 001C19D4 00000000 */   nop
/* C1AD8 001C19D8 1000A286 */  lh         $2, 0x10($21)
/* C1ADC 001C19DC 21184202 */  addu       $3, $18, $2
/* C1AE0 001C19E0 04006128 */  slti       $at, $3, 0x4
/* C1AE4 001C19E4 02002014 */  bnez       $at, .L001C19F0
/* C1AE8 001C19E8 00000000 */   nop
/* C1AEC 001C19EC FDFF6324 */  addiu      $3, $3, -0x3
.L001C19F0:
/* C1AF0 001C19F0 03000224 */  addiu      $2, $0, 0x3
/* C1AF4 001C19F4 02006214 */  bne        $3, $2, .L001C1A00
/* C1AF8 001C19F8 00000000 */   nop
/* C1AFC 001C19FC FFFF0324 */  addiu      $3, $0, -0x1
.L001C1A00:
/* C1B00 001C1A00 B4C2023C */  lui        $2, (0xC2B40000 >> 16)
/* C1B04 001C1A04 00088244 */  mtc1       $2, $f1
/* C1B08 001C1A08 00008344 */  mtc1       $3, $f0
/* C1B0C 001C1A0C 00000000 */  nop
/* C1B10 001C1A10 20008046 */  cvt.s.w    $f0, $f0
/* C1B14 001C1A14 42080046 */  mul.s      $f1, $f1, $f0
/* C1B18 001C1A18 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* C1B1C 001C1A1C 42000146 */  mul.s      $f1, $f0, $f1
/* C1B20 001C1A20 3443023C */  lui        $2, (0x43340000 >> 16)
/* C1B24 001C1A24 00008244 */  mtc1       $2, $f0
/* C1B28 001C1A28 00000000 */  nop
/* C1B2C 001C1A2C 430B0046 */  div.s      $f13, $f1, $f0
/* C1B30 001C1A30 00608044 */  mtc1       $0, $f12
/* C1B34 001C1A34 00000000 */  nop
/* C1B38 001C1A38 86630046 */  mov.s      $f14, $f12
/* C1B3C 001C1A3C 28260072 */  paddub     $4, $16, $0
/* C1B40 001C1A40 70A3040C */  jal        SetRotation__6CFrameFfff
/* C1B44 001C1A44 00000000 */   nop
/* C1B48 001C1A48 2043023C */  lui        $2, (0x43200000 >> 16)
/* C1B4C 001C1A4C 00088244 */  mtc1       $2, $f1
/* C1B50 001C1A50 00009444 */  mtc1       $20, $f0
/* C1B54 001C1A54 00000000 */  nop
/* C1B58 001C1A58 20008046 */  cvt.s.w    $f0, $f0
/* C1B5C 001C1A5C 020B0046 */  mul.s      $f12, $f1, $f0
/* C1B60 001C1A60 00009344 */  mtc1       $19, $f0
/* C1B64 001C1A64 00000000 */  nop
/* C1B68 001C1A68 20008046 */  cvt.s.w    $f0, $f0
/* C1B6C 001C1A6C 820B0046 */  mul.s      $f14, $f1, $f0
/* C1B70 001C1A70 00688044 */  mtc1       $0, $f13
/* C1B74 001C1A74 0C00A48E */  lw         $4, 0xC($21)
/* C1B78 001C1A78 A09F040C */  jal        SetPosition__6CFrameFfff
/* C1B7C 001C1A7C 00000000 */   nop
/* C1B80 001C1A80 39000010 */  b          .L001C1B68
/* C1B84 001C1A84 00000000 */   nop
.L001C1A88:
/* C1B88 001C1A88 7001A1C6 */  lwc1       $f1, 0x170($21)
/* C1B8C 001C1A8C 1000A286 */  lh         $2, 0x10($21)
/* C1B90 001C1A90 00008244 */  mtc1       $2, $f0
/* C1B94 001C1A94 00000000 */  nop
/* C1B98 001C1A98 20008046 */  cvt.s.w    $f0, $f0
/* C1B9C 001C1A9C 000B0046 */  add.s      $f12, $f1, $f0
/* C1BA0 001C1AA0 2C44040C */  jal        fptosi
/* C1BA4 001C1AA4 00000000 */   nop
/* C1BA8 001C1AA8 04004128 */  slti       $at, $2, 0x4
/* C1BAC 001C1AAC 02002014 */  bnez       $at, .L001C1AB8
/* C1BB0 001C1AB0 00000000 */   nop
/* C1BB4 001C1AB4 FDFF4224 */  addiu      $2, $2, -0x3
.L001C1AB8:
/* C1BB8 001C1AB8 03000324 */  addiu      $3, $0, 0x3
/* C1BBC 001C1ABC 02004314 */  bne        $2, $3, .L001C1AC8
/* C1BC0 001C1AC0 00000000 */   nop
/* C1BC4 001C1AC4 FFFF0224 */  addiu      $2, $0, -0x1
.L001C1AC8:
/* C1BC8 001C1AC8 B4C2033C */  lui        $3, (0xC2B40000 >> 16)
/* C1BCC 001C1ACC 00088344 */  mtc1       $3, $f1
/* C1BD0 001C1AD0 00008244 */  mtc1       $2, $f0
/* C1BD4 001C1AD4 00000000 */  nop
/* C1BD8 001C1AD8 20008046 */  cvt.s.w    $f0, $f0
/* C1BDC 001C1ADC 42080046 */  mul.s      $f1, $f1, $f0
/* C1BE0 001C1AE0 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* C1BE4 001C1AE4 42000146 */  mul.s      $f1, $f0, $f1
/* C1BE8 001C1AE8 3443023C */  lui        $2, (0x43340000 >> 16)
/* C1BEC 001C1AEC 00008244 */  mtc1       $2, $f0
/* C1BF0 001C1AF0 00000000 */  nop
/* C1BF4 001C1AF4 430B0046 */  div.s      $f13, $f1, $f0
/* C1BF8 001C1AF8 00608044 */  mtc1       $0, $f12
/* C1BFC 001C1AFC 00000000 */  nop
/* C1C00 001C1B00 86630046 */  mov.s      $f14, $f12
/* C1C04 001C1B04 28260072 */  paddub     $4, $16, $0
/* C1C08 001C1B08 70A3040C */  jal        SetRotation__6CFrameFfff
/* C1C0C 001C1B0C 00000000 */   nop
/* C1C10 001C1B10 9000A427 */  addiu      $4, $sp, 0x90
/* C1C14 001C1B14 F000A526 */  addiu      $5, $21, 0xF0
/* C1C18 001C1B18 0C86040C */  jal        sceVu0CopyVector
/* C1C1C 001C1B1C 00000000 */   nop
/* C1C20 001C1B20 1001A1C6 */  lwc1       $f1, 0x110($21)
/* C1C24 001C1B24 9000A0C7 */  lwc1       $f0, 0x90($sp)
/* C1C28 001C1B28 00000146 */  add.s      $f0, $f0, $f1
/* C1C2C 001C1B2C 9000A0E7 */  swc1       $f0, 0x90($sp)
/* C1C30 001C1B30 1401A1C6 */  lwc1       $f1, 0x114($21)
/* C1C34 001C1B34 9400A0C7 */  lwc1       $f0, 0x94($sp)
/* C1C38 001C1B38 00000146 */  add.s      $f0, $f0, $f1
/* C1C3C 001C1B3C 9400A0E7 */  swc1       $f0, 0x94($sp)
/* C1C40 001C1B40 1801A1C6 */  lwc1       $f1, 0x118($21)
/* C1C44 001C1B44 9800A0C7 */  lwc1       $f0, 0x98($sp)
/* C1C48 001C1B48 00000146 */  add.s      $f0, $f0, $f1
/* C1C4C 001C1B4C 9800A0E7 */  swc1       $f0, 0x98($sp)
/* C1C50 001C1B50 803F023C */  lui        $2, (0x3F800000 >> 16)
/* C1C54 001C1B54 9C00A2AF */  sw         $2, 0x9C($sp)
/* C1C58 001C1B58 0C00A48E */  lw         $4, 0xC($21)
/* C1C5C 001C1B5C 1001A526 */  addiu      $5, $21, 0x110
/* C1C60 001C1B60 B89F040C */  jal        SetPosition__6CFrameFPf
/* C1C64 001C1B64 00000000 */   nop
.L001C1B68:
/* C1C68 001C1B68 8000BF7B */  lq         $31, 0x80($sp)
/* C1C6C 001C1B6C 7000B77B */  lq         $23, 0x70($sp)
/* C1C70 001C1B70 6000B67B */  lq         $22, 0x60($sp)
/* C1C74 001C1B74 5000B57B */  lq         $21, 0x50($sp)
/* C1C78 001C1B78 4000B47B */  lq         $20, 0x40($sp)
/* C1C7C 001C1B7C 3000B37B */  lq         $19, 0x30($sp)
/* C1C80 001C1B80 2000B27B */  lq         $18, 0x20($sp)
/* C1C84 001C1B84 1000B17B */  lq         $17, 0x10($sp)
/* C1C88 001C1B88 0000B07B */  lq         $16, 0x0($sp)
/* C1C8C 001C1B8C A000BD27 */  addiu      $sp, $sp, 0xA0
/* C1C90 001C1B90 0800E003 */  jr         $31
/* C1C94 001C1B94 00000000 */   nop
/* C1C98 001C1B98 00000000 */  nop
/* C1C9C 001C1B9C 00000000 */  nop
