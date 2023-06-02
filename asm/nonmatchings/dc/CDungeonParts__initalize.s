.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel initalize__13CDungeonPartsFv
/* C1CA0 001C1BA0 282E0070 */  paddub     $5, $0, $0
/* C1CA4 001C1BA4 06000010 */  b          .L001C1BC0
/* C1CA8 001C1BA8 00000000 */   nop
.L001C1BAC:
/* C1CAC 001C1BAC 80180500 */  sll        $3, $5, 2
/* C1CB0 001C1BB0 21186400 */  addu       $3, $3, $4
/* C1CB4 001C1BB4 B00160AC */  sw         $0, 0x1B0($3)
/* C1CB8 001C1BB8 700160AC */  sw         $0, 0x170($3)
/* C1CBC 001C1BBC 0100A524 */  addiu      $5, $5, 0x1
.L001C1BC0:
/* C1CC0 001C1BC0 0600A328 */  slti       $3, $5, 0x6
/* C1CC4 001C1BC4 F9FF6014 */  bnez       $3, .L001C1BAC
/* C1CC8 001C1BC8 00000000 */   nop
/* C1CCC 001C1BCC 000080A4 */  sh         $0, 0x0($4)
/* C1CD0 001C1BD0 0C0080AC */  sw         $0, 0xC($4)
/* C1CD4 001C1BD4 040080AC */  sw         $0, 0x4($4)
/* C1CD8 001C1BD8 080080A4 */  sh         $0, 0x8($4)
/* C1CDC 001C1BDC 100080A4 */  sh         $0, 0x10($4)
/* C1CE0 001C1BE0 120080A4 */  sh         $0, 0x12($4)
/* C1CE4 001C1BE4 900080AC */  sw         $0, 0x90($4)
/* C1CE8 001C1BE8 EC0080AC */  sw         $0, 0xEC($4)
/* C1CEC 001C1BEC A80180AC */  sw         $0, 0x1A8($4)
/* C1CF0 001C1BF0 000180A4 */  sh         $0, 0x100($4)
/* C1CF4 001C1BF4 0800E003 */  jr         $31
/* C1CF8 001C1BF8 00000000 */   nop
/* C1CFC 001C1BFC 00000000 */  nop
