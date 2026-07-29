.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitParam__6CBoundFv
/* 03DDF0 0013DCF0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 03DDF4 0013DCF4 1000BF7F */  sq          $31, 0x10($29)
/* 03DDF8 0013DCF8 0000B07F */  sq          $16, 0x0($29)
/* 03DDFC 0013DCFC 28868070 */  paddub      $16, $4, $0
/* 03DE00 0013DD00 C00080AC */  sw          $0, 0xC0($4)
/* 03DE04 0013DD04 C40080AC */  sw          $0, 0xC4($4)
/* 03DE08 0013DD08 C80080AC */  sw          $0, 0xC8($4)
/* 03DE0C 0013DD0C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 03DE10 0013DD10 CC0082AC */  sw          $2, 0xCC($4)
/* 03DE14 0013DD14 000080AC */  sw          $0, 0x0($4)
/* 03DE18 0013DD18 040080AC */  sw          $0, 0x4($4)
/* 03DE1C 0013DD1C 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 03DE20 0013DD20 300082AC */  sw          $2, 0x30($4)
/* 03DE24 0013DD24 E80080AC */  sw          $0, 0xE8($4)
/* 03DE28 0013DD28 E40080AC */  sw          $0, 0xE4($4)
/* 03DE2C 0013DD2C F0000426 */  addiu       $4, $16, 0xF0
/* 03DE30 0013DD30 C0000526 */  addiu       $5, $16, 0xC0
/* 03DE34 0013DD34 0C86040C */  jal         sceVu0CopyVector
/* 03DE38 0013DD38 00000000 */   nop
/* 03DE3C 0013DD3C 00010426 */  addiu       $4, $16, 0x100
/* 03DE40 0013DD40 C0000526 */  addiu       $5, $16, 0xC0
/* 03DE44 0013DD44 0C86040C */  jal         sceVu0CopyVector
/* 03DE48 0013DD48 00000000 */   nop
/* 03DE4C 0013DD4C 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 03DE50 0013DD50 240103AE */  sw          $3, 0x124($16)
/* 03DE54 0013DD54 200103AE */  sw          $3, 0x120($16)
/* 03DE58 0013DD58 1000BF7B */  lq          $31, 0x10($29)
/* 03DE5C 0013DD5C 0000B07B */  lq          $16, 0x0($29)
/* 03DE60 0013DD60 2000BD27 */  addiu       $29, $29, 0x20
/* 03DE64 0013DD64 0800E003 */  jr          $31
/* 03DE68 0013DD68 00000000 */   nop
/* 03DE6C 0013DD6C 00000000 */  nop
