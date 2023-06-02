.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDmaSend
/* C7F8 0010C6F8 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* C7FC 0010C6FC 3000B3FF */  sd         $19, 0x30($sp)
/* C800 0010C700 1000B1FF */  sd         $17, 0x10($sp)
/* C804 0010C704 2D98A000 */  daddu      $19, $5, $0
/* C808 0010C708 0000B0FF */  sd         $16, 0x0($sp)
/* C80C 0010C70C 0001113C */  lui        $17, %hi(GlobalDataBuffer + 0xD54F7F)
/* C810 0010C710 4000BFFF */  sd         $31, 0x40($sp)
/* C814 0010C714 2D808000 */  daddu      $16, $4, $0
/* C818 0010C718 2000B2FF */  sd         $18, 0x20($sp)
/* C81C 0010C71C 0000028E */  lw         $2, 0x0($16)
/* C820 0010C720 00014230 */  andi       $2, $2, 0x100
/* C824 0010C724 18004010 */  beqz       $2, .L0010C788
/* C828 0010C728 2900123C */   lui       $18, %hi(D_002973B0)
/* C82C 0010C72C FFFF3126 */  addiu      $17, $17, %lo(GlobalDataBuffer + (0xD54F7F & 0xFFFF))
.L0010C730:
/* C830 0010C730 11002106 */  bgez       $17, .L0010C778
/* C834 0010C734 00000000 */   nop
/* C838 0010C738 A611040C */  jal        printf
/* C83C 0010C73C B0734426 */   addiu     $4, $18, %lo(D_002973B0)
/* C840 0010C740 0000048E */  lw         $4, 0x0($16)
/* C844 0010C744 02120400 */  srl        $2, $4, 8
/* C848 0010C748 01004230 */  andi       $2, $2, 0x1
/* C84C 0010C74C 0A004010 */  beqz       $2, .L0010C778
/* C850 0010C750 00000000 */   nop
/* C854 0010C754 FFFE0524 */  addiu      $5, $0, -0x101
.L0010C758:
/* C858 0010C758 24188500 */  and        $3, $4, $5
/* C85C 0010C75C 2D100000 */  daddu      $2, $0, $0
/* C860 0010C760 2D206000 */  daddu      $4, $3, $0
/* C864 0010C764 00000000 */  nop
/* C868 0010C768 00000000 */  nop
/* C86C 0010C76C FAFF4014 */  bnez       $2, .L0010C758
/* C870 0010C770 00000000 */   nop
/* C874 0010C774 000003AE */  sw         $3, 0x0($16)
.L0010C778:
/* C878 0010C778 0000028E */  lw         $2, 0x0($16)
/* C87C 0010C77C 00014230 */  andi       $2, $2, 0x100
/* C880 0010C780 EBFF4014 */  bnez       $2, .L0010C730
/* C884 0010C784 FFFF3126 */   addiu     $17, $17, -0x1
.L0010C788:
/* C888 0010C788 FFFF023C */  lui        $2, (0xFFFFFFFF >> 16)
/* C88C 0010C78C 3000038E */  lw         $3, 0x30($16)
/* C890 0010C790 FFFF4234 */  ori        $2, $2, (0xFFFFFFFF & 0xFFFF)
/* C894 0010C794 01006254 */  bnel       $3, $2, .L0010C79C
/* C898 0010C798 300013AE */   sw        $19, 0x30($16)
.L0010C79C:
/* C89C 0010C79C 0000028E */  lw         $2, 0x0($16)
/* C8A0 0010C7A0 F3FF0324 */  addiu      $3, $0, -0xD
/* C8A4 0010C7A4 200000AE */  sw         $0, 0x20($16)
/* C8A8 0010C7A8 24104300 */  and        $2, $2, $3
/* C8AC 0010C7AC 4000BFDF */  ld         $31, 0x40($sp)
/* C8B0 0010C7B0 05014234 */  ori        $2, $2, 0x105
/* C8B4 0010C7B4 3000B3DF */  ld         $19, 0x30($sp)
/* C8B8 0010C7B8 000002AE */  sw         $2, 0x0($16)
/* C8BC 0010C7BC 2000B2DF */  ld         $18, 0x20($sp)
/* C8C0 0010C7C0 1000B1DF */  ld         $17, 0x10($sp)
/* C8C4 0010C7C4 0000B0DF */  ld         $16, 0x0($sp)
/* C8C8 0010C7C8 0800E003 */  jr         $31
/* C8CC 0010C7CC 5000BD27 */   addiu     $sp, $sp, 0x50
