.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AreaAddPos__FPiPiPi
/* 4C720 0014C620 0000838C */  lw         $3, 0x0($4)
/* 4C724 0014C624 0400878C */  lw         $7, 0x4($4)
/* 4C728 0014C628 0800888C */  lw         $8, 0x8($4)
/* 4C72C 0014C62C 0C00848C */  lw         $4, 0xC($4)
/* 4C730 0014C630 0000A98C */  lw         $9, 0x0($5)
/* 4C734 0014C634 0400A58C */  lw         $5, 0x4($5)
/* 4C738 0014C638 2A082301 */  slt        $at, $9, $3
/* 4C73C 0014C63C 02002010 */  beqz       $at, .L0014C648
/* 4C740 0014C640 00000000 */   nop
/* 4C744 0014C644 281E2071 */  paddub     $3, $9, $0
.L0014C648:
/* 4C748 0014C648 2A080901 */  slt        $at, $8, $9
/* 4C74C 0014C64C 02002010 */  beqz       $at, .L0014C658
/* 4C750 0014C650 00000000 */   nop
/* 4C754 0014C654 28462071 */  paddub     $8, $9, $0
.L0014C658:
/* 4C758 0014C658 2A08A700 */  slt        $at, $5, $7
/* 4C75C 0014C65C 02002010 */  beqz       $at, .L0014C668
/* 4C760 0014C660 00000000 */   nop
/* 4C764 0014C664 283EA070 */  paddub     $7, $5, $0
.L0014C668:
/* 4C768 0014C668 2A088500 */  slt        $at, $4, $5
/* 4C76C 0014C66C 02002010 */  beqz       $at, .L0014C678
/* 4C770 0014C670 00000000 */   nop
/* 4C774 0014C674 2826A070 */  paddub     $4, $5, $0
.L0014C678:
/* 4C778 0014C678 0000C3AC */  sw         $3, 0x0($6)
/* 4C77C 0014C67C 0400C7AC */  sw         $7, 0x4($6)
/* 4C780 0014C680 0800C8AC */  sw         $8, 0x8($6)
/* 4C784 0014C684 0C00C4AC */  sw         $4, 0xC($6)
/* 4C788 0014C688 0800E003 */  jr         $31
/* 4C78C 0014C68C 00000000 */   nop