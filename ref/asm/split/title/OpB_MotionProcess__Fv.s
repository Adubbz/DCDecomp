.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpB_MotionProcess__Fv
/* 00EBC0 01DBA8C0 60FFBD27 */  addiu       $29, $29, -0xA0
/* 00EBC4 01DBA8C4 3000BF7F */  sq          $31, 0x30($29)
/* 00EBC8 01DBA8C8 2000B17F */  sq          $17, 0x20($29)
/* 00EBCC 01DBA8CC 1000B07F */  sq          $16, 0x10($29)
/* 00EBD0 01DBA8D0 0000B4E7 */  swc1        $f20, 0x0($29)
/* 00EBD4 01DBA8D4 08000224 */  addiu       $2, $0, 0x8
/* 00EBD8 01DBA8D8 4E000010 */  b           .L01DBAA14_2C0214
/* 00EBDC 01DBA8DC 00000000 */   nop
.L01DBA8E0_2C00E0:
/* 00EBE0 01DBA8E0 40180200 */  sll         $3, $2, 1
/* 00EBE4 01DBA8E4 21186200 */  addu        $3, $3, $2
/* 00EBE8 01DBA8E8 80180300 */  sll         $3, $3, 2
/* 00EBEC 01DBA8EC 21186200 */  addu        $3, $3, $2
/* 00EBF0 01DBA8F0 80180300 */  sll         $3, $3, 2
/* 00EBF4 01DBA8F4 DE01043C */  lui         $4, %hi(CScript__2 + 0x30)
/* 00EBF8 01DBA8F8 301B8424 */  addiu       $4, $4, %lo(CScript__2 + 0x30)
/* 00EBFC 01DBA8FC 21208300 */  addu        $4, $4, $3
/* 00EC00 01DBA900 00008490 */  lbu         $4, 0x0($4)
/* 00EC04 01DBA904 42008010 */  beqz        $4, .L01DBAA10_2C0210
/* 00EC08 01DBA908 00000000 */   nop
/* 00EC0C 01DBA90C DE01043C */  lui         $4, %hi(CScript__2 + 0x38)
/* 00EC10 01DBA910 381B8424 */  addiu       $4, $4, %lo(CScript__2 + 0x38)
/* 00EC14 01DBA914 21208300 */  addu        $4, $4, $3
/* 00EC18 01DBA918 0000888C */  lw          $8, 0x0($4)
/* 00EC1C 01DBA91C FFFF0524 */  addiu       $5, $0, -0x1
/* 00EC20 01DBA920 20000511 */  beq         $8, $5, .L01DBA9A4_2C01A4
/* 00EC24 01DBA924 00000000 */   nop
/* 00EC28 01DBA928 B0110524 */  addiu       $5, $0, 0x11B0
/* 00EC2C 01DBA92C 18384500 */  mult        $7, $2, $5
/* 00EC30 01DBA930 DF01053C */  lui         $5, %hi(Chara__3 + 0x344)
/* 00EC34 01DBA934 2402A524 */  addiu       $5, $5, %lo(Chara__3 + 0x344)
/* 00EC38 01DBA938 2128A700 */  addu        $5, $5, $7
/* 00EC3C 01DBA93C 0000A68C */  lw          $6, 0x0($5)
/* 00EC40 01DBA940 DE01053C */  lui         $5, %hi(CScript__2 + 0x34)
/* 00EC44 01DBA944 341BA524 */  addiu       $5, $5, %lo(CScript__2 + 0x34)
/* 00EC48 01DBA948 2148A300 */  addu        $9, $5, $3
/* 00EC4C 01DBA94C 0000258D */  lw          $5, 0x0($9)
/* 00EC50 01DBA950 00290500 */  sll         $5, $5, 4
/* 00EC54 01DBA954 2128A600 */  addu        $5, $5, $6
/* 00EC58 01DBA958 0400A58C */  lw          $5, 0x4($5)
/* 00EC5C 01DBA95C FFFFA524 */  addiu       $5, $5, -0x1
/* 00EC60 01DBA960 00008544 */  mtc1        $5, $f0
/* 00EC64 01DBA964 00000000 */  nop
/* 00EC68 01DBA968 60008046 */  cvt.s.w     $f1, $f0
/* 00EC6C 01DBA96C DF01053C */  lui         $5, %hi(Chara__3 + 0x2F0)
/* 00EC70 01DBA970 D001A524 */  addiu       $5, $5, %lo(Chara__3 + 0x2F0)
/* 00EC74 01DBA974 2128A700 */  addu        $5, $5, $7
/* 00EC78 01DBA978 0000A0C4 */  lwc1        $f0, 0x0($5)
/* 00EC7C 01DBA97C 36000146 */  c.le.s      $f0, $f1
/* 00EC80 01DBA980 01000524 */  addiu       $5, $0, 0x1
/* 00EC84 01DBA984 02000045 */  bc1f        .L01DBA990_2C0190
/* 00EC88 01DBA988 00000000 */   nop
/* 00EC8C 01DBA98C 282E0070 */  paddub      $5, $0, $0
.L01DBA990_2C0190:
/* 00EC90 01DBA990 0400A010 */  beqz        $5, .L01DBA9A4_2C01A4
/* 00EC94 01DBA994 00000000 */   nop
/* 00EC98 01DBA998 000028AD */  sw          $8, 0x0($9)
/* 00EC9C 01DBA99C FFFF0524 */  addiu       $5, $0, -0x1
/* 00ECA0 01DBA9A0 000085AC */  sw          $5, 0x0($4)
.L01DBA9A4_2C01A4:
/* 00ECA4 01DBA9A4 DE01043C */  lui         $4, %hi(CScript__2 + 0x60)
/* 00ECA8 01DBA9A8 601B8424 */  addiu       $4, $4, %lo(CScript__2 + 0x60)
/* 00ECAC 01DBA9AC 21208300 */  addu        $4, $4, $3
/* 00ECB0 01DBA9B0 000080C4 */  lwc1        $f0, 0x0($4)
/* 00ECB4 01DBA9B4 B0110424 */  addiu       $4, $0, 0x11B0
/* 00ECB8 01DBA9B8 18284400 */  mult        $5, $2, $4
/* 00ECBC 01DBA9BC DF01043C */  lui         $4, %hi(Chara__3 + 0x2F8)
/* 00ECC0 01DBA9C0 D8018424 */  addiu       $4, $4, %lo(Chara__3 + 0x2F8)
/* 00ECC4 01DBA9C4 21208500 */  addu        $4, $4, $5
/* 00ECC8 01DBA9C8 000080E4 */  swc1        $f0, 0x0($4)
/* 00ECCC 01DBA9CC DE01043C */  lui         $4, %hi(CScript__2 + 0x34)
/* 00ECD0 01DBA9D0 341B8424 */  addiu       $4, $4, %lo(CScript__2 + 0x34)
/* 00ECD4 01DBA9D4 21188300 */  addu        $3, $4, $3
/* 00ECD8 01DBA9D8 0000648C */  lw          $4, 0x0($3)
/* 00ECDC 01DBA9DC DF01033C */  lui         $3, %hi(Chara__3 + 0xC68)
/* 00ECE0 01DBA9E0 480B6324 */  addiu       $3, $3, %lo(Chara__3 + 0xC68)
/* 00ECE4 01DBA9E4 21186500 */  addu        $3, $3, $5
/* 00ECE8 01DBA9E8 000064AC */  sw          $4, 0x0($3)
/* 00ECEC 01DBA9EC DF01033C */  lui         $3, %hi(Chara__3 + 0xC64)
/* 00ECF0 01DBA9F0 440B6324 */  addiu       $3, $3, %lo(Chara__3 + 0xC64)
/* 00ECF4 01DBA9F4 21186500 */  addu        $3, $3, $5
/* 00ECF8 01DBA9F8 000060AC */  sw          $0, 0x0($3)
/* 00ECFC 01DBA9FC 80BF043C */  lui         $4, (0xBF800000 >> 16)
/* 00ED00 01DBAA00 DF01033C */  lui         $3, %hi(Chara__3 + 0xC60)
/* 00ED04 01DBAA04 400B6324 */  addiu       $3, $3, %lo(Chara__3 + 0xC60)
/* 00ED08 01DBAA08 21186500 */  addu        $3, $3, $5
/* 00ED0C 01DBAA0C 000064AC */  sw          $4, 0x0($3)
.L01DBAA10_2C0210:
/* 00ED10 01DBAA10 01004224 */  addiu       $2, $2, 0x1
.L01DBAA14_2C0214:
/* 00ED14 01DBAA14 0C004328 */  slti        $3, $2, 0xC
/* 00ED18 01DBAA18 B1FF6014 */  bnez        $3, .L01DBA8E0_2C00E0
/* 00ED1C 01DBAA1C 00000000 */   nop
/* 00ED20 01DBAA20 DD01023C */  lui         $2, %hi(LIT_581__2)
/* 00ED24 01DBAA24 90774224 */  addiu       $2, $2, %lo(LIT_581__2)
/* 00ED28 01DBAA28 4000A327 */  addiu       $3, $29, 0x40
/* 00ED2C 01DBAA2C 00004278 */  lq          $2, 0x0($2)
/* 00ED30 01DBAA30 0000627C */  sq          $2, 0x0($3)
/* 00ED34 01DBAA34 28860070 */  paddub      $16, $0, $0
/* 00ED38 01DBAA38 2B000010 */  b           .L01DBAAE8_2C02E8
/* 00ED3C 01DBAA3C 00000000 */   nop
.L01DBAA40_2C0240:
/* 00ED40 01DBAA40 0498838F */  lw          $3, -0x67FC($28)
/* 00ED44 01DBAA44 B0110224 */  addiu       $2, $0, 0x11B0
/* 00ED48 01DBAA48 18186200 */  mult        $3, $3, $2
/* 00ED4C 01DBAA4C E101023C */  lui         $2, %hi(Cam__2 + 0xBC)
/* 00ED50 01DBAA50 8C994224 */  addiu       $2, $2, %lo(Cam__2 + 0xBC)
/* 00ED54 01DBAA54 21184300 */  addu        $3, $2, $3
/* 00ED58 01DBAA58 80101000 */  sll         $2, $16, 2
/* 00ED5C 01DBAA5C 21105D00 */  addu        $2, $2, $29
/* 00ED60 01DBAA60 0000648C */  lw          $4, 0x0($3)
/* 00ED64 01DBAA64 4000458C */  lw          $5, 0x40($2)
/* 00ED68 01DBAA68 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00ED6C 01DBAA6C 00000000 */   nop
/* 00ED70 01DBAA70 1C004010 */  beqz        $2, .L01DBAAE4_2C02E4
/* 00ED74 01DBAA74 00000000 */   nop
/* 00ED78 01DBAA78 28264070 */  paddub      $4, $2, $0
/* 00ED7C 01DBAA7C 5000A527 */  addiu       $5, $29, 0x50
/* 00ED80 01DBAA80 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 00ED84 01DBAA84 00000000 */   nop
/* 00ED88 01DBAA88 00A08044 */  mtc1        $0, $f20
/* 00ED8C 01DBAA8C 7000ACC7 */  lwc1        $f12, 0x70($29)
/* 00ED90 01DBAA90 7800ADC7 */  lwc1        $f13, 0x78($29)
/* 00ED94 01DBAA94 5077040C */  jal         atan2f
/* 00ED98 01DBAA98 00000000 */   nop
/* 00ED9C 01DBAA9C 86A30046 */  mov.s       $f14, $f20
/* 00EDA0 01DBAAA0 08000326 */  addiu       $3, $16, 0x8
/* 00EDA4 01DBAAA4 B0110224 */  addiu       $2, $0, 0x11B0
/* 00EDA8 01DBAAA8 18186200 */  mult        $3, $3, $2
/* 00EDAC 01DBAAAC DF01023C */  lui         $2, %hi(Chara__3)
/* 00EDB0 01DBAAB0 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 00EDB4 01DBAAB4 21884300 */  addu        $17, $2, $3
/* 00EDB8 01DBAAB8 28262072 */  paddub      $4, $17, $0
/* 00EDBC 01DBAABC 06A30046 */  mov.s       $f12, $f20
/* 00EDC0 01DBAAC0 46030046 */  mov.s       $f13, $f0
/* 00EDC4 01DBAAC4 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 00EDC8 01DBAAC8 00000000 */   nop
/* 00EDCC 01DBAACC 8000ACC7 */  lwc1        $f12, 0x80($29)
/* 00EDD0 01DBAAD0 8400ADC7 */  lwc1        $f13, 0x84($29)
/* 00EDD4 01DBAAD4 8800AEC7 */  lwc1        $f14, 0x88($29)
/* 00EDD8 01DBAAD8 28262072 */  paddub      $4, $17, $0
/* 00EDDC 01DBAADC ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 00EDE0 01DBAAE0 00000000 */   nop
.L01DBAAE4_2C02E4:
/* 00EDE4 01DBAAE4 01001026 */  addiu       $16, $16, 0x1
.L01DBAAE8_2C02E8:
/* 00EDE8 01DBAAE8 0400022A */  slti        $2, $16, 0x4
/* 00EDEC 01DBAAEC D4FF4014 */  bnez        $2, .L01DBAA40_2C0240
/* 00EDF0 01DBAAF0 00000000 */   nop
/* 00EDF4 01DBAAF4 9000A0AF */  sw          $0, 0x90($29)
/* 00EDF8 01DBAAF8 9800A0AF */  sw          $0, 0x98($29)
/* 00EDFC 01DBAAFC 9400A0AF */  sw          $0, 0x94($29)
/* 00EE00 01DBAB00 9C00A0AF */  sw          $0, 0x9C($29)
/* 00EE04 01DBAB04 E301023C */  lui         $2, %hi(Wind)
/* 00EE08 01DBAB08 20A34424 */  addiu       $4, $2, %lo(Wind)
/* 00EE0C 01DBAB0C 9000A527 */  addiu       $5, $29, 0x90
/* 00EE10 01DBAB10 20ED040C */  jal         SetDir__5CWindFPf
/* 00EE14 01DBAB14 00000000 */   nop
/* 00EE18 01DBAB18 00608044 */  mtc1        $0, $f12
/* 00EE1C 01DBAB1C E301023C */  lui         $2, %hi(Wind)
/* 00EE20 01DBAB20 20A34424 */  addiu       $4, $2, %lo(Wind)
/* 00EE24 01DBAB24 2CED040C */  jal         SetVelocity__5CWindFf
/* 00EE28 01DBAB28 00000000 */   nop
/* 00EE2C 01DBAB2C B8998383 */  lb          $3, -0x6648($28)
/* 00EE30 01DBAB30 04006014 */  bnez        $3, .L01DBAB44_2C0344
/* 00EE34 01DBAB34 00000000 */   nop
/* 00EE38 01DBAB38 B49980AF */  sw          $0, -0x664C($28)
/* 00EE3C 01DBAB3C 01000324 */  addiu       $3, $0, 0x1
/* 00EE40 01DBAB40 B89983A3 */  sb          $3, -0x6648($28)
.L01DBAB44_2C0344:
/* 00EE44 01DBAB44 B499838F */  lw          $3, -0x664C($28)
/* 00EE48 01DBAB48 DE01013C */  lui         $1, %hi(CScript__2)
/* 00EE4C 01DBAB4C 001B248C */  lw          $4, %lo(CScript__2)($1)
/* 00EE50 01DBAB50 2B006410 */  beq         $3, $4, .L01DBAC00_2C0400
/* 00EE54 01DBAB54 00000000 */   nop
/* 00EE58 01DBAB58 B49984AF */  sw          $4, -0x664C($28)
/* 00EE5C 01DBAB5C 33000324 */  addiu       $3, $0, 0x33
/* 00EE60 01DBAB60 12008314 */  bne         $4, $3, .L01DBABAC_2C03AC
/* 00EE64 01DBAB64 00000000 */   nop
/* 00EE68 01DBAB68 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x490)
/* 00EE6C 01DBAB6C 608C4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x490)
/* 00EE70 01DBAB70 FFFF0524 */  addiu       $5, $0, -0x1
/* 00EE74 01DBAB74 94E3040C */  jal         ClothStep__10CCharacterFi
/* 00EE78 01DBAB78 00000000 */   nop
/* 00EE7C 01DBAB7C 28860070 */  paddub      $16, $0, $0
/* 00EE80 01DBAB80 07000010 */  b           .L01DBABA0_2C03A0
/* 00EE84 01DBAB84 00000000 */   nop
.L01DBAB88_2C0388:
/* 00EE88 01DBAB88 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x490)
/* 00EE8C 01DBAB8C 608C4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x490)
/* 00EE90 01DBAB90 282E0070 */  paddub      $5, $0, $0
/* 00EE94 01DBAB94 94E3040C */  jal         ClothStep__10CCharacterFi
/* 00EE98 01DBAB98 00000000 */   nop
/* 00EE9C 01DBAB9C 01001026 */  addiu       $16, $16, 0x1
.L01DBABA0_2C03A0:
/* 00EEA0 01DBABA0 0A00032A */  slti        $3, $16, 0xA
/* 00EEA4 01DBABA4 F8FF6014 */  bnez        $3, .L01DBAB88_2C0388
/* 00EEA8 01DBABA8 00000000 */   nop
.L01DBABAC_2C03AC:
/* 00EEAC 01DBABAC B499848F */  lw          $4, -0x664C($28)
/* 00EEB0 01DBABB0 39000324 */  addiu       $3, $0, 0x39
/* 00EEB4 01DBABB4 12008314 */  bne         $4, $3, .L01DBAC00_2C0400
/* 00EEB8 01DBABB8 00000000 */   nop
/* 00EEBC 01DBABBC E001023C */  lui         $2, %hi(MainMonstorUnit + 0x39A0)
/* 00EEC0 01DBABC0 70C14424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x39A0)
/* 00EEC4 01DBABC4 FFFF0524 */  addiu       $5, $0, -0x1
/* 00EEC8 01DBABC8 94E3040C */  jal         ClothStep__10CCharacterFi
/* 00EECC 01DBABCC 00000000 */   nop
/* 00EED0 01DBABD0 28860070 */  paddub      $16, $0, $0
/* 00EED4 01DBABD4 07000010 */  b           .L01DBABF4_2C03F4
/* 00EED8 01DBABD8 00000000 */   nop
.L01DBABDC_2C03DC:
/* 00EEDC 01DBABDC E001023C */  lui         $2, %hi(MainMonstorUnit + 0x39A0)
/* 00EEE0 01DBABE0 70C14424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x39A0)
/* 00EEE4 01DBABE4 282E0070 */  paddub      $5, $0, $0
/* 00EEE8 01DBABE8 94E3040C */  jal         ClothStep__10CCharacterFi
/* 00EEEC 01DBABEC 00000000 */   nop
/* 00EEF0 01DBABF0 01001026 */  addiu       $16, $16, 0x1
.L01DBABF4_2C03F4:
/* 00EEF4 01DBABF4 0A00032A */  slti        $3, $16, 0xA
/* 00EEF8 01DBABF8 F8FF6014 */  bnez        $3, .L01DBABDC_2C03DC
/* 00EEFC 01DBABFC 00000000 */   nop
.L01DBAC00_2C0400:
/* 00EF00 01DBAC00 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 00EF04 01DBAC04 181B248C */  lw          $4, %lo(CScript__2 + 0x18)($1)
/* 00EF08 01DBAC08 01000324 */  addiu       $3, $0, 0x1
/* 00EF0C 01DBAC0C 1B008314 */  bne         $4, $3, .L01DBAC7C_2C047C
/* 00EF10 01DBAC10 00000000 */   nop
/* 00EF14 01DBAC14 0898838F */  lw          $3, -0x67F8($28)
/* 00EF18 01DBAC18 18006014 */  bnez        $3, .L01DBAC7C_2C047C
/* 00EF1C 01DBAC1C 00000000 */   nop
/* 00EF20 01DBAC20 E301023C */  lui         $2, %hi(Fuusya)
/* 00EF24 01DBAC24 00A24424 */  addiu       $4, $2, %lo(Fuusya)
/* 00EF28 01DBAC28 7898050C */  jal         ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* 00EF2C 01DBAC2C 00000000 */   nop
/* 00EF30 01DBAC30 E301023C */  lui         $2, %hi(Fuusya + 0x90)
/* 00EF34 01DBAC34 90A24424 */  addiu       $4, $2, %lo(Fuusya + 0x90)
/* 00EF38 01DBAC38 7898050C */  jal         ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* 00EF3C 01DBAC3C 00000000 */   nop
/* 00EF40 01DBAC40 28860070 */  paddub      $16, $0, $0
/* 00EF44 01DBAC44 0A000010 */  b           .L01DBAC70_2C0470
/* 00EF48 01DBAC48 00000000 */   nop
.L01DBAC4C_2C044C:
/* 00EF4C 01DBAC4C C0101000 */  sll         $2, $16, 3
/* 00EF50 01DBAC50 21105000 */  addu        $2, $2, $16
/* 00EF54 01DBAC54 00190200 */  sll         $3, $2, 4
/* 00EF58 01DBAC58 E301023C */  lui         $2, %hi(Taimatsu)
/* 00EF5C 01DBAC5C 80A34224 */  addiu       $2, $2, %lo(Taimatsu)
/* 00EF60 01DBAC60 21204300 */  addu        $4, $2, $3
/* 00EF64 01DBAC64 7898050C */  jal         ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* 00EF68 01DBAC68 00000000 */   nop
/* 00EF6C 01DBAC6C 01001026 */  addiu       $16, $16, 0x1
.L01DBAC70_2C0470:
/* 00EF70 01DBAC70 0C00032A */  slti        $3, $16, 0xC
/* 00EF74 01DBAC74 F5FF6014 */  bnez        $3, .L01DBAC4C_2C044C
/* 00EF78 01DBAC78 00000000 */   nop
.L01DBAC7C_2C047C:
/* 00EF7C 01DBAC7C DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 00EF80 01DBAC80 181B248C */  lw          $4, %lo(CScript__2 + 0x18)($1)
/* 00EF84 01DBAC84 02000324 */  addiu       $3, $0, 0x2
/* 00EF88 01DBAC88 1B008314 */  bne         $4, $3, .L01DBACF8_2C04F8
/* 00EF8C 01DBAC8C 00000000 */   nop
/* 00EF90 01DBAC90 DE01013C */  lui         $1, %hi(CScript__2 + 0x14)
/* 00EF94 01DBAC94 141B248C */  lw          $4, %lo(CScript__2 + 0x14)($1)
/* 00EF98 01DBAC98 01000324 */  addiu       $3, $0, 0x1
/* 00EF9C 01DBAC9C 07008314 */  bne         $4, $3, .L01DBACBC_2C04BC
/* 00EFA0 01DBACA0 00000000 */   nop
/* 00EFA4 01DBACA4 AAC2033C */  lui         $3, (0xC2AA0000 >> 16)
/* 00EFA8 01DBACA8 E301013C */  lui         $1, %hi(Door + 0x34)
/* 00EFAC 01DBACAC A4A123AC */  sw          $3, %lo(Door + 0x34)($1)
/* 00EFB0 01DBACB0 C88380C7 */  lwc1        $f0, -0x7C38($28)
/* 00EFB4 01DBACB4 E301013C */  lui         $1, %hi(Door + 0x44)
/* 00EFB8 01DBACB8 B4A120E4 */  swc1        $f0, %lo(Door + 0x44)($1)
.L01DBACBC_2C04BC:
/* 00EFBC 01DBACBC 02000324 */  addiu       $3, $0, 0x2
/* 00EFC0 01DBACC0 06008314 */  bne         $4, $3, .L01DBACDC_2C04DC
/* 00EFC4 01DBACC4 00000000 */   nop
/* 00EFC8 01DBACC8 E301013C */  lui         $1, %hi(Door + 0x34)
/* 00EFCC 01DBACCC A4A120AC */  sw          $0, %lo(Door + 0x34)($1)
/* 00EFD0 01DBACD0 088380C7 */  lwc1        $f0, -0x7CF8($28)
/* 00EFD4 01DBACD4 E301013C */  lui         $1, %hi(Door + 0x44)
/* 00EFD8 01DBACD8 B4A120E4 */  swc1        $f0, %lo(Door + 0x44)($1)
.L01DBACDC_2C04DC:
/* 00EFDC 01DBACDC 0898838F */  lw          $3, -0x67F8($28)
/* 00EFE0 01DBACE0 05006014 */  bnez        $3, .L01DBACF8_2C04F8
/* 00EFE4 01DBACE4 00000000 */   nop
/* 00EFE8 01DBACE8 E301023C */  lui         $2, %hi(Door)
/* 00EFEC 01DBACEC 70A14424 */  addiu       $4, $2, %lo(Door)
/* 00EFF0 01DBACF0 7898050C */  jal         ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* 00EFF4 01DBACF4 00000000 */   nop
.L01DBACF8_2C04F8:
/* 00EFF8 01DBACF8 3000BF7B */  lq          $31, 0x30($29)
/* 00EFFC 01DBACFC 2000B17B */  lq          $17, 0x20($29)
/* 00F000 01DBAD00 1000B07B */  lq          $16, 0x10($29)
/* 00F004 01DBAD04 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 00F008 01DBAD08 A000BD27 */  addiu       $29, $29, 0xA0
/* 00F00C 01DBAD0C 0800E003 */  jr          $31
/* 00F010 01DBAD10 00000000 */   nop
/* 00F014 01DBAD14 00000000 */  nop
/* 00F018 01DBAD18 00000000 */  nop
/* 00F01C 01DBAD1C 00000000 */  nop
