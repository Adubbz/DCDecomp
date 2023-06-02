.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_CHARA_TEXTURE__FP12RS_STACKDATAi
/* 8C810 0018C710 A0FEBD27 */  addiu      $sp, $sp, -0x160
/* 8C814 0018C714 8000BF7F */  sq         $31, 0x80($sp)
/* 8C818 0018C718 7000B77F */  sq         $23, 0x70($sp)
/* 8C81C 0018C71C 6000B67F */  sq         $22, 0x60($sp)
/* 8C820 0018C720 5000B57F */  sq         $21, 0x50($sp)
/* 8C824 0018C724 4000B47F */  sq         $20, 0x40($sp)
/* 8C828 0018C728 3000B37F */  sq         $19, 0x30($sp)
/* 8C82C 0018C72C 2000B27F */  sq         $18, 0x20($sp)
/* 8C830 0018C730 1000B17F */  sq         $17, 0x10($sp)
/* 8C834 0018C734 0000B07F */  sq         $16, 0x0($sp)
/* 8C838 0018C738 28BEA070 */  paddub     $23, $5, $0
/* 8C83C 0018C73C 08009624 */  addiu      $22, $4, 0x8
/* 8C840 0018C740 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8C844 0018C744 00000000 */   nop
/* 8C848 0018C748 28264070 */  paddub     $4, $2, $0
/* 8C84C 0018C74C 702C060C */  jal        GetNPC__Fi
/* 8C850 0018C750 00000000 */   nop
/* 8C854 0018C754 28864070 */  paddub     $16, $2, $0
/* 8C858 0018C758 04000016 */  bnez       $16, .L0018C76C
/* 8C85C 0018C75C 00000000 */   nop
/* 8C860 0018C760 28160070 */  paddub     $2, $0, $0
/* 8C864 0018C764 51000010 */  b          .L0018C8AC
/* 8C868 0018C768 00000000 */   nop
.L0018C76C:
/* 8C86C 0018C76C C400028E */  lw         $2, 0xC4($16)
/* 8C870 0018C770 04004010 */  beqz       $2, .L0018C784
/* 8C874 0018C774 00000000 */   nop
/* 8C878 0018C778 01000224 */  addiu      $2, $0, 0x1
/* 8C87C 0018C77C 4B000010 */  b          .L0018C8AC
/* 8C880 0018C780 00000000 */   nop
.L0018C784:
/* 8C884 0018C784 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8C888 0018C788 C4D3228C */  lw         $2, -0x2C3C($at)
/* 8C88C 0018C78C 21884400 */  addu       $17, $2, $4
/* 8C890 0018C790 A830060C */  jal        get_pack_file__Fv
/* 8C894 0018C794 00000000 */   nop
/* 8C898 0018C798 289E4070 */  paddub     $19, $2, $0
/* 8C89C 0018C79C 04006016 */  bnez       $19, .L0018C7B0
/* 8C8A0 0018C7A0 00000000 */   nop
/* 8C8A4 0018C7A4 28160070 */  paddub     $2, $0, $0
/* 8C8A8 0018C7A8 40000010 */  b          .L0018C8AC
/* 8C8AC 0018C7AC 00000000 */   nop
.L0018C7B0:
/* 8C8B0 0018C7B0 28960070 */  paddub     $18, $0, $0
/* 8C8B4 0018C7B4 23000010 */  b          .L0018C844
/* 8C8B8 0018C7B8 00000000 */   nop
.L0018C7BC:
/* 8C8BC 0018C7BC 2826C072 */  paddub     $4, $22, $0
/* 8C8C0 0018C7C0 08009624 */  addiu      $22, $4, 0x8
/* 8C8C4 0018C7C4 F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 8C8C8 0018C7C8 00000000 */   nop
/* 8C8CC 0018C7CC 28266072 */  paddub     $4, $19, $0
/* 8C8D0 0018C7D0 282E4070 */  paddub     $5, $2, $0
/* 8C8D4 0018C7D4 5C01A627 */  addiu      $6, $sp, 0x15C
/* 8C8D8 0018C7D8 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 8C8DC 0018C7DC 00000000 */   nop
/* 8C8E0 0018C7E0 28A64070 */  paddub     $20, $2, $0
/* 8C8E4 0018C7E4 16008012 */  beqz       $20, .L0018C840
/* 8C8E8 0018C7E8 00000000 */   nop
/* 8C8EC 0018C7EC B030060C */  jal        get_buffer__Fv
/* 8C8F0 0018C7F0 00000000 */   nop
/* 8C8F4 0018C7F4 5C01A38F */  lw         $3, 0x15C($sp)
/* 8C8F8 0018C7F8 03190300 */  sra        $3, $3, 4
/* 8C8FC 0018C7FC 01006524 */  addiu      $5, $3, 0x1
/* 8C900 0018C800 28264070 */  paddub     $4, $2, $0
/* 8C904 0018C804 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 8C908 0018C808 00000000 */   nop
/* 8C90C 0018C80C 28AE4070 */  paddub     $21, $2, $0
/* 8C910 0018C810 5C01A68F */  lw         $6, 0x15C($sp)
/* 8C914 0018C814 2826A072 */  paddub     $4, $21, $0
/* 8C918 0018C818 282E8072 */  paddub     $5, $20, $0
/* 8C91C 0018C81C EC0C040C */  jal        memcpy
/* 8C920 0018C820 00000000 */   nop
/* 8C924 0018C824 40101200 */  sll        $2, $18, 1
/* 8C928 0018C828 21105200 */  addu       $2, $2, $18
/* 8C92C 0018C82C 80100200 */  sll        $2, $2, 2
/* 8C930 0018C830 21105D00 */  addu       $2, $2, $sp
/* 8C934 0018C834 940051AC */  sw         $17, 0x94($2)
/* 8C938 0018C838 980040AC */  sw         $0, 0x98($2)
/* 8C93C 0018C83C 900055AC */  sw         $21, 0x90($2)
.L0018C840:
/* 8C940 0018C840 01005226 */  addiu      $18, $18, 0x1
.L0018C844:
/* 8C944 0018C844 FFFFE226 */  addiu      $2, $23, -0x1
/* 8C948 0018C848 2A104202 */  slt        $2, $18, $2
/* 8C94C 0018C84C DBFF4014 */  bnez       $2, .L0018C7BC
/* 8C950 0018C850 00000000 */   nop
/* 8C954 0018C854 40101200 */  sll        $2, $18, 1
/* 8C958 0018C858 21105200 */  addu       $2, $2, $18
/* 8C95C 0018C85C 80100200 */  sll        $2, $2, 2
/* 8C960 0018C860 21105D00 */  addu       $2, $2, $sp
/* 8C964 0018C864 900040AC */  sw         $0, 0x90($2)
/* 8C968 0018C868 C701023C */  lui        $2, %hi(TexManager)
/* 8C96C 0018C86C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 8C970 0018C870 282E2072 */  paddub     $5, $17, $0
/* 8C974 0018C874 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 8C978 0018C878 00000000 */   nop
/* 8C97C 0018C87C C701023C */  lui        $2, %hi(TexManager)
/* 8C980 0018C880 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 8C984 0018C884 FCCD040C */  jal        CleanUpBuffer__15CTextureManagerFv
/* 8C988 0018C888 00000000 */   nop
/* 8C98C 0018C88C C701023C */  lui        $2, %hi(TexManager)
/* 8C990 0018C890 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 8C994 0018C894 282E2072 */  paddub     $5, $17, $0
/* 8C998 0018C898 9000A627 */  addiu      $6, $sp, 0x90
/* 8C99C 0018C89C 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 8C9A0 0018C8A0 00000000 */   nop
/* 8C9A4 0018C8A4 8C1411AE */  sw         $17, 0x148C($16)
/* 8C9A8 0018C8A8 01000224 */  addiu      $2, $0, 0x1
.L0018C8AC:
/* 8C9AC 0018C8AC 8000BF7B */  lq         $31, 0x80($sp)
/* 8C9B0 0018C8B0 7000B77B */  lq         $23, 0x70($sp)
/* 8C9B4 0018C8B4 6000B67B */  lq         $22, 0x60($sp)
/* 8C9B8 0018C8B8 5000B57B */  lq         $21, 0x50($sp)
/* 8C9BC 0018C8BC 4000B47B */  lq         $20, 0x40($sp)
/* 8C9C0 0018C8C0 3000B37B */  lq         $19, 0x30($sp)
/* 8C9C4 0018C8C4 2000B27B */  lq         $18, 0x20($sp)
/* 8C9C8 0018C8C8 1000B17B */  lq         $17, 0x10($sp)
/* 8C9CC 0018C8CC 0000B07B */  lq         $16, 0x0($sp)
/* 8C9D0 0018C8D0 6001BD27 */  addiu      $sp, $sp, 0x160
/* 8C9D4 0018C8D4 0800E003 */  jr         $31
/* 8C9D8 0018C8D8 00000000 */   nop
/* 8C9DC 0018C8DC 00000000 */  nop
