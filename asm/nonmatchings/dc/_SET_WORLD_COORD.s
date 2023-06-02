.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_WORLD_COORD__FP12RS_STACKDATAi
/* 8BD30 0018BC30 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8BD34 0018BC34 0000BF7F */  sq         $31, 0x0($sp)
/* 8BD38 0018BC38 06000224 */  addiu      $2, $0, 0x6
/* 8BD3C 0018BC3C 3000A214 */  bne        $5, $2, .L0018BD00
/* 8BD40 0018BC40 00000000 */   nop
/* 8BD44 0018BC44 08008324 */  addiu      $3, $4, 0x8
/* 8BD48 0018BC48 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8BD4C 0018BC4C 00000000 */   nop
/* 8BD50 0018BC50 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BD54 0018BC54 E0EE20E4 */  swc1       $f0, -0x1120($at)
/* 8BD58 0018BC58 28266070 */  paddub     $4, $3, $0
/* 8BD5C 0018BC5C 08008324 */  addiu      $3, $4, 0x8
/* 8BD60 0018BC60 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8BD64 0018BC64 00000000 */   nop
/* 8BD68 0018BC68 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BD6C 0018BC6C E4EE20E4 */  swc1       $f0, -0x111C($at)
/* 8BD70 0018BC70 28266070 */  paddub     $4, $3, $0
/* 8BD74 0018BC74 08008324 */  addiu      $3, $4, 0x8
/* 8BD78 0018BC78 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8BD7C 0018BC7C 00000000 */   nop
/* 8BD80 0018BC80 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BD84 0018BC84 E8EE20E4 */  swc1       $f0, -0x1118($at)
/* 8BD88 0018BC88 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 8BD8C 0018BC8C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BD90 0018BC90 ECEE22AC */  sw         $2, -0x1114($at)
/* 8BD94 0018BC94 28266070 */  paddub     $4, $3, $0
/* 8BD98 0018BC98 08008324 */  addiu      $3, $4, 0x8
/* 8BD9C 0018BC9C E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8BDA0 0018BCA0 00000000 */   nop
/* 8BDA4 0018BCA4 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BDA8 0018BCA8 F0EE20E4 */  swc1       $f0, -0x1110($at)
/* 8BDAC 0018BCAC 28266070 */  paddub     $4, $3, $0
/* 8BDB0 0018BCB0 08008324 */  addiu      $3, $4, 0x8
/* 8BDB4 0018BCB4 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8BDB8 0018BCB8 00000000 */   nop
/* 8BDBC 0018BCBC D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BDC0 0018BCC0 F4EE20E4 */  swc1       $f0, -0x110C($at)
/* 8BDC4 0018BCC4 28266070 */  paddub     $4, $3, $0
/* 8BDC8 0018BCC8 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8BDCC 0018BCCC 00000000 */   nop
/* 8BDD0 0018BCD0 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BDD4 0018BCD4 F8EE20E4 */  swc1       $f0, -0x1108($at)
/* 8BDD8 0018BCD8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BDDC 0018BCDC FCEE20AC */  sw         $0, -0x1104($at)
/* 8BDE0 0018BCE0 D401023C */  lui        $2, %hi(world_pos)
/* 8BDE4 0018BCE4 E0EE4424 */  addiu      $4, $2, %lo(world_pos)
/* 8BDE8 0018BCE8 D401023C */  lui        $2, %hi(world_rot)
/* 8BDEC 0018BCEC F0EE4524 */  addiu      $5, $2, %lo(world_rot)
/* 8BDF0 0018BCF0 D82C060C */  jal        SetWorldCoord__FPfPf
/* 8BDF4 0018BCF4 00000000 */   nop
/* 8BDF8 0018BCF8 16000010 */  b          .L0018BD54
/* 8BDFC 0018BCFC 00000000 */   nop
.L0018BD00:
/* 8BE00 0018BD00 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BE04 0018BD04 E8EE20AC */  sw         $0, -0x1118($at)
/* 8BE08 0018BD08 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BE0C 0018BD0C E4EE20AC */  sw         $0, -0x111C($at)
/* 8BE10 0018BD10 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BE14 0018BD14 E0EE20AC */  sw         $0, -0x1120($at)
/* 8BE18 0018BD18 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BE1C 0018BD1C F8EE20AC */  sw         $0, -0x1108($at)
/* 8BE20 0018BD20 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BE24 0018BD24 F4EE20AC */  sw         $0, -0x110C($at)
/* 8BE28 0018BD28 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BE2C 0018BD2C F0EE20AC */  sw         $0, -0x1110($at)
/* 8BE30 0018BD30 D401023C */  lui        $2, %hi(world_local)
/* 8BE34 0018BD34 00EF4424 */  addiu      $4, $2, %lo(world_local)
/* 8BE38 0018BD38 2A86040C */  jal        sceVu0UnitMatrix
/* 8BE3C 0018BD3C 00000000 */   nop
/* 8BE40 0018BD40 D401023C */  lui        $2, %hi(local_world)
/* 8BE44 0018BD44 40EF4424 */  addiu      $4, $2, %lo(local_world)
/* 8BE48 0018BD48 2A86040C */  jal        sceVu0UnitMatrix
/* 8BE4C 0018BD4C 00000000 */   nop
/* 8BE50 0018BD50 449280AF */  sw         $0, -0x6DBC($gp)
.L0018BD54:
/* 8BE54 0018BD54 01000224 */  addiu      $2, $0, 0x1
/* 8BE58 0018BD58 0000BF7B */  lq         $31, 0x0($sp)
/* 8BE5C 0018BD5C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8BE60 0018BD60 0800E003 */  jr         $31
/* 8BE64 0018BD64 00000000 */   nop
/* 8BE68 0018BD68 00000000 */  nop
/* 8BE6C 0018BD6C 00000000 */  nop
