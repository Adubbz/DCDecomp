.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel QuatSlerp__FPfPffPf
/* 47C70 00147B70 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 47C74 00147B74 4000BF7F */  sq         $31, 0x40($sp)
/* 47C78 00147B78 3000B17F */  sq         $17, 0x30($sp)
/* 47C7C 00147B7C 2000B07F */  sq         $16, 0x20($sp)
/* 47C80 00147B80 1C00BBE7 */  swc1       $f27, 0x1C($sp)
/* 47C84 00147B84 1800BAE7 */  swc1       $f26, 0x18($sp)
/* 47C88 00147B88 1400B9E7 */  swc1       $f25, 0x14($sp)
/* 47C8C 00147B8C 1000B8E7 */  swc1       $f24, 0x10($sp)
/* 47C90 00147B90 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* 47C94 00147B94 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 47C98 00147B98 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 47C9C 00147B9C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 47CA0 00147BA0 288E8070 */  paddub     $17, $4, $0
/* 47CA4 00147BA4 46660046 */  mov.s      $f25, $f12
/* 47CA8 00147BA8 2886C070 */  paddub     $16, $6, $0
/* 47CAC 00147BAC 000080C4 */  lwc1       $f0, 0x0($4)
/* 47CB0 00147BB0 07000046 */  neg.s      $f0, $f0
/* 47CB4 00147BB4 000080E4 */  swc1       $f0, 0x0($4)
/* 47CB8 00147BB8 0000A0C4 */  lwc1       $f0, 0x0($5)
/* 47CBC 00147BBC 07000046 */  neg.s      $f0, $f0
/* 47CC0 00147BC0 0000A0E4 */  swc1       $f0, 0x0($5)
/* 47CC4 00147BC4 0400B5C4 */  lwc1       $f21, 0x4($5)
/* 47CC8 00147BC8 040080C4 */  lwc1       $f0, 0x4($4)
/* 47CCC 00147BCC 1A001546 */  mula.s     $f0, $f21
/* 47CD0 00147BD0 0800B6C4 */  lwc1       $f22, 0x8($5)
/* 47CD4 00147BD4 080080C4 */  lwc1       $f0, 0x8($4)
/* 47CD8 00147BD8 5C001646 */  madd.s     $f1, $f0, $f22
/* 47CDC 00147BDC 0C00B7C4 */  lwc1       $f23, 0xC($5)
/* 47CE0 00147BE0 0C0080C4 */  lwc1       $f0, 0xC($4)
/* 47CE4 00147BE4 02001746 */  mul.s      $f0, $f0, $f23
/* 47CE8 00147BE8 18000146 */  adda.s     $f0, $f1
/* 47CEC 00147BEC 0000B8C4 */  lwc1       $f24, 0x0($5)
/* 47CF0 00147BF0 000080C4 */  lwc1       $f0, 0x0($4)
/* 47CF4 00147BF4 1C031846 */  madd.s     $f12, $f0, $f24
/* 47CF8 00147BF8 00008044 */  mtc1       $0, $f0
/* 47CFC 00147BFC 00000000 */  nop
/* 47D00 00147C00 34600046 */  c.lt.s     $f12, $f0
/* 47D04 00147C04 00000000 */  nop
/* 47D08 00147C08 08000045 */  bc1f       .L00147C2C
/* 47D0C 00147C0C 00000000 */   nop
/* 47D10 00147C10 07630046 */  neg.s      $f12, $f12
/* 47D14 00147C14 47AD0046 */  neg.s      $f21, $f21
/* 47D18 00147C18 87B50046 */  neg.s      $f22, $f22
/* 47D1C 00147C1C C7BD0046 */  neg.s      $f23, $f23
/* 47D20 00147C20 07C60046 */  neg.s      $f24, $f24
/* 47D24 00147C24 01000010 */  b          .L00147C2C
/* 47D28 00147C28 00000000 */   nop
.L00147C2C:
/* 47D2C 00147C2C 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 47D30 00147C30 00108344 */  mtc1       $3, $f2
/* 47D34 00147C34 00000000 */  nop
/* 47D38 00147C38 41100C46 */  sub.s      $f1, $f2, $f12
/* 47D3C 00147C3C A48080C7 */  lwc1       $f0, -0x7F5C($gp)
/* 47D40 00147C40 36080046 */  c.le.s     $f1, $f0
/* 47D44 00147C44 00000000 */  nop
/* 47D48 00147C48 16000145 */  bc1t       .L00147CA4
/* 47D4C 00147C4C 00000000 */   nop
/* 47D50 00147C50 1077040C */  jal        acosf
/* 47D54 00147C54 00000000 */   nop
/* 47D58 00147C58 86060046 */  mov.s      $f26, $f0
/* 47D5C 00147C5C 06D30046 */  mov.s      $f12, $f26
/* 47D60 00147C60 2876040C */  jal        sinf
/* 47D64 00147C64 00000000 */   nop
/* 47D68 00147C68 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 47D6C 00147C6C 00088244 */  mtc1       $2, $f1
/* 47D70 00147C70 00000000 */  nop
/* 47D74 00147C74 C30E0046 */  div.s      $f27, $f1, $f0
/* 47D78 00147C78 01081946 */  sub.s      $f0, $f1, $f25
/* 47D7C 00147C7C 02031A46 */  mul.s      $f12, $f0, $f26
/* 47D80 00147C80 2876040C */  jal        sinf
/* 47D84 00147C84 00000000 */   nop
/* 47D88 00147C88 02DD0046 */  mul.s      $f20, $f27, $f0
/* 47D8C 00147C8C 02CB1A46 */  mul.s      $f12, $f25, $f26
/* 47D90 00147C90 2876040C */  jal        sinf
/* 47D94 00147C94 00000000 */   nop
/* 47D98 00147C98 42DE0046 */  mul.s      $f25, $f27, $f0
/* 47D9C 00147C9C 02000010 */  b          .L00147CA8
/* 47DA0 00147CA0 00000000 */   nop
.L00147CA4:
/* 47DA4 00147CA4 01151946 */  sub.s      $f20, $f2, $f25
.L00147CA8:
/* 47DA8 00147CA8 040020C6 */  lwc1       $f0, 0x4($17)
/* 47DAC 00147CAC 1AA00046 */  mula.s     $f20, $f0
/* 47DB0 00147CB0 1CC81546 */  madd.s     $f0, $f25, $f21
/* 47DB4 00147CB4 040000E6 */  swc1       $f0, 0x4($16)
/* 47DB8 00147CB8 080020C6 */  lwc1       $f0, 0x8($17)
/* 47DBC 00147CBC 1AA00046 */  mula.s     $f20, $f0
/* 47DC0 00147CC0 1CC81646 */  madd.s     $f0, $f25, $f22
/* 47DC4 00147CC4 080000E6 */  swc1       $f0, 0x8($16)
/* 47DC8 00147CC8 0C0020C6 */  lwc1       $f0, 0xC($17)
/* 47DCC 00147CCC 1AA00046 */  mula.s     $f20, $f0
/* 47DD0 00147CD0 1CC81746 */  madd.s     $f0, $f25, $f23
/* 47DD4 00147CD4 0C0000E6 */  swc1       $f0, 0xC($16)
/* 47DD8 00147CD8 000020C6 */  lwc1       $f0, 0x0($17)
/* 47DDC 00147CDC 1AA00046 */  mula.s     $f20, $f0
/* 47DE0 00147CE0 1CC81846 */  madd.s     $f0, $f25, $f24
/* 47DE4 00147CE4 000000E6 */  swc1       $f0, 0x0($16)
/* 47DE8 00147CE8 4000BF7B */  lq         $31, 0x40($sp)
/* 47DEC 00147CEC 3000B17B */  lq         $17, 0x30($sp)
/* 47DF0 00147CF0 2000B07B */  lq         $16, 0x20($sp)
/* 47DF4 00147CF4 1C00BBC7 */  lwc1       $f27, 0x1C($sp)
/* 47DF8 00147CF8 1800BAC7 */  lwc1       $f26, 0x18($sp)
/* 47DFC 00147CFC 1400B9C7 */  lwc1       $f25, 0x14($sp)
/* 47E00 00147D00 1000B8C7 */  lwc1       $f24, 0x10($sp)
/* 47E04 00147D04 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* 47E08 00147D08 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 47E0C 00147D0C 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 47E10 00147D10 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 47E14 00147D14 5000BD27 */  addiu      $sp, $sp, 0x50
/* 47E18 00147D18 0800E003 */  jr         $31
/* 47E1C 00147D1C 00000000 */   nop
