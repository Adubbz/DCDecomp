.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DngWeaponEquipModelBuild__FiiP1
/* 10DE60 0020DD60 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 10DE64 0020DD64 4000BF7F */  sq         $31, 0x40($sp)
/* 10DE68 0020DD68 3000B37F */  sq         $19, 0x30($sp)
/* 10DE6C 0020DD6C 2000B27F */  sq         $18, 0x20($sp)
/* 10DE70 0020DD70 1000B17F */  sq         $17, 0x10($sp)
/* 10DE74 0020DD74 0000B07F */  sq         $16, 0x0($sp)
/* 10DE78 0020DD78 28968070 */  paddub     $18, $4, $0
/* 10DE7C 0020DD7C C701023C */  lui        $2, %hi(TexManager)
/* 10DE80 0020DD80 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10DE84 0020DD84 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 10DE88 0020DD88 00000000 */   nop
/* 10DE8C 0020DD8C 28260070 */  paddub     $4, $0, $0
/* 10DE90 0020DD90 EC34080C */  jal        GetMenuWeaponModelData__Fi
/* 10DE94 0020DD94 00000000 */   nop
/* 10DE98 0020DD98 28864070 */  paddub     $16, $2, $0
/* 10DE9C 0020DD9C 01000424 */  addiu      $4, $0, 0x1
/* 10DEA0 0020DDA0 EC34080C */  jal        GetMenuWeaponModelData__Fi
/* 10DEA4 0020DDA4 00000000 */   nop
/* 10DEA8 0020DDA8 288E4070 */  paddub     $17, $2, $0
/* 10DEAC 0020DDAC 289E0070 */  paddub     $19, $0, $0
/* 10DEB0 0020DDB0 789C838F */  lw         $3, -0x6388($gp)
/* 10DEB4 0020DDB4 0F006010 */  beqz       $3, .L0020DDF4
/* 10DEB8 0020DDB8 00000000 */   nop
/* 10DEBC 0020DDBC A80A0224 */  addiu      $2, $0, 0xAA8
/* 10DEC0 0020DDC0 18104202 */  mult       $2, $18, $2
/* 10DEC4 0020DDC4 21204300 */  addu       $4, $2, $3
/* 10DEC8 0020DDC8 21104302 */  addu       $2, $18, $3
/* 10DECC 0020DDCC 40434380 */  lb         $3, 0x4340($2)
/* 10DED0 0020DDD0 40110300 */  sll        $2, $3, 5
/* 10DED4 0020DDD4 23104300 */  subu       $2, $2, $3
/* 10DED8 0020DDD8 C0100200 */  sll        $2, $2, 3
/* 10DEDC 0020DDDC 21104400 */  addu       $2, $2, $4
/* 10DEE0 0020DDE0 0C455384 */  lh         $19, 0x450C($2)
/* 10DEE4 0020DDE4 28264072 */  paddub     $4, $18, $0
/* 10DEE8 0020DDE8 68CF070C */  jal        GetDefaultWeaponNo__Fi
/* 10DEEC 0020DDEC 00000000 */   nop
/* 10DEF0 0020DDF0 23986202 */  subu       $19, $19, $2
.L0020DDF4:
/* 10DEF4 0020DDF4 28266072 */  paddub     $4, $19, $0
/* 10DEF8 0020DDF8 EC34080C */  jal        GetMenuWeaponModelData__Fi
/* 10DEFC 0020DDFC 00000000 */   nop
/* 10DF00 0020DE00 04004014 */  bnez       $2, .L0020DE14
/* 10DF04 0020DE04 00000000 */   nop
/* 10DF08 0020DE08 28162072 */  paddub     $2, $17, $0
/* 10DF0C 0020DE0C 06000010 */  b          .L0020DE28
/* 10DF10 0020DE10 00000000 */   nop
.L0020DE14:
/* 10DF14 0020DE14 0000438C */  lw         $3, 0x0($2)
/* 10DF18 0020DE18 03006014 */  bnez       $3, .L0020DE28
/* 10DF1C 0020DE1C 00000000 */   nop
/* 10DF20 0020DE20 0000238E */  lw         $3, 0x0($17)
/* 10DF24 0020DE24 000043AC */  sw         $3, 0x0($2)
.L0020DE28:
/* 10DF28 0020DE28 0000048E */  lw         $4, 0x0($16)
/* 10DF2C 0020DE2C 0000258E */  lw         $5, 0x0($17)
/* 10DF30 0020DE30 0000468C */  lw         $6, 0x0($2)
/* 10DF34 0020DE34 283E4072 */  paddub     $7, $18, $0
/* 10DF38 0020DE38 01000824 */  addiu      $8, $0, 0x1
/* 10DF3C 0020DE3C 10E6760C */  jal        func_1DB9840
/* 10DF40 0020DE40 00000000 */   nop
/* 10DF44 0020DE44 01000424 */  addiu      $4, $0, 0x1
/* 10DF48 0020DE48 5C34080C */  jal        MenuWeaponEffectSet__Fi
/* 10DF4C 0020DE4C 00000000 */   nop
/* 10DF50 0020DE50 01000224 */  addiu      $2, $0, 0x1
/* 10DF54 0020DE54 4000BF7B */  lq         $31, 0x40($sp)
/* 10DF58 0020DE58 3000B37B */  lq         $19, 0x30($sp)
/* 10DF5C 0020DE5C 2000B27B */  lq         $18, 0x20($sp)
/* 10DF60 0020DE60 1000B17B */  lq         $17, 0x10($sp)
/* 10DF64 0020DE64 0000B07B */  lq         $16, 0x0($sp)
/* 10DF68 0020DE68 5000BD27 */  addiu      $sp, $sp, 0x50
/* 10DF6C 0020DE6C 0800E003 */  jr         $31
/* 10DF70 0020DE70 00000000 */   nop
/* 10DF74 0020DE74 00000000 */  nop
/* 10DF78 0020DE78 00000000 */  nop
/* 10DF7C 0020DE7C 00000000 */  nop
