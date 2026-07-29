.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Step__15CSHOT_MACHINGUNFv
/* 0AE850 001AE750 80FFBD27 */  addiu       $29, $29, -0x80
/* 0AE854 001AE754 7000BF7F */  sq          $31, 0x70($29)
/* 0AE858 001AE758 6000B67F */  sq          $22, 0x60($29)
/* 0AE85C 001AE75C 5000B57F */  sq          $21, 0x50($29)
/* 0AE860 001AE760 4000B47F */  sq          $20, 0x40($29)
/* 0AE864 001AE764 3000B37F */  sq          $19, 0x30($29)
/* 0AE868 001AE768 2000B27F */  sq          $18, 0x20($29)
/* 0AE86C 001AE76C 1000B17F */  sq          $17, 0x10($29)
/* 0AE870 001AE770 0000B07F */  sq          $16, 0x0($29)
/* 0AE874 001AE774 288E8070 */  paddub      $17, $4, $0
/* 0AE878 001AE778 28960070 */  paddub      $18, $0, $0
/* 0AE87C 001AE77C 72000010 */  b           .L001AE948
/* 0AE880 001AE780 00000000 */   nop
.L001AE784:
/* 0AE884 001AE784 80B01200 */  sll         $22, $18, 2
/* 0AE888 001AE788 2118D102 */  addu        $3, $22, $17
/* 0AE88C 001AE78C 80027424 */  addiu       $20, $3, 0x280
/* 0AE890 001AE790 8002638C */  lw          $3, 0x280($3)
/* 0AE894 001AE794 6B006018 */  blez        $3, .L001AE944
/* 0AE898 001AE798 00000000 */   nop
/* 0AE89C 001AE79C 0000838E */  lw          $3, 0x0($20)
/* 0AE8A0 001AE7A0 01006324 */  addiu       $3, $3, 0x1
/* 0AE8A4 001AE7A4 000083AE */  sw          $3, 0x0($20)
/* 0AE8A8 001AE7A8 0000838E */  lw          $3, 0x0($20)
/* 0AE8AC 001AE7AC F0006328 */  slti        $3, $3, 0xF0
/* 0AE8B0 001AE7B0 04006014 */  bnez        $3, .L001AE7C4
/* 0AE8B4 001AE7B4 00000000 */   nop
/* 0AE8B8 001AE7B8 000080AE */  sw          $0, 0x0($20)
/* 0AE8BC 001AE7BC 61000010 */  b           .L001AE944
/* 0AE8C0 001AE7C0 00000000 */   nop
.L001AE7C4:
/* 0AE8C4 001AE7C4 00811200 */  sll         $16, $18, 4
/* 0AE8C8 001AE7C8 21A83002 */  addu        $21, $17, $16
/* 0AE8CC 001AE7CC 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0AE8D0 001AE7D0 00608244 */  mtc1        $2, $f12
/* 0AE8D4 001AE7D4 2826A072 */  paddub      $4, $21, $0
/* 0AE8D8 001AE7D8 282EA072 */  paddub      $5, $21, $0
/* 0AE8DC 001AE7DC 0001A626 */  addiu       $6, $21, 0x100
/* 0AE8E0 001AE7E0 02000724 */  addiu       $7, $0, 0x2
/* 0AE8E4 001AE7E4 D0AD060C */  jal         checkCollision__FPfPfPfif
/* 0AE8E8 001AE7E8 00000000 */   nop
/* 0AE8EC 001AE7EC 289E4070 */  paddub      $19, $2, $0
/* 0AE8F0 001AE7F0 01000324 */  addiu       $3, $0, 0x1
/* 0AE8F4 001AE7F4 07006316 */  bne         $19, $3, .L001AE814
/* 0AE8F8 001AE7F8 00000000 */   nop
/* 0AE8FC 001AE7FC F001023C */  lui         $2, %hi(OzumondShotEffect)
/* 0AE900 001AE800 00C04424 */  addiu       $4, $2, %lo(OzumondShotEffect)
/* 0AE904 001AE804 282EA072 */  paddub      $5, $21, $0
/* 0AE908 001AE808 60BA060C */  jal         Set__21CHIT_MACHINGUN_EFFECTFPf
/* 0AE90C 001AE80C 00000000 */   nop
/* 0AE910 001AE810 000080AE */  sw          $0, 0x0($20)
.L001AE814:
/* 0AE914 001AE814 03000324 */  addiu       $3, $0, 0x3
/* 0AE918 001AE818 3D006316 */  bne         $19, $3, .L001AE910
/* 0AE91C 001AE81C 00000000 */   nop
/* 0AE920 001AE820 8040023C */  lui         $2, (0x40800000 >> 16)
/* 0AE924 001AE824 00608244 */  mtc1        $2, $f12
/* 0AE928 001AE828 2118D102 */  addu        $3, $22, $17
/* 0AE92C 001AE82C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0AE930 001AE830 00688244 */  mtc1        $2, $f13
/* 0AE934 001AE834 F09D848F */  lw          $4, -0x6210($28)
/* 0AE938 001AE838 282EA072 */  paddub      $5, $21, $0
/* 0AE93C 001AE83C 0002668C */  lw          $6, 0x200($3)
/* 0AE940 001AE840 02000724 */  addiu       $7, $0, 0x2
/* 0AE944 001AE844 2846E070 */  paddub      $8, $7, $0
/* 0AE948 001AE848 284EE070 */  paddub      $9, $7, $0
/* 0AE94C 001AE84C 28560070 */  paddub      $10, $0, $0
/* 0AE950 001AE850 285E0070 */  paddub      $11, $0, $0
/* 0AE954 001AE854 E8D5060C */  jal         Set__14CCollisionDataFPfiiffiiii
/* 0AE958 001AE858 00000000 */   nop
/* 0AE95C 001AE85C 049D828F */  lw          $2, -0x62FC($28)
/* 0AE960 001AE860 16004480 */  lb          $4, 0x16($2)
/* 0AE964 001AE864 F09D938F */  lw          $19, -0x6210($28)
/* 0AE968 001AE868 7CDA060C */  jal         GetWeaponElementAttr__Fi
/* 0AE96C 001AE86C 00000000 */   nop
/* 0AE970 001AE870 803D648E */  lw          $4, 0x3D80($19)
/* 0AE974 001AE874 80180400 */  sll         $3, $4, 2
/* 0AE978 001AE878 21186400 */  addu        $3, $3, $4
/* 0AE97C 001AE87C 40190300 */  sll         $3, $3, 5
/* 0AE980 001AE880 21187300 */  addu        $3, $3, $19
/* 0AE984 001AE884 500062AC */  sw          $2, 0x50($3)
/* 0AE988 001AE888 049D838F */  lw          $3, -0x62FC($28)
/* 0AE98C 001AE88C 1C006524 */  addiu       $5, $3, 0x1C
/* 0AE990 001AE890 F09D868F */  lw          $6, -0x6210($28)
/* 0AE994 001AE894 803DC48C */  lw          $4, 0x3D80($6)
/* 0AE998 001AE898 80180400 */  sll         $3, $4, 2
/* 0AE99C 001AE89C 21186400 */  addu        $3, $3, $4
/* 0AE9A0 001AE8A0 40190300 */  sll         $3, $3, 5
/* 0AE9A4 001AE8A4 21186600 */  addu        $3, $3, $6
/* 0AE9A8 001AE8A8 640065AC */  sw          $5, 0x64($3)
/* 0AE9AC 001AE8AC 049D838F */  lw          $3, -0x62FC($28)
/* 0AE9B0 001AE8B0 EE006584 */  lh          $5, 0xEE($3)
/* 0AE9B4 001AE8B4 F09D868F */  lw          $6, -0x6210($28)
/* 0AE9B8 001AE8B8 803DC48C */  lw          $4, 0x3D80($6)
/* 0AE9BC 001AE8BC 80180400 */  sll         $3, $4, 2
/* 0AE9C0 001AE8C0 21186400 */  addu        $3, $3, $4
/* 0AE9C4 001AE8C4 40190300 */  sll         $3, $3, 5
/* 0AE9C8 001AE8C8 21186600 */  addu        $3, $3, $6
/* 0AE9CC 001AE8CC 6C0065AC */  sw          $5, 0x6C($3)
/* 0AE9D0 001AE8D0 F09D868F */  lw          $6, -0x6210($28)
/* 0AE9D4 001AE8D4 05000524 */  addiu       $5, $0, 0x5
/* 0AE9D8 001AE8D8 803DC48C */  lw          $4, 0x3D80($6)
/* 0AE9DC 001AE8DC 80180400 */  sll         $3, $4, 2
/* 0AE9E0 001AE8E0 21186400 */  addu        $3, $3, $4
/* 0AE9E4 001AE8E4 40190300 */  sll         $3, $3, 5
/* 0AE9E8 001AE8E8 21186600 */  addu        $3, $3, $6
/* 0AE9EC 001AE8EC 580065AC */  sw          $5, 0x58($3)
/* 0AE9F0 001AE8F0 06000524 */  addiu       $5, $0, 0x6
/* 0AE9F4 001AE8F4 803DC48C */  lw          $4, 0x3D80($6)
/* 0AE9F8 001AE8F8 80180400 */  sll         $3, $4, 2
/* 0AE9FC 001AE8FC 21186400 */  addu        $3, $3, $4
/* 0AEA00 001AE900 40190300 */  sll         $3, $3, 5
/* 0AEA04 001AE904 21186600 */  addu        $3, $3, $6
/* 0AEA08 001AE908 600065AC */  sw          $5, 0x60($3)
/* 0AEA0C 001AE90C 000080AE */  sw          $0, 0x0($20)
.L001AE910:
/* 0AEA10 001AE910 21181102 */  addu        $3, $16, $17
/* 0AEA14 001AE914 000161C4 */  lwc1        $f1, 0x100($3)
/* 0AEA18 001AE918 0000A0C6 */  lwc1        $f0, 0x0($21)
/* 0AEA1C 001AE91C 00000146 */  add.s       $f0, $f0, $f1
/* 0AEA20 001AE920 0000A0E6 */  swc1        $f0, 0x0($21)
/* 0AEA24 001AE924 040161C4 */  lwc1        $f1, 0x104($3)
/* 0AEA28 001AE928 040060C4 */  lwc1        $f0, 0x4($3)
/* 0AEA2C 001AE92C 00000146 */  add.s       $f0, $f0, $f1
/* 0AEA30 001AE930 040060E4 */  swc1        $f0, 0x4($3)
/* 0AEA34 001AE934 080161C4 */  lwc1        $f1, 0x108($3)
/* 0AEA38 001AE938 080060C4 */  lwc1        $f0, 0x8($3)
/* 0AEA3C 001AE93C 00000146 */  add.s       $f0, $f0, $f1
/* 0AEA40 001AE940 080060E4 */  swc1        $f0, 0x8($3)
.L001AE944:
/* 0AEA44 001AE944 01005226 */  addiu       $18, $18, 0x1
.L001AE948:
/* 0AEA48 001AE948 1000432A */  slti        $3, $18, 0x10
/* 0AEA4C 001AE94C 8DFF6014 */  bnez        $3, .L001AE784
/* 0AEA50 001AE950 00000000 */   nop
/* 0AEA54 001AE954 7000BF7B */  lq          $31, 0x70($29)
/* 0AEA58 001AE958 6000B67B */  lq          $22, 0x60($29)
/* 0AEA5C 001AE95C 5000B57B */  lq          $21, 0x50($29)
/* 0AEA60 001AE960 4000B47B */  lq          $20, 0x40($29)
/* 0AEA64 001AE964 3000B37B */  lq          $19, 0x30($29)
/* 0AEA68 001AE968 2000B27B */  lq          $18, 0x20($29)
/* 0AEA6C 001AE96C 1000B17B */  lq          $17, 0x10($29)
/* 0AEA70 001AE970 0000B07B */  lq          $16, 0x0($29)
/* 0AEA74 001AE974 8000BD27 */  addiu       $29, $29, 0x80
/* 0AEA78 001AE978 0800E003 */  jr          $31
/* 0AEA7C 001AE97C 00000000 */   nop
