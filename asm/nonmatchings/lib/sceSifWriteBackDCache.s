.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel sceSifWriteBackDCache
/* 16C98 00116B98 FFFF193C */  lui        $25, (0xFFFFFFC0 >> 16)
/* 16C9C 00116B9C C0FF3937 */  ori        $25, $25, (0xFFFFFFC0 & 0xFFFF)
/* 16CA0 00116BA0 2600A018 */  blez       $5, .L00116C3C
/* 16CA4 00116BA4 21508500 */   addu      $10, $4, $5
/* 16CA8 00116BA8 24409900 */  and        $8, $4, $25
/* 16CAC 00116BAC FFFF4A25 */  addiu      $10, $10, -0x1
/* 16CB0 00116BB0 24485901 */  and        $9, $10, $25
/* 16CB4 00116BB4 23502801 */  subu       $10, $9, $8
/* 16CB8 00116BB8 82590A00 */  srl        $11, $10, 6
/* 16CBC 00116BBC 01006B25 */  addiu      $11, $11, 0x1
/* 16CC0 00116BC0 07006931 */  andi       $9, $11, 0x7
/* 16CC4 00116BC4 08002011 */  beqz       $9, .L00116BE8
/* 16CC8 00116BC8 C2500B00 */   srl       $10, $11, 3
.L00116BCC:
/* 16CCC 00116BCC 0F000000 */  sync
/* 16CD0 00116BD0 000018BD */  cache      0x18, 0x0($8) # handwritten instruction
/* 16CD4 00116BD4 0F000000 */  sync
/* 16CD8 00116BD8 FFFF2925 */  addiu      $9, $9, -0x1
/* 16CDC 00116BDC 00000000 */  nop
/* 16CE0 00116BE0 FAFF201D */  bgtz       $9, .L00116BCC
/* 16CE4 00116BE4 40000825 */   addiu     $8, $8, 0x40
.L00116BE8:
/* 16CE8 00116BE8 14004011 */  beqz       $10, .L00116C3C
.L00116BEC:
/* 16CEC 00116BEC FFFF4A25 */   addiu     $10, $10, -0x1
/* 16CF0 00116BF0 0F000000 */  sync
/* 16CF4 00116BF4 000018BD */  cache      0x18, 0x0($8) # handwritten instruction
/* 16CF8 00116BF8 0F000000 */  sync
/* 16CFC 00116BFC 400018BD */  cache      0x18, 0x40($8) # handwritten instruction
/* 16D00 00116C00 0F000000 */  sync
/* 16D04 00116C04 800018BD */  cache      0x18, 0x80($8) # handwritten instruction
/* 16D08 00116C08 0F000000 */  sync
/* 16D0C 00116C0C C00018BD */  cache      0x18, 0xC0($8) # handwritten instruction
/* 16D10 00116C10 0F000000 */  sync
/* 16D14 00116C14 000118BD */  cache      0x18, 0x100($8) # handwritten instruction
/* 16D18 00116C18 0F000000 */  sync
/* 16D1C 00116C1C 400118BD */  cache      0x18, 0x140($8) # handwritten instruction
/* 16D20 00116C20 0F000000 */  sync
/* 16D24 00116C24 800118BD */  cache      0x18, 0x180($8) # handwritten instruction
/* 16D28 00116C28 0F000000 */  sync
/* 16D2C 00116C2C C00118BD */  cache      0x18, 0x1C0($8) # handwritten instruction
/* 16D30 00116C30 0F000000 */  sync
/* 16D34 00116C34 EDFF401D */  bgtz       $10, .L00116BEC
/* 16D38 00116C38 00020825 */   addiu     $8, $8, 0x200
.L00116C3C:
/* 16D3C 00116C3C 0800E003 */  jr         $31
/* 16D40 00116C40 00000000 */   nop
/* 16D44 00116C44 0800E003 */  jr         $31
