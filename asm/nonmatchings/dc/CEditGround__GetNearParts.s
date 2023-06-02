.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNearParts__11CEditGroundFPP9CMapPartsiP7CBoxVu0P7CBoxVu0
/* A2B90 001A2A90 70FFBD27 */  addiu      $sp, $sp, -0x90
/* A2B94 001A2A94 8000BF7F */  sq         $31, 0x80($sp)
/* A2B98 001A2A98 7000B77F */  sq         $23, 0x70($sp)
/* A2B9C 001A2A9C 6000B67F */  sq         $22, 0x60($sp)
/* A2BA0 001A2AA0 5000B57F */  sq         $21, 0x50($sp)
/* A2BA4 001A2AA4 4000B47F */  sq         $20, 0x40($sp)
/* A2BA8 001A2AA8 3000B37F */  sq         $19, 0x30($sp)
/* A2BAC 001A2AAC 2000B27F */  sq         $18, 0x20($sp)
/* A2BB0 001A2AB0 1000B17F */  sq         $17, 0x10($sp)
/* A2BB4 001A2AB4 0000B07F */  sq         $16, 0x0($sp)
/* A2BB8 001A2AB8 28BE8070 */  paddub     $23, $4, $0
/* A2BBC 001A2ABC 28B6A070 */  paddub     $22, $5, $0
/* A2BC0 001A2AC0 28AEC070 */  paddub     $21, $6, $0
/* A2BC4 001A2AC4 28A6E070 */  paddub     $20, $7, $0
/* A2BC8 001A2AC8 289E0071 */  paddub     $19, $8, $0
/* A2BCC 001A2ACC 288E0070 */  paddub     $17, $0, $0
/* A2BD0 001A2AD0 3000F226 */  addiu      $18, $23, 0x30
/* A2BD4 001A2AD4 28860070 */  paddub     $16, $0, $0
/* A2BD8 001A2AD8 15000010 */  b          .L001A2B30
/* A2BDC 001A2ADC 00000000 */   nop
.L001A2AE0:
/* A2BE0 001A2AE0 E800428E */  lw         $2, 0xE8($18)
/* A2BE4 001A2AE4 10004004 */  bltz       $2, .L001A2B28
/* A2BE8 001A2AE8 00000000 */   nop
/* A2BEC 001A2AEC 28264072 */  paddub     $4, $18, $0
/* A2BF0 001A2AF0 282E8072 */  paddub     $5, $20, $0
/* A2BF4 001A2AF4 606B060C */  jal        CheckBox__9CMapPartsFP7CBoxVu0
/* A2BF8 001A2AF8 00000000 */   nop
/* A2BFC 001A2AFC 0A004010 */  beqz       $2, .L001A2B28
/* A2C00 001A2B00 00000000 */   nop
/* A2C04 001A2B04 2A103502 */  slt        $2, $17, $21
/* A2C08 001A2B08 04004014 */  bnez       $2, .L001A2B1C
/* A2C0C 001A2B0C 00000000 */   nop
/* A2C10 001A2B10 28162072 */  paddub     $2, $17, $0
/* A2C14 001A2B14 31000010 */  b          .L001A2BDC
/* A2C18 001A2B18 00000000 */   nop
.L001A2B1C:
/* A2C1C 001A2B1C 0000D2AE */  sw         $18, 0x0($22)
/* A2C20 001A2B20 0400D626 */  addiu      $22, $22, 0x4
/* A2C24 001A2B24 01003126 */  addiu      $17, $17, 0x1
.L001A2B28:
/* A2C28 001A2B28 01001026 */  addiu      $16, $16, 0x1
/* A2C2C 001A2B2C A0025226 */  addiu      $18, $18, 0x2A0
.L001A2B30:
/* A2C30 001A2B30 8000022A */  slti       $2, $16, 0x80
/* A2C34 001A2B34 EAFF4014 */  bnez       $2, .L001A2AE0
/* A2C38 001A2B38 00000000 */   nop
/* A2C3C 001A2B3C 02006016 */  bnez       $19, .L001A2B48
/* A2C40 001A2B40 00000000 */   nop
/* A2C44 001A2B44 289E8072 */  paddub     $19, $20, $0
.L001A2B48:
/* A2C48 001A2B48 28860070 */  paddub     $16, $0, $0
/* A2C4C 001A2B4C 1F000010 */  b          .L001A2BCC
/* A2C50 001A2B50 00000000 */   nop
.L001A2B54:
/* A2C54 001A2B54 C0101000 */  sll        $2, $16, 3
/* A2C58 001A2B58 23185000 */  subu       $3, $2, $16
/* A2C5C 001A2B5C 80100300 */  sll        $2, $3, 2
/* A2C60 001A2B60 23104300 */  subu       $2, $2, $3
/* A2C64 001A2B64 40110200 */  sll        $2, $2, 5
/* A2C68 001A2B68 21185700 */  addu       $3, $2, $23
/* A2C6C 001A2B6C 0100013C */  lui        $at, (0x16028 >> 16)
/* A2C70 001A2B70 21086100 */  addu       $at, $3, $at
/* A2C74 001A2B74 2860228C */  lw         $2, (0x16028 & 0xFFFF)($at)
/* A2C78 001A2B78 13004004 */  bltz       $2, .L001A2BC8
/* A2C7C 001A2B7C 00000000 */   nop
/* A2C80 001A2B80 0100013C */  lui        $at, (0x15F40 >> 16)
/* A2C84 001A2B84 405F2134 */  ori        $at, $at, (0x15F40 & 0xFFFF)
/* A2C88 001A2B88 21906100 */  addu       $18, $3, $at
/* A2C8C 001A2B8C 28264072 */  paddub     $4, $18, $0
/* A2C90 001A2B90 282E6072 */  paddub     $5, $19, $0
/* A2C94 001A2B94 B06B060C */  jal        CheckBox2__9CMapPartsFP7CBoxVu0
/* A2C98 001A2B98 00000000 */   nop
/* A2C9C 001A2B9C 0A004010 */  beqz       $2, .L001A2BC8
/* A2CA0 001A2BA0 00000000 */   nop
/* A2CA4 001A2BA4 2A103502 */  slt        $2, $17, $21
/* A2CA8 001A2BA8 04004014 */  bnez       $2, .L001A2BBC
/* A2CAC 001A2BAC 00000000 */   nop
/* A2CB0 001A2BB0 28162072 */  paddub     $2, $17, $0
/* A2CB4 001A2BB4 09000010 */  b          .L001A2BDC
/* A2CB8 001A2BB8 00000000 */   nop
.L001A2BBC:
/* A2CBC 001A2BBC 0000D2AE */  sw         $18, 0x0($22)
/* A2CC0 001A2BC0 0400D626 */  addiu      $22, $22, 0x4
/* A2CC4 001A2BC4 01003126 */  addiu      $17, $17, 0x1
.L001A2BC8:
/* A2CC8 001A2BC8 01001026 */  addiu      $16, $16, 0x1
.L001A2BCC:
/* A2CCC 001A2BCC 4000022A */  slti       $2, $16, 0x40
/* A2CD0 001A2BD0 E0FF4014 */  bnez       $2, .L001A2B54
/* A2CD4 001A2BD4 00000000 */   nop
/* A2CD8 001A2BD8 28162072 */  paddub     $2, $17, $0
.L001A2BDC:
/* A2CDC 001A2BDC 8000BF7B */  lq         $31, 0x80($sp)
/* A2CE0 001A2BE0 7000B77B */  lq         $23, 0x70($sp)
/* A2CE4 001A2BE4 6000B67B */  lq         $22, 0x60($sp)
/* A2CE8 001A2BE8 5000B57B */  lq         $21, 0x50($sp)
/* A2CEC 001A2BEC 4000B47B */  lq         $20, 0x40($sp)
/* A2CF0 001A2BF0 3000B37B */  lq         $19, 0x30($sp)
/* A2CF4 001A2BF4 2000B27B */  lq         $18, 0x20($sp)
/* A2CF8 001A2BF8 1000B17B */  lq         $17, 0x10($sp)
/* A2CFC 001A2BFC 0000B07B */  lq         $16, 0x0($sp)
/* A2D00 001A2C00 9000BD27 */  addiu      $sp, $sp, 0x90
/* A2D04 001A2C04 0800E003 */  jr         $31
/* A2D08 001A2C08 00000000 */   nop
/* A2D0C 001A2C0C 00000000 */  nop
