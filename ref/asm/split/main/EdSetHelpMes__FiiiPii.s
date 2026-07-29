.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdSetHelpMes__FiiiPii
/* 0735A0 001734A0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0735A4 001734A4 0000BF7F */  sq          $31, 0x0($29)
/* 0735A8 001734A8 2856E070 */  paddub      $10, $7, $0
/* 0735AC 001734AC 284E0071 */  paddub      $9, $8, $0
/* 0735B0 001734B0 78000224 */  addiu       $2, $0, 0x78
/* 0735B4 001734B4 1B008214 */  bne         $4, $2, .L00173524
/* 0735B8 001734B8 00000000 */   nop
/* 0735BC 001734BC D201013C */  lui         $1, %hi(EditSystemMes + 0x18)
/* 0735C0 001734C0 282C228C */  lw          $2, %lo(EditSystemMes + 0x18)($1)
/* 0735C4 001734C4 E2FF4324 */  addiu       $3, $2, -0x1E
/* 0735C8 001734C8 10000224 */  addiu       $2, $0, 0x10
/* 0735CC 001734CC 23184300 */  subu        $3, $2, $3
/* 0735D0 001734D0 02006104 */  bgez        $3, .L001734DC
/* 0735D4 001734D4 00000000 */   nop
/* 0735D8 001734D8 281E0070 */  paddub      $3, $0, $0
.L001734DC:
/* 0735DC 001734DC 908F878F */  lw          $7, -0x7070($28)
/* 0735E0 001734E0 D201013C */  lui         $1, %hi(EditSystemMes + 0x8)
/* 0735E4 001734E4 182C228C */  lw          $2, %lo(EditSystemMes + 0x8)($1)
/* 0735E8 001734E8 18106200 */  mult        $2, $3, $2
/* 0735EC 001734EC 43100200 */  sra         $2, $2, 1
/* 0735F0 001734F0 8C8F838F */  lw          $3, -0x7074($28)
/* 0735F4 001734F4 21106200 */  addu        $2, $3, $2
/* 0735F8 001734F8 D201013C */  lui         $1, %hi(EditSystemMes + 0x1750)
/* 0735FC 001734FC 604322AC */  sw          $2, %lo(EditSystemMes + 0x1750)($1)
/* 073600 00173500 D201013C */  lui         $1, %hi(EditSystemMes + 0x1754)
/* 073604 00173504 644327AC */  sw          $7, %lo(EditSystemMes + 0x1754)($1)
/* 073608 00173508 B4006224 */  addiu       $2, $3, 0xB4
/* 07360C 0017350C D201013C */  lui         $1, %hi(EditSystemMes + 0x1758)
/* 073610 00173510 684322AC */  sw          $2, %lo(EditSystemMes + 0x1758)($1)
/* 073614 00173514 D201013C */  lui         $1, %hi(EditSystemMes + 0x175C)
/* 073618 00173518 6C4327AC */  sw          $7, %lo(EditSystemMes + 0x175C)($1)
/* 07361C 0017351C 0A000010 */  b           .L00173548
/* 073620 00173520 00000000 */   nop
.L00173524:
/* 073624 00173524 FFFF0224 */  addiu       $2, $0, -0x1
/* 073628 00173528 D201013C */  lui         $1, %hi(EditSystemMes + 0x1750)
/* 07362C 0017352C 604322AC */  sw          $2, %lo(EditSystemMes + 0x1750)($1)
/* 073630 00173530 D201013C */  lui         $1, %hi(EditSystemMes + 0x1754)
/* 073634 00173534 644322AC */  sw          $2, %lo(EditSystemMes + 0x1754)($1)
/* 073638 00173538 D201013C */  lui         $1, %hi(EditSystemMes + 0x1758)
/* 07363C 0017353C 684322AC */  sw          $2, %lo(EditSystemMes + 0x1758)($1)
/* 073640 00173540 D201013C */  lui         $1, %hi(EditSystemMes + 0x175C)
/* 073644 00173544 6C4322AC */  sw          $2, %lo(EditSystemMes + 0x175C)($1)
.L00173548:
/* 073648 00173548 808F838F */  lw          $3, -0x7080($28)
/* 07364C 0017354C D201013C */  lui         $1, %hi(EditSystemMes + 0x54)
/* 073650 00173550 642C23AC */  sw          $3, %lo(EditSystemMes + 0x54)($1)
/* 073654 00173554 8C8F828F */  lw          $2, -0x7074($28)
/* 073658 00173558 D201013C */  lui         $1, %hi(EditSystemMes)
/* 07365C 0017355C 102C22AC */  sw          $2, %lo(EditSystemMes)($1)
/* 073660 00173560 908F828F */  lw          $2, -0x7070($28)
/* 073664 00173564 D201013C */  lui         $1, %hi(EditSystemMes + 0x4)
/* 073668 00173568 142C22AC */  sw          $2, %lo(EditSystemMes + 0x4)($1)
/* 07366C 0017356C 848F828F */  lw          $2, -0x707C($28)
/* 073670 00173570 D201013C */  lui         $1, %hi(EditSystemMes + 0x9C)
/* 073674 00173574 AC2C22AC */  sw          $2, %lo(EditSystemMes + 0x9C)($1)
/* 073678 00173578 888F828F */  lw          $2, -0x7078($28)
/* 07367C 0017357C D201013C */  lui         $1, %hi(EditSystemMes + 0xA0)
/* 073680 00173580 B02C22AC */  sw          $2, %lo(EditSystemMes + 0xA0)($1)
/* 073684 00173584 D201013C */  lui         $1, %hi(EditSystemMes + 0x54)
/* 073688 00173588 642C23AC */  sw          $3, %lo(EditSystemMes + 0x54)($1)
/* 07368C 0017358C 283E0070 */  paddub      $7, $0, $0
/* 073690 00173590 28464071 */  paddub      $8, $10, $0
/* 073694 00173594 F8CC050C */  jal         EdSetSystemMes__FiiiiPii
/* 073698 00173598 00000000 */   nop
/* 07369C 0017359C 808F838F */  lw          $3, -0x7080($28)
/* 0736A0 001735A0 D201013C */  lui         $1, %hi(EditSystemMes + 0x54)
/* 0736A4 001735A4 642C23AC */  sw          $3, %lo(EditSystemMes + 0x54)($1)
/* 0736A8 001735A8 5887838F */  lw          $3, -0x78A8($28)
/* 0736AC 001735AC 5C8783AF */  sw          $3, -0x78A4($28)
/* 0736B0 001735B0 7C8F838F */  lw          $3, -0x7084($28)
/* 0736B4 001735B4 9C8F83AF */  sw          $3, -0x7064($28)
/* 0736B8 001735B8 FFFF0324 */  addiu       $3, $0, -0x1
/* 0736BC 001735BC 588783AF */  sw          $3, -0x78A8($28)
/* 0736C0 001735C0 7C8F80AF */  sw          $0, -0x7084($28)
/* 0736C4 001735C4 0000BF7B */  lq          $31, 0x0($29)
/* 0736C8 001735C8 1000BD27 */  addiu       $29, $29, 0x10
/* 0736CC 001735CC 0800E003 */  jr          $31
/* 0736D0 001735D0 00000000 */   nop
/* 0736D4 001735D4 00000000 */  nop
/* 0736D8 001735D8 00000000 */  nop
/* 0736DC 001735DC 00000000 */  nop
