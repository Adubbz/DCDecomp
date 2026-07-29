.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGInitVif1Packet__FP1P1
/* 02C820 0012C720 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02C824 0012C724 0000BF7F */  sq          $31, 0x0($29)
/* 02C828 0012C728 088C84AF */  sw          $4, -0x73F8($28)
/* 02C82C 0012C72C 0C8C85AF */  sw          $5, -0x73F4($28)
/* 02C830 0012C730 088C828F */  lw          $2, -0x73F8($28)
/* 02C834 0012C734 03004330 */  andi        $3, $2, 0x3
/* 02C838 0012C738 04004104 */  bgez        $2, .L0012C74C
/* 02C83C 0012C73C 00000000 */   nop
/* 02C840 0012C740 02006010 */  beqz        $3, .L0012C74C
/* 02C844 0012C744 00000000 */   nop
/* 02C848 0012C748 FCFF6324 */  addiu       $3, $3, -0x4
.L0012C74C:
/* 02C84C 0012C74C 07006010 */  beqz        $3, .L0012C76C
/* 02C850 0012C750 00000000 */   nop
/* 02C854 0012C754 04000224 */  addiu       $2, $0, 0x4
/* 02C858 0012C758 23104300 */  subu        $2, $2, $3
/* 02C85C 0012C75C 80180200 */  sll         $3, $2, 2
/* 02C860 0012C760 088C828F */  lw          $2, -0x73F8($28)
/* 02C864 0012C764 21104300 */  addu        $2, $2, $3
/* 02C868 0012C768 088C82AF */  sw          $2, -0x73F8($28)
.L0012C76C:
/* 02C86C 0012C76C 0C8C828F */  lw          $2, -0x73F4($28)
/* 02C870 0012C770 03004330 */  andi        $3, $2, 0x3
/* 02C874 0012C774 04004104 */  bgez        $2, .L0012C788
/* 02C878 0012C778 00000000 */   nop
/* 02C87C 0012C77C 02006010 */  beqz        $3, .L0012C788
/* 02C880 0012C780 00000000 */   nop
/* 02C884 0012C784 FCFF6324 */  addiu       $3, $3, -0x4
.L0012C788:
/* 02C888 0012C788 07006010 */  beqz        $3, .L0012C7A8
/* 02C88C 0012C78C 00000000 */   nop
/* 02C890 0012C790 04000224 */  addiu       $2, $0, 0x4
/* 02C894 0012C794 23104300 */  subu        $2, $2, $3
/* 02C898 0012C798 80180200 */  sll         $3, $2, 2
/* 02C89C 0012C79C 0C8C828F */  lw          $2, -0x73F4($28)
/* 02C8A0 0012C7A0 21104300 */  addu        $2, $2, $3
/* 02C8A4 0012C7A4 0C8C82AF */  sw          $2, -0x73F4($28)
.L0012C7A8:
/* 02C8A8 0012C7A8 088C858F */  lw          $5, -0x73F8($28)
/* 02C8AC 0012C7AC C801023C */  lui         $2, %hi(vifpacket)
/* 02C8B0 0012C7B0 80A74424 */  addiu       $4, $2, %lo(vifpacket)
/* 02C8B4 0012C7B4 0283040C */  jal         sceVif1PkInit
/* 02C8B8 0012C7B8 00000000 */   nop
/* 02C8BC 0012C7BC 0C8C858F */  lw          $5, -0x73F4($28)
/* 02C8C0 0012C7C0 C801023C */  lui         $2, %hi(vifpacket + 0x20)
/* 02C8C4 0012C7C4 A0A74424 */  addiu       $4, $2, %lo(vifpacket + 0x20)
/* 02C8C8 0012C7C8 0283040C */  jal         sceVif1PkInit
/* 02C8CC 0012C7CC 00000000 */   nop
/* 02C8D0 0012C7D0 C801023C */  lui         $2, %hi(vifpacket)
/* 02C8D4 0012C7D4 80A74424 */  addiu       $4, $2, %lo(vifpacket)
/* 02C8D8 0012C7D8 0683040C */  jal         sceVif1PkReset
/* 02C8DC 0012C7DC 00000000 */   nop
/* 02C8E0 0012C7E0 C801023C */  lui         $2, %hi(vifpacket + 0x20)
/* 02C8E4 0012C7E4 A0A74424 */  addiu       $4, $2, %lo(vifpacket + 0x20)
/* 02C8E8 0012C7E8 0683040C */  jal         sceVif1PkReset
/* 02C8EC 0012C7EC 00000000 */   nop
/* 02C8F0 0012C7F0 0000BF7B */  lq          $31, 0x0($29)
/* 02C8F4 0012C7F4 1000BD27 */  addiu       $29, $29, 0x10
/* 02C8F8 0012C7F8 0800E003 */  jr          $31
/* 02C8FC 0012C7FC 00000000 */   nop
