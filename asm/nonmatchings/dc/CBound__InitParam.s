.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitParam__6CBoundFv
/* 3DDF0 0013DCF0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 3DDF4 0013DCF4 1000BF7F */  sq         $31, 0x10($sp)
/* 3DDF8 0013DCF8 0000B07F */  sq         $16, 0x0($sp)
/* 3DDFC 0013DCFC 28868070 */  paddub     $16, $4, $0
/* 3DE00 0013DD00 C00080AC */  sw         $0, 0xC0($4)
/* 3DE04 0013DD04 C40080AC */  sw         $0, 0xC4($4)
/* 3DE08 0013DD08 C80080AC */  sw         $0, 0xC8($4)
/* 3DE0C 0013DD0C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 3DE10 0013DD10 CC0082AC */  sw         $2, 0xCC($4)
/* 3DE14 0013DD14 000080AC */  sw         $0, 0x0($4)
/* 3DE18 0013DD18 040080AC */  sw         $0, 0x4($4)
/* 3DE1C 0013DD1C 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 3DE20 0013DD20 300082AC */  sw         $2, 0x30($4)
/* 3DE24 0013DD24 E80080AC */  sw         $0, 0xE8($4)
/* 3DE28 0013DD28 E40080AC */  sw         $0, 0xE4($4)
/* 3DE2C 0013DD2C F0000426 */  addiu      $4, $16, 0xF0
/* 3DE30 0013DD30 C0000526 */  addiu      $5, $16, 0xC0
/* 3DE34 0013DD34 0C86040C */  jal        sceVu0CopyVector
/* 3DE38 0013DD38 00000000 */   nop
/* 3DE3C 0013DD3C 00010426 */  addiu      $4, $16, 0x100
/* 3DE40 0013DD40 C0000526 */  addiu      $5, $16, 0xC0
/* 3DE44 0013DD44 0C86040C */  jal        sceVu0CopyVector
/* 3DE48 0013DD48 00000000 */   nop
/* 3DE4C 0013DD4C 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 3DE50 0013DD50 240103AE */  sw         $3, 0x124($16)
/* 3DE54 0013DD54 200103AE */  sw         $3, 0x120($16)
/* 3DE58 0013DD58 1000BF7B */  lq         $31, 0x10($sp)
/* 3DE5C 0013DD5C 0000B07B */  lq         $16, 0x0($sp)
/* 3DE60 0013DD60 2000BD27 */  addiu      $sp, $sp, 0x20
/* 3DE64 0013DD64 0800E003 */  jr         $31
/* 3DE68 0013DD68 00000000 */   nop
/* 3DE6C 0013DD6C 00000000 */  nop
