.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MapLoad__Fv
/* 0128A0 01DBE5A0 90EABD27 */  addiu       $29, $29, -0x1570
/* 0128A4 01DBE5A4 8000BF7F */  sq          $31, 0x80($29)
/* 0128A8 01DBE5A8 7000B77F */  sq          $23, 0x70($29)
/* 0128AC 01DBE5AC 6000B67F */  sq          $22, 0x60($29)
/* 0128B0 01DBE5B0 5000B57F */  sq          $21, 0x50($29)
/* 0128B4 01DBE5B4 4000B47F */  sq          $20, 0x40($29)
/* 0128B8 01DBE5B8 3000B37F */  sq          $19, 0x30($29)
/* 0128BC 01DBE5BC 2000B27F */  sq          $18, 0x20($29)
/* 0128C0 01DBE5C0 1000B17F */  sq          $17, 0x10($29)
/* 0128C4 01DBE5C4 0000B07F */  sq          $16, 0x0($29)
/* 0128C8 01DBE5C8 DD01023C */  lui         $2, %hi(LIT_649__4)
/* 0128CC 01DBE5CC 307F4624 */  addiu       $6, $2, %lo(LIT_649__4)
/* 0128D0 01DBE5D0 9000A527 */  addiu       $5, $29, 0x90
/* 0128D4 01DBE5D4 4B000424 */  addiu       $4, $0, 0x4B
.L01DBE5D8_2C3DD8:
/* 0128D8 01DBE5D8 0000C378 */  lq          $3, 0x0($6)
/* 0128DC 01DBE5DC 1000C278 */  lq          $2, 0x10($6)
/* 0128E0 01DBE5E0 2000C624 */  addiu       $6, $6, 0x20
/* 0128E4 01DBE5E4 FFFF8424 */  addiu       $4, $4, -0x1
/* 0128E8 01DBE5E8 0000A37C */  sq          $3, 0x0($5)
/* 0128EC 01DBE5EC 1000A27C */  sq          $2, 0x10($5)
/* 0128F0 01DBE5F0 2000A524 */  addiu       $5, $5, 0x20
/* 0128F4 01DBE5F4 F8FF801C */  bgtz        $4, .L01DBE5D8_2C3DD8
/* 0128F8 01DBE5F8 00000000 */   nop
/* 0128FC 01DBE5FC F009A427 */  addiu       $4, $29, 0x9F0
/* 012900 01DBE600 509F040C */  jal         __ct__10CFrameAttrFv
/* 012904 01DBE604 00000000 */   nop
/* 012908 01DBE608 01000324 */  addiu       $3, $0, 0x1
/* 01290C 01DBE60C FC09A3A3 */  sb          $3, 0x9FC($29)
/* 012910 01DBE610 DF01013C */  lui         $1, %hi(MapDataBuffer + 0x8)
/* 012914 01DBE614 B8FE20AC */  sw          $0, %lo(MapDataBuffer + 0x8)($1)
/* 012918 01DBE618 288E0070 */  paddub      $17, $0, $0
/* 01291C 01DBE61C C6000010 */  b           .L01DBE938_2C4138
/* 012920 01DBE620 00000000 */   nop
.L01DBE624_2C3E24:
/* 012924 01DBE624 40A11100 */  sll         $20, $17, 5
/* 012928 01DBE628 21109D02 */  addu        $2, $20, $29
/* 01292C 01DBE62C 9000448C */  lw          $4, 0x90($2)
/* 012930 01DBE630 0E008010 */  beqz        $4, .L01DBE66C_2C3E6C
/* 012934 01DBE634 00000000 */   nop
/* 012938 01DBE638 948B858F */  lw          $5, -0x746C($28)
/* 01293C 01DBE63C 28360070 */  paddub      $6, $0, $0
/* 012940 01DBE640 D8FC040C */  jal         LoadFile__FPcPvPi
/* 012944 01DBE644 00000000 */   nop
/* 012948 01DBE648 948B848F */  lw          $4, -0x746C($28)
/* 01294C 01DBE64C DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 012950 01DBE650 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 012954 01DBE654 02000624 */  addiu       $6, $0, 0x2
/* 012958 01DBE658 283E0070 */  paddub      $7, $0, $0
/* 01295C 01DBE65C 28460070 */  paddub      $8, $0, $0
/* 012960 01DBE660 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 012964 01DBE664 00000000 */   nop
/* 012968 01DBE668 28864070 */  paddub      $16, $2, $0
.L01DBE66C_2C3E6C:
/* 01296C 01DBE66C 04000224 */  addiu       $2, $0, 0x4
/* 012970 01DBE670 02002216 */  bne         $17, $2, .L01DBE67C_2C3E7C
/* 012974 01DBE674 00000000 */   nop
/* 012978 01DBE678 D89990AF */  sw          $16, -0x6628($28)
.L01DBE67C_2C3E7C:
/* 01297C 01DBE67C 05000224 */  addiu       $2, $0, 0x5
/* 012980 01DBE680 02002216 */  bne         $17, $2, .L01DBE68C_2C3E8C
/* 012984 01DBE684 00000000 */   nop
/* 012988 01DBE688 DC9990AF */  sw          $16, -0x6624($28)
.L01DBE68C_2C3E8C:
/* 01298C 01DBE68C 4300222A */  slti        $2, $17, 0x43
/* 012990 01DBE690 09004014 */  bnez        $2, .L01DBE6B8_2C3EB8
/* 012994 01DBE694 00000000 */   nop
/* 012998 01DBE698 4B00212A */  slti        $1, $17, 0x4B
/* 01299C 01DBE69C 06002010 */  beqz        $1, .L01DBE6B8_2C3EB8
/* 0129A0 01DBE6A0 00000000 */   nop
/* 0129A4 01DBE6A4 80181100 */  sll         $3, $17, 2
/* 0129A8 01DBE6A8 E301023C */  lui         $2, %hi(Fuusya__2 + 0x44)
/* 0129AC 01DBE6AC B4AB4224 */  addiu       $2, $2, %lo(Fuusya__2 + 0x44)
/* 0129B0 01DBE6B0 21104300 */  addu        $2, $2, $3
/* 0129B4 01DBE6B4 000050AC */  sw          $16, 0x0($2)
.L01DBE6B8_2C3EB8:
/* 0129B8 01DBE6B8 28260072 */  paddub      $4, $16, $0
/* 0129BC 01DBE6BC 01000524 */  addiu       $5, $0, 0x1
/* 0129C0 01DBE6C0 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 0129C4 01DBE6C4 00000000 */   nop
/* 0129C8 01DBE6C8 28260072 */  paddub      $4, $16, $0
/* 0129CC 01DBE6CC F009A527 */  addiu       $5, $29, 0x9F0
/* 0129D0 01DBE6D0 01000624 */  addiu       $6, $0, 0x1
/* 0129D4 01DBE6D4 40000724 */  addiu       $7, $0, 0x40
/* 0129D8 01DBE6D8 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0129DC 01DBE6DC 00000000 */   nop
/* 0129E0 01DBE6E0 00111100 */  sll         $2, $17, 4
/* 0129E4 01DBE6E4 23105100 */  subu        $2, $2, $17
/* 0129E8 01DBE6E8 00A90200 */  sll         $21, $2, 4
/* 0129EC 01DBE6EC E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 0129F0 01DBE6F0 B0F64224 */  addiu       $2, $2, %lo(OP_NornMapObj)
/* 0129F4 01DBE6F4 21985500 */  addu        $19, $2, $21
/* 0129F8 01DBE6F8 28266072 */  paddub      $4, $19, $0
/* 0129FC 01DBE6FC 445E050C */  jal         Initialize__10CMapObjectFv
/* 012A00 01DBE700 00000000 */   nop
/* 012A04 01DBE704 28266072 */  paddub      $4, $19, $0
/* 012A08 01DBE708 282E0072 */  paddub      $5, $16, $0
/* 012A0C 01DBE70C 28360070 */  paddub      $6, $0, $0
/* 012A10 01DBE710 305C050C */  jal         SetFrame__12CObjectFrameFP9CFrameVu1i
/* 012A14 01DBE714 00000000 */   nop
/* 012A18 01DBE718 E201023C */  lui         $2, %hi(OP_NornMapObj + 0xE8)
/* 012A1C 01DBE71C 98F74224 */  addiu       $2, $2, %lo(OP_NornMapObj + 0xE8)
/* 012A20 01DBE720 21105500 */  addu        $2, $2, $21
/* 012A24 01DBE724 000040AC */  sw          $0, 0x0($2)
/* 012A28 01DBE728 E201023C */  lui         $2, %hi(OP_NornMapObj + 0xE4)
/* 012A2C 01DBE72C 94F74224 */  addiu       $2, $2, %lo(OP_NornMapObj + 0xE4)
/* 012A30 01DBE730 21105500 */  addu        $2, $2, $21
/* 012A34 01DBE734 000040AC */  sw          $0, 0x0($2)
/* 012A38 01DBE738 21189D02 */  addu        $3, $20, $29
/* 012A3C 01DBE73C 2041023C */  lui         $2, (0x41200000 >> 16)
/* 012A40 01DBE740 00088244 */  mtc1        $2, $f1
/* 012A44 01DBE744 A00060C4 */  lwc1        $f0, 0xA0($3)
/* 012A48 01DBE748 C2080046 */  mul.s       $f3, $f1, $f0
/* 012A4C 01DBE74C 9C0060C4 */  lwc1        $f0, 0x9C($3)
/* 012A50 01DBE750 82080046 */  mul.s       $f2, $f1, $f0
/* 012A54 01DBE754 980060C4 */  lwc1        $f0, 0x98($3)
/* 012A58 01DBE758 02080046 */  mul.s       $f0, $f1, $f0
/* 012A5C 01DBE75C 3015A0E7 */  swc1        $f0, 0x1530($29)
/* 012A60 01DBE760 3415A2E7 */  swc1        $f2, 0x1534($29)
/* 012A64 01DBE764 3815A3E7 */  swc1        $f3, 0x1538($29)
/* 012A68 01DBE768 28266072 */  paddub      $4, $19, $0
/* 012A6C 01DBE76C 3015A527 */  addiu       $5, $29, 0x1530
/* 012A70 01DBE770 A000798E */  lw          $25, 0xA0($19)
/* 012A74 01DBE774 1000398F */  lw          $25, 0x10($25)
/* 012A78 01DBE778 09F82003 */  jalr        $25
/* 012A7C 01DBE77C 00000000 */   nop
/* 012A80 01DBE780 21109D02 */  addu        $2, $20, $29
/* 012A84 01DBE784 AC004CC4 */  lwc1        $f12, 0xAC($2)
/* 012A88 01DBE788 9044040C */  jal         fptodp
/* 012A8C 01DBE78C 00000000 */   nop
/* 012A90 01DBE790 188084DF */  ld          $4, -0x7FE8($28)
/* 012A94 01DBE794 282E4070 */  paddub      $5, $2, $0
/* 012A98 01DBE798 9E3F040C */  jal         dpmul
/* 012A9C 01DBE79C 00000000 */   nop
/* 012AA0 01DBE7A0 28AE4070 */  paddub      $21, $2, $0
/* 012AA4 01DBE7A4 B4000424 */  addiu       $4, $0, 0xB4
/* 012AA8 01DBE7A8 FC40040C */  jal         litodp
/* 012AAC 01DBE7AC 00000000 */   nop
/* 012AB0 01DBE7B0 2826A072 */  paddub      $4, $21, $0
/* 012AB4 01DBE7B4 282E4070 */  paddub      $5, $2, $0
/* 012AB8 01DBE7B8 4840040C */  jal         dpdiv
/* 012ABC 01DBE7BC 00000000 */   nop
/* 012AC0 01DBE7C0 28BE4070 */  paddub      $23, $2, $0
/* 012AC4 01DBE7C4 28264070 */  paddub      $4, $2, $0
/* 012AC8 01DBE7C8 9241040C */  jal         dptofp
/* 012ACC 01DBE7CC 00000000 */   nop
/* 012AD0 01DBE7D0 21109D02 */  addu        $2, $20, $29
/* 012AD4 01DBE7D4 A8004CC4 */  lwc1        $f12, 0xA8($2)
/* 012AD8 01DBE7D8 9044040C */  jal         fptodp
/* 012ADC 01DBE7DC 00000000 */   nop
/* 012AE0 01DBE7E0 188084DF */  ld          $4, -0x7FE8($28)
/* 012AE4 01DBE7E4 282E4070 */  paddub      $5, $2, $0
/* 012AE8 01DBE7E8 9E3F040C */  jal         dpmul
/* 012AEC 01DBE7EC 00000000 */   nop
/* 012AF0 01DBE7F0 28AE4070 */  paddub      $21, $2, $0
/* 012AF4 01DBE7F4 B4000424 */  addiu       $4, $0, 0xB4
/* 012AF8 01DBE7F8 FC40040C */  jal         litodp
/* 012AFC 01DBE7FC 00000000 */   nop
/* 012B00 01DBE800 2826A072 */  paddub      $4, $21, $0
/* 012B04 01DBE804 282E4070 */  paddub      $5, $2, $0
/* 012B08 01DBE808 4840040C */  jal         dpdiv
/* 012B0C 01DBE80C 00000000 */   nop
/* 012B10 01DBE810 28AE4070 */  paddub      $21, $2, $0
/* 012B14 01DBE814 28264070 */  paddub      $4, $2, $0
/* 012B18 01DBE818 9241040C */  jal         dptofp
/* 012B1C 01DBE81C 00000000 */   nop
/* 012B20 01DBE820 21109D02 */  addu        $2, $20, $29
/* 012B24 01DBE824 A4004CC4 */  lwc1        $f12, 0xA4($2)
/* 012B28 01DBE828 9044040C */  jal         fptodp
/* 012B2C 01DBE82C 00000000 */   nop
/* 012B30 01DBE830 188084DF */  ld          $4, -0x7FE8($28)
/* 012B34 01DBE834 282E4070 */  paddub      $5, $2, $0
/* 012B38 01DBE838 9E3F040C */  jal         dpmul
/* 012B3C 01DBE83C 00000000 */   nop
/* 012B40 01DBE840 28B64070 */  paddub      $22, $2, $0
/* 012B44 01DBE844 B4000424 */  addiu       $4, $0, 0xB4
/* 012B48 01DBE848 FC40040C */  jal         litodp
/* 012B4C 01DBE84C 00000000 */   nop
/* 012B50 01DBE850 2826C072 */  paddub      $4, $22, $0
/* 012B54 01DBE854 282E4070 */  paddub      $5, $2, $0
/* 012B58 01DBE858 4840040C */  jal         dpdiv
/* 012B5C 01DBE85C 00000000 */   nop
/* 012B60 01DBE860 28264070 */  paddub      $4, $2, $0
/* 012B64 01DBE864 9241040C */  jal         dptofp
/* 012B68 01DBE868 00000000 */   nop
/* 012B6C 01DBE86C 4015A0E7 */  swc1        $f0, 0x1540($29)
/* 012B70 01DBE870 2826A072 */  paddub      $4, $21, $0
/* 012B74 01DBE874 9241040C */  jal         dptofp
/* 012B78 01DBE878 00000000 */   nop
/* 012B7C 01DBE87C 4415A0E7 */  swc1        $f0, 0x1544($29)
/* 012B80 01DBE880 2826E072 */  paddub      $4, $23, $0
/* 012B84 01DBE884 9241040C */  jal         dptofp
/* 012B88 01DBE888 00000000 */   nop
/* 012B8C 01DBE88C 4815A0E7 */  swc1        $f0, 0x1548($29)
/* 012B90 01DBE890 28266072 */  paddub      $4, $19, $0
/* 012B94 01DBE894 4015A527 */  addiu       $5, $29, 0x1540
/* 012B98 01DBE898 A000798E */  lw          $25, 0xA0($19)
/* 012B9C 01DBE89C 2C00398F */  lw          $25, 0x2C($25)
/* 012BA0 01DBE8A0 09F82003 */  jalr        $25
/* 012BA4 01DBE8A4 00000000 */   nop
/* 012BA8 01DBE8A8 28266072 */  paddub      $4, $19, $0
/* 012BAC 01DBE8AC DE01023C */  lui         $2, %hi(LIT_739__2)
/* 012BB0 01DBE8B0 E8F54524 */  addiu       $5, $2, %lo(LIT_739__2)
/* 012BB4 01DBE8B4 28360070 */  paddub      $6, $0, $0
/* 012BB8 01DBE8B8 A000798E */  lw          $25, 0xA0($19)
/* 012BBC 01DBE8BC 9000398F */  lw          $25, 0x90($25)
/* 012BC0 01DBE8C0 09F82003 */  jalr        $25
/* 012BC4 01DBE8C4 00000000 */   nop
/* 012BC8 01DBE8C8 28266072 */  paddub      $4, $19, $0
/* 012BCC 01DBE8CC DE01023C */  lui         $2, %hi(LIT_740__2)
/* 012BD0 01DBE8D0 F0F54524 */  addiu       $5, $2, %lo(LIT_740__2)
/* 012BD4 01DBE8D4 28360070 */  paddub      $6, $0, $0
/* 012BD8 01DBE8D8 A000798E */  lw          $25, 0xA0($19)
/* 012BDC 01DBE8DC 9000398F */  lw          $25, 0x90($25)
/* 012BE0 01DBE8E0 09F82003 */  jalr        $25
/* 012BE4 01DBE8E4 00000000 */   nop
/* 012BE8 01DBE8E8 21189D02 */  addu        $3, $20, $29
/* 012BEC 01DBE8EC 9400648C */  lw          $4, 0x94($3)
/* 012BF0 01DBE8F0 10008010 */  beqz        $4, .L01DBE934_2C4134
/* 012BF4 01DBE8F4 00000000 */   nop
/* 012BF8 01DBE8F8 948B858F */  lw          $5, -0x746C($28)
/* 012BFC 01DBE8FC 28360070 */  paddub      $6, $0, $0
/* 012C00 01DBE900 D8FC040C */  jal         LoadFile__FPcPvPi
/* 012C04 01DBE904 00000000 */   nop
/* 012C08 01DBE908 948B848F */  lw          $4, -0x746C($28)
/* 012C0C 01DBE90C DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 012C10 01DBE910 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 012C14 01DBE914 0E000624 */  addiu       $6, $0, 0xE
/* 012C18 01DBE918 283E0070 */  paddub      $7, $0, $0
/* 012C1C 01DBE91C 28460070 */  paddub      $8, $0, $0
/* 012C20 01DBE920 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 012C24 01DBE924 00000000 */   nop
/* 012C28 01DBE928 D40062AE */  sw          $2, 0xD4($19)
/* 012C2C 01DBE92C A0C1033C */  lui         $3, (0xC1A00000 >> 16)
/* 012C30 01DBE930 E00063AE */  sw          $3, 0xE0($19)
.L01DBE934_2C4134:
/* 012C34 01DBE934 01003126 */  addiu       $17, $17, 0x1
.L01DBE938_2C4138:
/* 012C38 01DBE938 4B00232A */  slti        $3, $17, 0x4B
/* 012C3C 01DBE93C 39FF6014 */  bnez        $3, .L01DBE624_2C3E24
/* 012C40 01DBE940 00000000 */   nop
/* 012C44 01DBE944 DE01033C */  lui         $3, %hi(LIT_677__2)
/* 012C48 01DBE948 90886724 */  addiu       $7, $3, %lo(LIT_677__2)
/* 012C4C 01DBE94C 500AA627 */  addiu       $6, $29, 0xA50
/* 012C50 01DBE950 57000524 */  addiu       $5, $0, 0x57
.L01DBE954_2C4154:
/* 012C54 01DBE954 0000E478 */  lq          $4, 0x0($7)
/* 012C58 01DBE958 1000E378 */  lq          $3, 0x10($7)
/* 012C5C 01DBE95C 2000E724 */  addiu       $7, $7, 0x20
/* 012C60 01DBE960 FFFFA524 */  addiu       $5, $5, -0x1
/* 012C64 01DBE964 0000C47C */  sq          $4, 0x0($6)
/* 012C68 01DBE968 1000C37C */  sq          $3, 0x10($6)
/* 012C6C 01DBE96C 2000C624 */  addiu       $6, $6, 0x20
/* 012C70 01DBE970 F8FFA01C */  bgtz        $5, .L01DBE954_2C4154
/* 012C74 01DBE974 00000000 */   nop
/* 012C78 01DBE978 28860070 */  paddub      $16, $0, $0
/* 012C7C 01DBE97C A7000010 */  b           .L01DBEC1C_2C441C
/* 012C80 01DBE980 00000000 */   nop
.L01DBE984_2C4184:
/* 012C84 01DBE984 40A11000 */  sll         $20, $16, 5
/* 012C88 01DBE988 21109D02 */  addu        $2, $20, $29
/* 012C8C 01DBE98C 500A448C */  lw          $4, 0xA50($2)
/* 012C90 01DBE990 0E008010 */  beqz        $4, .L01DBE9CC_2C41CC
/* 012C94 01DBE994 00000000 */   nop
/* 012C98 01DBE998 948B858F */  lw          $5, -0x746C($28)
/* 012C9C 01DBE99C 28360070 */  paddub      $6, $0, $0
/* 012CA0 01DBE9A0 D8FC040C */  jal         LoadFile__FPcPvPi
/* 012CA4 01DBE9A4 00000000 */   nop
/* 012CA8 01DBE9A8 948B848F */  lw          $4, -0x746C($28)
/* 012CAC 01DBE9AC DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 012CB0 01DBE9B0 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 012CB4 01DBE9B4 02000624 */  addiu       $6, $0, 0x2
/* 012CB8 01DBE9B8 283E0070 */  paddub      $7, $0, $0
/* 012CBC 01DBE9BC 28460070 */  paddub      $8, $0, $0
/* 012CC0 01DBE9C0 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 012CC4 01DBE9C4 00000000 */   nop
/* 012CC8 01DBE9C8 28964070 */  paddub      $18, $2, $0
.L01DBE9CC_2C41CC:
/* 012CCC 01DBE9CC 0B00001A */  blez        $16, .L01DBE9FC_2C41FC
/* 012CD0 01DBE9D0 00000000 */   nop
/* 012CD4 01DBE9D4 28264072 */  paddub      $4, $18, $0
/* 012CD8 01DBE9D8 F009A527 */  addiu       $5, $29, 0x9F0
/* 012CDC 01DBE9DC 01000624 */  addiu       $6, $0, 0x1
/* 012CE0 01DBE9E0 40000724 */  addiu       $7, $0, 0x40
/* 012CE4 01DBE9E4 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 012CE8 01DBE9E8 00000000 */   nop
/* 012CEC 01DBE9EC 28264072 */  paddub      $4, $18, $0
/* 012CF0 01DBE9F0 01000524 */  addiu       $5, $0, 0x1
/* 012CF4 01DBE9F4 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 012CF8 01DBE9F8 00000000 */   nop
.L01DBE9FC_2C41FC:
/* 012CFC 01DBE9FC 29000224 */  addiu       $2, $0, 0x29
/* 012D00 01DBEA00 03000216 */  bne         $16, $2, .L01DBEA10_2C4210
/* 012D04 01DBEA04 00000000 */   nop
/* 012D08 01DBEA08 E301013C */  lui         $1, %hi(TaimatsuFrame__2 + 0x20)
/* 012D0C 01DBEA0C E0AC32AC */  sw          $18, %lo(TaimatsuFrame__2 + 0x20)($1)
.L01DBEA10_2C4210:
/* 012D10 01DBEA10 0F000016 */  bnez        $16, .L01DBEA50_2C4250
/* 012D14 01DBEA14 00000000 */   nop
/* 012D18 01DBEA18 28264072 */  paddub      $4, $18, $0
/* 012D1C 01DBEA1C DE01023C */  lui         $2, %hi(LIT_741__3)
/* 012D20 01DBEA20 F8F54524 */  addiu       $5, $2, %lo(LIT_741__3)
/* 012D24 01DBEA24 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 012D28 01DBEA28 00000000 */   nop
/* 012D2C 01DBEA2C C843033C */  lui         $3, (0x43C80000 >> 16)
/* 012D30 01DBEA30 00688344 */  mtc1        $3, $f13
/* 012D34 01DBEA34 F0C1033C */  lui         $3, (0xC1F00000 >> 16)
/* 012D38 01DBEA38 00708344 */  mtc1        $3, $f14
/* 012D3C 01DBEA3C D243033C */  lui         $3, (0x43D20000 >> 16)
/* 012D40 01DBEA40 00608344 */  mtc1        $3, $f12
/* 012D44 01DBEA44 28264070 */  paddub      $4, $2, $0
/* 012D48 01DBEA48 A09F040C */  jal         SetPosition__6CFrameFfff
/* 012D4C 01DBEA4C 00000000 */   nop
.L01DBEA50_2C4250:
/* 012D50 01DBEA50 00111000 */  sll         $2, $16, 4
/* 012D54 01DBEA54 23105000 */  subu        $2, $2, $16
/* 012D58 01DBEA58 00990200 */  sll         $19, $2, 4
/* 012D5C 01DBEA5C E201023C */  lui         $2, %hi(OP_NornMapObj2)
/* 012D60 01DBEA60 F03D4224 */  addiu       $2, $2, %lo(OP_NornMapObj2)
/* 012D64 01DBEA64 21885300 */  addu        $17, $2, $19
/* 012D68 01DBEA68 28262072 */  paddub      $4, $17, $0
/* 012D6C 01DBEA6C 445E050C */  jal         Initialize__10CMapObjectFv
/* 012D70 01DBEA70 00000000 */   nop
/* 012D74 01DBEA74 28262072 */  paddub      $4, $17, $0
/* 012D78 01DBEA78 282E4072 */  paddub      $5, $18, $0
/* 012D7C 01DBEA7C 28360070 */  paddub      $6, $0, $0
/* 012D80 01DBEA80 305C050C */  jal         SetFrame__12CObjectFrameFP9CFrameVu1i
/* 012D84 01DBEA84 00000000 */   nop
/* 012D88 01DBEA88 E201023C */  lui         $2, %hi(OP_NornMapObj2 + 0xE8)
/* 012D8C 01DBEA8C D83E4224 */  addiu       $2, $2, %lo(OP_NornMapObj2 + 0xE8)
/* 012D90 01DBEA90 21105300 */  addu        $2, $2, $19
/* 012D94 01DBEA94 000040AC */  sw          $0, 0x0($2)
/* 012D98 01DBEA98 E201023C */  lui         $2, %hi(OP_NornMapObj2 + 0xE4)
/* 012D9C 01DBEA9C D43E4224 */  addiu       $2, $2, %lo(OP_NornMapObj2 + 0xE4)
/* 012DA0 01DBEAA0 21105300 */  addu        $2, $2, $19
/* 012DA4 01DBEAA4 000040AC */  sw          $0, 0x0($2)
/* 012DA8 01DBEAA8 21189D02 */  addu        $3, $20, $29
/* 012DAC 01DBEAAC 2041023C */  lui         $2, (0x41200000 >> 16)
/* 012DB0 01DBEAB0 00088244 */  mtc1        $2, $f1
/* 012DB4 01DBEAB4 600A60C4 */  lwc1        $f0, 0xA60($3)
/* 012DB8 01DBEAB8 C2080046 */  mul.s       $f3, $f1, $f0
/* 012DBC 01DBEABC 5C0A60C4 */  lwc1        $f0, 0xA5C($3)
/* 012DC0 01DBEAC0 82080046 */  mul.s       $f2, $f1, $f0
/* 012DC4 01DBEAC4 580A60C4 */  lwc1        $f0, 0xA58($3)
/* 012DC8 01DBEAC8 02080046 */  mul.s       $f0, $f1, $f0
/* 012DCC 01DBEACC 5015A0E7 */  swc1        $f0, 0x1550($29)
/* 012DD0 01DBEAD0 5415A2E7 */  swc1        $f2, 0x1554($29)
/* 012DD4 01DBEAD4 5815A3E7 */  swc1        $f3, 0x1558($29)
/* 012DD8 01DBEAD8 28262072 */  paddub      $4, $17, $0
/* 012DDC 01DBEADC 5015A527 */  addiu       $5, $29, 0x1550
/* 012DE0 01DBEAE0 A000398E */  lw          $25, 0xA0($17)
/* 012DE4 01DBEAE4 1000398F */  lw          $25, 0x10($25)
/* 012DE8 01DBEAE8 09F82003 */  jalr        $25
/* 012DEC 01DBEAEC 00000000 */   nop
/* 012DF0 01DBEAF0 21109D02 */  addu        $2, $20, $29
/* 012DF4 01DBEAF4 6C0A4CC4 */  lwc1        $f12, 0xA6C($2)
/* 012DF8 01DBEAF8 9044040C */  jal         fptodp
/* 012DFC 01DBEAFC 00000000 */   nop
/* 012E00 01DBEB00 188084DF */  ld          $4, -0x7FE8($28)
/* 012E04 01DBEB04 282E4070 */  paddub      $5, $2, $0
/* 012E08 01DBEB08 9E3F040C */  jal         dpmul
/* 012E0C 01DBEB0C 00000000 */   nop
/* 012E10 01DBEB10 289E4070 */  paddub      $19, $2, $0
/* 012E14 01DBEB14 B4000424 */  addiu       $4, $0, 0xB4
/* 012E18 01DBEB18 FC40040C */  jal         litodp
/* 012E1C 01DBEB1C 00000000 */   nop
/* 012E20 01DBEB20 28266072 */  paddub      $4, $19, $0
/* 012E24 01DBEB24 282E4070 */  paddub      $5, $2, $0
/* 012E28 01DBEB28 4840040C */  jal         dpdiv
/* 012E2C 01DBEB2C 00000000 */   nop
/* 012E30 01DBEB30 28AE4070 */  paddub      $21, $2, $0
/* 012E34 01DBEB34 28264070 */  paddub      $4, $2, $0
/* 012E38 01DBEB38 9241040C */  jal         dptofp
/* 012E3C 01DBEB3C 00000000 */   nop
/* 012E40 01DBEB40 21109D02 */  addu        $2, $20, $29
/* 012E44 01DBEB44 680A4CC4 */  lwc1        $f12, 0xA68($2)
/* 012E48 01DBEB48 9044040C */  jal         fptodp
/* 012E4C 01DBEB4C 00000000 */   nop
/* 012E50 01DBEB50 188084DF */  ld          $4, -0x7FE8($28)
/* 012E54 01DBEB54 282E4070 */  paddub      $5, $2, $0
/* 012E58 01DBEB58 9E3F040C */  jal         dpmul
/* 012E5C 01DBEB5C 00000000 */   nop
/* 012E60 01DBEB60 289E4070 */  paddub      $19, $2, $0
/* 012E64 01DBEB64 B4000424 */  addiu       $4, $0, 0xB4
/* 012E68 01DBEB68 FC40040C */  jal         litodp
/* 012E6C 01DBEB6C 00000000 */   nop
/* 012E70 01DBEB70 28266072 */  paddub      $4, $19, $0
/* 012E74 01DBEB74 282E4070 */  paddub      $5, $2, $0
/* 012E78 01DBEB78 4840040C */  jal         dpdiv
/* 012E7C 01DBEB7C 00000000 */   nop
/* 012E80 01DBEB80 289E4070 */  paddub      $19, $2, $0
/* 012E84 01DBEB84 28264070 */  paddub      $4, $2, $0
/* 012E88 01DBEB88 9241040C */  jal         dptofp
/* 012E8C 01DBEB8C 00000000 */   nop
/* 012E90 01DBEB90 21109D02 */  addu        $2, $20, $29
/* 012E94 01DBEB94 640A4CC4 */  lwc1        $f12, 0xA64($2)
/* 012E98 01DBEB98 9044040C */  jal         fptodp
/* 012E9C 01DBEB9C 00000000 */   nop
/* 012EA0 01DBEBA0 188084DF */  ld          $4, -0x7FE8($28)
/* 012EA4 01DBEBA4 282E4070 */  paddub      $5, $2, $0
/* 012EA8 01DBEBA8 9E3F040C */  jal         dpmul
/* 012EAC 01DBEBAC 00000000 */   nop
/* 012EB0 01DBEBB0 28A64070 */  paddub      $20, $2, $0
/* 012EB4 01DBEBB4 B4000424 */  addiu       $4, $0, 0xB4
/* 012EB8 01DBEBB8 FC40040C */  jal         litodp
/* 012EBC 01DBEBBC 00000000 */   nop
/* 012EC0 01DBEBC0 28268072 */  paddub      $4, $20, $0
/* 012EC4 01DBEBC4 282E4070 */  paddub      $5, $2, $0
/* 012EC8 01DBEBC8 4840040C */  jal         dpdiv
/* 012ECC 01DBEBCC 00000000 */   nop
/* 012ED0 01DBEBD0 28264070 */  paddub      $4, $2, $0
/* 012ED4 01DBEBD4 9241040C */  jal         dptofp
/* 012ED8 01DBEBD8 00000000 */   nop
/* 012EDC 01DBEBDC 6015A0E7 */  swc1        $f0, 0x1560($29)
/* 012EE0 01DBEBE0 28266072 */  paddub      $4, $19, $0
/* 012EE4 01DBEBE4 9241040C */  jal         dptofp
/* 012EE8 01DBEBE8 00000000 */   nop
/* 012EEC 01DBEBEC 6415A0E7 */  swc1        $f0, 0x1564($29)
/* 012EF0 01DBEBF0 2826A072 */  paddub      $4, $21, $0
/* 012EF4 01DBEBF4 9241040C */  jal         dptofp
/* 012EF8 01DBEBF8 00000000 */   nop
/* 012EFC 01DBEBFC 6815A0E7 */  swc1        $f0, 0x1568($29)
/* 012F00 01DBEC00 28262072 */  paddub      $4, $17, $0
/* 012F04 01DBEC04 6015A527 */  addiu       $5, $29, 0x1560
/* 012F08 01DBEC08 A000398E */  lw          $25, 0xA0($17)
/* 012F0C 01DBEC0C 2C00398F */  lw          $25, 0x2C($25)
/* 012F10 01DBEC10 09F82003 */  jalr        $25
/* 012F14 01DBEC14 00000000 */   nop
/* 012F18 01DBEC18 01001026 */  addiu       $16, $16, 0x1
.L01DBEC1C_2C441C:
/* 012F1C 01DBEC1C 5700032A */  slti        $3, $16, 0x57
/* 012F20 01DBEC20 58FF6014 */  bnez        $3, .L01DBE984_2C4184
/* 012F24 01DBEC24 00000000 */   nop
/* 012F28 01DBEC28 8000BF7B */  lq          $31, 0x80($29)
/* 012F2C 01DBEC2C 7000B77B */  lq          $23, 0x70($29)
/* 012F30 01DBEC30 6000B67B */  lq          $22, 0x60($29)
/* 012F34 01DBEC34 5000B57B */  lq          $21, 0x50($29)
/* 012F38 01DBEC38 4000B47B */  lq          $20, 0x40($29)
/* 012F3C 01DBEC3C 3000B37B */  lq          $19, 0x30($29)
/* 012F40 01DBEC40 2000B27B */  lq          $18, 0x20($29)
/* 012F44 01DBEC44 1000B17B */  lq          $17, 0x10($29)
/* 012F48 01DBEC48 0000B07B */  lq          $16, 0x0($29)
/* 012F4C 01DBEC4C 7015BD27 */  addiu       $29, $29, 0x1570
/* 012F50 01DBEC50 0800E003 */  jr          $31
/* 012F54 01DBEC54 00000000 */   nop
/* 012F58 01DBEC58 00000000 */  nop
/* 012F5C 01DBEC5C 00000000 */  nop
