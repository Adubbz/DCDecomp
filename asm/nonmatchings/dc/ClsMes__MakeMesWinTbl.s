.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MakeMesWinTbl__6ClsMesFi
/* 4F9D0 0014F8D0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 4F9D4 0014F8D4 3000BF7F */  sq         $31, 0x30($sp)
/* 4F9D8 0014F8D8 2000B27F */  sq         $18, 0x20($sp)
/* 4F9DC 0014F8DC 1000B17F */  sq         $17, 0x10($sp)
/* 4F9E0 0014F8E0 0000B07F */  sq         $16, 0x0($sp)
/* 4F9E4 0014F8E4 28968070 */  paddub     $18, $4, $0
/* 4F9E8 0014F8E8 A017828C */  lw         $2, 0x17A0($4)
/* 4F9EC 0014F8EC 04004014 */  bnez       $2, .L0014F900
/* 4F9F0 0014F8F0 00000000 */   nop
/* 4F9F4 0014F8F4 28160070 */  paddub     $2, $0, $0
/* 4F9F8 0014F8F8 F8000010 */  b          .L0014FCDC
/* 4F9FC 0014F8FC 00000000 */   nop
.L0014F900:
/* 4FA00 0014F900 2C3D050C */  jal        GetTextLineDataTop__6ClsMesFi
/* 4FA04 0014F904 00000000 */   nop
/* 4FA08 0014F908 28864070 */  paddub     $16, $2, $0
/* 4FA0C 0014F90C 04000016 */  bnez       $16, .L0014F920
/* 4FA10 0014F910 00000000 */   nop
/* 4FA14 0014F914 28160070 */  paddub     $2, $0, $0
/* 4FA18 0014F918 F0000010 */  b          .L0014FCDC
/* 4FA1C 0014F91C 00000000 */   nop
.L0014F920:
/* 4FA20 0014F920 28264072 */  paddub     $4, $18, $0
/* 4FA24 0014F924 643D050C */  jal        InitMesWinTbl__6ClsMesFv
/* 4FA28 0014F928 00000000 */   nop
/* 4FA2C 0014F92C 4800A0AF */  sw         $0, 0x48($sp)
/* 4FA30 0014F930 4C00A0AF */  sw         $0, 0x4C($sp)
.L0014F934:
/* 4FA34 0014F934 00001186 */  lh         $17, 0x0($16)
/* 4FA38 0014F938 02001026 */  addiu      $16, $16, 0x2
/* 4FA3C 0014F93C 03FF0224 */  addiu      $2, $0, -0xFD
/* 4FA40 0014F940 05002212 */  beq        $17, $2, .L0014F958
/* 4FA44 0014F944 00000000 */   nop
/* 4FA48 0014F948 00012226 */  addiu      $2, $17, 0x100
/* 4FA4C 0014F94C 0200412C */  sltiu      $at, $2, 0x2
/* 4FA50 0014F950 04002010 */  beqz       $at, .L0014F964
/* 4FA54 0014F954 00000000 */   nop
.L0014F958:
/* 4FA58 0014F958 FFFF0224 */  addiu      $2, $0, -0x1
/* 4FA5C 0014F95C 381742AE */  sw         $2, 0x1738($18)
/* 4FA60 0014F960 3C1742AE */  sw         $2, 0x173C($18)
.L0014F964:
/* 4FA64 0014F964 02FF0224 */  addiu      $2, $0, -0xFE
/* 4FA68 0014F968 2F002212 */  beq        $17, $2, .L0014FA28
/* 4FA6C 0014F96C 00000000 */   nop
/* 4FA70 0014F970 03FF0224 */  addiu      $2, $0, -0xFD
/* 4FA74 0014F974 21002212 */  beq        $17, $2, .L0014F9FC
/* 4FA78 0014F978 00000000 */   nop
/* 4FA7C 0014F97C 00FF0224 */  addiu      $2, $0, -0x100
/* 4FA80 0014F980 10002212 */  beq        $17, $2, .L0014F9C4
/* 4FA84 0014F984 00000000 */   nop
/* 4FA88 0014F988 01FF0224 */  addiu      $2, $0, -0xFF
/* 4FA8C 0014F98C 03002212 */  beq        $17, $2, .L0014F99C
/* 4FA90 0014F990 00000000 */   nop
/* 4FA94 0014F994 3D000010 */  b          .L0014FA8C
/* 4FA98 0014F998 00000000 */   nop
.L0014F99C:
/* 4FA9C 0014F99C 4800A787 */  lh         $7, 0x48($sp)
/* 4FAA0 0014F9A0 4C00A887 */  lh         $8, 0x4C($sp)
/* 4FAA4 0014F9A4 28264072 */  paddub     $4, $18, $0
/* 4FAA8 0014F9A8 282E2072 */  paddub     $5, $17, $0
/* 4FAAC 0014F9AC 28360070 */  paddub     $6, $0, $0
/* 4FAB0 0014F9B0 783D050C */  jal        SetMesWinTbl__6ClsMesFiiss
/* 4FAB4 0014F9B4 00000000 */   nop
/* 4FAB8 0014F9B8 01000224 */  addiu      $2, $0, 0x1
/* 4FABC 0014F9BC C7000010 */  b          .L0014FCDC
/* 4FAC0 0014F9C0 00000000 */   nop
.L0014F9C4:
/* 4FAC4 0014F9C4 4800A787 */  lh         $7, 0x48($sp)
/* 4FAC8 0014F9C8 4C00A887 */  lh         $8, 0x4C($sp)
/* 4FACC 0014F9CC 28264072 */  paddub     $4, $18, $0
/* 4FAD0 0014F9D0 282E2072 */  paddub     $5, $17, $0
/* 4FAD4 0014F9D4 28360070 */  paddub     $6, $0, $0
/* 4FAD8 0014F9D8 783D050C */  jal        SetMesWinTbl__6ClsMesFiiss
/* 4FADC 0014F9DC 00000000 */   nop
/* 4FAE0 0014F9E0 4800A0AF */  sw         $0, 0x48($sp)
/* 4FAE4 0014F9E4 4C00A38F */  lw         $3, 0x4C($sp)
/* 4FAE8 0014F9E8 0C00428E */  lw         $2, 0xC($18)
/* 4FAEC 0014F9EC 21106200 */  addu       $2, $3, $2
/* 4FAF0 0014F9F0 4C00A2AF */  sw         $2, 0x4C($sp)
/* 4FAF4 0014F9F4 CFFF0010 */  b          .L0014F934
/* 4FAF8 0014F9F8 00000000 */   nop
.L0014F9FC:
/* 4FAFC 0014F9FC 4800A787 */  lh         $7, 0x48($sp)
/* 4FB00 0014FA00 4C00A887 */  lh         $8, 0x4C($sp)
/* 4FB04 0014FA04 28264072 */  paddub     $4, $18, $0
/* 4FB08 0014FA08 282E2072 */  paddub     $5, $17, $0
/* 4FB0C 0014FA0C 28360070 */  paddub     $6, $0, $0
/* 4FB10 0014FA10 783D050C */  jal        SetMesWinTbl__6ClsMesFiiss
/* 4FB14 0014FA14 00000000 */   nop
/* 4FB18 0014FA18 4800A0AF */  sw         $0, 0x48($sp)
/* 4FB1C 0014FA1C 4C00A0AF */  sw         $0, 0x4C($sp)
/* 4FB20 0014FA20 C4FF0010 */  b          .L0014F934
/* 4FB24 0014FA24 00000000 */   nop
.L0014FA28:
/* 4FB28 0014FA28 4800A787 */  lh         $7, 0x48($sp)
/* 4FB2C 0014FA2C 4C00A887 */  lh         $8, 0x4C($sp)
/* 4FB30 0014FA30 28264072 */  paddub     $4, $18, $0
/* 4FB34 0014FA34 282E2072 */  paddub     $5, $17, $0
/* 4FB38 0014FA38 28360070 */  paddub     $6, $0, $0
/* 4FB3C 0014FA3C 783D050C */  jal        SetMesWinTbl__6ClsMesFiiss
/* 4FB40 0014FA40 00000000 */   nop
/* 4FB44 0014FA44 3C17428E */  lw         $2, 0x173C($18)
/* 4FB48 0014FA48 04004104 */  bgez       $2, .L0014FA5C
/* 4FB4C 0014FA4C 00000000 */   nop
/* 4FB50 0014FA50 3817428E */  lw         $2, 0x1738($18)
/* 4FB54 0014FA54 07004004 */  bltz       $2, .L0014FA74
/* 4FB58 0014FA58 00000000 */   nop
.L0014FA5C:
/* 4FB5C 0014FA5C 4800A38F */  lw         $3, 0x48($sp)
/* 4FB60 0014FA60 3817428E */  lw         $2, 0x1738($18)
/* 4FB64 0014FA64 21106200 */  addu       $2, $3, $2
/* 4FB68 0014FA68 4800A2AF */  sw         $2, 0x48($sp)
/* 4FB6C 0014FA6C B1FF0010 */  b          .L0014F934
/* 4FB70 0014FA70 00000000 */   nop
.L0014FA74:
/* 4FB74 0014FA74 4800A38F */  lw         $3, 0x48($sp)
/* 4FB78 0014FA78 0800428E */  lw         $2, 0x8($18)
/* 4FB7C 0014FA7C 21106200 */  addu       $2, $3, $2
/* 4FB80 0014FA80 4800A2AF */  sw         $2, 0x48($sp)
/* 4FB84 0014FA84 ABFF0010 */  b          .L0014F934
/* 4FB88 0014FA88 00000000 */   nop
.L0014FA8C:
/* 4FB8C 0014FA8C 00FD222A */  slti       $2, $17, -0x300
/* 4FB90 0014FA90 16004014 */  bnez       $2, .L0014FAEC
/* 4FB94 0014FA94 00000000 */   nop
/* 4FB98 0014FA98 9EFD212A */  slti       $at, $17, -0x262
/* 4FB9C 0014FA9C 13002010 */  beqz       $at, .L0014FAEC
/* 4FBA0 0014FAA0 00000000 */   nop
/* 4FBA4 0014FAA4 4800A787 */  lh         $7, 0x48($sp)
/* 4FBA8 0014FAA8 4C00A887 */  lh         $8, 0x4C($sp)
/* 4FBAC 0014FAAC 28264072 */  paddub     $4, $18, $0
/* 4FBB0 0014FAB0 282E2072 */  paddub     $5, $17, $0
/* 4FBB4 0014FAB4 28360070 */  paddub     $6, $0, $0
/* 4FBB8 0014FAB8 783D050C */  jal        SetMesWinTbl__6ClsMesFiiss
/* 4FBBC 0014FABC 00000000 */   nop
/* 4FBC0 0014FAC0 28264072 */  paddub     $4, $18, $0
/* 4FBC4 0014FAC4 282E2072 */  paddub     $5, $17, $0
/* 4FBC8 0014FAC8 CC32050C */  jal        GetGaijiW__6ClsMesFi
/* 4FBCC 0014FACC 00000000 */   nop
/* 4FBD0 0014FAD0 3C1C0200 */  dsll32     $3, $2, 16
/* 4FBD4 0014FAD4 3F1C0300 */  dsra32     $3, $3, 16
/* 4FBD8 0014FAD8 4800A28F */  lw         $2, 0x48($sp)
/* 4FBDC 0014FADC 21104300 */  addu       $2, $2, $3
/* 4FBE0 0014FAE0 4800A2AF */  sw         $2, 0x48($sp)
/* 4FBE4 0014FAE4 93FF0010 */  b          .L0014F934
/* 4FBE8 0014FAE8 00000000 */   nop
.L0014FAEC:
/* 4FBEC 0014FAEC 00F7222A */  slti       $2, $17, -0x900
/* 4FBF0 0014FAF0 10004014 */  bnez       $2, .L0014FB34
/* 4FBF4 0014FAF4 00000000 */   nop
/* 4FBF8 0014FAF8 00F8212A */  slti       $at, $17, -0x800
/* 4FBFC 0014FAFC 0D002010 */  beqz       $at, .L0014FB34
/* 4FC00 0014FB00 00000000 */   nop
/* 4FC04 0014FB04 00092226 */  addiu      $2, $17, 0x900
/* 4FC08 0014FB08 80100200 */  sll        $2, $2, 2
/* 4FC0C 0014FB0C 3C1742AE */  sw         $2, 0x173C($18)
/* 4FC10 0014FB10 28264072 */  paddub     $4, $18, $0
/* 4FC14 0014FB14 3C17458E */  lw         $5, 0x173C($18)
/* 4FC18 0014FB18 0800468E */  lw         $6, 0x8($18)
/* 4FC1C 0014FB1C FEFF0726 */  addiu      $7, $16, -0x2
/* 4FC20 0014FB20 E03D050C */  jal        CalcSpaceW__6ClsMesFiiPs
/* 4FC24 0014FB24 00000000 */   nop
/* 4FC28 0014FB28 381742AE */  sw         $2, 0x1738($18)
/* 4FC2C 0014FB2C 81FF0010 */  b          .L0014F934
/* 4FC30 0014FB30 00000000 */   nop
.L0014FB34:
/* 4FC34 0014FB34 00F8222A */  slti       $2, $17, -0x800
/* 4FC38 0014FB38 08004014 */  bnez       $2, .L0014FB5C
/* 4FC3C 0014FB3C 00000000 */   nop
/* 4FC40 0014FB40 00F9212A */  slti       $at, $17, -0x700
/* 4FC44 0014FB44 05002010 */  beqz       $at, .L0014FB5C
/* 4FC48 0014FB48 00000000 */   nop
/* 4FC4C 0014FB4C 00082226 */  addiu      $2, $17, 0x800
/* 4FC50 0014FB50 381742AE */  sw         $2, 0x1738($18)
/* 4FC54 0014FB54 77FF0010 */  b          .L0014F934
/* 4FC58 0014FB58 00000000 */   nop
.L0014FB5C:
/* 4FC5C 0014FB5C 00F9222A */  slti       $2, $17, -0x700
/* 4FC60 0014FB60 0A004014 */  bnez       $2, .L0014FB8C
/* 4FC64 0014FB64 00000000 */   nop
/* 4FC68 0014FB68 00FA212A */  slti       $at, $17, -0x600
/* 4FC6C 0014FB6C 07002010 */  beqz       $at, .L0014FB8C
/* 4FC70 0014FB70 00000000 */   nop
/* 4FC74 0014FB74 00072326 */  addiu      $3, $17, 0x700
/* 4FC78 0014FB78 4800A28F */  lw         $2, 0x48($sp)
/* 4FC7C 0014FB7C 21104300 */  addu       $2, $2, $3
/* 4FC80 0014FB80 4800A2AF */  sw         $2, 0x48($sp)
/* 4FC84 0014FB84 6BFF0010 */  b          .L0014F934
/* 4FC88 0014FB88 00000000 */   nop
.L0014FB8C:
/* 4FC8C 0014FB8C FAFA222A */  slti       $2, $17, -0x506
/* 4FC90 0014FB90 22004014 */  bnez       $2, .L0014FC1C
/* 4FC94 0014FB94 00000000 */   nop
/* 4FC98 0014FB98 00FB212A */  slti       $at, $17, -0x500
/* 4FC9C 0014FB9C 1F002010 */  beqz       $at, .L0014FC1C
/* 4FCA0 0014FBA0 00000000 */   nop
/* 4FCA4 0014FBA4 06052426 */  addiu      $4, $17, 0x506
/* 4FCA8 0014FBA8 6039050C */  jal        SetAndGetNameRegistTbl__Fi
/* 4FCAC 0014FBAC 00000000 */   nop
/* 4FCB0 0014FBB0 288E4070 */  paddub     $17, $2, $0
/* 4FCB4 0014FBB4 5FFF2012 */  beqz       $17, .L0014F934
/* 4FCB8 0014FBB8 00000000 */   nop
/* 4FCBC 0014FBBC 00002586 */  lh         $5, 0x0($17)
/* 4FCC0 0014FBC0 0E000010 */  b          .L0014FBFC
/* 4FCC4 0014FBC4 00000000 */   nop
.L0014FBC8:
/* 4FCC8 0014FBC8 4800A787 */  lh         $7, 0x48($sp)
/* 4FCCC 0014FBCC 4C00A887 */  lh         $8, 0x4C($sp)
/* 4FCD0 0014FBD0 28264072 */  paddub     $4, $18, $0
/* 4FCD4 0014FBD4 28360070 */  paddub     $6, $0, $0
/* 4FCD8 0014FBD8 783D050C */  jal        SetMesWinTbl__6ClsMesFiiss
/* 4FCDC 0014FBDC 00000000 */   nop
/* 4FCE0 0014FBE0 4800A38F */  lw         $3, 0x48($sp)
/* 4FCE4 0014FBE4 0800428E */  lw         $2, 0x8($18)
/* 4FCE8 0014FBE8 21106200 */  addu       $2, $3, $2
/* 4FCEC 0014FBEC 4800A2AF */  sw         $2, 0x48($sp)
/* 4FCF0 0014FBF0 02003126 */  addiu      $17, $17, 0x2
/* 4FCF4 0014FBF4 00002586 */  lh         $5, 0x0($17)
/* 4FCF8 0014FBF8 00000000 */  nop
.L0014FBFC:
/* 4FCFC 0014FBFC 00FF0224 */  addiu      $2, $0, -0x100
/* 4FD00 0014FC00 4CFFA210 */  beq        $5, $2, .L0014F934
/* 4FD04 0014FC04 00000000 */   nop
/* 4FD08 0014FC08 01FF0224 */  addiu      $2, $0, -0xFF
/* 4FD0C 0014FC0C EEFFA214 */  bne        $5, $2, .L0014FBC8
/* 4FD10 0014FC10 00000000 */   nop
/* 4FD14 0014FC14 47FF0010 */  b          .L0014F934
/* 4FD18 0014FC18 00000000 */   nop
.L0014FC1C:
/* 4FD1C 0014FC1C FFFB0224 */  addiu      $2, $0, -0x401
/* 4FD20 0014FC20 08002216 */  bne        $17, $2, .L0014FC44
/* 4FD24 0014FC24 00000000 */   nop
/* 4FD28 0014FC28 28264072 */  paddub     $4, $18, $0
/* 4FD2C 0014FC2C 4800A527 */  addiu      $5, $sp, 0x48
/* 4FD30 0014FC30 4C00A627 */  addiu      $6, $sp, 0x4C
/* 4FD34 0014FC34 C039050C */  jal        MakeMesWinTbl_value__6ClsMesFPiPi
/* 4FD38 0014FC38 00000000 */   nop
/* 4FD3C 0014FC3C 3DFF0010 */  b          .L0014F934
/* 4FD40 0014FC40 00000000 */   nop
.L0014FC44:
/* 4FD44 0014FC44 F3FB222A */  slti       $2, $17, -0x40D
/* 4FD48 0014FC48 0D004014 */  bnez       $2, .L0014FC80
/* 4FD4C 0014FC4C 00000000 */   nop
/* 4FD50 0014FC50 FBFB212A */  slti       $at, $17, -0x405
/* 4FD54 0014FC54 0A002010 */  beqz       $at, .L0014FC80
/* 4FD58 0014FC58 00000000 */   nop
/* 4FD5C 0014FC5C FAFB0224 */  addiu      $2, $0, -0x406
/* 4FD60 0014FC60 23285100 */  subu       $5, $2, $17
/* 4FD64 0014FC64 28264072 */  paddub     $4, $18, $0
/* 4FD68 0014FC68 4800A627 */  addiu      $6, $sp, 0x48
/* 4FD6C 0014FC6C 4C00A727 */  addiu      $7, $sp, 0x4C
/* 4FD70 0014FC70 4C3A050C */  jal        MakeMesWinTbl_value__6ClsMesFiPiPi
/* 4FD74 0014FC74 00000000 */   nop
/* 4FD78 0014FC78 2EFF0010 */  b          .L0014F934
/* 4FD7C 0014FC7C 00000000 */   nop
.L0014FC80:
/* 4FD80 0014FC80 28264072 */  paddub     $4, $18, $0
/* 4FD84 0014FC84 282E2072 */  paddub     $5, $17, $0
/* 4FD88 0014FC88 4800A627 */  addiu      $6, $sp, 0x48
/* 4FD8C 0014FC8C 4C00A727 */  addiu      $7, $sp, 0x4C
/* 4FD90 0014FC90 DC3A050C */  jal        MakeMesWinTbl_system__6ClsMesFiPiPi
/* 4FD94 0014FC94 00000000 */   nop
/* 4FD98 0014FC98 26FF4014 */  bnez       $2, .L0014F934
/* 4FD9C 0014FC9C 00000000 */   nop
/* 4FDA0 0014FCA0 4800A787 */  lh         $7, 0x48($sp)
/* 4FDA4 0014FCA4 4C00A887 */  lh         $8, 0x4C($sp)
/* 4FDA8 0014FCA8 28264072 */  paddub     $4, $18, $0
/* 4FDAC 0014FCAC 282E2072 */  paddub     $5, $17, $0
/* 4FDB0 0014FCB0 28360070 */  paddub     $6, $0, $0
/* 4FDB4 0014FCB4 783D050C */  jal        SetMesWinTbl__6ClsMesFiiss
/* 4FDB8 0014FCB8 00000000 */   nop
/* 4FDBC 0014FCBC 1DFF4010 */  beqz       $2, .L0014F934
/* 4FDC0 0014FCC0 00000000 */   nop
/* 4FDC4 0014FCC4 4800A38F */  lw         $3, 0x48($sp)
/* 4FDC8 0014FCC8 0800428E */  lw         $2, 0x8($18)
/* 4FDCC 0014FCCC 21106200 */  addu       $2, $3, $2
/* 4FDD0 0014FCD0 4800A2AF */  sw         $2, 0x48($sp)
/* 4FDD4 0014FCD4 17FF0010 */  b          .L0014F934
/* 4FDD8 0014FCD8 00000000 */   nop
.L0014FCDC:
/* 4FDDC 0014FCDC 3000BF7B */  lq         $31, 0x30($sp)
/* 4FDE0 0014FCE0 2000B27B */  lq         $18, 0x20($sp)
/* 4FDE4 0014FCE4 1000B17B */  lq         $17, 0x10($sp)
/* 4FDE8 0014FCE8 0000B07B */  lq         $16, 0x0($sp)
/* 4FDEC 0014FCEC 5000BD27 */  addiu      $sp, $sp, 0x50
/* 4FDF0 0014FCF0 0800E003 */  jr         $31
/* 4FDF4 0014FCF4 00000000 */   nop
/* 4FDF8 0014FCF8 00000000 */  nop
/* 4FDFC 0014FCFC 00000000 */  nop
