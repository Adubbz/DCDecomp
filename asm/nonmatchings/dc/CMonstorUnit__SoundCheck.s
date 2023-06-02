.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SoundCheck__12CMonstorUnitFv
/* D8A90 001D8990 90FFBD27 */  addiu      $sp, $sp, -0x70
/* D8A94 001D8994 4000BF7F */  sq         $31, 0x40($sp)
/* D8A98 001D8998 3000B27F */  sq         $18, 0x30($sp)
/* D8A9C 001D899C 2000B17F */  sq         $17, 0x20($sp)
/* D8AA0 001D89A0 1000B07F */  sq         $16, 0x10($sp)
/* D8AA4 001D89A4 0800B6E7 */  swc1       $f22, 0x8($sp)
/* D8AA8 001D89A8 0400B5E7 */  swc1       $f21, 0x4($sp)
/* D8AAC 001D89AC 0000B4E7 */  swc1       $f20, 0x0($sp)
/* D8AB0 001D89B0 28968070 */  paddub     $18, $4, $0
/* D8AB4 001D89B4 9000838C */  lw         $3, 0x90($4)
/* D8AB8 001D89B8 10350224 */  addiu      $2, $0, 0x3510
/* D8ABC 001D89BC 18106200 */  mult       $2, $3, $2
/* D8AC0 001D89C0 21108200 */  addu       $2, $4, $2
/* D8AC4 001D89C4 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* D8AC8 001D89C8 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* D8ACC 001D89CC 21204100 */  addu       $4, $2, $at
/* D8AD0 001D89D0 5000A527 */  addiu      $5, $sp, 0x50
/* D8AD4 001D89D4 A000998C */  lw         $25, 0xA0($4)
/* D8AD8 001D89D8 A000398F */  lw         $25, 0xA0($25)
/* D8ADC 001D89DC 09F82003 */  jalr       $25
/* D8AE0 001D89E0 00000000 */   nop
/* D8AE4 001D89E4 9000458E */  lw         $5, 0x90($18)
/* D8AE8 001D89E8 10350324 */  addiu      $3, $0, 0x3510
/* D8AEC 001D89EC 1818A300 */  mult       $3, $5, $3
/* D8AF0 001D89F0 21187200 */  addu       $3, $3, $18
/* D8AF4 001D89F4 0200013C */  lui        $at, (0x20000 >> 16)
/* D8AF8 001D89F8 21086100 */  addu       $at, $3, $at
/* D8AFC 001D89FC C0FF34C4 */  lwc1       $f20, -0x40($at)
/* D8B00 001D8A00 4842033C */  lui        $3, (0x42480000 >> 16)
/* D8B04 001D8A04 00A88344 */  mtc1       $3, $f21
/* D8B08 001D8A08 FA43033C */  lui        $3, (0x43FA0000 >> 16)
/* D8B0C 001D8A0C 00B08344 */  mtc1       $3, $f22
/* D8B10 001D8A10 80180500 */  sll        $3, $5, 2
/* D8B14 001D8A14 21206500 */  addu       $4, $3, $5
/* D8B18 001D8A18 80180400 */  sll        $3, $4, 2
/* D8B1C 001D8A1C 21188300 */  addu       $3, $4, $3
/* D8B20 001D8A20 00190300 */  sll        $3, $3, 4
/* D8B24 001D8A24 21187200 */  addu       $3, $3, $18
/* D8B28 001D8A28 0200013C */  lui        $at, (0x20000 >> 16)
/* D8B2C 001D8A2C 21086100 */  addu       $at, $3, $at
/* D8B30 001D8A30 10E42484 */  lh         $4, -0x1BF0($at)
/* D8B34 001D8A34 02000324 */  addiu      $3, $0, 0x2
/* D8B38 001D8A38 05008314 */  bne        $4, $3, .L001D8A50
/* D8B3C 001D8A3C 00000000 */   nop
/* D8B40 001D8A40 AF43033C */  lui        $3, (0x43AF0000 >> 16)
/* D8B44 001D8A44 00A88344 */  mtc1       $3, $f21
/* D8B48 001D8A48 7A44033C */  lui        $3, (0x447A0000 >> 16)
/* D8B4C 001D8A4C 00B08344 */  mtc1       $3, $f22
.L001D8A50:
/* D8B50 001D8A50 00190500 */  sll        $3, $5, 4
/* D8B54 001D8A54 21186500 */  addu       $3, $3, $5
/* D8B58 001D8A58 00190300 */  sll        $3, $3, 4
/* D8B5C 001D8A5C 21187200 */  addu       $3, $3, $18
/* D8B60 001D8A60 0600013C */  lui        $at, (0x60000 >> 16)
/* D8B64 001D8A64 21086100 */  addu       $at, $3, $at
/* D8B68 001D8A68 50EF20C4 */  lwc1       $f0, -0x10B0($at)
/* D8B6C 001D8A6C 36001446 */  c.le.s     $f0, $f20
/* D8B70 001D8A70 00000000 */  nop
/* D8B74 001D8A74 30000045 */  bc1f       .L001D8B38
/* D8B78 001D8A78 00000000 */   nop
/* D8B7C 001D8A7C 0600013C */  lui        $at, (0x60000 >> 16)
/* D8B80 001D8A80 21086100 */  addu       $at, $3, $at
/* D8B84 001D8A84 54EF20C4 */  lwc1       $f0, -0x10AC($at)
/* D8B88 001D8A88 36001446 */  c.le.s     $f0, $f20
/* D8B8C 001D8A8C 00000000 */  nop
/* D8B90 001D8A90 29000145 */  bc1t       .L001D8B38
/* D8B94 001D8A94 00000000 */   nop
/* D8B98 001D8A98 40300500 */  sll        $6, $5, 1
/* D8B9C 001D8A9C 0600013C */  lui        $at, (0x60000 >> 16)
/* D8BA0 001D8AA0 21086100 */  addu       $at, $3, $at
/* D8BA4 001D8AA4 5CEF248C */  lw         $4, -0x10A4($at)
/* D8BA8 001D8AA8 0600013C */  lui        $at, (0x60000 >> 16)
/* D8BAC 001D8AAC 21086100 */  addu       $at, $3, $at
/* D8BB0 001D8AB0 58EF258C */  lw         $5, -0x10A8($at)
/* D8BB4 001D8AB4 C86B050C */  jal        SndSeSeqPlayStop__Fiii
/* D8BB8 001D8AB8 00000000 */   nop
/* D8BBC 001D8ABC 6000A427 */  addiu      $4, $sp, 0x60
/* D8BC0 001D8AC0 6400A527 */  addiu      $5, $sp, 0x64
/* D8BC4 001D8AC4 5000A627 */  addiu      $6, $sp, 0x50
/* D8BC8 001D8AC8 06AB0046 */  mov.s      $f12, $f21
/* D8BCC 001D8ACC 46B30046 */  mov.s      $f13, $f22
/* D8BD0 001D8AD0 006B050C */  jal        SndGetVolPan__FPfPfPfff
/* D8BD4 001D8AD4 00000000 */   nop
/* D8BD8 001D8AD8 9000438E */  lw         $3, 0x90($18)
/* D8BDC 001D8ADC 00110300 */  sll        $2, $3, 4
/* D8BE0 001D8AE0 21104300 */  addu       $2, $2, $3
/* D8BE4 001D8AE4 00110200 */  sll        $2, $2, 4
/* D8BE8 001D8AE8 21105200 */  addu       $2, $2, $18
/* D8BEC 001D8AEC 40280300 */  sll        $5, $3, 1
/* D8BF0 001D8AF0 0600013C */  lui        $at, (0x60000 >> 16)
/* D8BF4 001D8AF4 21084100 */  addu       $at, $2, $at
/* D8BF8 001D8AF8 5CEF248C */  lw         $4, -0x10A4($at)
/* D8BFC 001D8AFC 6000ACC7 */  lwc1       $f12, 0x60($sp)
/* D8C00 001D8B00 AC6A050C */  jal        SndSetSeVolf__Fifi
/* D8C04 001D8B04 00000000 */   nop
/* D8C08 001D8B08 9000438E */  lw         $3, 0x90($18)
/* D8C0C 001D8B0C 00110300 */  sll        $2, $3, 4
/* D8C10 001D8B10 21104300 */  addu       $2, $2, $3
/* D8C14 001D8B14 00110200 */  sll        $2, $2, 4
/* D8C18 001D8B18 21105200 */  addu       $2, $2, $18
/* D8C1C 001D8B1C 40280300 */  sll        $5, $3, 1
/* D8C20 001D8B20 0600013C */  lui        $at, (0x60000 >> 16)
/* D8C24 001D8B24 21084100 */  addu       $at, $2, $at
/* D8C28 001D8B28 5CEF248C */  lw         $4, -0x10A4($at)
/* D8C2C 001D8B2C 6400ACC7 */  lwc1       $f12, 0x64($sp)
/* D8C30 001D8B30 C46A050C */  jal        SndSetSePanf__Fifi
/* D8C34 001D8B34 00000000 */   nop
.L001D8B38:
/* D8C38 001D8B38 28860070 */  paddub     $16, $0, $0
/* D8C3C 001D8B3C 55000010 */  b          .L001D8C94
/* D8C40 001D8B40 00000000 */   nop
.L001D8B44:
/* D8C44 001D8B44 9000448E */  lw         $4, 0x90($18)
/* D8C48 001D8B48 00190400 */  sll        $3, $4, 4
/* D8C4C 001D8B4C 21186400 */  addu       $3, $3, $4
/* D8C50 001D8B50 00190300 */  sll        $3, $3, 4
/* D8C54 001D8B54 21187200 */  addu       $3, $3, $18
/* D8C58 001D8B58 80881000 */  sll        $17, $16, 2
/* D8C5C 001D8B5C 21302302 */  addu       $6, $17, $3
/* D8C60 001D8B60 0500013C */  lui        $at, (0x5EF10 >> 16)
/* D8C64 001D8B64 10EF2134 */  ori        $at, $at, (0x5EF10 & 0xFFFF)
/* D8C68 001D8B68 2120C100 */  addu       $4, $6, $at
/* D8C6C 001D8B6C 0000838C */  lw         $3, 0x0($4)
/* D8C70 001D8B70 05006018 */  blez       $3, .L001D8B88
/* D8C74 001D8B74 00000000 */   nop
/* D8C78 001D8B78 FFFF6324 */  addiu      $3, $3, -0x1
/* D8C7C 001D8B7C 000083AC */  sw         $3, 0x0($4)
/* D8C80 001D8B80 43000010 */  b          .L001D8C90
/* D8C84 001D8B84 00000000 */   nop
.L001D8B88:
/* D8C88 001D8B88 0600013C */  lui        $at, (0x60000 >> 16)
/* D8C8C 001D8B8C 2108C100 */  addu       $at, $6, $at
/* D8C90 001D8B90 D0EE248C */  lw         $4, -0x1130($at)
/* D8C94 001D8B94 FFFF0524 */  addiu      $5, $0, -0x1
/* D8C98 001D8B98 3D008510 */  beq        $4, $5, .L001D8C90
/* D8C9C 001D8B9C 00000000 */   nop
/* D8CA0 001D8BA0 0600013C */  lui        $at, (0x60000 >> 16)
/* D8CA4 001D8BA4 2108C100 */  addu       $at, $6, $at
/* D8CA8 001D8BA8 50EE20C4 */  lwc1       $f0, -0x11B0($at)
/* D8CAC 001D8BAC 36001446 */  c.le.s     $f0, $f20
/* D8CB0 001D8BB0 00000000 */  nop
/* D8CB4 001D8BB4 36000045 */  bc1f       .L001D8C90
/* D8CB8 001D8BB8 00000000 */   nop
/* D8CBC 001D8BBC 0600013C */  lui        $at, (0x60000 >> 16)
/* D8CC0 001D8BC0 2108C100 */  addu       $at, $6, $at
/* D8CC4 001D8BC4 90EE20C4 */  lwc1       $f0, -0x1170($at)
/* D8CC8 001D8BC8 36001446 */  c.le.s     $f0, $f20
/* D8CCC 001D8BCC 00000000 */  nop
/* D8CD0 001D8BD0 2F000145 */  bc1t       .L001D8C90
/* D8CD4 001D8BD4 00000000 */   nop
/* D8CD8 001D8BD8 28360070 */  paddub     $6, $0, $0
/* D8CDC 001D8BDC AC69050C */  jal        SndSePlay__Fiii
/* D8CE0 001D8BE0 00000000 */   nop
/* D8CE4 001D8BE4 6800A427 */  addiu      $4, $sp, 0x68
/* D8CE8 001D8BE8 6C00A527 */  addiu      $5, $sp, 0x6C
/* D8CEC 001D8BEC 5000A627 */  addiu      $6, $sp, 0x50
/* D8CF0 001D8BF0 06AB0046 */  mov.s      $f12, $f21
/* D8CF4 001D8BF4 46B30046 */  mov.s      $f13, $f22
/* D8CF8 001D8BF8 006B050C */  jal        SndGetVolPan__FPfPfPfff
/* D8CFC 001D8BFC 00000000 */   nop
/* D8D00 001D8C00 9000438E */  lw         $3, 0x90($18)
/* D8D04 001D8C04 00110300 */  sll        $2, $3, 4
/* D8D08 001D8C08 21104300 */  addu       $2, $2, $3
/* D8D0C 001D8C0C 00110200 */  sll        $2, $2, 4
/* D8D10 001D8C10 21105200 */  addu       $2, $2, $18
/* D8D14 001D8C14 21102202 */  addu       $2, $17, $2
/* D8D18 001D8C18 0600013C */  lui        $at, (0x60000 >> 16)
/* D8D1C 001D8C1C 21084100 */  addu       $at, $2, $at
/* D8D20 001D8C20 D0EE248C */  lw         $4, -0x1130($at)
/* D8D24 001D8C24 6800ACC7 */  lwc1       $f12, 0x68($sp)
/* D8D28 001D8C28 282E0070 */  paddub     $5, $0, $0
/* D8D2C 001D8C2C AC6A050C */  jal        SndSetSeVolf__Fifi
/* D8D30 001D8C30 00000000 */   nop
/* D8D34 001D8C34 9000438E */  lw         $3, 0x90($18)
/* D8D38 001D8C38 00110300 */  sll        $2, $3, 4
/* D8D3C 001D8C3C 21104300 */  addu       $2, $2, $3
/* D8D40 001D8C40 00110200 */  sll        $2, $2, 4
/* D8D44 001D8C44 21105200 */  addu       $2, $2, $18
/* D8D48 001D8C48 21102202 */  addu       $2, $17, $2
/* D8D4C 001D8C4C 0600013C */  lui        $at, (0x60000 >> 16)
/* D8D50 001D8C50 21084100 */  addu       $at, $2, $at
/* D8D54 001D8C54 D0EE248C */  lw         $4, -0x1130($at)
/* D8D58 001D8C58 6C00ACC7 */  lwc1       $f12, 0x6C($sp)
/* D8D5C 001D8C5C 282E0070 */  paddub     $5, $0, $0
/* D8D60 001D8C60 C46A050C */  jal        SndSetSePanf__Fifi
/* D8D64 001D8C64 00000000 */   nop
/* D8D68 001D8C68 0A000524 */  addiu      $5, $0, 0xA
/* D8D6C 001D8C6C 9000448E */  lw         $4, 0x90($18)
/* D8D70 001D8C70 00190400 */  sll        $3, $4, 4
/* D8D74 001D8C74 21186400 */  addu       $3, $3, $4
/* D8D78 001D8C78 00190300 */  sll        $3, $3, 4
/* D8D7C 001D8C7C 21187200 */  addu       $3, $3, $18
/* D8D80 001D8C80 21182302 */  addu       $3, $17, $3
/* D8D84 001D8C84 0600013C */  lui        $at, (0x60000 >> 16)
/* D8D88 001D8C88 21086100 */  addu       $at, $3, $at
/* D8D8C 001D8C8C 10EF25AC */  sw         $5, -0x10F0($at)
.L001D8C90:
/* D8D90 001D8C90 01001026 */  addiu      $16, $16, 0x1
.L001D8C94:
/* D8D94 001D8C94 1000032A */  slti       $3, $16, 0x10
/* D8D98 001D8C98 AAFF6014 */  bnez       $3, .L001D8B44
/* D8D9C 001D8C9C 00000000 */   nop
/* D8DA0 001D8CA0 4000BF7B */  lq         $31, 0x40($sp)
/* D8DA4 001D8CA4 3000B27B */  lq         $18, 0x30($sp)
/* D8DA8 001D8CA8 2000B17B */  lq         $17, 0x20($sp)
/* D8DAC 001D8CAC 1000B07B */  lq         $16, 0x10($sp)
/* D8DB0 001D8CB0 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* D8DB4 001D8CB4 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* D8DB8 001D8CB8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* D8DBC 001D8CBC 7000BD27 */  addiu      $sp, $sp, 0x70
/* D8DC0 001D8CC0 0800E003 */  jr         $31
/* D8DC4 001D8CC4 00000000 */   nop
/* D8DC8 001D8CC8 00000000 */  nop
/* D8DCC 001D8CCC 00000000 */  nop
