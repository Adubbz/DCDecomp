.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel checkCollision__FPfPfPfif
/* AB840 001AB740 00FFBD27 */  addiu      $sp, $sp, -0x100
/* AB844 001AB744 A000BF7F */  sq         $31, 0xA0($sp)
/* AB848 001AB748 9000BE7F */  sq         $fp, 0x90($sp)
/* AB84C 001AB74C 8000B77F */  sq         $23, 0x80($sp)
/* AB850 001AB750 7000B67F */  sq         $22, 0x70($sp)
/* AB854 001AB754 6000B57F */  sq         $21, 0x60($sp)
/* AB858 001AB758 5000B47F */  sq         $20, 0x50($sp)
/* AB85C 001AB75C 4000B37F */  sq         $19, 0x40($sp)
/* AB860 001AB760 3000B27F */  sq         $18, 0x30($sp)
/* AB864 001AB764 2000B17F */  sq         $17, 0x20($sp)
/* AB868 001AB768 1000B07F */  sq         $16, 0x10($sp)
/* AB86C 001AB76C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* AB870 001AB770 28AE8070 */  paddub     $21, $4, $0
/* AB874 001AB774 28A6A070 */  paddub     $20, $5, $0
/* AB878 001AB778 289EC070 */  paddub     $19, $6, $0
/* AB87C 001AB77C 2896E070 */  paddub     $18, $7, $0
/* AB880 001AB780 06650046 */  mov.s      $f20, $f12
/* AB884 001AB784 988B828F */  lw         $2, -0x7468($gp)
/* AB888 001AB788 080040AC */  sw         $0, 0x8($2)
/* AB88C 001AB78C 988B848F */  lw         $4, -0x7468($gp)
/* AB890 001AB790 00050524 */  addiu      $5, $0, 0x500
/* AB894 001AB794 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* AB898 001AB798 00000000 */   nop
/* AB89C 001AB79C 28864070 */  paddub     $16, $2, $0
/* AB8A0 001AB7A0 A041023C */  lui        $2, (0x41A00000 >> 16)
/* AB8A4 001AB7A4 00608244 */  mtc1       $2, $f12
/* AB8A8 001AB7A8 C03F023C */  lui        $2, (0x3FC00000 >> 16)
/* AB8AC 001AB7AC 00688244 */  mtc1       $2, $f13
/* AB8B0 001AB7B0 C89C848F */  lw         $4, -0x6338($gp)
/* AB8B4 001AB7B4 282E0072 */  paddub     $5, $16, $0
/* AB8B8 001AB7B8 28368072 */  paddub     $6, $20, $0
/* AB8BC 001AB7BC F003070C */  jal        setCollisionData__FP11CDungeonMapP6CCPolyPfff
/* AB8C0 001AB7C0 00000000 */   nop
/* AB8C4 001AB7C4 288E4070 */  paddub     $17, $2, $0
/* AB8C8 001AB7C8 0001222A */  slti       $2, $17, 0x100
/* AB8CC 001AB7CC 06004014 */  bnez       $2, .L001AB7E8
/* AB8D0 001AB7D0 00000000 */   nop
/* AB8D4 001AB7D4 2A00023C */  lui        $2, %hi(_604)
/* AB8D8 001AB7D8 C0B44424 */  addiu      $4, $2, %lo(_604)
/* AB8DC 001AB7DC 282E2072 */  paddub     $5, $17, $0
/* AB8E0 001AB7E0 A611040C */  jal        printf
/* AB8E4 001AB7E4 00000000 */   nop
.L001AB7E8:
/* AB8E8 001AB7E8 000081C6 */  lwc1       $f1, 0x0($20)
/* AB8EC 001AB7EC 000060C6 */  lwc1       $f0, 0x0($19)
/* AB8F0 001AB7F0 00080046 */  add.s      $f0, $f1, $f0
/* AB8F4 001AB7F4 C000A0E7 */  swc1       $f0, 0xC0($sp)
/* AB8F8 001AB7F8 040081C6 */  lwc1       $f1, 0x4($20)
/* AB8FC 001AB7FC 040060C6 */  lwc1       $f0, 0x4($19)
/* AB900 001AB800 00080046 */  add.s      $f0, $f1, $f0
/* AB904 001AB804 C400A0E7 */  swc1       $f0, 0xC4($sp)
/* AB908 001AB808 080081C6 */  lwc1       $f1, 0x8($20)
/* AB90C 001AB80C 080060C6 */  lwc1       $f0, 0x8($19)
/* AB910 001AB810 00080046 */  add.s      $f0, $f1, $f0
/* AB914 001AB814 C800A0E7 */  swc1       $f0, 0xC8($sp)
/* AB918 001AB818 02000224 */  addiu      $2, $0, 0x2
/* AB91C 001AB81C 28004212 */  beq        $18, $2, .L001AB8C0
/* AB920 001AB820 00000000 */   nop
/* AB924 001AB824 D000A427 */  addiu      $4, $sp, 0xD0
/* AB928 001AB828 EA01023C */  lui        $2, %hi(D_1EA1D30)
/* AB92C 001AB82C 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* AB930 001AB830 0C86040C */  jal        sceVu0CopyVector
/* AB934 001AB834 00000000 */   nop
/* AB938 001AB838 789C858F */  lw         $5, -0x6388($gp)
/* AB93C 001AB83C 2700023C */  lui        $2, %hi(_345_4)
/* AB940 001AB840 E0AF4224 */  addiu      $2, $2, %lo(_345_4)
/* AB944 001AB844 E000A427 */  addiu      $4, $sp, 0xE0
/* AB948 001AB848 00004378 */  lq         $3, 0x0($2)
/* AB94C 001AB84C 100042DC */  ld         $2, 0x10($2)
/* AB950 001AB850 0000837C */  sq         $3, 0x0($4)
/* AB954 001AB854 100082FC */  sd         $2, 0x10($4)
/* AB958 001AB858 0400A280 */  lb         $2, 0x4($5)
/* AB95C 001AB85C 80100200 */  sll        $2, $2, 2
/* AB960 001AB860 21105D00 */  addu       $2, $2, $sp
/* AB964 001AB864 E00041C4 */  lwc1       $f1, 0xE0($2)
/* AB968 001AB868 D400A0C7 */  lwc1       $f0, 0xD4($sp)
/* AB96C 001AB86C 00000146 */  add.s      $f0, $f0, $f1
/* AB970 001AB870 D400A0E7 */  swc1       $f0, 0xD4($sp)
/* AB974 001AB874 D000A427 */  addiu      $4, $sp, 0xD0
/* AB978 001AB878 C000A527 */  addiu      $5, $sp, 0xC0
/* AB97C 001AB87C 648D040C */  jal        DistVector__FPfPf
/* AB980 001AB880 00000000 */   nop
/* AB984 001AB884 C040023C */  lui        $2, (0x40C00000 >> 16)
/* AB988 001AB888 00088244 */  mtc1       $2, $f1
/* AB98C 001AB88C 00000000 */  nop
/* AB990 001AB890 40081446 */  add.s      $f1, $f1, $f20
/* AB994 001AB894 36000146 */  c.le.s     $f0, $f1
/* AB998 001AB898 00000000 */  nop
/* AB99C 001AB89C 08000045 */  bc1f       .L001AB8C0
/* AB9A0 001AB8A0 00000000 */   nop
/* AB9A4 001AB8A4 2826A072 */  paddub     $4, $21, $0
/* AB9A8 001AB8A8 D000A527 */  addiu      $5, $sp, 0xD0
/* AB9AC 001AB8AC 0C86040C */  jal        sceVu0CopyVector
/* AB9B0 001AB8B0 00000000 */   nop
/* AB9B4 001AB8B4 02000224 */  addiu      $2, $0, 0x2
/* AB9B8 001AB8B8 80000010 */  b          .L001ABABC
/* AB9BC 001AB8BC 00000000 */   nop
.L001AB8C0:
/* AB9C0 001AB8C0 01000224 */  addiu      $2, $0, 0x1
/* AB9C4 001AB8C4 53004212 */  beq        $18, $2, .L001ABA14
/* AB9C8 001AB8C8 00000000 */   nop
/* AB9CC 001AB8CC 28960070 */  paddub     $18, $0, $0
/* AB9D0 001AB8D0 4D000010 */  b          .L001ABA08
/* AB9D4 001AB8D4 00000000 */   nop
.L001AB8D8:
/* AB9D8 001AB8D8 E09C848F */  lw         $4, -0x6320($gp)
/* AB9DC 001AB8DC 80101200 */  sll        $2, $18, 2
/* AB9E0 001AB8E0 21185200 */  addu       $3, $2, $18
/* AB9E4 001AB8E4 80100300 */  sll        $2, $3, 2
/* AB9E8 001AB8E8 21106200 */  addu       $2, $3, $2
/* AB9EC 001AB8EC 00110200 */  sll        $2, $2, 4
/* AB9F0 001AB8F0 21204400 */  addu       $4, $2, $4
/* AB9F4 001AB8F4 0200013C */  lui        $at, (0x20000 >> 16)
/* AB9F8 001AB8F8 21088100 */  addu       $at, $4, $at
/* AB9FC 001AB8FC D0E3238C */  lw         $3, -0x1C30($at)
/* ABA00 001AB900 FFFF0224 */  addiu      $2, $0, -0x1
/* ABA04 001AB904 3F006210 */  beq        $3, $2, .L001ABA04
/* ABA08 001AB908 00000000 */   nop
/* ABA0C 001AB90C 08004006 */  bltz       $18, .L001AB930
/* ABA10 001AB910 00000000 */   nop
/* ABA14 001AB914 1100412A */  slti       $at, $18, 0x11
/* ABA18 001AB918 05002010 */  beqz       $at, .L001AB930
/* ABA1C 001AB91C 00000000 */   nop
/* ABA20 001AB920 0200013C */  lui        $at, (0x20000 >> 16)
/* ABA24 001AB924 21088100 */  addu       $at, $4, $at
/* ABA28 001AB928 A4E42284 */  lh         $2, -0x1B5C($at)
/* ABA2C 001AB92C B000A2AF */  sw         $2, 0xB0($sp)
.L001AB930:
/* ABA30 001AB930 B000A28F */  lw         $2, 0xB0($sp)
/* ABA34 001AB934 33004010 */  beqz       $2, .L001ABA04
/* ABA38 001AB938 00000000 */   nop
/* ABA3C 001AB93C 289E0070 */  paddub     $19, $0, $0
/* ABA40 001AB940 2D000010 */  b          .L001AB9F8
/* ABA44 001AB944 00000000 */   nop
.L001AB948:
/* ABA48 001AB948 E09C848F */  lw         $4, -0x6320($gp)
/* ABA4C 001AB94C C0101200 */  sll        $2, $18, 3
/* ABA50 001AB950 21185200 */  addu       $3, $2, $18
/* ABA54 001AB954 C0100300 */  sll        $2, $3, 3
/* ABA58 001AB958 21106200 */  addu       $2, $3, $2
/* ABA5C 001AB95C 00F10200 */  sll        $fp, $2, 4
/* ABA60 001AB960 2118C403 */  addu       $3, $fp, $4
/* ABA64 001AB964 80B81300 */  sll        $23, $19, 2
/* ABA68 001AB968 2110E302 */  addu       $2, $23, $3
/* ABA6C 001AB96C 0500013C */  lui        $at, (0x55450 >> 16)
/* ABA70 001AB970 21084100 */  addu       $at, $2, $at
/* ABA74 001AB974 5054228C */  lw         $2, (0x55450 & 0xFFFF)($at)
/* ABA78 001AB978 1E004010 */  beqz       $2, .L001AB9F4
/* ABA7C 001AB97C 00000000 */   nop
/* ABA80 001AB980 00B11300 */  sll        $22, $19, 4
/* ABA84 001AB984 21107600 */  addu       $2, $3, $22
/* ABA88 001AB988 0500013C */  lui        $at, (0x55250 >> 16)
/* ABA8C 001AB98C 50522134 */  ori        $at, $at, (0x55250 & 0xFFFF)
/* ABA90 001AB990 21204100 */  addu       $4, $2, $at
/* ABA94 001AB994 282E8072 */  paddub     $5, $20, $0
/* ABA98 001AB998 648D040C */  jal        DistVector__FPfPf
/* ABA9C 001AB99C 00000000 */   nop
/* ABAA0 001AB9A0 E09C828F */  lw         $2, -0x6320($gp)
/* ABAA4 001AB9A4 2118C203 */  addu       $3, $fp, $2
/* ABAA8 001AB9A8 2110E302 */  addu       $2, $23, $3
/* ABAAC 001AB9AC 0500013C */  lui        $at, (0x55390 >> 16)
/* ABAB0 001AB9B0 21084100 */  addu       $at, $2, $at
/* ABAB4 001AB9B4 905321C4 */  lwc1       $f1, (0x55390 & 0xFFFF)($at)
/* ABAB8 001AB9B8 40A00146 */  add.s      $f1, $f20, $f1
/* ABABC 001AB9BC 36000146 */  c.le.s     $f0, $f1
/* ABAC0 001AB9C0 00000000 */  nop
/* ABAC4 001AB9C4 0B000045 */  bc1f       .L001AB9F4
/* ABAC8 001AB9C8 00000000 */   nop
/* ABACC 001AB9CC 21107600 */  addu       $2, $3, $22
/* ABAD0 001AB9D0 2826A072 */  paddub     $4, $21, $0
/* ABAD4 001AB9D4 0500013C */  lui        $at, (0x55250 >> 16)
/* ABAD8 001AB9D8 50522134 */  ori        $at, $at, (0x55250 & 0xFFFF)
/* ABADC 001AB9DC 21284100 */  addu       $5, $2, $at
/* ABAE0 001AB9E0 0C86040C */  jal        sceVu0CopyVector
/* ABAE4 001AB9E4 00000000 */   nop
/* ABAE8 001AB9E8 03000224 */  addiu      $2, $0, 0x3
/* ABAEC 001AB9EC 33000010 */  b          .L001ABABC
/* ABAF0 001AB9F0 00000000 */   nop
.L001AB9F4:
/* ABAF4 001AB9F4 01007326 */  addiu      $19, $19, 0x1
.L001AB9F8:
/* ABAF8 001AB9F8 1000622A */  slti       $2, $19, 0x10
/* ABAFC 001AB9FC D2FF4014 */  bnez       $2, .L001AB948
/* ABB00 001ABA00 00000000 */   nop
.L001ABA04:
/* ABB04 001ABA04 01005226 */  addiu      $18, $18, 0x1
.L001ABA08:
/* ABB08 001ABA08 1000422A */  slti       $2, $18, 0x10
/* ABB0C 001ABA0C B2FF4014 */  bnez       $2, .L001AB8D8
/* ABB10 001ABA10 00000000 */   nop
.L001ABA14:
/* ABB14 001ABA14 28260072 */  paddub     $4, $16, $0
/* ABB18 001ABA18 282E2072 */  paddub     $5, $17, $0
/* ABB1C 001ABA1C 28368072 */  paddub     $6, $20, $0
/* ABB20 001ABA20 C000A727 */  addiu      $7, $sp, 0xC0
/* ABB24 001ABA24 2846A072 */  paddub     $8, $21, $0
/* ABB28 001ABA28 01000924 */  addiu      $9, $0, 0x1
/* ABB2C 001ABA2C 04000A24 */  addiu      $10, $0, 0x4
/* ABB30 001ABA30 5427050C */  jal        CheckHit__FP6CCPolyiPfPfPfii
/* ABB34 001ABA34 00000000 */   nop
/* ABB38 001ABA38 1B004004 */  bltz       $2, .L001ABAA8
/* ABB3C 001ABA3C 00000000 */   nop
/* ABB40 001ABA40 80180200 */  sll        $3, $2, 2
/* ABB44 001ABA44 21106200 */  addu       $2, $3, $2
/* ABB48 001ABA48 00110200 */  sll        $2, $2, 4
/* ABB4C 001ABA4C 21100202 */  addu       $2, $16, $2
/* ABB50 001ABA50 40004284 */  lh         $2, 0x40($2)
/* ABB54 001ABA54 11004018 */  blez       $2, .L001ABA9C
/* ABB58 001ABA58 00000000 */   nop
/* ABB5C 001ABA5C 0D004128 */  slti       $at, $2, 0xD
/* ABB60 001ABA60 0E002010 */  beqz       $at, .L001ABA9C
/* ABB64 001ABA64 00000000 */   nop
/* ABB68 001ABA68 CC9C838F */  lw         $3, -0x6334($gp)
/* ABB6C 001ABA6C 80100200 */  sll        $2, $2, 2
/* ABB70 001ABA70 21204300 */  addu       $4, $2, $3
/* ABB74 001ABA74 0100013C */  lui        $at, (0x10000 >> 16)
/* ABB78 001ABA78 21088100 */  addu       $at, $4, $at
/* ABB7C 001ABA7C 6CD4238C */  lw         $3, -0x2B94($at)
/* ABB80 001ABA80 02006228 */  slti       $2, $3, 0x2
/* ABB84 001ABA84 05004014 */  bnez       $2, .L001ABA9C
/* ABB88 001ABA88 00000000 */   nop
/* ABB8C 001ABA8C FFFF6224 */  addiu      $2, $3, -0x1
/* ABB90 001ABA90 0100013C */  lui        $at, (0x10000 >> 16)
/* ABB94 001ABA94 21088100 */  addu       $at, $4, $at
/* ABB98 001ABA98 6CD422AC */  sw         $2, -0x2B94($at)
.L001ABA9C:
/* ABB9C 001ABA9C 01000224 */  addiu      $2, $0, 0x1
/* ABBA0 001ABAA0 06000010 */  b          .L001ABABC
/* ABBA4 001ABAA4 00000000 */   nop
.L001ABAA8:
/* ABBA8 001ABAA8 2826A072 */  paddub     $4, $21, $0
/* ABBAC 001ABAAC 282E8072 */  paddub     $5, $20, $0
/* ABBB0 001ABAB0 0C86040C */  jal        sceVu0CopyVector
/* ABBB4 001ABAB4 00000000 */   nop
/* ABBB8 001ABAB8 28160070 */  paddub     $2, $0, $0
.L001ABABC:
/* ABBBC 001ABABC A000BF7B */  lq         $31, 0xA0($sp)
/* ABBC0 001ABAC0 9000BE7B */  lq         $fp, 0x90($sp)
/* ABBC4 001ABAC4 8000B77B */  lq         $23, 0x80($sp)
/* ABBC8 001ABAC8 7000B67B */  lq         $22, 0x70($sp)
/* ABBCC 001ABACC 6000B57B */  lq         $21, 0x60($sp)
/* ABBD0 001ABAD0 5000B47B */  lq         $20, 0x50($sp)
/* ABBD4 001ABAD4 4000B37B */  lq         $19, 0x40($sp)
/* ABBD8 001ABAD8 3000B27B */  lq         $18, 0x30($sp)
/* ABBDC 001ABADC 2000B17B */  lq         $17, 0x20($sp)
/* ABBE0 001ABAE0 1000B07B */  lq         $16, 0x10($sp)
/* ABBE4 001ABAE4 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* ABBE8 001ABAE8 0001BD27 */  addiu      $sp, $sp, 0x100
/* ABBEC 001ABAEC 0800E003 */  jr         $31
/* ABBF0 001ABAF0 00000000 */   nop
/* ABBF4 001ABAF4 00000000 */  nop
/* ABBF8 001ABAF8 00000000 */  nop
/* ABBFC 001ABAFC 00000000 */  nop
