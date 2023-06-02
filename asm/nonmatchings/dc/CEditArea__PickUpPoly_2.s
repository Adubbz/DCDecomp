.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PickUpPoly__9CEditAreaFP6CCPoly8CRect_i_
/* 6F830 0016F730 E0FEBD27 */  addiu      $sp, $sp, -0x120
/* 6F834 0016F734 9000BF7F */  sq         $31, 0x90($sp)
/* 6F838 0016F738 8000BE7F */  sq         $fp, 0x80($sp)
/* 6F83C 0016F73C 7000B77F */  sq         $23, 0x70($sp)
/* 6F840 0016F740 6000B67F */  sq         $22, 0x60($sp)
/* 6F844 0016F744 5000B57F */  sq         $21, 0x50($sp)
/* 6F848 0016F748 4000B47F */  sq         $20, 0x40($sp)
/* 6F84C 0016F74C 3000B37F */  sq         $19, 0x30($sp)
/* 6F850 0016F750 2000B27F */  sq         $18, 0x20($sp)
/* 6F854 0016F754 1000B17F */  sq         $17, 0x10($sp)
/* 6F858 0016F758 0000B07F */  sq         $16, 0x0($sp)
/* 6F85C 0016F75C 28AE8070 */  paddub     $21, $4, $0
/* 6F860 0016F760 28A6A070 */  paddub     $20, $5, $0
/* 6F864 0016F764 A000A327 */  addiu      $3, $sp, 0xA0
/* 6F868 0016F768 0000C278 */  lq         $2, 0x0($6)
/* 6F86C 0016F76C 0000627C */  sq         $2, 0x0($3)
/* 6F870 0016F770 28860070 */  paddub     $16, $0, $0
/* 6F874 0016F774 A000B18F */  lw         $17, 0xA0($sp)
/* 6F878 0016F778 A7000010 */  b          .L0016FA18
/* 6F87C 0016F77C 00000000 */   nop
.L0016F780:
/* 6F880 0016F780 A400B38F */  lw         $19, 0xA4($sp)
/* 6F884 0016F784 28966072 */  paddub     $18, $19, $0
/* 6F888 0016F788 9D000010 */  b          .L0016FA00
/* 6F88C 0016F78C 00000000 */   nop
.L0016F790:
/* 6F890 0016F790 9A002006 */  bltz       $17, .L0016F9FC
/* 6F894 0016F794 00000000 */   nop
/* 6F898 0016F798 0800A28E */  lw         $2, 0x8($21)
/* 6F89C 0016F79C 2A082202 */  slt        $at, $17, $2
/* 6F8A0 0016F7A0 96002010 */  beqz       $at, .L0016F9FC
/* 6F8A4 0016F7A4 00000000 */   nop
/* 6F8A8 0016F7A8 94004006 */  bltz       $18, .L0016F9FC
/* 6F8AC 0016F7AC 00000000 */   nop
/* 6F8B0 0016F7B0 0C00A28E */  lw         $2, 0xC($21)
/* 6F8B4 0016F7B4 2A084202 */  slt        $at, $18, $2
/* 6F8B8 0016F7B8 90002010 */  beqz       $at, .L0016F9FC
/* 6F8BC 0016F7BC 00000000 */   nop
/* 6F8C0 0016F7C0 2826A072 */  paddub     $4, $21, $0
/* 6F8C4 0016F7C4 282E2072 */  paddub     $5, $17, $0
/* 6F8C8 0016F7C8 28364072 */  paddub     $6, $18, $0
/* 6F8CC 0016F7CC F4B6050C */  jal        GetCode__9CEditAreaFii
/* 6F8D0 0016F7D0 00000000 */   nop
/* 6F8D4 0016F7D4 81000324 */  addiu      $3, $0, 0x81
/* 6F8D8 0016F7D8 88004310 */  beq        $2, $3, .L0016F9FC
/* 6F8DC 0016F7DC 00000000 */   nop
/* 6F8E0 0016F7E0 2826A072 */  paddub     $4, $21, $0
/* 6F8E4 0016F7E4 B000A527 */  addiu      $5, $sp, 0xB0
/* 6F8E8 0016F7E8 28362072 */  paddub     $6, $17, $0
/* 6F8EC 0016F7EC 283E0070 */  paddub     $7, $0, $0
/* 6F8F0 0016F7F0 28464072 */  paddub     $8, $18, $0
/* 6F8F4 0016F7F4 48B6050C */  jal        GetPos__9CEditAreaFP11CVector3_f_iii
/* 6F8F8 0016F7F8 00000000 */   nop
/* 6F8FC 0016F7FC 1001A427 */  addiu      $4, $sp, 0x110
/* 6F900 0016F800 282E0070 */  paddub     $5, $0, $0
/* 6F904 0016F804 10000624 */  addiu      $6, $0, 0x10
/* 6F908 0016F808 5A0D040C */  jal        memset
/* 6F90C 0016F80C 00000000 */   nop
/* 6F910 0016F810 0400A28E */  lw         $2, 0x4($21)
/* 6F914 0016F814 80180200 */  sll        $3, $2, 2
/* 6F918 0016F818 2600023C */  lui        $2, %hi(sound$740)
/* 6F91C 0016F81C D06E4224 */  addiu      $2, $2, %lo(sound$740)
/* 6F920 0016F820 21104300 */  addu       $2, $2, $3
/* 6F924 0016F824 00004284 */  lh         $2, 0x0($2)
/* 6F928 0016F828 1201A2A7 */  sh         $2, 0x112($sp)
/* 6F92C 0016F82C CC8082C7 */  lwc1       $f2, -0x7F34($gp)
/* 6F930 0016F830 2000A0C6 */  lwc1       $f0, 0x20($21)
/* 6F934 0016F834 42100046 */  mul.s      $f1, $f2, $f0
/* 6F938 0016F838 B000A0C7 */  lwc1       $f0, 0xB0($sp)
/* 6F93C 0016F83C 01000146 */  sub.s      $f0, $f0, $f1
/* 6F940 0016F840 C000A0E7 */  swc1       $f0, 0xC0($sp)
/* 6F944 0016F844 B400A0C7 */  lwc1       $f0, 0xB4($sp)
/* 6F948 0016F848 C400A0E7 */  swc1       $f0, 0xC4($sp)
/* 6F94C 0016F84C 2000A0C6 */  lwc1       $f0, 0x20($21)
/* 6F950 0016F850 42100046 */  mul.s      $f1, $f2, $f0
/* 6F954 0016F854 B800A0C7 */  lwc1       $f0, 0xB8($sp)
/* 6F958 0016F858 01000146 */  sub.s      $f0, $f0, $f1
/* 6F95C 0016F85C C800A227 */  addiu      $2, $sp, 0xC8
/* 6F960 0016F860 000040E4 */  swc1       $f0, 0x0($2)
/* 6F964 0016F864 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 6F968 0016F868 CC00A2AF */  sw         $2, 0xCC($sp)
/* 6F96C 0016F86C D000B627 */  addiu      $22, $sp, 0xD0
/* 6F970 0016F870 2826C072 */  paddub     $4, $22, $0
/* 6F974 0016F874 C000A527 */  addiu      $5, $sp, 0xC0
/* 6F978 0016F878 0C86040C */  jal        sceVu0CopyVector
/* 6F97C 0016F87C 00000000 */   nop
/* 6F980 0016F880 E000B727 */  addiu      $23, $sp, 0xE0
/* 6F984 0016F884 2826E072 */  paddub     $4, $23, $0
/* 6F988 0016F888 C000A527 */  addiu      $5, $sp, 0xC0
/* 6F98C 0016F88C 0C86040C */  jal        sceVu0CopyVector
/* 6F990 0016F890 00000000 */   nop
/* 6F994 0016F894 F000BE27 */  addiu      $fp, $sp, 0xF0
/* 6F998 0016F898 2826C073 */  paddub     $4, $fp, $0
/* 6F99C 0016F89C C000A527 */  addiu      $5, $sp, 0xC0
/* 6F9A0 0016F8A0 0C86040C */  jal        sceVu0CopyVector
/* 6F9A4 0016F8A4 00000000 */   nop
/* 6F9A8 0016F8A8 2000A2C6 */  lwc1       $f2, 0x20($21)
/* 6F9AC 0016F8AC 188180C7 */  lwc1       $f0, -0x7EE8($gp)
/* 6F9B0 0016F8B0 42000246 */  mul.s      $f1, $f0, $f2
/* 6F9B4 0016F8B4 C000A0C7 */  lwc1       $f0, 0xC0($sp)
/* 6F9B8 0016F8B8 00000246 */  add.s      $f0, $f0, $f2
/* 6F9BC 0016F8BC 00080046 */  add.s      $f0, $f1, $f0
/* 6F9C0 0016F8C0 0000C0E6 */  swc1       $f0, 0x0($22)
/* 6F9C4 0016F8C4 2000A3C6 */  lwc1       $f3, 0x20($21)
/* 6F9C8 0016F8C8 188182C7 */  lwc1       $f2, -0x7EE8($gp)
/* 6F9CC 0016F8CC 42100346 */  mul.s      $f1, $f2, $f3
/* 6F9D0 0016F8D0 C800A227 */  addiu      $2, $sp, 0xC8
/* 6F9D4 0016F8D4 000040C4 */  lwc1       $f0, 0x0($2)
/* 6F9D8 0016F8D8 00000346 */  add.s      $f0, $f0, $f3
/* 6F9DC 0016F8DC 00080046 */  add.s      $f0, $f1, $f0
/* 6F9E0 0016F8E0 E800A0E7 */  swc1       $f0, 0xE8($sp)
/* 6F9E4 0016F8E4 2000A3C6 */  lwc1       $f3, 0x20($21)
/* 6F9E8 0016F8E8 42100346 */  mul.s      $f1, $f2, $f3
/* 6F9EC 0016F8EC C000A0C7 */  lwc1       $f0, 0xC0($sp)
/* 6F9F0 0016F8F0 00000346 */  add.s      $f0, $f0, $f3
/* 6F9F4 0016F8F4 00080046 */  add.s      $f0, $f1, $f0
/* 6F9F8 0016F8F8 0000C0E7 */  swc1       $f0, 0x0($fp)
/* 6F9FC 0016F8FC 2000A2C6 */  lwc1       $f2, 0x20($21)
/* 6FA00 0016F900 188180C7 */  lwc1       $f0, -0x7EE8($gp)
/* 6FA04 0016F904 42000246 */  mul.s      $f1, $f0, $f2
/* 6FA08 0016F908 000040C4 */  lwc1       $f0, 0x0($2)
/* 6FA0C 0016F90C 00000246 */  add.s      $f0, $f0, $f2
/* 6FA10 0016F910 00080046 */  add.s      $f0, $f1, $f0
/* 6FA14 0016F914 F800A0E7 */  swc1       $f0, 0xF8($sp)
/* 6FA18 0016F918 0001A0AF */  sw         $0, 0x100($sp)
/* 6FA1C 0016F91C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 6FA20 0016F920 0401A2AF */  sw         $2, 0x104($sp)
/* 6FA24 0016F924 0801A0AF */  sw         $0, 0x108($sp)
/* 6FA28 0016F928 0C01A0AF */  sw         $0, 0x10C($sp)
/* 6FA2C 0016F92C 28268072 */  paddub     $4, $20, $0
/* 6FA30 0016F930 C000A527 */  addiu      $5, $sp, 0xC0
/* 6FA34 0016F934 0C86040C */  jal        sceVu0CopyVector
/* 6FA38 0016F938 00000000 */   nop
/* 6FA3C 0016F93C 10008426 */  addiu      $4, $20, 0x10
/* 6FA40 0016F940 282EC072 */  paddub     $5, $22, $0
/* 6FA44 0016F944 0C86040C */  jal        sceVu0CopyVector
/* 6FA48 0016F948 00000000 */   nop
/* 6FA4C 0016F94C 20008426 */  addiu      $4, $20, 0x20
/* 6FA50 0016F950 282EE072 */  paddub     $5, $23, $0
/* 6FA54 0016F954 0C86040C */  jal        sceVu0CopyVector
/* 6FA58 0016F958 00000000 */   nop
/* 6FA5C 0016F95C 30008426 */  addiu      $4, $20, 0x30
/* 6FA60 0016F960 0001A527 */  addiu      $5, $sp, 0x100
/* 6FA64 0016F964 0C86040C */  jal        sceVu0CopyVector
/* 6FA68 0016F968 00000000 */   nop
/* 6FA6C 0016F96C 1001A227 */  addiu      $2, $sp, 0x110
/* 6FA70 0016F970 000043C4 */  lwc1       $f3, 0x0($2)
/* 6FA74 0016F974 040042C4 */  lwc1       $f2, 0x4($2)
/* 6FA78 0016F978 080041C4 */  lwc1       $f1, 0x8($2)
/* 6FA7C 0016F97C 0C0040C4 */  lwc1       $f0, 0xC($2)
/* 6FA80 0016F980 400083E6 */  swc1       $f3, 0x40($20)
/* 6FA84 0016F984 440082E6 */  swc1       $f2, 0x44($20)
/* 6FA88 0016F988 480081E6 */  swc1       $f1, 0x48($20)
/* 6FA8C 0016F98C 4C0080E6 */  swc1       $f0, 0x4C($20)
/* 6FA90 0016F990 50008426 */  addiu      $4, $20, 0x50
/* 6FA94 0016F994 282EE072 */  paddub     $5, $23, $0
/* 6FA98 0016F998 0C86040C */  jal        sceVu0CopyVector
/* 6FA9C 0016F99C 00000000 */   nop
/* 6FAA0 0016F9A0 60008426 */  addiu      $4, $20, 0x60
/* 6FAA4 0016F9A4 282EC072 */  paddub     $5, $22, $0
/* 6FAA8 0016F9A8 0C86040C */  jal        sceVu0CopyVector
/* 6FAAC 0016F9AC 00000000 */   nop
/* 6FAB0 0016F9B0 70008426 */  addiu      $4, $20, 0x70
/* 6FAB4 0016F9B4 282EC073 */  paddub     $5, $fp, $0
/* 6FAB8 0016F9B8 0C86040C */  jal        sceVu0CopyVector
/* 6FABC 0016F9BC 00000000 */   nop
/* 6FAC0 0016F9C0 80008426 */  addiu      $4, $20, 0x80
/* 6FAC4 0016F9C4 0001A527 */  addiu      $5, $sp, 0x100
/* 6FAC8 0016F9C8 0C86040C */  jal        sceVu0CopyVector
/* 6FACC 0016F9CC 00000000 */   nop
/* 6FAD0 0016F9D0 1001A227 */  addiu      $2, $sp, 0x110
/* 6FAD4 0016F9D4 000043C4 */  lwc1       $f3, 0x0($2)
/* 6FAD8 0016F9D8 040042C4 */  lwc1       $f2, 0x4($2)
/* 6FADC 0016F9DC 080041C4 */  lwc1       $f1, 0x8($2)
/* 6FAE0 0016F9E0 0C0040C4 */  lwc1       $f0, 0xC($2)
/* 6FAE4 0016F9E4 900083E6 */  swc1       $f3, 0x90($20)
/* 6FAE8 0016F9E8 940082E6 */  swc1       $f2, 0x94($20)
/* 6FAEC 0016F9EC 980081E6 */  swc1       $f1, 0x98($20)
/* 6FAF0 0016F9F0 9C0080E6 */  swc1       $f0, 0x9C($20)
/* 6FAF4 0016F9F4 A0009426 */  addiu      $20, $20, 0xA0
/* 6FAF8 0016F9F8 02001026 */  addiu      $16, $16, 0x2
.L0016F9FC:
/* 6FAFC 0016F9FC 01005226 */  addiu      $18, $18, 0x1
.L0016FA00:
/* 6FB00 0016FA00 AC00A28F */  lw         $2, 0xAC($sp)
/* 6FB04 0016FA04 21106202 */  addu       $2, $19, $2
/* 6FB08 0016FA08 2A104202 */  slt        $2, $18, $2
/* 6FB0C 0016FA0C 60FF4014 */  bnez       $2, .L0016F790
/* 6FB10 0016FA10 00000000 */   nop
/* 6FB14 0016FA14 01003126 */  addiu      $17, $17, 0x1
.L0016FA18:
/* 6FB18 0016FA18 A000A38F */  lw         $3, 0xA0($sp)
/* 6FB1C 0016FA1C A800A28F */  lw         $2, 0xA8($sp)
/* 6FB20 0016FA20 21106200 */  addu       $2, $3, $2
/* 6FB24 0016FA24 2A102202 */  slt        $2, $17, $2
/* 6FB28 0016FA28 55FF4014 */  bnez       $2, .L0016F780
/* 6FB2C 0016FA2C 00000000 */   nop
/* 6FB30 0016FA30 28160072 */  paddub     $2, $16, $0
/* 6FB34 0016FA34 9000BF7B */  lq         $31, 0x90($sp)
/* 6FB38 0016FA38 8000BE7B */  lq         $fp, 0x80($sp)
/* 6FB3C 0016FA3C 7000B77B */  lq         $23, 0x70($sp)
/* 6FB40 0016FA40 6000B67B */  lq         $22, 0x60($sp)
/* 6FB44 0016FA44 5000B57B */  lq         $21, 0x50($sp)
/* 6FB48 0016FA48 4000B47B */  lq         $20, 0x40($sp)
/* 6FB4C 0016FA4C 3000B37B */  lq         $19, 0x30($sp)
/* 6FB50 0016FA50 2000B27B */  lq         $18, 0x20($sp)
/* 6FB54 0016FA54 1000B17B */  lq         $17, 0x10($sp)
/* 6FB58 0016FA58 0000B07B */  lq         $16, 0x0($sp)
/* 6FB5C 0016FA5C 2001BD27 */  addiu      $sp, $sp, 0x120
/* 6FB60 0016FA60 0800E003 */  jr         $31
/* 6FB64 0016FA64 00000000 */   nop
/* 6FB68 0016FA68 00000000 */  nop
/* 6FB6C 0016FA6C 00000000 */  nop
