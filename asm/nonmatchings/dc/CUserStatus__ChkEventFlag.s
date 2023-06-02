.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ChkEventFlag__11CUserStatusFi
/* BDBC0 001BDAC0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BDBC4 001BDAC4 0000BF7F */  sq         $31, 0x0($sp)
/* BDBC8 001BDAC8 0B00A104 */  bgez       $5, .L001BDAF8
/* BDBCC 001BDACC 00000000 */   nop
/* BDBD0 001BDAD0 3300A128 */  slti       $at, $5, 0x33
/* BDBD4 001BDAD4 08002014 */  bnez       $at, .L001BDAF8
/* BDBD8 001BDAD8 00000000 */   nop
/* BDBDC 001BDADC 2A00023C */  lui        $2, %hi(_281_3)
/* BDBE0 001BDAE0 90BD4424 */  addiu      $4, $2, %lo(_281_3)
/* BDBE4 001BDAE4 A611040C */  jal        printf
/* BDBE8 001BDAE8 00000000 */   nop
/* BDBEC 001BDAEC 28160070 */  paddub     $2, $0, $0
/* BDBF0 001BDAF0 06000010 */  b          .L001BDB0C
/* BDBF4 001BDAF4 00000000 */   nop
.L001BDAF8:
/* BDBF8 001BDAF8 2110A400 */  addu       $2, $5, $4
/* BDBFC 001BDAFC 0100013C */  lui        $at, (0x10000 >> 16)
/* BDC00 001BDB00 21084100 */  addu       $at, $2, $at
/* BDC04 001BDB04 A48A2280 */  lb         $2, -0x755C($at)
/* BDC08 001BDB08 00000000 */  nop
.L001BDB0C:
/* BDC0C 001BDB0C 0000BF7B */  lq         $31, 0x0($sp)
/* BDC10 001BDB10 1000BD27 */  addiu      $sp, $sp, 0x10
/* BDC14 001BDB14 0800E003 */  jr         $31
/* BDC18 001BDB18 00000000 */   nop
/* BDC1C 001BDB1C 00000000 */  nop
