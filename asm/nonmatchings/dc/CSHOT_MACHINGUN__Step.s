.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__15CSHOT_MACHINGUNFv
/* AE850 001AE750 80FFBD27 */  addiu      $sp, $sp, -0x80
/* AE854 001AE754 7000BF7F */  sq         $31, 0x70($sp)
/* AE858 001AE758 6000B67F */  sq         $22, 0x60($sp)
/* AE85C 001AE75C 5000B57F */  sq         $21, 0x50($sp)
/* AE860 001AE760 4000B47F */  sq         $20, 0x40($sp)
/* AE864 001AE764 3000B37F */  sq         $19, 0x30($sp)
/* AE868 001AE768 2000B27F */  sq         $18, 0x20($sp)
/* AE86C 001AE76C 1000B17F */  sq         $17, 0x10($sp)
/* AE870 001AE770 0000B07F */  sq         $16, 0x0($sp)
/* AE874 001AE774 288E8070 */  paddub     $17, $4, $0
/* AE878 001AE778 28960070 */  paddub     $18, $0, $0
/* AE87C 001AE77C 72000010 */  b          .L001AE948
/* AE880 001AE780 00000000 */   nop
.L001AE784:
/* AE884 001AE784 80B01200 */  sll        $22, $18, 2
/* AE888 001AE788 2118D102 */  addu       $3, $22, $17
/* AE88C 001AE78C 80027424 */  addiu      $20, $3, 0x280
/* AE890 001AE790 8002638C */  lw         $3, 0x280($3)
/* AE894 001AE794 6B006018 */  blez       $3, .L001AE944
/* AE898 001AE798 00000000 */   nop
/* AE89C 001AE79C 0000838E */  lw         $3, 0x0($20)
/* AE8A0 001AE7A0 01006324 */  addiu      $3, $3, 0x1
/* AE8A4 001AE7A4 000083AE */  sw         $3, 0x0($20)
/* AE8A8 001AE7A8 0000838E */  lw         $3, 0x0($20)
/* AE8AC 001AE7AC F0006328 */  slti       $3, $3, 0xF0
/* AE8B0 001AE7B0 04006014 */  bnez       $3, .L001AE7C4
/* AE8B4 001AE7B4 00000000 */   nop
/* AE8B8 001AE7B8 000080AE */  sw         $0, 0x0($20)
/* AE8BC 001AE7BC 61000010 */  b          .L001AE944
/* AE8C0 001AE7C0 00000000 */   nop
.L001AE7C4:
/* AE8C4 001AE7C4 00811200 */  sll        $16, $18, 4
/* AE8C8 001AE7C8 21A83002 */  addu       $21, $17, $16
/* AE8CC 001AE7CC 0040023C */  lui        $2, (0x40000000 >> 16)
/* AE8D0 001AE7D0 00608244 */  mtc1       $2, $f12
/* AE8D4 001AE7D4 2826A072 */  paddub     $4, $21, $0
/* AE8D8 001AE7D8 282EA072 */  paddub     $5, $21, $0
/* AE8DC 001AE7DC 0001A626 */  addiu      $6, $21, 0x100
/* AE8E0 001AE7E0 02000724 */  addiu      $7, $0, 0x2
/* AE8E4 001AE7E4 D0AD060C */  jal        checkCollision__FPfPfPfif
/* AE8E8 001AE7E8 00000000 */   nop
/* AE8EC 001AE7EC 289E4070 */  paddub     $19, $2, $0
/* AE8F0 001AE7F0 01000324 */  addiu      $3, $0, 0x1
/* AE8F4 001AE7F4 07006316 */  bne        $19, $3, .L001AE814
/* AE8F8 001AE7F8 00000000 */   nop
/* AE8FC 001AE7FC F001023C */  lui        $2, %hi(D_1EFC000)
/* AE900 001AE800 00C04424 */  addiu      $4, $2, %lo(D_1EFC000)
/* AE904 001AE804 282EA072 */  paddub     $5, $21, $0
/* AE908 001AE808 60BA060C */  jal        Set__21CHIT_MACHINGUN_EFFECTFPf
/* AE90C 001AE80C 00000000 */   nop
/* AE910 001AE810 000080AE */  sw         $0, 0x0($20)
.L001AE814:
/* AE914 001AE814 03000324 */  addiu      $3, $0, 0x3
/* AE918 001AE818 3D006316 */  bne        $19, $3, .L001AE910
/* AE91C 001AE81C 00000000 */   nop
/* AE920 001AE820 8040023C */  lui        $2, (0x40800000 >> 16)
/* AE924 001AE824 00608244 */  mtc1       $2, $f12
/* AE928 001AE828 2118D102 */  addu       $3, $22, $17
/* AE92C 001AE82C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* AE930 001AE830 00688244 */  mtc1       $2, $f13
/* AE934 001AE834 F09D848F */  lw         $4, -0x6210($gp)
/* AE938 001AE838 282EA072 */  paddub     $5, $21, $0
/* AE93C 001AE83C 0002668C */  lw         $6, 0x200($3)
/* AE940 001AE840 02000724 */  addiu      $7, $0, 0x2
/* AE944 001AE844 2846E070 */  paddub     $8, $7, $0
/* AE948 001AE848 284EE070 */  paddub     $9, $7, $0
/* AE94C 001AE84C 28560070 */  paddub     $10, $0, $0
/* AE950 001AE850 285E0070 */  paddub     $11, $0, $0
/* AE954 001AE854 E8D5060C */  jal        Set__14CCollisionDataFPfiiffiiii
/* AE958 001AE858 00000000 */   nop
/* AE95C 001AE85C 049D828F */  lw         $2, -0x62FC($gp)
/* AE960 001AE860 16004480 */  lb         $4, 0x16($2)
/* AE964 001AE864 F09D938F */  lw         $19, -0x6210($gp)
/* AE968 001AE868 7CDA060C */  jal        GetWeaponElementAttr__Fi
/* AE96C 001AE86C 00000000 */   nop
/* AE970 001AE870 803D648E */  lw         $4, 0x3D80($19)
/* AE974 001AE874 80180400 */  sll        $3, $4, 2
/* AE978 001AE878 21186400 */  addu       $3, $3, $4
/* AE97C 001AE87C 40190300 */  sll        $3, $3, 5
/* AE980 001AE880 21187300 */  addu       $3, $3, $19
/* AE984 001AE884 500062AC */  sw         $2, 0x50($3)
/* AE988 001AE888 049D838F */  lw         $3, -0x62FC($gp)
/* AE98C 001AE88C 1C006524 */  addiu      $5, $3, 0x1C
/* AE990 001AE890 F09D868F */  lw         $6, -0x6210($gp)
/* AE994 001AE894 803DC48C */  lw         $4, 0x3D80($6)
/* AE998 001AE898 80180400 */  sll        $3, $4, 2
/* AE99C 001AE89C 21186400 */  addu       $3, $3, $4
/* AE9A0 001AE8A0 40190300 */  sll        $3, $3, 5
/* AE9A4 001AE8A4 21186600 */  addu       $3, $3, $6
/* AE9A8 001AE8A8 640065AC */  sw         $5, 0x64($3)
/* AE9AC 001AE8AC 049D838F */  lw         $3, -0x62FC($gp)
/* AE9B0 001AE8B0 EE006584 */  lh         $5, 0xEE($3)
/* AE9B4 001AE8B4 F09D868F */  lw         $6, -0x6210($gp)
/* AE9B8 001AE8B8 803DC48C */  lw         $4, 0x3D80($6)
/* AE9BC 001AE8BC 80180400 */  sll        $3, $4, 2
/* AE9C0 001AE8C0 21186400 */  addu       $3, $3, $4
/* AE9C4 001AE8C4 40190300 */  sll        $3, $3, 5
/* AE9C8 001AE8C8 21186600 */  addu       $3, $3, $6
/* AE9CC 001AE8CC 6C0065AC */  sw         $5, 0x6C($3)
/* AE9D0 001AE8D0 F09D868F */  lw         $6, -0x6210($gp)
/* AE9D4 001AE8D4 05000524 */  addiu      $5, $0, 0x5
/* AE9D8 001AE8D8 803DC48C */  lw         $4, 0x3D80($6)
/* AE9DC 001AE8DC 80180400 */  sll        $3, $4, 2
/* AE9E0 001AE8E0 21186400 */  addu       $3, $3, $4
/* AE9E4 001AE8E4 40190300 */  sll        $3, $3, 5
/* AE9E8 001AE8E8 21186600 */  addu       $3, $3, $6
/* AE9EC 001AE8EC 580065AC */  sw         $5, 0x58($3)
/* AE9F0 001AE8F0 06000524 */  addiu      $5, $0, 0x6
/* AE9F4 001AE8F4 803DC48C */  lw         $4, 0x3D80($6)
/* AE9F8 001AE8F8 80180400 */  sll        $3, $4, 2
/* AE9FC 001AE8FC 21186400 */  addu       $3, $3, $4
/* AEA00 001AE900 40190300 */  sll        $3, $3, 5
/* AEA04 001AE904 21186600 */  addu       $3, $3, $6
/* AEA08 001AE908 600065AC */  sw         $5, 0x60($3)
/* AEA0C 001AE90C 000080AE */  sw         $0, 0x0($20)
.L001AE910:
/* AEA10 001AE910 21181102 */  addu       $3, $16, $17
/* AEA14 001AE914 000161C4 */  lwc1       $f1, 0x100($3)
/* AEA18 001AE918 0000A0C6 */  lwc1       $f0, 0x0($21)
/* AEA1C 001AE91C 00000146 */  add.s      $f0, $f0, $f1
/* AEA20 001AE920 0000A0E6 */  swc1       $f0, 0x0($21)
/* AEA24 001AE924 040161C4 */  lwc1       $f1, 0x104($3)
/* AEA28 001AE928 040060C4 */  lwc1       $f0, 0x4($3)
/* AEA2C 001AE92C 00000146 */  add.s      $f0, $f0, $f1
/* AEA30 001AE930 040060E4 */  swc1       $f0, 0x4($3)
/* AEA34 001AE934 080161C4 */  lwc1       $f1, 0x108($3)
/* AEA38 001AE938 080060C4 */  lwc1       $f0, 0x8($3)
/* AEA3C 001AE93C 00000146 */  add.s      $f0, $f0, $f1
/* AEA40 001AE940 080060E4 */  swc1       $f0, 0x8($3)
.L001AE944:
/* AEA44 001AE944 01005226 */  addiu      $18, $18, 0x1
.L001AE948:
/* AEA48 001AE948 1000432A */  slti       $3, $18, 0x10
/* AEA4C 001AE94C 8DFF6014 */  bnez       $3, .L001AE784
/* AEA50 001AE950 00000000 */   nop
/* AEA54 001AE954 7000BF7B */  lq         $31, 0x70($sp)
/* AEA58 001AE958 6000B67B */  lq         $22, 0x60($sp)
/* AEA5C 001AE95C 5000B57B */  lq         $21, 0x50($sp)
/* AEA60 001AE960 4000B47B */  lq         $20, 0x40($sp)
/* AEA64 001AE964 3000B37B */  lq         $19, 0x30($sp)
/* AEA68 001AE968 2000B27B */  lq         $18, 0x20($sp)
/* AEA6C 001AE96C 1000B17B */  lq         $17, 0x10($sp)
/* AEA70 001AE970 0000B07B */  lq         $16, 0x0($sp)
/* AEA74 001AE974 8000BD27 */  addiu      $sp, $sp, 0x80
/* AEA78 001AE978 0800E003 */  jr         $31
/* AEA7C 001AE97C 00000000 */   nop
