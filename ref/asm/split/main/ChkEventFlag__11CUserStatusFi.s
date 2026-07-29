.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ChkEventFlag__11CUserStatusFi
/* 0BDBC0 001BDAC0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BDBC4 001BDAC4 0000BF7F */  sq          $31, 0x0($29)
/* 0BDBC8 001BDAC8 0B00A104 */  bgez        $5, .L001BDAF8
/* 0BDBCC 001BDACC 00000000 */   nop
/* 0BDBD0 001BDAD0 3300A128 */  slti        $1, $5, 0x33
/* 0BDBD4 001BDAD4 08002014 */  bnez        $1, .L001BDAF8
/* 0BDBD8 001BDAD8 00000000 */   nop
/* 0BDBDC 001BDADC 2A00023C */  lui         $2, %hi(LIT_281__3)
/* 0BDBE0 001BDAE0 90BD4424 */  addiu       $4, $2, %lo(LIT_281__3)
/* 0BDBE4 001BDAE4 A611040C */  jal         printf
/* 0BDBE8 001BDAE8 00000000 */   nop
/* 0BDBEC 001BDAEC 28160070 */  paddub      $2, $0, $0
/* 0BDBF0 001BDAF0 06000010 */  b           .L001BDB0C
/* 0BDBF4 001BDAF4 00000000 */   nop
.L001BDAF8:
/* 0BDBF8 001BDAF8 2110A400 */  addu        $2, $5, $4
/* 0BDBFC 001BDAFC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BDC00 001BDB00 21084100 */  addu        $1, $2, $1
/* 0BDC04 001BDB04 A48A2280 */  lb          $2, -0x755C($1)
/* 0BDC08 001BDB08 00000000 */  nop
.L001BDB0C:
/* 0BDC0C 001BDB0C 0000BF7B */  lq          $31, 0x0($29)
/* 0BDC10 001BDB10 1000BD27 */  addiu       $29, $29, 0x10
/* 0BDC14 001BDB14 0800E003 */  jr          $31
/* 0BDC18 001BDB18 00000000 */   nop
/* 0BDC1C 001BDB1C 00000000 */  nop
