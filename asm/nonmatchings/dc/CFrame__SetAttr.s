.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetAttr__6CFrameFR10CFrameAttrii
/* 28C50 00128B50 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 28C54 00128B54 3000BF7F */  sq         $31, 0x30($sp)
/* 28C58 00128B58 2000B27F */  sq         $18, 0x20($sp)
/* 28C5C 00128B5C 1000B17F */  sq         $17, 0x10($sp)
/* 28C60 00128B60 0000B07F */  sq         $16, 0x0($sp)
/* 28C64 00128B64 288EA070 */  paddub     $17, $5, $0
/* 28C68 00128B68 2886E070 */  paddub     $16, $7, $0
/* 28C6C 00128B6C 0F000016 */  bnez       $16, .L00128BAC
/* 28C70 00128B70 00000000 */   nop
/* 28C74 00128B74 B0008824 */  addiu      $8, $4, 0xB0
/* 28C78 00128B78 03000724 */  addiu      $7, $0, 0x3
/* 28C7C 00128B7C 284E2072 */  paddub     $9, $17, $0
.L00128B80:
/* 28C80 00128B80 00002579 */  lq         $5, 0x0($9)
/* 28C84 00128B84 10002379 */  lq         $3, 0x10($9)
/* 28C88 00128B88 20002925 */  addiu      $9, $9, 0x20
/* 28C8C 00128B8C FFFFE724 */  addiu      $7, $7, -0x1
/* 28C90 00128B90 0000057D */  sq         $5, 0x0($8)
/* 28C94 00128B94 1000037D */  sq         $3, 0x10($8)
/* 28C98 00128B98 20000825 */  addiu      $8, $8, 0x20
/* 28C9C 00128B9C F8FFE01C */  bgtz       $7, .L00128B80
/* 28CA0 00128BA0 00000000 */   nop
/* 28CA4 00128BA4 57000010 */  b          .L00128D04
/* 28CA8 00128BA8 00000000 */   nop
.L00128BAC:
/* 28CAC 00128BAC 01000332 */  andi       $3, $16, 0x1
/* 28CB0 00128BB0 03006010 */  beqz       $3, .L00128BC0
/* 28CB4 00128BB4 00000000 */   nop
/* 28CB8 00128BB8 00002386 */  lh         $3, 0x0($17)
/* 28CBC 00128BBC B00083A4 */  sh         $3, 0xB0($4)
.L00128BC0:
/* 28CC0 00128BC0 02000332 */  andi       $3, $16, 0x2
/* 28CC4 00128BC4 03006010 */  beqz       $3, .L00128BD4
/* 28CC8 00128BC8 00000000 */   nop
/* 28CCC 00128BCC 040020C6 */  lwc1       $f0, 0x4($17)
/* 28CD0 00128BD0 B40080E4 */  swc1       $f0, 0xB4($4)
.L00128BD4:
/* 28CD4 00128BD4 04000332 */  andi       $3, $16, 0x4
/* 28CD8 00128BD8 03006010 */  beqz       $3, .L00128BE8
/* 28CDC 00128BDC 00000000 */   nop
/* 28CE0 00128BE0 08002382 */  lb         $3, 0x8($17)
/* 28CE4 00128BE4 B80083A0 */  sb         $3, 0xB8($4)
.L00128BE8:
/* 28CE8 00128BE8 08000332 */  andi       $3, $16, 0x8
/* 28CEC 00128BEC 03006010 */  beqz       $3, .L00128BFC
/* 28CF0 00128BF0 00000000 */   nop
/* 28CF4 00128BF4 09002382 */  lb         $3, 0x9($17)
/* 28CF8 00128BF8 B90083A0 */  sb         $3, 0xB9($4)
.L00128BFC:
/* 28CFC 00128BFC 10000332 */  andi       $3, $16, 0x10
/* 28D00 00128C00 03006010 */  beqz       $3, .L00128C10
/* 28D04 00128C04 00000000 */   nop
/* 28D08 00128C08 0A002382 */  lb         $3, 0xA($17)
/* 28D0C 00128C0C BA0083A0 */  sb         $3, 0xBA($4)
.L00128C10:
/* 28D10 00128C10 20000332 */  andi       $3, $16, 0x20
/* 28D14 00128C14 03006010 */  beqz       $3, .L00128C24
/* 28D18 00128C18 00000000 */   nop
/* 28D1C 00128C1C 0B002382 */  lb         $3, 0xB($17)
/* 28D20 00128C20 BB0083A0 */  sb         $3, 0xBB($4)
.L00128C24:
/* 28D24 00128C24 40000332 */  andi       $3, $16, 0x40
/* 28D28 00128C28 03006010 */  beqz       $3, .L00128C38
/* 28D2C 00128C2C 00000000 */   nop
/* 28D30 00128C30 0C002382 */  lb         $3, 0xC($17)
/* 28D34 00128C34 BC0083A0 */  sb         $3, 0xBC($4)
.L00128C38:
/* 28D38 00128C38 80000332 */  andi       $3, $16, 0x80
/* 28D3C 00128C3C 03006010 */  beqz       $3, .L00128C4C
/* 28D40 00128C40 00000000 */   nop
/* 28D44 00128C44 0D002382 */  lb         $3, 0xD($17)
/* 28D48 00128C48 BD0083A0 */  sb         $3, 0xBD($4)
.L00128C4C:
/* 28D4C 00128C4C 00010332 */  andi       $3, $16, 0x100
/* 28D50 00128C50 03006010 */  beqz       $3, .L00128C60
/* 28D54 00128C54 00000000 */   nop
/* 28D58 00128C58 100020C6 */  lwc1       $f0, 0x10($17)
/* 28D5C 00128C5C C00080E4 */  swc1       $f0, 0xC0($4)
.L00128C60:
/* 28D60 00128C60 00020332 */  andi       $3, $16, 0x200
/* 28D64 00128C64 03006010 */  beqz       $3, .L00128C74
/* 28D68 00128C68 00000000 */   nop
/* 28D6C 00128C6C 14002382 */  lb         $3, 0x14($17)
/* 28D70 00128C70 C40083A0 */  sb         $3, 0xC4($4)
.L00128C74:
/* 28D74 00128C74 00040332 */  andi       $3, $16, 0x400
/* 28D78 00128C78 03006010 */  beqz       $3, .L00128C88
/* 28D7C 00128C7C 00000000 */   nop
/* 28D80 00128C80 2000237A */  lq         $3, 0x20($17)
/* 28D84 00128C84 D000837C */  sq         $3, 0xD0($4)
.L00128C88:
/* 28D88 00128C88 00080332 */  andi       $3, $16, 0x800
/* 28D8C 00128C8C 03006010 */  beqz       $3, .L00128C9C
/* 28D90 00128C90 00000000 */   nop
/* 28D94 00128C94 50002386 */  lh         $3, 0x50($17)
/* 28D98 00128C98 000183A4 */  sh         $3, 0x100($4)
.L00128C9C:
/* 28D9C 00128C9C 00100332 */  andi       $3, $16, 0x1000
/* 28DA0 00128CA0 03006010 */  beqz       $3, .L00128CB0
/* 28DA4 00128CA4 00000000 */   nop
/* 28DA8 00128CA8 54002382 */  lb         $3, 0x54($17)
/* 28DAC 00128CAC 040183A0 */  sb         $3, 0x104($4)
.L00128CB0:
/* 28DB0 00128CB0 00200332 */  andi       $3, $16, 0x2000
/* 28DB4 00128CB4 03006010 */  beqz       $3, .L00128CC4
/* 28DB8 00128CB8 00000000 */   nop
/* 28DBC 00128CBC 56002386 */  lh         $3, 0x56($17)
/* 28DC0 00128CC0 060183A4 */  sh         $3, 0x106($4)
.L00128CC4:
/* 28DC4 00128CC4 00400332 */  andi       $3, $16, 0x4000
/* 28DC8 00128CC8 03006010 */  beqz       $3, .L00128CD8
/* 28DCC 00128CCC 00000000 */   nop
/* 28DD0 00128CD0 58002386 */  lh         $3, 0x58($17)
/* 28DD4 00128CD4 080183A4 */  sh         $3, 0x108($4)
.L00128CD8:
/* 28DD8 00128CD8 00800332 */  andi       $3, $16, 0x8000
/* 28DDC 00128CDC 03006010 */  beqz       $3, .L00128CEC
/* 28DE0 00128CE0 00000000 */   nop
/* 28DE4 00128CE4 52002386 */  lh         $3, 0x52($17)
/* 28DE8 00128CE8 020183A4 */  sh         $3, 0x102($4)
.L00128CEC:
/* 28DEC 00128CEC 0100033C */  lui        $3, (0x10000 >> 16)
/* 28DF0 00128CF0 24180302 */  and        $3, $16, $3
/* 28DF4 00128CF4 03006010 */  beqz       $3, .L00128D04
/* 28DF8 00128CF8 00000000 */   nop
/* 28DFC 00128CFC 55002382 */  lb         $3, 0x55($17)
/* 28E00 00128D00 050183A0 */  sb         $3, 0x105($4)
.L00128D04:
/* 28E04 00128D04 0E00C010 */  beqz       $6, .L00128D40
/* 28E08 00128D08 00000000 */   nop
/* 28E0C 00128D0C 3801928C */  lw         $18, 0x138($4)
/* 28E10 00128D10 09000010 */  b          .L00128D38
/* 28E14 00128D14 00000000 */   nop
.L00128D18:
/* 28E18 00128D18 28264072 */  paddub     $4, $18, $0
/* 28E1C 00128D1C 282E2072 */  paddub     $5, $17, $0
/* 28E20 00128D20 01000624 */  addiu      $6, $0, 0x1
/* 28E24 00128D24 283E0072 */  paddub     $7, $16, $0
/* 28E28 00128D28 D4A2040C */  jal        SetAttr__6CFrameFR10CFrameAttrii
/* 28E2C 00128D2C 00000000 */   nop
/* 28E30 00128D30 3C01528E */  lw         $18, 0x13C($18)
/* 28E34 00128D34 00000000 */  nop
.L00128D38:
/* 28E38 00128D38 F7FF4016 */  bnez       $18, .L00128D18
/* 28E3C 00128D3C 00000000 */   nop
.L00128D40:
/* 28E40 00128D40 3000BF7B */  lq         $31, 0x30($sp)
/* 28E44 00128D44 2000B27B */  lq         $18, 0x20($sp)
/* 28E48 00128D48 1000B17B */  lq         $17, 0x10($sp)
/* 28E4C 00128D4C 0000B07B */  lq         $16, 0x0($sp)
/* 28E50 00128D50 4000BD27 */  addiu      $sp, $sp, 0x40
/* 28E54 00128D54 0800E003 */  jr         $31
/* 28E58 00128D58 00000000 */   nop
/* 28E5C 00128D5C 00000000 */  nop