.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawBuildUpWeaponSelect__Fiii
/* 100B40 00200A40 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 100B44 00200A44 5000BF7F */  sq         $31, 0x50($sp)
/* 100B48 00200A48 4000B47F */  sq         $20, 0x40($sp)
/* 100B4C 00200A4C 3000B37F */  sq         $19, 0x30($sp)
/* 100B50 00200A50 2000B27F */  sq         $18, 0x20($sp)
/* 100B54 00200A54 1000B17F */  sq         $17, 0x10($sp)
/* 100B58 00200A58 0000B07F */  sq         $16, 0x0($sp)
/* 100B5C 00200A5C 28A68070 */  paddub     $20, $4, $0
/* 100B60 00200A60 289EA070 */  paddub     $19, $5, $0
/* 100B64 00200A64 2896C070 */  paddub     $18, $6, $0
/* 100B68 00200A68 E094848F */  lw         $4, -0x6B20($gp)
/* 100B6C 00200A6C 38B4080C */  jal        MenuTextureReload__Fi
/* 100B70 00200A70 00000000 */   nop
/* 100B74 00200A74 2900023C */  lui        $2, %hi(_3967)
/* 100B78 00200A78 20334524 */  addiu      $5, $2, %lo(_3967)
/* 100B7C 00200A7C 6000A427 */  addiu      $4, $sp, 0x60
/* 100B80 00200A80 03000324 */  addiu      $3, $0, 0x3
.L00200A84:
/* 100B84 00200A84 0000A278 */  lq         $2, 0x0($5)
/* 100B88 00200A88 1000A524 */  addiu      $5, $5, 0x10
/* 100B8C 00200A8C FFFF6324 */  addiu      $3, $3, -0x1
/* 100B90 00200A90 0000827C */  sq         $2, 0x0($4)
/* 100B94 00200A94 10008424 */  addiu      $4, $4, 0x10
/* 100B98 00200A98 FAFF601C */  bgtz       $3, .L00200A84
/* 100B9C 00200A9C 00000000 */   nop
/* 100BA0 00200AA0 0000A2DC */  ld         $2, 0x0($5)
/* 100BA4 00200AA4 000082FC */  sd         $2, 0x0($4)
/* 100BA8 00200AA8 2900023C */  lui        $2, %hi(_3968)
/* 100BAC 00200AAC 58334224 */  addiu      $2, $2, %lo(_3968)
/* 100BB0 00200AB0 9800A427 */  addiu      $4, $sp, 0x98
/* 100BB4 00200AB4 000043DC */  ld         $3, 0x0($2)
/* 100BB8 00200AB8 080040C4 */  lwc1       $f0, 0x8($2)
/* 100BBC 00200ABC 0C004284 */  lh         $2, 0xC($2)
/* 100BC0 00200AC0 000083FC */  sd         $3, 0x0($4)
/* 100BC4 00200AC4 080080E4 */  swc1       $f0, 0x8($4)
/* 100BC8 00200AC8 0C0082A4 */  sh         $2, 0xC($4)
/* 100BCC 00200ACC 1C88828F */  lw         $2, -0x77E4($gp)
/* 100BD0 00200AD0 C0300200 */  sll        $6, $2, 3
/* 100BD4 00200AD4 40100200 */  sll        $2, $2, 1
/* 100BD8 00200AD8 F2FF8326 */  addiu      $3, $20, -0xE
/* 100BDC 00200ADC 21285D00 */  addu       $5, $2, $sp
/* 100BE0 00200AE0 9800A280 */  lb         $2, 0x98($5)
/* 100BE4 00200AE4 21206200 */  addu       $4, $3, $2
/* 100BE8 00200AE8 F4FF6326 */  addiu      $3, $19, -0xC
/* 100BEC 00200AEC 9900A280 */  lb         $2, 0x99($5)
/* 100BF0 00200AF0 21286200 */  addu       $5, $3, $2
/* 100BF4 00200AF4 2110DD00 */  addu       $2, $6, $sp
/* 100BF8 00200AF8 60004CC4 */  lwc1       $f12, 0x60($2)
/* 100BFC 00200AFC 64004DC4 */  lwc1       $f13, 0x64($2)
/* 100C00 00200B00 80000624 */  addiu      $6, $0, 0x80
/* 100C04 00200B04 985E080C */  jal        MenuHelpWinDraw__Fiiffi
/* 100C08 00200B08 00000000 */   nop
/* 100C0C 00200B0C DA01013C */  lui        $at, (0x1DA0C28 >> 16)
/* 100C10 00200B10 280C20AC */  sw         $0, (0x1DA0C28 & 0xFFFF)($at)
/* 100C14 00200B14 DA01013C */  lui        $at, (0x1DA22E0 >> 16)
/* 100C18 00200B18 E02234AC */  sw         $20, (0x1DA22E0 & 0xFFFF)($at)
/* 100C1C 00200B1C FAFF6226 */  addiu      $2, $19, -0x6
/* 100C20 00200B20 DA01013C */  lui        $at, (0x1DA22E4 >> 16)
/* 100C24 00200B24 E42222AC */  sw         $2, (0x1DA22E4 & 0xFFFF)($at)
/* 100C28 00200B28 DA01013C */  lui        $at, (0x1DA0B9C >> 16)
/* 100C2C 00200B2C 9C0B228C */  lw         $2, (0x1DA0B9C & 0xFFFF)($at)
/* 100C30 00200B30 21986202 */  addu       $19, $19, $2
/* 100C34 00200B34 DA01013C */  lui        $at, (0x1DA22E8 >> 16)
/* 100C38 00200B38 E82234AC */  sw         $20, (0x1DA22E8 & 0xFFFF)($at)
/* 100C3C 00200B3C FAFF6226 */  addiu      $2, $19, -0x6
/* 100C40 00200B40 DA01013C */  lui        $at, (0x1DA22EC >> 16)
/* 100C44 00200B44 EC2222AC */  sw         $2, (0x1DA22EC & 0xFFFF)($at)
/* 100C48 00200B48 1E007326 */  addiu      $19, $19, 0x1E
/* 100C4C 00200B4C C0CF070C */  jal        GetNowSelectWeapon__Fv
/* 100C50 00200B50 00000000 */   nop
/* 100C54 00200B54 28264070 */  paddub     $4, $2, $0
/* 100C58 00200B58 AC00A527 */  addiu      $5, $sp, 0xAC
/* 100C5C 00200B5C 9C33080C */  jal        WeaponStatusBuildUp__FP11WEAPON_HAVERi
/* 100C60 00200B60 00000000 */   nop
/* 100C64 00200B64 28864070 */  paddub     $16, $2, $0
/* 100C68 00200B68 288E0070 */  paddub     $17, $0, $0
/* 100C6C 00200B6C 2A000010 */  b          .L00200C18
/* 100C70 00200B70 00000000 */   nop
.L00200B74:
/* 100C74 00200B74 28360070 */  paddub     $6, $0, $0
/* 100C78 00200B78 02003216 */  bne        $17, $18, .L00200B84
/* 100C7C 00200B7C 00000000 */   nop
/* 100C80 00200B80 01000624 */  addiu      $6, $0, 0x1
.L00200B84:
/* 100C84 00200B84 10008426 */  addiu      $4, $20, 0x10
/* 100C88 00200B88 282E6072 */  paddub     $5, $19, $0
/* 100C8C 00200B8C 80000724 */  addiu      $7, $0, 0x80
/* 100C90 00200B90 6E000824 */  addiu      $8, $0, 0x6E
/* 100C94 00200B94 60E5070C */  jal        DrawWeaponNameBoard__Fiiiii
/* 100C98 00200B98 00000000 */   nop
/* 100C9C 00200B9C 80181100 */  sll        $3, $17, 2
/* 100CA0 00200BA0 DA01023C */  lui        $2, %hi(D_1DA2270)
/* 100CA4 00200BA4 70224224 */  addiu      $2, $2, %lo(D_1DA2270)
/* 100CA8 00200BA8 21184300 */  addu       $3, $2, $3
/* 100CAC 00200BAC DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* 100CB0 00200BB0 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* 100CB4 00200BB4 0000658C */  lw         $5, 0x0($3)
/* 100CB8 00200BB8 C83C050C */  jal        GetMesWidth_system__6ClsMesFi
/* 100CBC 00200BBC 00000000 */   nop
/* 100CC0 00200BC0 76008426 */  addiu      $4, $20, 0x76
/* 100CC4 00200BC4 282E4070 */  paddub     $5, $2, $0
/* 100CC8 00200BC8 B0E5070C */  jal        GetWeaponNamePutX__Fii
/* 100CCC 00200BCC 00000000 */   nop
/* 100CD0 00200BD0 02002326 */  addiu      $3, $17, 0x2
/* 100CD4 00200BD4 0E006004 */  bltz       $3, .L00200C10
/* 100CD8 00200BD8 00000000 */   nop
/* 100CDC 00200BDC 0A006128 */  slti       $at, $3, 0xA
/* 100CE0 00200BE0 0B002010 */  beqz       $at, .L00200C10
/* 100CE4 00200BE4 00000000 */   nop
/* 100CE8 00200BE8 C0201100 */  sll        $4, $17, 3
/* 100CEC 00200BEC DA01033C */  lui        $3, %hi(D_1DA22F0)
/* 100CF0 00200BF0 F0226324 */  addiu      $3, $3, %lo(D_1DA22F0)
/* 100CF4 00200BF4 21186400 */  addu       $3, $3, $4
/* 100CF8 00200BF8 000062AC */  sw         $2, 0x0($3)
/* 100CFC 00200BFC 05006326 */  addiu      $3, $19, 0x5
/* 100D00 00200C00 DA01023C */  lui        $2, %hi(D_1DA22F4)
/* 100D04 00200C04 F4224224 */  addiu      $2, $2, %lo(D_1DA22F4)
/* 100D08 00200C08 21104400 */  addu       $2, $2, $4
/* 100D0C 00200C0C 000043AC */  sw         $3, 0x0($2)
.L00200C10:
/* 100D10 00200C10 26007326 */  addiu      $19, $19, 0x26
/* 100D14 00200C14 01003126 */  addiu      $17, $17, 0x1
.L00200C18:
/* 100D18 00200C18 2A103002 */  slt        $2, $17, $16
/* 100D1C 00200C1C D5FF4014 */  bnez       $2, .L00200B74
/* 100D20 00200C20 00000000 */   nop
/* 100D24 00200C24 DA01013C */  lui        $at, (0x1DA22DC >> 16)
/* 100D28 00200C28 DC22248C */  lw         $4, (0x1DA22DC & 0xFFFF)($at)
/* 100D2C 00200C2C 38B4080C */  jal        MenuTextureReload__Fi
/* 100D30 00200C30 00000000 */   nop
/* 100D34 00200C34 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* 100D38 00200C38 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* 100D3C 00200C3C 6437050C */  jal        Step__6ClsMesFv
/* 100D40 00200C40 00000000 */   nop
/* 100D44 00200C44 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* 100D48 00200C48 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* 100D4C 00200C4C C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 100D50 00200C50 00000000 */   nop
/* 100D54 00200C54 5000BF7B */  lq         $31, 0x50($sp)
/* 100D58 00200C58 4000B47B */  lq         $20, 0x40($sp)
/* 100D5C 00200C5C 3000B37B */  lq         $19, 0x30($sp)
/* 100D60 00200C60 2000B27B */  lq         $18, 0x20($sp)
/* 100D64 00200C64 1000B17B */  lq         $17, 0x10($sp)
/* 100D68 00200C68 0000B07B */  lq         $16, 0x0($sp)
/* 100D6C 00200C6C B000BD27 */  addiu      $sp, $sp, 0xB0
/* 100D70 00200C70 0800E003 */  jr         $31
/* 100D74 00200C74 00000000 */   nop
/* 100D78 00200C78 00000000 */  nop
/* 100D7C 00200C7C 00000000 */  nop
