.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_MONSTOR_VECTOR__FP12RS_STACKDATAi
/* 0E5970 001E5870 00FFBD27 */  addiu       $29, $29, -0x100
/* 0E5974 001E5874 5000BF7F */  sq          $31, 0x50($29)
/* 0E5978 001E5878 4000B37F */  sq          $19, 0x40($29)
/* 0E597C 001E587C 3000B27F */  sq          $18, 0x30($29)
/* 0E5980 001E5880 2000B17F */  sq          $17, 0x20($29)
/* 0E5984 001E5884 1000B07F */  sq          $16, 0x10($29)
/* 0E5988 001E5888 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0E598C 001E588C 2896A070 */  paddub      $18, $5, $0
/* 0E5990 001E5890 08009324 */  addiu       $19, $4, 0x8
/* 0E5994 001E5894 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E5998 001E5898 00000000 */   nop
/* 0E599C 001E589C 00A08044 */  mtc1        $0, $f20
/* 0E59A0 001E58A0 10350324 */  addiu       $3, $0, 0x3510
/* 0E59A4 001E58A4 18184300 */  mult        $3, $2, $3
/* 0E59A8 001E58A8 E09C828F */  lw          $2, -0x6320($28)
/* 0E59AC 001E58AC 21104300 */  addu        $2, $2, $3
/* 0E59B0 001E58B0 0100013C */  lui         $1, (0x1FCD0 >> 16)
/* 0E59B4 001E58B4 D0FC2134 */  ori         $1, $1, (0x1FCD0 & 0xFFFF)
/* 0E59B8 001E58B8 21204100 */  addu        $4, $2, $1
/* 0E59BC 001E58BC 7000A527 */  addiu       $5, $29, 0x70
/* 0E59C0 001E58C0 A000998C */  lw          $25, 0xA0($4)
/* 0E59C4 001E58C4 A000398F */  lw          $25, 0xA0($25)
/* 0E59C8 001E58C8 09F82003 */  jalr        $25
/* 0E59CC 001E58CC 00000000 */   nop
/* 0E59D0 001E58D0 28266072 */  paddub      $4, $19, $0
/* 0E59D4 001E58D4 08009324 */  addiu       $19, $4, 0x8
/* 0E59D8 001E58D8 A485070C */  jal         GetStackFloat__FP12RS_STACKDATA__3
/* 0E59DC 001E58DC 00000000 */   nop
/* 0E59E0 001E58E0 6000A0E7 */  swc1        $f0, 0x60($29)
/* 0E59E4 001E58E4 28266072 */  paddub      $4, $19, $0
/* 0E59E8 001E58E8 08009324 */  addiu       $19, $4, 0x8
/* 0E59EC 001E58EC A485070C */  jal         GetStackFloat__FP12RS_STACKDATA__3
/* 0E59F0 001E58F0 00000000 */   nop
/* 0E59F4 001E58F4 6400B027 */  addiu       $16, $29, 0x64
/* 0E59F8 001E58F8 000000E6 */  swc1        $f0, 0x0($16)
/* 0E59FC 001E58FC 28266072 */  paddub      $4, $19, $0
/* 0E5A00 001E5900 08009324 */  addiu       $19, $4, 0x8
/* 0E5A04 001E5904 A485070C */  jal         GetStackFloat__FP12RS_STACKDATA__3
/* 0E5A08 001E5908 00000000 */   nop
/* 0E5A0C 001E590C 6800B127 */  addiu       $17, $29, 0x68
/* 0E5A10 001E5910 000020E6 */  swc1        $f0, 0x0($17)
/* 0E5A14 001E5914 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0E5A18 001E5918 6C00A2AF */  sw          $2, 0x6C($29)
/* 0E5A1C 001E591C 08000224 */  addiu       $2, $0, 0x8
/* 0E5A20 001E5920 20004216 */  bne         $18, $2, .L001E59A4
/* 0E5A24 001E5924 00000000 */   nop
/* 0E5A28 001E5928 28266072 */  paddub      $4, $19, $0
/* 0E5A2C 001E592C 08009324 */  addiu       $19, $4, 0x8
/* 0E5A30 001E5930 A485070C */  jal         GetStackFloat__FP12RS_STACKDATA__3
/* 0E5A34 001E5934 00000000 */   nop
/* 0E5A38 001E5938 06050046 */  mov.s       $f20, $f0
/* 0E5A3C 001E593C 3443023C */  lui         $2, (0x43340000 >> 16)
/* 0E5A40 001E5940 00008244 */  mtc1        $2, $f0
/* 0E5A44 001E5944 00000000 */  nop
/* 0E5A48 001E5948 34A00046 */  c.lt.s      $f20, $f0
/* 0E5A4C 001E594C 00000000 */  nop
/* 0E5A50 001E5950 05000145 */  bc1t        .L001E5968
/* 0E5A54 001E5954 00000000 */   nop
/* 0E5A58 001E5958 B443023C */  lui         $2, (0x43B40000 >> 16)
/* 0E5A5C 001E595C 00008244 */  mtc1        $2, $f0
/* 0E5A60 001E5960 00000000 */  nop
/* 0E5A64 001E5964 01A50046 */  sub.s       $f20, $f20, $f0
.L001E5968:
/* 0E5A68 001E5968 788180C7 */  lwc1        $f0, -0x7E88($28)
/* 0E5A6C 001E596C 02051446 */  mul.s       $f20, $f0, $f20
/* 0E5A70 001E5970 588180C7 */  lwc1        $f0, -0x7EA8($28)
/* 0E5A74 001E5974 36A00046 */  c.le.s      $f20, $f0
/* 0E5A78 001E5978 00000000 */  nop
/* 0E5A7C 001E597C 02000145 */  bc1t        .L001E5988
/* 0E5A80 001E5980 00000000 */   nop
/* 0E5A84 001E5984 01A50046 */  sub.s       $f20, $f20, $f0
.L001E5988:
/* 0E5A88 001E5988 7C8180C7 */  lwc1        $f0, -0x7E84($28)
/* 0E5A8C 001E598C 34A00046 */  c.lt.s      $f20, $f0
/* 0E5A90 001E5990 00000000 */  nop
/* 0E5A94 001E5994 03000045 */  bc1f        .L001E59A4
/* 0E5A98 001E5998 00000000 */   nop
/* 0E5A9C 001E599C 808180C7 */  lwc1        $f0, -0x7E80($28)
/* 0E5AA0 001E59A0 00A50046 */  add.s       $f20, $f20, $f0
.L001E59A4:
/* 0E5AA4 001E59A4 6000A1C7 */  lwc1        $f1, 0x60($29)
/* 0E5AA8 001E59A8 7000A0C7 */  lwc1        $f0, 0x70($29)
/* 0E5AAC 001E59AC 01080046 */  sub.s       $f0, $f1, $f0
/* 0E5AB0 001E59B0 6000A0E7 */  swc1        $f0, 0x60($29)
/* 0E5AB4 001E59B4 000001C6 */  lwc1        $f1, 0x0($16)
/* 0E5AB8 001E59B8 7400A0C7 */  lwc1        $f0, 0x74($29)
/* 0E5ABC 001E59BC 01080046 */  sub.s       $f0, $f1, $f0
/* 0E5AC0 001E59C0 000000E6 */  swc1        $f0, 0x0($16)
/* 0E5AC4 001E59C4 000021C6 */  lwc1        $f1, 0x0($17)
/* 0E5AC8 001E59C8 7800A0C7 */  lwc1        $f0, 0x78($29)
/* 0E5ACC 001E59CC 01080046 */  sub.s       $f0, $f1, $f0
/* 0E5AD0 001E59D0 000020E6 */  swc1        $f0, 0x0($17)
/* 0E5AD4 001E59D4 6000A427 */  addiu       $4, $29, 0x60
/* 0E5AD8 001E59D8 282E8070 */  paddub      $5, $4, $0
/* 0E5ADC 001E59DC 9285040C */  jal         sceVu0Normalize
/* 0E5AE0 001E59E0 00000000 */   nop
/* 0E5AE4 001E59E4 08000224 */  addiu       $2, $0, 0x8
/* 0E5AE8 001E59E8 0E004216 */  bne         $18, $2, .L001E5A24
/* 0E5AEC 001E59EC 00000000 */   nop
/* 0E5AF0 001E59F0 C000A427 */  addiu       $4, $29, 0xC0
/* 0E5AF4 001E59F4 2A86040C */  jal         sceVu0UnitMatrix
/* 0E5AF8 001E59F8 00000000 */   nop
/* 0E5AFC 001E59FC 8000A427 */  addiu       $4, $29, 0x80
/* 0E5B00 001E5A00 C000A527 */  addiu       $5, $29, 0xC0
/* 0E5B04 001E5A04 06A30046 */  mov.s       $f12, $f20
/* 0E5B08 001E5A08 A686040C */  jal         sceVu0RotMatrixY
/* 0E5B0C 001E5A0C 00000000 */   nop
/* 0E5B10 001E5A10 6000A427 */  addiu       $4, $29, 0x60
/* 0E5B14 001E5A14 8000A527 */  addiu       $5, $29, 0x80
/* 0E5B18 001E5A18 28368070 */  paddub      $6, $4, $0
/* 0E5B1C 001E5A1C 6285040C */  jal         sceVu0ApplyMatrix
/* 0E5B20 001E5A20 00000000 */   nop
.L001E5A24:
/* 0E5B24 001E5A24 28266072 */  paddub      $4, $19, $0
/* 0E5B28 001E5A28 08009324 */  addiu       $19, $4, 0x8
/* 0E5B2C 001E5A2C 6000ACC7 */  lwc1        $f12, 0x60($29)
/* 0E5B30 001E5A30 BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E5B34 001E5A34 00000000 */   nop
/* 0E5B38 001E5A38 28266072 */  paddub      $4, $19, $0
/* 0E5B3C 001E5A3C 08009324 */  addiu       $19, $4, 0x8
/* 0E5B40 001E5A40 00000CC6 */  lwc1        $f12, 0x0($16)
/* 0E5B44 001E5A44 BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E5B48 001E5A48 00000000 */   nop
/* 0E5B4C 001E5A4C 28266072 */  paddub      $4, $19, $0
/* 0E5B50 001E5A50 00002CC6 */  lwc1        $f12, 0x0($17)
/* 0E5B54 001E5A54 BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E5B58 001E5A58 00000000 */   nop
/* 0E5B5C 001E5A5C 01000224 */  addiu       $2, $0, 0x1
/* 0E5B60 001E5A60 5000BF7B */  lq          $31, 0x50($29)
/* 0E5B64 001E5A64 4000B37B */  lq          $19, 0x40($29)
/* 0E5B68 001E5A68 3000B27B */  lq          $18, 0x30($29)
/* 0E5B6C 001E5A6C 2000B17B */  lq          $17, 0x20($29)
/* 0E5B70 001E5A70 1000B07B */  lq          $16, 0x10($29)
/* 0E5B74 001E5A74 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0E5B78 001E5A78 0001BD27 */  addiu       $29, $29, 0x100
/* 0E5B7C 001E5A7C 0800E003 */  jr          $31
/* 0E5B80 001E5A80 00000000 */   nop
/* 0E5B84 001E5A84 00000000 */  nop
/* 0E5B88 001E5A88 00000000 */  nop
/* 0E5B8C 001E5A8C 00000000 */  nop
