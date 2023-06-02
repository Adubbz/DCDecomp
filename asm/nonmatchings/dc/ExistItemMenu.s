.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExistItemMenu__Fv
/* 102D90 00202C90 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 102D94 00202C94 1000BF7F */  sq         $31, 0x10($sp)
/* 102D98 00202C98 0000B07F */  sq         $16, 0x0($sp)
/* 102D9C 00202C9C 2900023C */  lui        $2, %hi(_4433)
/* 102DA0 00202CA0 B8344324 */  addiu      $3, $2, %lo(_4433)
/* 102DA4 00202CA4 2000A427 */  addiu      $4, $sp, 0x20
/* 102DA8 00202CA8 000062DC */  ld         $2, 0x0($3)
/* 102DAC 00202CAC 080060C4 */  lwc1       $f0, 0x8($3)
/* 102DB0 00202CB0 000082FC */  sd         $2, 0x0($4)
/* 102DB4 00202CB4 080080E4 */  swc1       $f0, 0x8($4)
/* 102DB8 00202CB8 0095828F */  lw         $2, -0x6B00($gp)
/* 102DBC 00202CBC 2000A2AF */  sw         $2, 0x20($sp)
/* 102DC0 00202CC0 EC94828F */  lw         $2, -0x6B14($gp)
/* 102DC4 00202CC4 2400A2AF */  sw         $2, 0x24($sp)
/* 102DC8 00202CC8 4CB4080C */  jal        MenuTextureDelete__FPi
/* 102DCC 00202CCC 00000000 */   nop
/* 102DD0 00202CD0 C701023C */  lui        $2, %hi(TexManager)
/* 102DD4 00202CD4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 102DD8 00202CD8 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* 102DDC 00202CDC 00000000 */   nop
/* 102DE0 00202CE0 28D6070C */  jal        BtlMenuTexBlockEnter__Fv
/* 102DE4 00202CE4 00000000 */   nop
/* 102DE8 00202CE8 28860070 */  paddub     $16, $0, $0
/* 102DEC 00202CEC 0E000010 */  b          .L00202D28
/* 102DF0 00202CF0 00000000 */   nop
.L00202CF4:
/* 102DF4 00202CF4 D494838F */  lw         $3, -0x6B2C($gp)
/* 102DF8 00202CF8 21180302 */  addu       $3, $16, $3
/* 102DFC 00202CFC 40436380 */  lb         $3, 0x4340($3)
/* 102E00 00202D00 2A086000 */  slt        $at, $3, $0
/* 102E04 00202D04 04002014 */  bnez       $at, .L00202D18
/* 102E08 00202D08 00000000 */   nop
/* 102E0C 00202D0C 0A006328 */  slti       $3, $3, 0xA
/* 102E10 00202D10 04006014 */  bnez       $3, .L00202D24
/* 102E14 00202D14 00000000 */   nop
.L00202D18:
/* 102E18 00202D18 28260072 */  paddub     $4, $16, $0
/* 102E1C 00202D1C EC2F080C */  jal        EquipDefaultWeapon__Fi
/* 102E20 00202D20 00000000 */   nop
.L00202D24:
/* 102E24 00202D24 01001026 */  addiu      $16, $16, 0x1
.L00202D28:
/* 102E28 00202D28 0600032A */  slti       $3, $16, 0x6
/* 102E2C 00202D2C F1FF6014 */  bnez       $3, .L00202CF4
/* 102E30 00202D30 00000000 */   nop
/* 102E34 00202D34 80DC070C */  jal        ForBackMenu__Fv
/* 102E38 00202D38 00000000 */   nop
/* 102E3C 00202D3C 1000BF7B */  lq         $31, 0x10($sp)
/* 102E40 00202D40 0000B07B */  lq         $16, 0x0($sp)
/* 102E44 00202D44 3000BD27 */  addiu      $sp, $sp, 0x30
/* 102E48 00202D48 0800E003 */  jr         $31
/* 102E4C 00202D4C 00000000 */   nop
