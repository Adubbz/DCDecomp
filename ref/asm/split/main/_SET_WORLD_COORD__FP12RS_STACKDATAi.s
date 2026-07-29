.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_WORLD_COORD__FP12RS_STACKDATAi
/* 08BD30 0018BC30 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08BD34 0018BC34 0000BF7F */  sq          $31, 0x0($29)
/* 08BD38 0018BC38 06000224 */  addiu       $2, $0, 0x6
/* 08BD3C 0018BC3C 3000A214 */  bne         $5, $2, .L0018BD00
/* 08BD40 0018BC40 00000000 */   nop
/* 08BD44 0018BC44 08008324 */  addiu       $3, $4, 0x8
/* 08BD48 0018BC48 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08BD4C 0018BC4C 00000000 */   nop
/* 08BD50 0018BC50 D401013C */  lui         $1, %hi(world_pos)
/* 08BD54 0018BC54 E0EE20E4 */  swc1        $f0, %lo(world_pos)($1)
/* 08BD58 0018BC58 28266070 */  paddub      $4, $3, $0
/* 08BD5C 0018BC5C 08008324 */  addiu       $3, $4, 0x8
/* 08BD60 0018BC60 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08BD64 0018BC64 00000000 */   nop
/* 08BD68 0018BC68 D401013C */  lui         $1, %hi(world_pos + 0x4)
/* 08BD6C 0018BC6C E4EE20E4 */  swc1        $f0, %lo(world_pos + 0x4)($1)
/* 08BD70 0018BC70 28266070 */  paddub      $4, $3, $0
/* 08BD74 0018BC74 08008324 */  addiu       $3, $4, 0x8
/* 08BD78 0018BC78 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08BD7C 0018BC7C 00000000 */   nop
/* 08BD80 0018BC80 D401013C */  lui         $1, %hi(world_pos + 0x8)
/* 08BD84 0018BC84 E8EE20E4 */  swc1        $f0, %lo(world_pos + 0x8)($1)
/* 08BD88 0018BC88 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 08BD8C 0018BC8C D401013C */  lui         $1, %hi(world_pos + 0xC)
/* 08BD90 0018BC90 ECEE22AC */  sw          $2, %lo(world_pos + 0xC)($1)
/* 08BD94 0018BC94 28266070 */  paddub      $4, $3, $0
/* 08BD98 0018BC98 08008324 */  addiu       $3, $4, 0x8
/* 08BD9C 0018BC9C E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08BDA0 0018BCA0 00000000 */   nop
/* 08BDA4 0018BCA4 D401013C */  lui         $1, %hi(world_rot)
/* 08BDA8 0018BCA8 F0EE20E4 */  swc1        $f0, %lo(world_rot)($1)
/* 08BDAC 0018BCAC 28266070 */  paddub      $4, $3, $0
/* 08BDB0 0018BCB0 08008324 */  addiu       $3, $4, 0x8
/* 08BDB4 0018BCB4 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08BDB8 0018BCB8 00000000 */   nop
/* 08BDBC 0018BCBC D401013C */  lui         $1, %hi(world_rot + 0x4)
/* 08BDC0 0018BCC0 F4EE20E4 */  swc1        $f0, %lo(world_rot + 0x4)($1)
/* 08BDC4 0018BCC4 28266070 */  paddub      $4, $3, $0
/* 08BDC8 0018BCC8 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08BDCC 0018BCCC 00000000 */   nop
/* 08BDD0 0018BCD0 D401013C */  lui         $1, %hi(world_rot + 0x8)
/* 08BDD4 0018BCD4 F8EE20E4 */  swc1        $f0, %lo(world_rot + 0x8)($1)
/* 08BDD8 0018BCD8 D401013C */  lui         $1, %hi(world_rot + 0xC)
/* 08BDDC 0018BCDC FCEE20AC */  sw          $0, %lo(world_rot + 0xC)($1)
/* 08BDE0 0018BCE0 D401023C */  lui         $2, %hi(world_pos)
/* 08BDE4 0018BCE4 E0EE4424 */  addiu       $4, $2, %lo(world_pos)
/* 08BDE8 0018BCE8 D401023C */  lui         $2, %hi(world_rot)
/* 08BDEC 0018BCEC F0EE4524 */  addiu       $5, $2, %lo(world_rot)
/* 08BDF0 0018BCF0 D82C060C */  jal         SetWorldCoord__FPfPf
/* 08BDF4 0018BCF4 00000000 */   nop
/* 08BDF8 0018BCF8 16000010 */  b           .L0018BD54
/* 08BDFC 0018BCFC 00000000 */   nop
.L0018BD00:
/* 08BE00 0018BD00 D401013C */  lui         $1, %hi(world_pos + 0x8)
/* 08BE04 0018BD04 E8EE20AC */  sw          $0, %lo(world_pos + 0x8)($1)
/* 08BE08 0018BD08 D401013C */  lui         $1, %hi(world_pos + 0x4)
/* 08BE0C 0018BD0C E4EE20AC */  sw          $0, %lo(world_pos + 0x4)($1)
/* 08BE10 0018BD10 D401013C */  lui         $1, %hi(world_pos)
/* 08BE14 0018BD14 E0EE20AC */  sw          $0, %lo(world_pos)($1)
/* 08BE18 0018BD18 D401013C */  lui         $1, %hi(world_rot + 0x8)
/* 08BE1C 0018BD1C F8EE20AC */  sw          $0, %lo(world_rot + 0x8)($1)
/* 08BE20 0018BD20 D401013C */  lui         $1, %hi(world_rot + 0x4)
/* 08BE24 0018BD24 F4EE20AC */  sw          $0, %lo(world_rot + 0x4)($1)
/* 08BE28 0018BD28 D401013C */  lui         $1, %hi(world_rot)
/* 08BE2C 0018BD2C F0EE20AC */  sw          $0, %lo(world_rot)($1)
/* 08BE30 0018BD30 D401023C */  lui         $2, %hi(world_local)
/* 08BE34 0018BD34 00EF4424 */  addiu       $4, $2, %lo(world_local)
/* 08BE38 0018BD38 2A86040C */  jal         sceVu0UnitMatrix
/* 08BE3C 0018BD3C 00000000 */   nop
/* 08BE40 0018BD40 D401023C */  lui         $2, %hi(local_world)
/* 08BE44 0018BD44 40EF4424 */  addiu       $4, $2, %lo(local_world)
/* 08BE48 0018BD48 2A86040C */  jal         sceVu0UnitMatrix
/* 08BE4C 0018BD4C 00000000 */   nop
/* 08BE50 0018BD50 449280AF */  sw          $0, -0x6DBC($28)
.L0018BD54:
/* 08BE54 0018BD54 01000224 */  addiu       $2, $0, 0x1
/* 08BE58 0018BD58 0000BF7B */  lq          $31, 0x0($29)
/* 08BE5C 0018BD5C 1000BD27 */  addiu       $29, $29, 0x10
/* 08BE60 0018BD60 0800E003 */  jr          $31
/* 08BE64 0018BD64 00000000 */   nop
/* 08BE68 0018BD68 00000000 */  nop
/* 08BE6C 0018BD6C 00000000 */  nop
