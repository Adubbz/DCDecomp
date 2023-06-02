.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceGifPkRefLoadImage
/* 20B48 00120A48 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* 20B4C 00120A4C 2A00023C */  lui        $2, %hi(D_00298C88)
/* 20B50 00120A50 A000BEFF */  sd         $fp, 0xA0($sp)
/* 20B54 00120A54 888C4324 */  addiu      $3, $2, %lo(D_00298C88)
/* 20B58 00120A58 2DF08000 */  daddu      $fp, $4, $0
/* 20B5C 00120A5C 9000B7FF */  sd         $23, 0x90($sp)
/* 20B60 00120A60 8000B6FF */  sd         $22, 0x80($sp)
/* 20B64 00120A64 2DB82001 */  daddu      $23, $9, $0
/* 20B68 00120A68 7000B5FF */  sd         $21, 0x70($sp)
/* 20B6C 00120A6C 2DB04001 */  daddu      $22, $10, $0
/* 20B70 00120A70 6000B4FF */  sd         $20, 0x60($sp)
/* 20B74 00120A74 2DA80001 */  daddu      $21, $8, $0
/* 20B78 00120A78 5000B3FF */  sd         $19, 0x50($sp)
/* 20B7C 00120A7C 2DA06001 */  daddu      $20, $11, $0
/* 20B80 00120A80 4000B2FF */  sd         $18, 0x40($sp)
/* 20B84 00120A84 FF00D330 */  andi       $19, $6, 0xFF
/* 20B88 00120A88 3000B1FF */  sd         $17, 0x30($sp)
/* 20B8C 00120A8C FFFFF230 */  andi       $18, $7, 0xFFFF
/* 20B90 00120A90 2000B0FF */  sd         $16, 0x20($sp)
/* 20B94 00120A94 2D300000 */  daddu      $6, $0, $0
/* 20B98 00120A98 B000BFFF */  sd         $31, 0xB0($sp)
/* 20B9C 00120A9C FFFFB030 */  andi       $16, $5, 0xFFFF
/* 20BA0 00120AA0 888C44DC */  ld         $4, -0x7378($2)
/* 20BA4 00120AA4 2D280000 */  daddu      $5, $0, $0
/* 20BA8 00120AA8 08006CDC */  ld         $12, 0x8($3)
/* 20BAC 00120AAC 2D380000 */  daddu      $7, $0, $0
/* 20BB0 00120AB0 0000A4FF */  sd         $4, 0x0($sp)
/* 20BB4 00120AB4 C000B18F */  lw         $17, 0xC0($sp)
/* 20BB8 00120AB8 2D20C003 */  daddu      $4, $fp, $0
/* 20BBC 00120ABC F281040C */  jal        sceGifPkCnt
/* 20BC0 00120AC0 0800ACFF */   sd        $12, 0x8($sp)
/* 20BC4 00120AC4 0000A57B */  lq         $5, 0x0($sp)
/* 20BC8 00120AC8 5A82040C */  jal        sceGifPkOpenGifTag
/* 20BCC 00120ACC 2D20C003 */   daddu     $4, $fp, $0
/* 20BD0 00120AD0 3C801000 */  dsll32     $16, $16, 0
/* 20BD4 00120AD4 3C941200 */  dsll32     $18, $18, 16
/* 20BD8 00120AD8 25801202 */  or         $16, $16, $18
/* 20BDC 00120ADC 3C9E1300 */  dsll32     $19, $19, 24
/* 20BE0 00120AE0 25301302 */  or         $6, $16, $19
/* 20BE4 00120AE4 2D20C003 */  daddu      $4, $fp, $0
/* 20BE8 00120AE8 8882040C */  jal        sceGifPkAddGsAD
/* 20BEC 00120AEC 50000524 */   addiu     $5, $0, 0x50
/* 20BF0 00120AF0 3CB01600 */  dsll32     $22, $22, 0
/* 20BF4 00120AF4 3CA41400 */  dsll32     $20, $20, 16
/* 20BF8 00120AF8 2530D402 */  or         $6, $22, $20
/* 20BFC 00120AFC 2D20C003 */  daddu      $4, $fp, $0
/* 20C00 00120B00 8882040C */  jal        sceGifPkAddGsAD
/* 20C04 00120B04 51000524 */   addiu     $5, $0, 0x51
/* 20C08 00120B08 C800A28F */  lw         $2, 0xC8($sp)
/* 20C0C 00120B0C 3C881100 */  dsll32     $17, $17, 0
/* 20C10 00120B10 3E881100 */  dsrl32     $17, $17, 0
/* 20C14 00120B14 2D20C003 */  daddu      $4, $fp, $0
/* 20C18 00120B18 3C100200 */  dsll32     $2, $2, 0
/* 20C1C 00120B1C 52000524 */  addiu      $5, $0, 0x52
/* 20C20 00120B20 1000A2FF */  sd         $2, 0x10($sp)
/* 20C24 00120B24 8882040C */  jal        sceGifPkAddGsAD
/* 20C28 00120B28 25302202 */   or        $6, $17, $2
/* 20C2C 00120B2C 2D20C003 */  daddu      $4, $fp, $0
/* 20C30 00120B30 53000524 */  addiu      $5, $0, 0x53
/* 20C34 00120B34 8882040C */  jal        sceGifPkAddGsAD
/* 20C38 00120B38 2D300000 */   daddu     $6, $0, $0
/* 20C3C 00120B3C 6082040C */  jal        sceGifPkCloseGifTag
/* 20C40 00120B40 2D20C003 */   daddu     $4, $fp, $0
/* 20C44 00120B44 2400E012 */  beqz       $23, .L00120BD8
/* 20C48 00120B48 FF7F1124 */   addiu     $17, $0, 0x7FFF
/* 20C4C 00120B4C 0008133C */  lui        $19, (0x8000000 >> 16)
/* 20C50 00120B50 3C981300 */  dsll32     $19, $19, 0
/* 20C54 00120B54 00807336 */  ori        $19, $19, 0x8000
/* 20C58 00120B58 00801234 */  ori        $18, $0, 0x8000
/* 20C5C 00120B5C 3C931200 */  dsll32     $18, $18, 12
.L00120B60:
/* 20C60 00120B60 2B103702 */  sltu       $2, $17, $23
/* 20C64 00120B64 2D802002 */  daddu      $16, $17, $0
/* 20C68 00120B68 0A80E202 */  movz       $16, $23, $2
/* 20C6C 00120B6C 2D20C003 */  daddu      $4, $fp, $0
/* 20C70 00120B70 2D280000 */  daddu      $5, $0, $0
/* 20C74 00120B74 2D300000 */  daddu      $6, $0, $0
/* 20C78 00120B78 F281040C */  jal        sceGifPkCnt
/* 20C7C 00120B7C 2D380000 */   daddu     $7, $0, $0
/* 20C80 00120B80 2D20C003 */  daddu      $4, $fp, $0
/* 20C84 00120B84 5482040C */  jal        sceGifPkReserve
/* 20C88 00120B88 04000524 */   addiu     $5, $0, 0x4
/* 20C8C 00120B8C 3C181000 */  dsll32     $3, $16, 0
/* 20C90 00120B90 26281702 */  xor        $5, $16, $23
/* 20C94 00120B94 3E180300 */  dsrl32     $3, $3, 0
/* 20C98 00120B98 2D300002 */  daddu      $6, $16, $0
/* 20C9C 00120B9C 25207300 */  or         $4, $3, $19
/* 20CA0 00120BA0 080040FC */  sd         $0, 0x8($2)
/* 20CA4 00120BA4 25187200 */  or         $3, $3, $18
/* 20CA8 00120BA8 2D380000 */  daddu      $7, $0, $0
/* 20CAC 00120BAC 0A188500 */  movz       $3, $4, $5
/* 20CB0 00120BB0 2D400000 */  daddu      $8, $0, $0
/* 20CB4 00120BB4 2D28A002 */  daddu      $5, $21, $0
/* 20CB8 00120BB8 000043FC */  sd         $3, 0x0($2)
/* 20CBC 00120BBC 2D20C003 */  daddu      $4, $fp, $0
/* 20CC0 00120BC0 2D480000 */  daddu      $9, $0, $0
/* 20CC4 00120BC4 1082040C */  jal        sceGifPkRef
/* 20CC8 00120BC8 23B8F002 */   subu      $23, $23, $16
/* 20CCC 00120BCC 00811000 */  sll        $16, $16, 4
/* 20CD0 00120BD0 E3FFE016 */  bnez       $23, .L00120B60
/* 20CD4 00120BD4 21A8B002 */   addu      $21, $21, $16
.L00120BD8:
/* 20CD8 00120BD8 B000BFDF */  ld         $31, 0xB0($sp)
/* 20CDC 00120BDC A000BEDF */  ld         $fp, 0xA0($sp)
/* 20CE0 00120BE0 9000B7DF */  ld         $23, 0x90($sp)
/* 20CE4 00120BE4 8000B6DF */  ld         $22, 0x80($sp)
/* 20CE8 00120BE8 7000B5DF */  ld         $21, 0x70($sp)
/* 20CEC 00120BEC 6000B4DF */  ld         $20, 0x60($sp)
/* 20CF0 00120BF0 5000B3DF */  ld         $19, 0x50($sp)
/* 20CF4 00120BF4 4000B2DF */  ld         $18, 0x40($sp)
/* 20CF8 00120BF8 3000B1DF */  ld         $17, 0x30($sp)
/* 20CFC 00120BFC 2000B0DF */  ld         $16, 0x20($sp)
/* 20D00 00120C00 0800E003 */  jr         $31
/* 20D04 00120C04 C000BD27 */   addiu     $sp, $sp, 0xC0
