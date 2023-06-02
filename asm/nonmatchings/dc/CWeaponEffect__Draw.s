.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__13CWeaponEffectFv
/* D6A40 001D6940 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* D6A44 001D6944 6000BF7F */  sq         $31, 0x60($sp)
/* D6A48 001D6948 5000B47F */  sq         $20, 0x50($sp)
/* D6A4C 001D694C 4000B37F */  sq         $19, 0x40($sp)
/* D6A50 001D6950 3000B27F */  sq         $18, 0x30($sp)
/* D6A54 001D6954 2000B17F */  sq         $17, 0x20($sp)
/* D6A58 001D6958 1000B07F */  sq         $16, 0x10($sp)
/* D6A5C 001D695C 28A68070 */  paddub     $20, $4, $0
/* D6A60 001D6960 0000838C */  lw         $3, 0x0($4)
/* D6A64 001D6964 04006010 */  beqz       $3, .L001D6978
/* D6A68 001D6968 00000000 */   nop
/* D6A6C 001D696C 0400838E */  lw         $3, 0x4($20)
/* D6A70 001D6970 03006014 */  bnez       $3, .L001D6980
/* D6A74 001D6974 00000000 */   nop
.L001D6978:
/* D6A78 001D6978 8E000010 */  b          .L001D6BB4
/* D6A7C 001D697C 00000000 */   nop
.L001D6980:
/* D6A80 001D6980 B000A427 */  addiu      $4, $sp, 0xB0
/* D6A84 001D6984 F88B82DF */  ld         $2, -0x7408($gp)
/* D6A88 001D6988 000082FC */  sd         $2, 0x0($4)
/* D6A8C 001D698C B000A393 */  lbu        $3, 0xB0($sp)
/* D6A90 001D6990 03000630 */  andi       $6, $0, 0x3
/* D6A94 001D6994 FCFF0224 */  addiu      $2, $0, -0x4
/* D6A98 001D6998 24106200 */  and        $2, $3, $2
/* D6A9C 001D699C 25104600 */  or         $2, $2, $6
/* D6AA0 001D69A0 B000A2A3 */  sb         $2, 0xB0($sp)
/* D6AA4 001D69A4 B000A593 */  lbu        $5, 0xB0($sp)
/* D6AA8 001D69A8 08000364 */  daddiu     $3, $0, 0x8
/* D6AAC 001D69AC F3FF0224 */  addiu      $2, $0, -0xD
/* D6AB0 001D69B0 2410A200 */  and        $2, $5, $2
/* D6AB4 001D69B4 25104300 */  or         $2, $2, $3
/* D6AB8 001D69B8 B000A2A3 */  sb         $2, 0xB0($sp)
/* D6ABC 001D69BC B000A593 */  lbu        $5, 0xB0($sp)
/* D6AC0 001D69C0 00190600 */  sll        $3, $6, 4
/* D6AC4 001D69C4 CFFF0224 */  addiu      $2, $0, -0x31
/* D6AC8 001D69C8 2410A200 */  and        $2, $5, $2
/* D6ACC 001D69CC 25104300 */  or         $2, $2, $3
/* D6AD0 001D69D0 B000A2A3 */  sb         $2, 0xB0($sp)
/* D6AD4 001D69D4 B000A593 */  lbu        $5, 0xB0($sp)
/* D6AD8 001D69D8 40000364 */  daddiu     $3, $0, 0x40
/* D6ADC 001D69DC 3FFF0224 */  addiu      $2, $0, -0xC1
/* D6AE0 001D69E0 2410A200 */  and        $2, $5, $2
/* D6AE4 001D69E4 25104300 */  or         $2, $2, $3
/* D6AE8 001D69E8 B000A2A3 */  sb         $2, 0xB0($sp)
/* D6AEC 001D69EC E4BB040C */  jal        MGSetGsALPHA__FP10sceGsAlpha
/* D6AF0 001D69F0 00000000 */   nop
/* D6AF4 001D69F4 B800A427 */  addiu      $4, $sp, 0xB8
/* D6AF8 001D69F8 F08B82DF */  ld         $2, -0x7410($gp)
/* D6AFC 001D69FC 000082FC */  sd         $2, 0x0($4)
/* D6B00 001D6A00 BC00A593 */  lbu        $5, 0xBC($sp)
/* D6B04 001D6A04 01000364 */  daddiu     $3, $0, 0x1
/* D6B08 001D6A08 FEFF0224 */  addiu      $2, $0, -0x2
/* D6B0C 001D6A0C 2410A200 */  and        $2, $5, $2
/* D6B10 001D6A10 25104300 */  or         $2, $2, $3
/* D6B14 001D6A14 BC00A2A3 */  sb         $2, 0xBC($sp)
/* D6B18 001D6A18 B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* D6B1C 001D6A1C 00000000 */   nop
/* D6B20 001D6A20 288E0070 */  paddub     $17, $0, $0
/* D6B24 001D6A24 5A000010 */  b          .L001D6B90
/* D6B28 001D6A28 00000000 */   nop
.L001D6A2C:
/* D6B2C 001D6A2C 04002016 */  bnez       $17, .L001D6A40
/* D6B30 001D6A30 00000000 */   nop
/* D6B34 001D6A34 1F001024 */  addiu      $16, $0, 0x1F
/* D6B38 001D6A38 02000010 */  b          .L001D6A44
/* D6B3C 001D6A3C 00000000 */   nop
.L001D6A40:
/* D6B40 001D6A40 FFFF3026 */  addiu      $16, $17, -0x1
.L001D6A44:
/* D6B44 001D6A44 80981100 */  sll        $19, $17, 2
/* D6B48 001D6A48 21107402 */  addu       $2, $19, $20
/* D6B4C 001D6A4C 9004428C */  lw         $2, 0x490($2)
/* D6B50 001D6A50 4E004010 */  beqz       $2, .L001D6B8C
/* D6B54 001D6A54 00000000 */   nop
/* D6B58 001D6A58 80901000 */  sll        $18, $16, 2
/* D6B5C 001D6A5C 21105402 */  addu       $2, $18, $20
/* D6B60 001D6A60 9004428C */  lw         $2, 0x490($2)
/* D6B64 001D6A64 49004010 */  beqz       $2, .L001D6B8C
/* D6B68 001D6A68 00000000 */   nop
/* D6B6C 001D6A6C 40111000 */  sll        $2, $16, 5
/* D6B70 001D6A70 21108202 */  addu       $2, $20, $2
/* D6B74 001D6A74 7000A427 */  addiu      $4, $sp, 0x70
/* D6B78 001D6A78 10004524 */  addiu      $5, $2, 0x10
/* D6B7C 001D6A7C 28360070 */  paddub     $6, $0, $0
/* D6B80 001D6A80 A4B8040C */  jal        MGRotTransPers__FPiPfi
/* D6B84 001D6A84 00000000 */   nop
/* D6B88 001D6A88 40004010 */  beqz       $2, .L001D6B8C
/* D6B8C 001D6A8C 00000000 */   nop
/* D6B90 001D6A90 40101000 */  sll        $2, $16, 1
/* D6B94 001D6A94 01004224 */  addiu      $2, $2, 0x1
/* D6B98 001D6A98 00110200 */  sll        $2, $2, 4
/* D6B9C 001D6A9C 21108202 */  addu       $2, $20, $2
/* D6BA0 001D6AA0 8000A427 */  addiu      $4, $sp, 0x80
/* D6BA4 001D6AA4 10004524 */  addiu      $5, $2, 0x10
/* D6BA8 001D6AA8 28360070 */  paddub     $6, $0, $0
/* D6BAC 001D6AAC A4B8040C */  jal        MGRotTransPers__FPiPfi
/* D6BB0 001D6AB0 00000000 */   nop
/* D6BB4 001D6AB4 35004010 */  beqz       $2, .L001D6B8C
/* D6BB8 001D6AB8 00000000 */   nop
/* D6BBC 001D6ABC 40111100 */  sll        $2, $17, 5
/* D6BC0 001D6AC0 21108202 */  addu       $2, $20, $2
/* D6BC4 001D6AC4 9000A427 */  addiu      $4, $sp, 0x90
/* D6BC8 001D6AC8 10004524 */  addiu      $5, $2, 0x10
/* D6BCC 001D6ACC 28360070 */  paddub     $6, $0, $0
/* D6BD0 001D6AD0 A4B8040C */  jal        MGRotTransPers__FPiPfi
/* D6BD4 001D6AD4 00000000 */   nop
/* D6BD8 001D6AD8 2C004010 */  beqz       $2, .L001D6B8C
/* D6BDC 001D6ADC 00000000 */   nop
/* D6BE0 001D6AE0 40101100 */  sll        $2, $17, 1
/* D6BE4 001D6AE4 01004224 */  addiu      $2, $2, 0x1
/* D6BE8 001D6AE8 00110200 */  sll        $2, $2, 4
/* D6BEC 001D6AEC 21108202 */  addu       $2, $20, $2
/* D6BF0 001D6AF0 A000A427 */  addiu      $4, $sp, 0xA0
/* D6BF4 001D6AF4 10004524 */  addiu      $5, $2, 0x10
/* D6BF8 001D6AF8 28360070 */  paddub     $6, $0, $0
/* D6BFC 001D6AFC A4B8040C */  jal        MGRotTransPers__FPiPfi
/* D6C00 001D6B00 00000000 */   nop
/* D6C04 001D6B04 21004010 */  beqz       $2, .L001D6B8C
/* D6C08 001D6B08 00000000 */   nop
/* D6C0C 001D6B0C 21105402 */  addu       $2, $18, $20
/* D6C10 001D6B10 10045024 */  addiu      $16, $2, 0x410
/* D6C14 001D6B14 10044CC4 */  lwc1       $f12, 0x410($2)
/* D6C18 001D6B18 5044040C */  jal        fptoui
/* D6C1C 001D6B1C 00000000 */   nop
/* D6C20 001D6B20 130582A2 */  sb         $2, 0x513($20)
/* D6C24 001D6B24 00000CC6 */  lwc1       $f12, 0x0($16)
/* D6C28 001D6B28 5044040C */  jal        fptoui
/* D6C2C 001D6B2C 00000000 */   nop
/* D6C30 001D6B30 170582A2 */  sb         $2, 0x517($20)
/* D6C34 001D6B34 21107402 */  addu       $2, $19, $20
/* D6C38 001D6B38 10045024 */  addiu      $16, $2, 0x410
/* D6C3C 001D6B3C 10044CC4 */  lwc1       $f12, 0x410($2)
/* D6C40 001D6B40 5044040C */  jal        fptoui
/* D6C44 001D6B44 00000000 */   nop
/* D6C48 001D6B48 1B0582A2 */  sb         $2, 0x51B($20)
/* D6C4C 001D6B4C 00000CC6 */  lwc1       $f12, 0x0($16)
/* D6C50 001D6B50 5044040C */  jal        fptoui
/* D6C54 001D6B54 00000000 */   nop
/* D6C58 001D6B58 1F0582A2 */  sb         $2, 0x51F($20)
/* D6C5C 001D6B5C 1C058226 */  addiu      $2, $20, 0x51C
/* D6C60 001D6B60 0000A2FF */  sd         $2, 0x0($sp)
/* D6C64 001D6B64 D48B848F */  lw         $4, -0x742C($gp)
/* D6C68 001D6B68 7000A527 */  addiu      $5, $sp, 0x70
/* D6C6C 001D6B6C 9000A627 */  addiu      $6, $sp, 0x90
/* D6C70 001D6B70 8000A727 */  addiu      $7, $sp, 0x80
/* D6C74 001D6B74 A000A827 */  addiu      $8, $sp, 0xA0
/* D6C78 001D6B78 10058926 */  addiu      $9, $20, 0x510
/* D6C7C 001D6B7C 18058A26 */  addiu      $10, $20, 0x518
/* D6C80 001D6B80 14058B26 */  addiu      $11, $20, 0x514
/* D6C84 001D6B84 6C74050C */  jal        set3DColSprite__FP13sceVif1PacketPiPiPiPiP6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* D6C88 001D6B88 00000000 */   nop
.L001D6B8C:
/* D6C8C 001D6B8C 01003126 */  addiu      $17, $17, 0x1
.L001D6B90:
/* D6C90 001D6B90 2000222A */  slti       $2, $17, 0x20
/* D6C94 001D6B94 A5FF4014 */  bnez       $2, .L001D6A2C
/* D6C98 001D6B98 00000000 */   nop
/* D6C9C 001D6B9C 28260070 */  paddub     $4, $0, $0
/* D6CA0 001D6BA0 E4BB040C */  jal        MGSetGsALPHA__FP10sceGsAlpha
/* D6CA4 001D6BA4 00000000 */   nop
/* D6CA8 001D6BA8 28260070 */  paddub     $4, $0, $0
/* D6CAC 001D6BAC B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* D6CB0 001D6BB0 00000000 */   nop
.L001D6BB4:
/* D6CB4 001D6BB4 6000BF7B */  lq         $31, 0x60($sp)
/* D6CB8 001D6BB8 5000B47B */  lq         $20, 0x50($sp)
/* D6CBC 001D6BBC 4000B37B */  lq         $19, 0x40($sp)
/* D6CC0 001D6BC0 3000B27B */  lq         $18, 0x30($sp)
/* D6CC4 001D6BC4 2000B17B */  lq         $17, 0x20($sp)
/* D6CC8 001D6BC8 1000B07B */  lq         $16, 0x10($sp)
/* D6CCC 001D6BCC C000BD27 */  addiu      $sp, $sp, 0xC0
/* D6CD0 001D6BD0 0800E003 */  jr         $31
/* D6CD4 001D6BD4 00000000 */   nop
/* D6CD8 001D6BD8 00000000 */  nop
/* D6CDC 001D6BDC 00000000 */  nop
