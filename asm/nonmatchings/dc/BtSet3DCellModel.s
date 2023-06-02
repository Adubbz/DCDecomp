.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtSet3DCellModel__FPfP8CTexturefiiiii
/* B28F0 001B27F0 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* B28F4 001B27F4 6000BF7F */  sq         $31, 0x60($sp)
/* B28F8 001B27F8 5000B57F */  sq         $21, 0x50($sp)
/* B28FC 001B27FC 4000B47F */  sq         $20, 0x40($sp)
/* B2900 001B2800 3000B37F */  sq         $19, 0x30($sp)
/* B2904 001B2804 2000B27F */  sq         $18, 0x20($sp)
/* B2908 001B2808 1000B17F */  sq         $17, 0x10($sp)
/* B290C 001B280C 0000B07F */  sq         $16, 0x0($sp)
/* B2910 001B2810 281E8070 */  paddub     $3, $4, $0
/* B2914 001B2814 28AEA070 */  paddub     $21, $5, $0
/* B2918 001B2818 28A6C070 */  paddub     $20, $6, $0
/* B291C 001B281C 289EE070 */  paddub     $19, $7, $0
/* B2920 001B2820 28960071 */  paddub     $18, $8, $0
/* B2924 001B2824 288E2071 */  paddub     $17, $9, $0
/* B2928 001B2828 28864071 */  paddub     $16, $10, $0
/* B292C 001B282C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* B2930 001B2830 0C0082AC */  sw         $2, 0xC($4)
/* B2934 001B2834 0040023C */  lui        $2, (0x40000000 >> 16)
/* B2938 001B2838 00008244 */  mtc1       $2, $f0
/* B293C 001B283C 00000000 */  nop
/* B2940 001B2840 43630046 */  div.s      $f13, $f12, $f0
/* B2944 001B2844 7000A427 */  addiu      $4, $sp, 0x70
/* B2948 001B2848 A000A527 */  addiu      $5, $sp, 0xA0
/* B294C 001B284C 28366070 */  paddub     $6, $3, $0
/* B2950 001B2850 283E0070 */  paddub     $7, $0, $0
/* B2954 001B2854 D0B9040C */  jal        MGRotTransPers3DSprite__FPiPiPfffi
/* B2958 001B2858 00000000 */   nop
/* B295C 001B285C 01000324 */  addiu      $3, $0, 0x1
/* B2960 001B2860 1B004314 */  bne        $2, $3, .L001B28D0
/* B2964 001B2864 00000000 */   nop
/* B2968 001B2868 A000A28F */  lw         $2, 0xA0($sp)
/* B296C 001B286C 8000A2AF */  sw         $2, 0x80($sp)
/* B2970 001B2870 7400A28F */  lw         $2, 0x74($sp)
/* B2974 001B2874 8400A2AF */  sw         $2, 0x84($sp)
/* B2978 001B2878 7800A28F */  lw         $2, 0x78($sp)
/* B297C 001B287C 8800A2AF */  sw         $2, 0x88($sp)
/* B2980 001B2880 7000A28F */  lw         $2, 0x70($sp)
/* B2984 001B2884 9000A2AF */  sw         $2, 0x90($sp)
/* B2988 001B2888 A400A28F */  lw         $2, 0xA4($sp)
/* B298C 001B288C 9400A2AF */  sw         $2, 0x94($sp)
/* B2990 001B2890 A800A28F */  lw         $2, 0xA8($sp)
/* B2994 001B2894 9800A2AF */  sw         $2, 0x98($sp)
/* B2998 001B2898 B000B4AF */  sw         $20, 0xB0($sp)
/* B299C 001B289C B400B3AF */  sw         $19, 0xB4($sp)
/* B29A0 001B28A0 B800B2AF */  sw         $18, 0xB8($sp)
/* B29A4 001B28A4 BC00B1AF */  sw         $17, 0xBC($sp)
/* B29A8 001B28A8 FF000B32 */  andi       $11, $16, 0xFF
/* B29AC 001B28AC D48B848F */  lw         $4, -0x742C($gp)
/* B29B0 001B28B0 282EA072 */  paddub     $5, $21, $0
/* B29B4 001B28B4 B000A627 */  addiu      $6, $sp, 0xB0
/* B29B8 001B28B8 7000A727 */  addiu      $7, $sp, 0x70
/* B29BC 001B28BC 8000A827 */  addiu      $8, $sp, 0x80
/* B29C0 001B28C0 9000A927 */  addiu      $9, $sp, 0x90
/* B29C4 001B28C4 A000AA27 */  addiu      $10, $sp, 0xA0
/* B29C8 001B28C8 1C75050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* B29CC 001B28CC 00000000 */   nop
.L001B28D0:
/* B29D0 001B28D0 6000BF7B */  lq         $31, 0x60($sp)
/* B29D4 001B28D4 5000B57B */  lq         $21, 0x50($sp)
/* B29D8 001B28D8 4000B47B */  lq         $20, 0x40($sp)
/* B29DC 001B28DC 3000B37B */  lq         $19, 0x30($sp)
/* B29E0 001B28E0 2000B27B */  lq         $18, 0x20($sp)
/* B29E4 001B28E4 1000B17B */  lq         $17, 0x10($sp)
/* B29E8 001B28E8 0000B07B */  lq         $16, 0x0($sp)
/* B29EC 001B28EC C000BD27 */  addiu      $sp, $sp, 0xC0
/* B29F0 001B28F0 0800E003 */  jr         $31
/* B29F4 001B28F4 00000000 */   nop
/* B29F8 001B28F8 00000000 */  nop
/* B29FC 001B28FC 00000000 */  nop
