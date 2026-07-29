.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EquipReAttach__FP10CCharacteri
/* 00D890 01DB9590 D0FFBD27 */  addiu       $29, $29, -0x30
/* 00D894 01DB9594 2000BF7F */  sq          $31, 0x20($29)
/* 00D898 01DB9598 1000B17F */  sq          $17, 0x10($29)
/* 00D89C 01DB959C 0000B07F */  sq          $16, 0x0($29)
/* 00D8A0 01DB95A0 288E8070 */  paddub      $17, $4, $0
/* 00D8A4 01DB95A4 0900A010 */  beqz        $5, .L01DB95CC_2F4BCC
/* 00D8A8 01DB95A8 00000000 */   nop
/* 00D8AC 01DB95AC EA01013C */  lui         $1, %hi(CharaHand + 0xBC)
/* 00D8B0 01DB95B0 8C2F248C */  lw          $4, %lo(CharaHand + 0xBC)($1)
/* 00D8B4 01DB95B4 DC01023C */  lui         $2, %hi(LIT_4979)
/* 00D8B8 01DB95B8 D8304524 */  addiu       $5, $2, %lo(LIT_4979)
/* 00D8BC 01DB95BC C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00D8C0 01DB95C0 00000000 */   nop
/* 00D8C4 01DB95C4 07000010 */  b           .L01DB95E4_2F4BE4
/* 00D8C8 01DB95C8 00000000 */   nop
.L01DB95CC_2F4BCC:
/* 00D8CC 01DB95CC EA01013C */  lui         $1, %hi(CharaMain + 0xBC)
/* 00D8D0 01DB95D0 DC1D248C */  lw          $4, %lo(CharaMain + 0xBC)($1)
/* 00D8D4 01DB95D4 DC01023C */  lui         $2, %hi(LIT_4980)
/* 00D8D8 01DB95D8 E0304524 */  addiu       $5, $2, %lo(LIT_4980)
/* 00D8DC 01DB95DC C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00D8E0 01DB95E0 00000000 */   nop
.L01DB95E4_2F4BE4:
/* 00D8E4 01DB95E4 28864070 */  paddub      $16, $2, $0
/* 00D8E8 01DB95E8 00608044 */  mtc1        $0, $f12
/* 00D8EC 01DB95EC 00000000 */  nop
/* 00D8F0 01DB95F0 46630046 */  mov.s       $f13, $f12
/* 00D8F4 01DB95F4 86630046 */  mov.s       $f14, $f12
/* 00D8F8 01DB95F8 28262072 */  paddub      $4, $17, $0
/* 00D8FC 01DB95FC A000398E */  lw          $25, 0xA0($17)
/* 00D900 01DB9600 1800398F */  lw          $25, 0x18($25)
/* 00D904 01DB9604 09F82003 */  jalr        $25
/* 00D908 01DB9608 00000000 */   nop
/* 00D90C 01DB960C 00608044 */  mtc1        $0, $f12
/* 00D910 01DB9610 00000000 */  nop
/* 00D914 01DB9614 46630046 */  mov.s       $f13, $f12
/* 00D918 01DB9618 86630046 */  mov.s       $f14, $f12
/* 00D91C 01DB961C 28262072 */  paddub      $4, $17, $0
/* 00D920 01DB9620 A000398E */  lw          $25, 0xA0($17)
/* 00D924 01DB9624 3000398F */  lw          $25, 0x30($25)
/* 00D928 01DB9628 09F82003 */  jalr        $25
/* 00D92C 01DB962C 00000000 */   nop
/* 00D930 01DB9630 BC00248E */  lw          $4, 0xBC($17)
/* 00D934 01DB9634 282E0072 */  paddub      $5, $16, $0
/* 00D938 01DB9638 60A0040C */  jal         SetReference__6CFrameFP6CFrame
/* 00D93C 01DB963C 00000000 */   nop
/* 00D940 01DB9640 2000BF7B */  lq          $31, 0x20($29)
/* 00D944 01DB9644 1000B17B */  lq          $17, 0x10($29)
/* 00D948 01DB9648 0000B07B */  lq          $16, 0x0($29)
/* 00D94C 01DB964C 3000BD27 */  addiu       $29, $29, 0x30
/* 00D950 01DB9650 0800E003 */  jr          $31
/* 00D954 01DB9654 00000000 */   nop
/* 00D958 01DB9658 00000000 */  nop
/* 00D95C 01DB965C 00000000 */  nop
