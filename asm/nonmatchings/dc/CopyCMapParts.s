.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CopyCMapParts__FP9CMapPartsP9CMapPartsP14CDataAlloc2_1_
/* 838A0 001837A0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 838A4 001837A4 4000BF7F */  sq         $31, 0x40($sp)
/* 838A8 001837A8 3000B37F */  sq         $19, 0x30($sp)
/* 838AC 001837AC 2000B27F */  sq         $18, 0x20($sp)
/* 838B0 001837B0 1000B17F */  sq         $17, 0x10($sp)
/* 838B4 001837B4 0000B07F */  sq         $16, 0x0($sp)
/* 838B8 001837B8 289E8070 */  paddub     $19, $4, $0
/* 838BC 001837BC 2896A070 */  paddub     $18, $5, $0
/* 838C0 001837C0 288EC070 */  paddub     $17, $6, $0
/* 838C4 001837C4 28860070 */  paddub     $16, $0, $0
/* 838C8 001837C8 0D000010 */  b          .L00183800
/* 838CC 001837CC 00000000 */   nop
.L001837D0:
/* 838D0 001837D0 80101000 */  sll        $2, $16, 2
/* 838D4 001837D4 21105200 */  addu       $2, $2, $18
/* 838D8 001837D8 B000448C */  lw         $4, 0xB0($2)
/* 838DC 001837DC 282E2072 */  paddub     $5, $17, $0
/* 838E0 001837E0 849D040C */  jal        CopyFrameVu1__FP9CFrameVu1P14CDataAlloc2_1_
/* 838E4 001837E4 00000000 */   nop
/* 838E8 001837E8 28266072 */  paddub     $4, $19, $0
/* 838EC 001837EC 282E4070 */  paddub     $5, $2, $0
/* 838F0 001837F0 28360072 */  paddub     $6, $16, $0
/* 838F4 001837F4 305C050C */  jal        SetFrame__12CObjectFrameFP9CFrameVu1i
/* 838F8 001837F8 00000000 */   nop
/* 838FC 001837FC 01001026 */  addiu      $16, $16, 0x1
.L00183800:
/* 83900 00183800 0400022A */  slti       $2, $16, 0x4
/* 83904 00183804 F2FF4014 */  bnez       $2, .L001837D0
/* 83908 00183808 00000000 */   nop
/* 8390C 0018380C 28264072 */  paddub     $4, $18, $0
/* 83910 00183810 3C5D050C */  jal        GetCollisionFrame__10CMapObjectFv
/* 83914 00183814 00000000 */   nop
/* 83918 00183818 28264070 */  paddub     $4, $2, $0
/* 8391C 0018381C 282E2072 */  paddub     $5, $17, $0
/* 83920 00183820 C09D040C */  jal        CopyFrame__FP6CFrameP14CDataAlloc2_1_
/* 83924 00183824 00000000 */   nop
/* 83928 00183828 D00062AE */  sw         $2, 0xD0($19)
/* 8392C 0018382C D400448E */  lw         $4, 0xD4($18)
/* 83930 00183830 282E2072 */  paddub     $5, $17, $0
/* 83934 00183834 849D040C */  jal        CopyFrameVu1__FP9CFrameVu1P14CDataAlloc2_1_
/* 83938 00183838 00000000 */   nop
/* 8393C 0018383C D40062AE */  sw         $2, 0xD4($19)
/* 83940 00183840 D800448E */  lw         $4, 0xD8($18)
/* 83944 00183844 282E2072 */  paddub     $5, $17, $0
/* 83948 00183848 849D040C */  jal        CopyFrameVu1__FP9CFrameVu1P14CDataAlloc2_1_
/* 8394C 0018384C 00000000 */   nop
/* 83950 00183850 D80062AE */  sw         $2, 0xD8($19)
/* 83954 00183854 DC00448E */  lw         $4, 0xDC($18)
/* 83958 00183858 04008014 */  bnez       $4, .L0018386C
/* 8395C 0018385C 00000000 */   nop
/* 83960 00183860 28260070 */  paddub     $4, $0, $0
/* 83964 00183864 0E000010 */  b          .L001838A0
/* 83968 00183868 00000000 */   nop
.L0018386C:
/* 8396C 0018386C 10004CC6 */  lwc1       $f12, 0x10($18)
/* 83970 00183870 14004DC6 */  lwc1       $f13, 0x14($18)
/* 83974 00183874 18004EC6 */  lwc1       $f14, 0x18($18)
/* 83978 00183878 A09F040C */  jal        SetPosition__6CFrameFfff
/* 8397C 0018387C 00000000 */   nop
/* 83980 00183880 DC00448E */  lw         $4, 0xDC($18)
/* 83984 00183884 60004CC6 */  lwc1       $f12, 0x60($18)
/* 83988 00183888 64004DC6 */  lwc1       $f13, 0x64($18)
/* 8398C 0018388C 68004EC6 */  lwc1       $f14, 0x68($18)
/* 83990 00183890 70A3040C */  jal        SetRotation__6CFrameFfff
/* 83994 00183894 00000000 */   nop
/* 83998 00183898 DC00448E */  lw         $4, 0xDC($18)
/* 8399C 0018389C 00000000 */  nop
.L001838A0:
/* 839A0 001838A0 282E2072 */  paddub     $5, $17, $0
/* 839A4 001838A4 C09D040C */  jal        CopyFrame__FP6CFrameP14CDataAlloc2_1_
/* 839A8 001838A8 00000000 */   nop
/* 839AC 001838AC DC0062AE */  sw         $2, 0xDC($19)
/* 839B0 001838B0 0401448E */  lw         $4, 0x104($18)
/* 839B4 001838B4 282E2072 */  paddub     $5, $17, $0
/* 839B8 001838B8 849D040C */  jal        CopyFrameVu1__FP9CFrameVu1P14CDataAlloc2_1_
/* 839BC 001838BC 00000000 */   nop
/* 839C0 001838C0 040162AE */  sw         $2, 0x104($19)
/* 839C4 001838C4 4000BF7B */  lq         $31, 0x40($sp)
/* 839C8 001838C8 3000B37B */  lq         $19, 0x30($sp)
/* 839CC 001838CC 2000B27B */  lq         $18, 0x20($sp)
/* 839D0 001838D0 1000B17B */  lq         $17, 0x10($sp)
/* 839D4 001838D4 0000B07B */  lq         $16, 0x0($sp)
/* 839D8 001838D8 5000BD27 */  addiu      $sp, $sp, 0x50
/* 839DC 001838DC 0800E003 */  jr         $31
/* 839E0 001838E0 00000000 */   nop
/* 839E4 001838E4 00000000 */  nop
/* 839E8 001838E8 00000000 */  nop
/* 839EC 001838EC 00000000 */  nop