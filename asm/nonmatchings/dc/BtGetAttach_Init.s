.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtGetAttach_Init__Fii
/* D3B70 001D3A70 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* D3B74 001D3A74 1000BF7F */  sq         $31, 0x10($sp)
/* D3B78 001D3A78 0000B07F */  sq         $16, 0x0($sp)
/* D3B7C 001D3A7C 28368070 */  paddub     $6, $4, $0
/* D3B80 001D3A80 2886A070 */  paddub     $16, $5, $0
/* D3B84 001D3A84 28160070 */  paddub     $2, $0, $0
/* D3B88 001D3A88 5100032A */  slti       $3, $16, 0x51
/* D3B8C 001D3A8C 08006014 */  bnez       $3, .L001D3AB0
/* D3B90 001D3A90 00000000 */   nop
/* D3B94 001D3A94 7900012A */  slti       $at, $16, 0x79
/* D3B98 001D3A98 05002010 */  beqz       $at, .L001D3AB0
/* D3B9C 001D3A9C 00000000 */   nop
/* D3BA0 001D3AA0 28260072 */  paddub     $4, $16, $0
/* D3BA4 001D3AA4 282EC070 */  paddub     $5, $6, $0
/* D3BA8 001D3AA8 4CDD060C */  jal        createAttachVolume__Fii
/* D3BAC 001D3AAC 00000000 */   nop
.L001D3AB0:
/* D3BB0 001D3AB0 3C9490AF */  sw         $16, -0x6BC4($gp)
/* D3BB4 001D3AB4 409482AF */  sw         $2, -0x6BC0($gp)
/* D3BB8 001D3AB8 789C848F */  lw         $4, -0x6388($gp)
/* D3BBC 001D3ABC 282E0072 */  paddub     $5, $16, $0
/* D3BC0 001D3AC0 28364070 */  paddub     $6, $2, $0
/* D3BC4 001D3AC4 18F8060C */  jal        GetItem__14CDngStatusDataFii
/* D3BC8 001D3AC8 00000000 */   nop
/* D3BCC 001D3ACC 3480050C */  jal        ClearSystemMes__Fv
/* D3BD0 001D3AD0 00000000 */   nop
/* D3BD4 001D3AD4 3C94848F */  lw         $4, -0x6BC4($gp)
/* D3BD8 001D3AD8 4094858F */  lw         $5, -0x6BC0($gp)
/* D3BDC 001D3ADC 78000624 */  addiu      $6, $0, 0x78
/* D3BE0 001D3AE0 283E0070 */  paddub     $7, $0, $0
/* D3BE4 001D3AE4 A480050C */  jal        ItemGetMes__Fiiii
/* D3BE8 001D3AE8 00000000 */   nop
/* D3BEC 001D3AEC 1000BF7B */  lq         $31, 0x10($sp)
/* D3BF0 001D3AF0 0000B07B */  lq         $16, 0x0($sp)
/* D3BF4 001D3AF4 2000BD27 */  addiu      $sp, $sp, 0x20
/* D3BF8 001D3AF8 0800E003 */  jr         $31
/* D3BFC 001D3AFC 00000000 */   nop
