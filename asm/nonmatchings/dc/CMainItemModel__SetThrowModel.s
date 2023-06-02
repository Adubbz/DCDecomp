.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetThrowModel__14CMainItemModelFiPfPf
/* D4AC0 001D49C0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* D4AC4 001D49C4 6000BF7F */  sq         $31, 0x60($sp)
/* D4AC8 001D49C8 5000B57F */  sq         $21, 0x50($sp)
/* D4ACC 001D49CC 4000B47F */  sq         $20, 0x40($sp)
/* D4AD0 001D49D0 3000B37F */  sq         $19, 0x30($sp)
/* D4AD4 001D49D4 2000B27F */  sq         $18, 0x20($sp)
/* D4AD8 001D49D8 1000B17F */  sq         $17, 0x10($sp)
/* D4ADC 001D49DC 0000B07F */  sq         $16, 0x0($sp)
/* D4AE0 001D49E0 28AE8070 */  paddub     $21, $4, $0
/* D4AE4 001D49E4 28A6A070 */  paddub     $20, $5, $0
/* D4AE8 001D49E8 289EC070 */  paddub     $19, $6, $0
/* D4AEC 001D49EC 2896E070 */  paddub     $18, $7, $0
/* D4AF0 001D49F0 6451070C */  jal        GetFreeModelNo__14CMainItemModelFv
/* D4AF4 001D49F4 00000000 */   nop
/* D4AF8 001D49F8 28864070 */  paddub     $16, $2, $0
/* D4AFC 001D49FC 02000424 */  addiu      $4, $0, 0x2
/* D4B00 001D4A00 80880200 */  sll        $17, $2, 2
/* D4B04 001D4A04 21183502 */  addu       $3, $17, $21
/* D4B08 001D4A08 480064AC */  sw         $4, 0x48($3)
/* D4B0C 001D4A0C 00110200 */  sll        $2, $2, 4
/* D4B10 001D4A10 2110A202 */  addu       $2, $21, $2
/* D4B14 001D4A14 D0264424 */  addiu      $4, $2, 0x26D0
/* D4B18 001D4A18 282E4072 */  paddub     $5, $18, $0
/* D4B1C 001D4A1C 0C86040C */  jal        sceVu0CopyVector
/* D4B20 001D4A20 00000000 */   nop
/* D4B24 001D4A24 C0101000 */  sll        $2, $16, 3
/* D4B28 001D4A28 21105000 */  addu       $2, $2, $16
/* D4B2C 001D4A2C 40100200 */  sll        $2, $2, 1
/* D4B30 001D4A30 21105000 */  addu       $2, $2, $16
/* D4B34 001D4A34 40110200 */  sll        $2, $2, 5
/* D4B38 001D4A38 2110A202 */  addu       $2, $21, $2
/* D4B3C 001D4A3C D0005224 */  addiu      $18, $2, 0xD0
/* D4B40 001D4A40 28264072 */  paddub     $4, $18, $0
/* D4B44 001D4A44 282E6072 */  paddub     $5, $19, $0
/* D4B48 001D4A48 B89F040C */  jal        SetPosition__6CFrameFPf
/* D4B4C 001D4A4C 00000000 */   nop
/* D4B50 001D4A50 00688044 */  mtc1       $0, $f13
/* D4B54 001D4A54 00000000 */  nop
/* D4B58 001D4A58 866B0046 */  mov.s      $f14, $f13
/* D4B5C 001D4A5C 28264072 */  paddub     $4, $18, $0
/* D4B60 001D4A60 C8808CC7 */  lwc1       $f12, -0x7F38($gp)
/* D4B64 001D4A64 70A3040C */  jal        SetRotation__6CFrameFfff
/* D4B68 001D4A68 00000000 */   nop
/* D4B6C 001D4A6C 21203502 */  addu       $4, $17, $21
/* D4B70 001D4A70 D02780AC */  sw         $0, 0x27D0($4)
/* D4B74 001D4A74 80101400 */  sll        $2, $20, 2
/* D4B78 001D4A78 21185500 */  addu       $3, $2, $21
/* D4B7C 001D4A7C 8800628C */  lw         $2, 0x88($3)
/* D4B80 001D4A80 880082AC */  sw         $2, 0x88($4)
/* D4B84 001D4A84 8800628C */  lw         $2, 0x88($3)
/* D4B88 001D4A88 80100200 */  sll        $2, $2, 2
/* D4B8C 001D4A8C 21185500 */  addu       $3, $2, $21
/* D4B90 001D4A90 3000628C */  lw         $2, 0x30($3)
/* D4B94 001D4A94 01004224 */  addiu      $2, $2, 0x1
/* D4B98 001D4A98 300062AC */  sw         $2, 0x30($3)
/* D4B9C 001D4A9C 28160072 */  paddub     $2, $16, $0
/* D4BA0 001D4AA0 6000BF7B */  lq         $31, 0x60($sp)
/* D4BA4 001D4AA4 5000B57B */  lq         $21, 0x50($sp)
/* D4BA8 001D4AA8 4000B47B */  lq         $20, 0x40($sp)
/* D4BAC 001D4AAC 3000B37B */  lq         $19, 0x30($sp)
/* D4BB0 001D4AB0 2000B27B */  lq         $18, 0x20($sp)
/* D4BB4 001D4AB4 1000B17B */  lq         $17, 0x10($sp)
/* D4BB8 001D4AB8 0000B07B */  lq         $16, 0x0($sp)
/* D4BBC 001D4ABC 7000BD27 */  addiu      $sp, $sp, 0x70
/* D4BC0 001D4AC0 0800E003 */  jr         $31
/* D4BC4 001D4AC4 00000000 */   nop
/* D4BC8 001D4AC8 00000000 */  nop
/* D4BCC 001D4ACC 00000000 */  nop
