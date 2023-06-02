.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGInitVif1Packet__FP1P1
/* 2C820 0012C720 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2C824 0012C724 0000BF7F */  sq         $31, 0x0($sp)
/* 2C828 0012C728 088C84AF */  sw         $4, -0x73F8($gp)
/* 2C82C 0012C72C 0C8C85AF */  sw         $5, -0x73F4($gp)
/* 2C830 0012C730 088C828F */  lw         $2, -0x73F8($gp)
/* 2C834 0012C734 03004330 */  andi       $3, $2, 0x3
/* 2C838 0012C738 04004104 */  bgez       $2, .L0012C74C
/* 2C83C 0012C73C 00000000 */   nop
/* 2C840 0012C740 02006010 */  beqz       $3, .L0012C74C
/* 2C844 0012C744 00000000 */   nop
/* 2C848 0012C748 FCFF6324 */  addiu      $3, $3, -0x4
.L0012C74C:
/* 2C84C 0012C74C 07006010 */  beqz       $3, .L0012C76C
/* 2C850 0012C750 00000000 */   nop
/* 2C854 0012C754 04000224 */  addiu      $2, $0, 0x4
/* 2C858 0012C758 23104300 */  subu       $2, $2, $3
/* 2C85C 0012C75C 80180200 */  sll        $3, $2, 2
/* 2C860 0012C760 088C828F */  lw         $2, -0x73F8($gp)
/* 2C864 0012C764 21104300 */  addu       $2, $2, $3
/* 2C868 0012C768 088C82AF */  sw         $2, -0x73F8($gp)
.L0012C76C:
/* 2C86C 0012C76C 0C8C828F */  lw         $2, -0x73F4($gp)
/* 2C870 0012C770 03004330 */  andi       $3, $2, 0x3
/* 2C874 0012C774 04004104 */  bgez       $2, .L0012C788
/* 2C878 0012C778 00000000 */   nop
/* 2C87C 0012C77C 02006010 */  beqz       $3, .L0012C788
/* 2C880 0012C780 00000000 */   nop
/* 2C884 0012C784 FCFF6324 */  addiu      $3, $3, -0x4
.L0012C788:
/* 2C888 0012C788 07006010 */  beqz       $3, .L0012C7A8
/* 2C88C 0012C78C 00000000 */   nop
/* 2C890 0012C790 04000224 */  addiu      $2, $0, 0x4
/* 2C894 0012C794 23104300 */  subu       $2, $2, $3
/* 2C898 0012C798 80180200 */  sll        $3, $2, 2
/* 2C89C 0012C79C 0C8C828F */  lw         $2, -0x73F4($gp)
/* 2C8A0 0012C7A0 21104300 */  addu       $2, $2, $3
/* 2C8A4 0012C7A4 0C8C82AF */  sw         $2, -0x73F4($gp)
.L0012C7A8:
/* 2C8A8 0012C7A8 088C858F */  lw         $5, -0x73F8($gp)
/* 2C8AC 0012C7AC C801023C */  lui        $2, %hi(vifpacket)
/* 2C8B0 0012C7B0 80A74424 */  addiu      $4, $2, %lo(vifpacket)
/* 2C8B4 0012C7B4 0283040C */  jal        sceVif1PkInit
/* 2C8B8 0012C7B8 00000000 */   nop
/* 2C8BC 0012C7BC 0C8C858F */  lw         $5, -0x73F4($gp)
/* 2C8C0 0012C7C0 C801023C */  lui        $2, %hi(D_1C7A7A0)
/* 2C8C4 0012C7C4 A0A74424 */  addiu      $4, $2, %lo(D_1C7A7A0)
/* 2C8C8 0012C7C8 0283040C */  jal        sceVif1PkInit
/* 2C8CC 0012C7CC 00000000 */   nop
/* 2C8D0 0012C7D0 C801023C */  lui        $2, %hi(vifpacket)
/* 2C8D4 0012C7D4 80A74424 */  addiu      $4, $2, %lo(vifpacket)
/* 2C8D8 0012C7D8 0683040C */  jal        sceVif1PkReset
/* 2C8DC 0012C7DC 00000000 */   nop
/* 2C8E0 0012C7E0 C801023C */  lui        $2, %hi(D_1C7A7A0)
/* 2C8E4 0012C7E4 A0A74424 */  addiu      $4, $2, %lo(D_1C7A7A0)
/* 2C8E8 0012C7E8 0683040C */  jal        sceVif1PkReset
/* 2C8EC 0012C7EC 00000000 */   nop
/* 2C8F0 0012C7F0 0000BF7B */  lq         $31, 0x0($sp)
/* 2C8F4 0012C7F4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2C8F8 0012C7F8 0800E003 */  jr         $31
/* 2C8FC 0012C7FC 00000000 */   nop
