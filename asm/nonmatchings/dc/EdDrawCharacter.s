.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdDrawCharacter__FP10CCharacteriiP12CNPCharacterPiiP13ED_EVENT_INFO
/* 726F0 001725F0 30FEBD27 */  addiu      $sp, $sp, -0x1D0
/* 726F4 001725F4 A000BF7F */  sq         $31, 0xA0($sp)
/* 726F8 001725F8 9000BE7F */  sq         $fp, 0x90($sp)
/* 726FC 001725FC 8000B77F */  sq         $23, 0x80($sp)
/* 72700 00172600 7000B67F */  sq         $22, 0x70($sp)
/* 72704 00172604 6000B57F */  sq         $21, 0x60($sp)
/* 72708 00172608 5000B47F */  sq         $20, 0x50($sp)
/* 7270C 0017260C 4000B37F */  sq         $19, 0x40($sp)
/* 72710 00172610 3000B27F */  sq         $18, 0x30($sp)
/* 72714 00172614 2000B17F */  sq         $17, 0x20($sp)
/* 72718 00172618 1000B07F */  sq         $16, 0x10($sp)
/* 7271C 0017261C 28B68070 */  paddub     $22, $4, $0
/* 72720 00172620 28AEA070 */  paddub     $21, $5, $0
/* 72724 00172624 28BEC070 */  paddub     $23, $6, $0
/* 72728 00172628 28A6E070 */  paddub     $20, $7, $0
/* 7272C 0017262C 289E0071 */  paddub     $19, $8, $0
/* 72730 00172630 28962071 */  paddub     $18, $9, $0
/* 72734 00172634 288E4071 */  paddub     $17, $10, $0
/* 72738 00172638 488F838F */  lw         $3, -0x70B8($gp)
/* 7273C 0017263C 02006010 */  beqz       $3, .L00172648
/* 72740 00172640 00000000 */   nop
/* 72744 00172644 28AE0070 */  paddub     $21, $0, $0
.L00172648:
/* 72748 00172648 6C002012 */  beqz       $17, .L001727FC
/* 7274C 0017264C 00000000 */   nop
/* 72750 00172650 28960070 */  paddub     $18, $0, $0
/* 72754 00172654 03001524 */  addiu      $21, $0, 0x3
/* 72758 00172658 6000238E */  lw         $3, 0x60($17)
/* 7275C 0017265C 03006014 */  bnez       $3, .L0017266C
/* 72760 00172660 00000000 */   nop
/* 72764 00172664 FEFF0324 */  addiu      $3, $0, -0x2
/* 72768 00172668 24A8A302 */  and        $21, $21, $3
.L0017266C:
/* 7276C 0017266C 6400238E */  lw         $3, 0x64($17)
/* 72770 00172670 05006014 */  bnez       $3, .L00172688
/* 72774 00172674 00000000 */   nop
/* 72778 00172678 FDFF0324 */  addiu      $3, $0, -0x3
/* 7277C 0017267C 24A8A302 */  and        $21, $21, $3
/* 72780 00172680 02000010 */  b          .L0017268C
/* 72784 00172684 00000000 */   nop
.L00172688:
/* 72788 00172688 01005236 */  ori        $18, $18, 0x1
.L0017268C:
/* 7278C 0017268C 1B006012 */  beqz       $19, .L001726FC
/* 72790 00172690 00000000 */   nop
/* 72794 00172694 28860070 */  paddub     $16, $0, $0
/* 72798 00172698 15000010 */  b          .L001726F0
/* 7279C 0017269C 00000000 */   nop
.L001726A0:
/* 727A0 001726A0 80201000 */  sll        $4, $16, 2
/* 727A4 001726A4 21189100 */  addu       $3, $4, $17
/* 727A8 001726A8 B400638C */  lw         $3, 0xB4($3)
/* 727AC 001726AC 03006014 */  bnez       $3, .L001726BC
/* 727B0 001726B0 00000000 */   nop
/* 727B4 001726B4 21186402 */  addu       $3, $19, $4
/* 727B8 001726B8 000060AC */  sw         $0, 0x0($3)
.L001726BC:
/* 727BC 001726BC 21189100 */  addu       $3, $4, $17
/* 727C0 001726C0 F400638C */  lw         $3, 0xF4($3)
/* 727C4 001726C4 08006014 */  bnez       $3, .L001726E8
/* 727C8 001726C8 00000000 */   nop
/* 727CC 001726CC 21286402 */  addu       $5, $19, $4
/* 727D0 001726D0 0000A48C */  lw         $4, 0x0($5)
/* 727D4 001726D4 FDFF0324 */  addiu      $3, $0, -0x3
/* 727D8 001726D8 24188300 */  and        $3, $4, $3
/* 727DC 001726DC 0000A3AC */  sw         $3, 0x0($5)
/* 727E0 001726E0 02000010 */  b          .L001726EC
/* 727E4 001726E4 00000000 */   nop
.L001726E8:
/* 727E8 001726E8 01005236 */  ori        $18, $18, 0x1
.L001726EC:
/* 727EC 001726EC 01001026 */  addiu      $16, $16, 0x1
.L001726F0:
/* 727F0 001726F0 2A181702 */  slt        $3, $16, $23
/* 727F4 001726F4 EAFF6014 */  bnez       $3, .L001726A0
/* 727F8 001726F8 00000000 */   nop
.L001726FC:
/* 727FC 001726FC 28860070 */  paddub     $16, $0, $0
/* 72800 00172700 39000010 */  b          .L001727E8
/* 72804 00172704 00000000 */   nop
.L00172708:
/* 72808 00172708 40111000 */  sll        $2, $16, 5
/* 7280C 0017270C 21185000 */  addu       $3, $2, $16
/* 72810 00172710 80100300 */  sll        $2, $3, 2
/* 72814 00172714 21106200 */  addu       $2, $3, $2
/* 72818 00172718 40110200 */  sll        $2, $2, 5
/* 7281C 0017271C B000A2AF */  sw         $2, 0xB0($sp)
/* 72820 00172720 B000A28F */  lw         $2, 0xB0($sp)
/* 72824 00172724 21F08202 */  addu       $fp, $20, $2
/* 72828 00172728 2826C073 */  paddub     $4, $fp, $0
/* 7282C 0017272C 9C59050C */  jal        CheckDraw__12CNPCharacterFv
/* 72830 00172730 00000000 */   nop
/* 72834 00172734 2B004010 */  beqz       $2, .L001727E4
/* 72838 00172738 00000000 */   nop
/* 7283C 0017273C 80201000 */  sll        $4, $16, 2
/* 72840 00172740 21189100 */  addu       $3, $4, $17
/* 72844 00172744 B401638C */  lw         $3, 0x1B4($3)
/* 72848 00172748 26006010 */  beqz       $3, .L001727E4
/* 7284C 0017274C 00000000 */   nop
/* 72850 00172750 21286402 */  addu       $5, $19, $4
/* 72854 00172754 0000A38C */  lw         $3, 0x0($5)
/* 72858 00172758 01006330 */  andi       $3, $3, 0x1
/* 7285C 0017275C 21006010 */  beqz       $3, .L001727E4
/* 72860 00172760 00000000 */   nop
/* 72864 00172764 B000A38F */  lw         $3, 0xB0($sp)
/* 72868 00172768 21207400 */  addu       $4, $3, $20
/* 7286C 0017276C 6C14838C */  lw         $3, 0x146C($4)
/* 72870 00172770 2B180300 */  sltu       $3, $0, $3
/* 72874 00172774 03006010 */  beqz       $3, .L00172784
/* 72878 00172778 00000000 */   nop
/* 7287C 0017277C 7014838C */  lw         $3, 0x1470($4)
/* 72880 00172780 2B180300 */  sltu       $3, $0, $3
.L00172784:
/* 72884 00172784 FF006330 */  andi       $3, $3, 0xFF
/* 72888 00172788 16006010 */  beqz       $3, .L001727E4
/* 7288C 0017278C 00000000 */   nop
/* 72890 00172790 0000A0AC */  sw         $0, 0x0($5)
/* 72894 00172794 B000A28F */  lw         $2, 0xB0($sp)
/* 72898 00172798 21185400 */  addu       $3, $2, $20
/* 7289C 0017279C 8C146224 */  addiu      $2, $3, 0x148C
/* 728A0 001727A0 C000A2AF */  sw         $2, 0xC0($sp)
/* 728A4 001727A4 C701023C */  lui        $2, %hi(TexManager)
/* 728A8 001727A8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 728AC 001727AC D48B858F */  lw         $5, -0x742C($gp)
/* 728B0 001727B0 8C14668C */  lw         $6, 0x148C($3)
/* 728B4 001727B4 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 728B8 001727B8 00000000 */   nop
/* 728BC 001727BC 2826C073 */  paddub     $4, $fp, $0
/* 728C0 001727C0 C000A28F */  lw         $2, 0xC0($sp)
/* 728C4 001727C4 0000458C */  lw         $5, 0x0($2)
/* 728C8 001727C8 14E0040C */  jal        TextureAnime__10CCharacterFi
/* 728CC 001727CC 00000000 */   nop
/* 728D0 001727D0 2826C073 */  paddub     $4, $fp, $0
/* 728D4 001727D4 A000D98F */  lw         $25, 0xA0($fp)
/* 728D8 001727D8 AC00398F */  lw         $25, 0xAC($25)
/* 728DC 001727DC 09F82003 */  jalr       $25
/* 728E0 001727E0 00000000 */   nop
.L001727E4:
/* 728E4 001727E4 01001026 */  addiu      $16, $16, 0x1
.L001727E8:
/* 728E8 001727E8 2A081702 */  slt        $at, $16, $23
/* 728EC 001727EC 03002010 */  beqz       $at, .L001727FC
/* 728F0 001727F0 00000000 */   nop
/* 728F4 001727F4 C4FF6016 */  bnez       $19, .L00172708
/* 728F8 001727F8 00000000 */   nop
.L001727FC:
/* 728FC 001727FC 5A004012 */  beqz       $18, .L00172968
/* 72900 00172800 00000000 */   nop
/* 72904 00172804 D000A427 */  addiu      $4, $sp, 0xD0
/* 72908 00172808 5001A527 */  addiu      $5, $sp, 0x150
/* 7290C 0017280C 2CB7040C */  jal        MGGetPLight__FPA4_fPA4_f
/* 72910 00172810 00000000 */   nop
/* 72914 00172814 1001A427 */  addiu      $4, $sp, 0x110
/* 72918 00172818 D000A527 */  addiu      $5, $sp, 0xD0
/* 7291C 0017281C 1086040C */  jal        sceVu0CopyMatrix
/* 72920 00172820 00000000 */   nop
/* 72924 00172824 9001A427 */  addiu      $4, $sp, 0x190
/* 72928 00172828 5001A527 */  addiu      $5, $sp, 0x150
/* 7292C 0017282C 1086040C */  jal        sceVu0CopyMatrix
/* 72930 00172830 00000000 */   nop
/* 72934 00172834 4040023C */  lui        $2, (0x40400000 >> 16)
/* 72938 00172838 00608244 */  mtc1       $2, $f12
/* 7293C 0017283C 1001A427 */  addiu      $4, $sp, 0x110
/* 72940 00172840 D41F060C */  jal        EdLimitShadowLight__FPA4_ff
/* 72944 00172844 00000000 */   nop
/* 72948 00172848 1001A427 */  addiu      $4, $sp, 0x110
/* 7294C 0017284C 5001A527 */  addiu      $5, $sp, 0x150
/* 72950 00172850 08B7040C */  jal        MGSetPLight__FPA4_fPA4_f
/* 72954 00172854 00000000 */   nop
/* 72958 00172858 C701023C */  lui        $2, %hi(TexManager)
/* 7295C 0017285C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 72960 00172860 D48B858F */  lw         $5, -0x742C($gp)
/* 72964 00172864 16000624 */  addiu      $6, $0, 0x16
/* 72968 00172868 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 7296C 0017286C 00000000 */   nop
/* 72970 00172870 C701023C */  lui        $2, %hi(TexManager)
/* 72974 00172874 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 72978 00172878 2A00023C */  lui        $2, %hi(_435)
/* 7297C 0017287C A0A24524 */  addiu      $5, $2, %lo(_435)
/* 72980 00172880 FFFF0624 */  addiu      $6, $0, -0x1
/* 72984 00172884 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 72988 00172888 00000000 */   nop
/* 7298C 0017288C 280044DC */  ld         $4, 0x28($2)
/* 72990 00172890 28C2040C */  jal        MGBeginDrawShadow__F9sceGsTex0
/* 72994 00172894 00000000 */   nop
/* 72998 00172898 0200A232 */  andi       $2, $21, 0x2
/* 7299C 0017289C 06004010 */  beqz       $2, .L001728B8
/* 729A0 001728A0 00000000 */   nop
/* 729A4 001728A4 2826C072 */  paddub     $4, $22, $0
/* 729A8 001728A8 A000D98E */  lw         $25, 0xA0($22)
/* 729AC 001728AC B000398F */  lw         $25, 0xB0($25)
/* 729B0 001728B0 09F82003 */  jalr       $25
/* 729B4 001728B4 00000000 */   nop
.L001728B8:
/* 729B8 001728B8 28860070 */  paddub     $16, $0, $0
/* 729BC 001728BC 1E000010 */  b          .L00172938
/* 729C0 001728C0 00000000 */   nop
.L001728C4:
/* 729C4 001728C4 80101000 */  sll        $2, $16, 2
/* 729C8 001728C8 21106202 */  addu       $2, $19, $2
/* 729CC 001728CC 0000428C */  lw         $2, 0x0($2)
/* 729D0 001728D0 02004230 */  andi       $2, $2, 0x2
/* 729D4 001728D4 17004010 */  beqz       $2, .L00172934
/* 729D8 001728D8 00000000 */   nop
/* 729DC 001728DC 28260070 */  paddub     $4, $0, $0
/* 729E0 001728E0 40111000 */  sll        $2, $16, 5
/* 729E4 001728E4 21185000 */  addu       $3, $2, $16
/* 729E8 001728E8 80100300 */  sll        $2, $3, 2
/* 729EC 001728EC 21106200 */  addu       $2, $3, $2
/* 729F0 001728F0 40290200 */  sll        $5, $2, 5
/* 729F4 001728F4 2118B400 */  addu       $3, $5, $20
/* 729F8 001728F8 6C14628C */  lw         $2, 0x146C($3)
/* 729FC 001728FC 05004010 */  beqz       $2, .L00172914
/* 72A00 00172900 00000000 */   nop
/* 72A04 00172904 7014628C */  lw         $2, 0x1470($3)
/* 72A08 00172908 02004010 */  beqz       $2, .L00172914
/* 72A0C 0017290C 00000000 */   nop
/* 72A10 00172910 01000464 */  daddiu     $4, $0, 0x1
.L00172914:
/* 72A14 00172914 FF008230 */  andi       $2, $4, 0xFF
/* 72A18 00172918 06004010 */  beqz       $2, .L00172934
/* 72A1C 0017291C 00000000 */   nop
/* 72A20 00172920 21208502 */  addu       $4, $20, $5
/* 72A24 00172924 A000998C */  lw         $25, 0xA0($4)
/* 72A28 00172928 B000398F */  lw         $25, 0xB0($25)
/* 72A2C 0017292C 09F82003 */  jalr       $25
/* 72A30 00172930 00000000 */   nop
.L00172934:
/* 72A34 00172934 01001026 */  addiu      $16, $16, 0x1
.L00172938:
/* 72A38 00172938 2A081702 */  slt        $at, $16, $23
/* 72A3C 0017293C 03002010 */  beqz       $at, .L0017294C
/* 72A40 00172940 00000000 */   nop
/* 72A44 00172944 DFFF6016 */  bnez       $19, .L001728C4
/* 72A48 00172948 00000000 */   nop
.L0017294C:
/* 72A4C 0017294C 34000424 */  addiu      $4, $0, 0x34
/* 72A50 00172950 CCC2040C */  jal        MGEndDrawShadow__FUc
/* 72A54 00172954 00000000 */   nop
/* 72A58 00172958 D000A427 */  addiu      $4, $sp, 0xD0
/* 72A5C 0017295C 5001A527 */  addiu      $5, $sp, 0x150
/* 72A60 00172960 08B7040C */  jal        MGSetPLight__FPA4_fPA4_f
/* 72A64 00172964 00000000 */   nop
.L00172968:
/* 72A68 00172968 0100A332 */  andi       $3, $21, 0x1
/* 72A6C 0017296C 10006010 */  beqz       $3, .L001729B0
/* 72A70 00172970 00000000 */   nop
/* 72A74 00172974 C701023C */  lui        $2, %hi(TexManager)
/* 72A78 00172978 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 72A7C 0017297C D48B858F */  lw         $5, -0x742C($gp)
/* 72A80 00172980 08000624 */  addiu      $6, $0, 0x8
/* 72A84 00172984 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 72A88 00172988 00000000 */   nop
/* 72A8C 0017298C 2826C072 */  paddub     $4, $22, $0
/* 72A90 00172990 08000524 */  addiu      $5, $0, 0x8
/* 72A94 00172994 14E0040C */  jal        TextureAnime__10CCharacterFi
/* 72A98 00172998 00000000 */   nop
/* 72A9C 0017299C 2826C072 */  paddub     $4, $22, $0
/* 72AA0 001729A0 A000D98E */  lw         $25, 0xA0($22)
/* 72AA4 001729A4 AC00398F */  lw         $25, 0xAC($25)
/* 72AA8 001729A8 09F82003 */  jalr       $25
/* 72AAC 001729AC 00000000 */   nop
.L001729B0:
/* 72AB0 001729B0 28860070 */  paddub     $16, $0, $0
/* 72AB4 001729B4 2E000010 */  b          .L00172A70
/* 72AB8 001729B8 00000000 */   nop
.L001729BC:
/* 72ABC 001729BC 40111000 */  sll        $2, $16, 5
/* 72AC0 001729C0 21185000 */  addu       $3, $2, $16
/* 72AC4 001729C4 80100300 */  sll        $2, $3, 2
/* 72AC8 001729C8 21106200 */  addu       $2, $3, $2
/* 72ACC 001729CC 40890200 */  sll        $17, $2, 5
/* 72AD0 001729D0 21909102 */  addu       $18, $20, $17
/* 72AD4 001729D4 28264072 */  paddub     $4, $18, $0
/* 72AD8 001729D8 9C59050C */  jal        CheckDraw__12CNPCharacterFv
/* 72ADC 001729DC 00000000 */   nop
/* 72AE0 001729E0 22004010 */  beqz       $2, .L00172A6C
/* 72AE4 001729E4 00000000 */   nop
/* 72AE8 001729E8 80181000 */  sll        $3, $16, 2
/* 72AEC 001729EC 21186302 */  addu       $3, $19, $3
/* 72AF0 001729F0 0000638C */  lw         $3, 0x0($3)
/* 72AF4 001729F4 01006330 */  andi       $3, $3, 0x1
/* 72AF8 001729F8 1C006010 */  beqz       $3, .L00172A6C
/* 72AFC 001729FC 00000000 */   nop
/* 72B00 00172A00 28264072 */  paddub     $4, $18, $0
/* 72B04 00172A04 6C14838C */  lw         $3, 0x146C($4)
/* 72B08 00172A08 2B180300 */  sltu       $3, $0, $3
/* 72B0C 00172A0C 03006010 */  beqz       $3, .L00172A1C
/* 72B10 00172A10 00000000 */   nop
/* 72B14 00172A14 7014838C */  lw         $3, 0x1470($4)
/* 72B18 00172A18 2B180300 */  sltu       $3, $0, $3
.L00172A1C:
/* 72B1C 00172A1C FF006330 */  andi       $3, $3, 0xFF
/* 72B20 00172A20 12006010 */  beqz       $3, .L00172A6C
/* 72B24 00172A24 00000000 */   nop
/* 72B28 00172A28 21183402 */  addu       $3, $17, $20
/* 72B2C 00172A2C 8C147124 */  addiu      $17, $3, 0x148C
/* 72B30 00172A30 C701023C */  lui        $2, %hi(TexManager)
/* 72B34 00172A34 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 72B38 00172A38 D48B858F */  lw         $5, -0x742C($gp)
/* 72B3C 00172A3C 8C14668C */  lw         $6, 0x148C($3)
/* 72B40 00172A40 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 72B44 00172A44 00000000 */   nop
/* 72B48 00172A48 28264072 */  paddub     $4, $18, $0
/* 72B4C 00172A4C 0000258E */  lw         $5, 0x0($17)
/* 72B50 00172A50 14E0040C */  jal        TextureAnime__10CCharacterFi
/* 72B54 00172A54 00000000 */   nop
/* 72B58 00172A58 28264072 */  paddub     $4, $18, $0
/* 72B5C 00172A5C A000598E */  lw         $25, 0xA0($18)
/* 72B60 00172A60 AC00398F */  lw         $25, 0xAC($25)
/* 72B64 00172A64 09F82003 */  jalr       $25
/* 72B68 00172A68 00000000 */   nop
.L00172A6C:
/* 72B6C 00172A6C 01001026 */  addiu      $16, $16, 0x1
.L00172A70:
/* 72B70 00172A70 2A081702 */  slt        $at, $16, $23
/* 72B74 00172A74 03002010 */  beqz       $at, .L00172A84
/* 72B78 00172A78 00000000 */   nop
/* 72B7C 00172A7C CFFF6016 */  bnez       $19, .L001729BC
/* 72B80 00172A80 00000000 */   nop
.L00172A84:
/* 72B84 00172A84 A000BF7B */  lq         $31, 0xA0($sp)
/* 72B88 00172A88 9000BE7B */  lq         $fp, 0x90($sp)
/* 72B8C 00172A8C 8000B77B */  lq         $23, 0x80($sp)
/* 72B90 00172A90 7000B67B */  lq         $22, 0x70($sp)
/* 72B94 00172A94 6000B57B */  lq         $21, 0x60($sp)
/* 72B98 00172A98 5000B47B */  lq         $20, 0x50($sp)
/* 72B9C 00172A9C 4000B37B */  lq         $19, 0x40($sp)
/* 72BA0 00172AA0 3000B27B */  lq         $18, 0x30($sp)
/* 72BA4 00172AA4 2000B17B */  lq         $17, 0x20($sp)
/* 72BA8 00172AA8 1000B07B */  lq         $16, 0x10($sp)
/* 72BAC 00172AAC D001BD27 */  addiu      $sp, $sp, 0x1D0
/* 72BB0 00172AB0 0800E003 */  jr         $31
/* 72BB4 00172AB4 00000000 */   nop
/* 72BB8 00172AB8 00000000 */  nop
/* 72BBC 00172ABC 00000000 */  nop
