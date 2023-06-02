.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdDMoveChara__FP10CCharacterP7CCamera
/* 70C70 00170B70 D0FCBD27 */  addiu      $sp, $sp, -0x330
/* 70C74 00170B74 5000BF7F */  sq         $31, 0x50($sp)
/* 70C78 00170B78 4000B27F */  sq         $18, 0x40($sp)
/* 70C7C 00170B7C 3000B17F */  sq         $17, 0x30($sp)
/* 70C80 00170B80 2000B07F */  sq         $16, 0x20($sp)
/* 70C84 00170B84 1400B9E7 */  swc1       $f25, 0x14($sp)
/* 70C88 00170B88 1000B8E7 */  swc1       $f24, 0x10($sp)
/* 70C8C 00170B8C 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* 70C90 00170B90 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 70C94 00170B94 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 70C98 00170B98 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 70C9C 00170B9C 28968070 */  paddub     $18, $4, $0
/* 70CA0 00170BA0 288EA070 */  paddub     $17, $5, $0
/* 70CA4 00170BA4 EF004012 */  beqz       $18, .L00170F64
/* 70CA8 00170BA8 00000000 */   nop
/* 70CAC 00170BAC 6000A527 */  addiu      $5, $sp, 0x60
/* 70CB0 00170BB0 A000598E */  lw         $25, 0xA0($18)
/* 70CB4 00170BB4 A000398F */  lw         $25, 0xA0($25)
/* 70CB8 00170BB8 09F82003 */  jalr       $25
/* 70CBC 00170BBC 00000000 */   nop
/* 70CC0 00170BC0 28264072 */  paddub     $4, $18, $0
/* 70CC4 00170BC4 9000A527 */  addiu      $5, $sp, 0x90
/* 70CC8 00170BC8 A000598E */  lw         $25, 0xA0($18)
/* 70CCC 00170BCC 5800398F */  lw         $25, 0x58($25)
/* 70CD0 00170BD0 09F82003 */  jalr       $25
/* 70CD4 00170BD4 00000000 */   nop
/* 70CD8 00170BD8 28262072 */  paddub     $4, $17, $0
/* 70CDC 00170BDC 7000A527 */  addiu      $5, $sp, 0x70
/* 70CE0 00170BE0 9C91040C */  jal        GetPos__7CCameraFPf
/* 70CE4 00170BE4 00000000 */   nop
/* 70CE8 00170BE8 28262072 */  paddub     $4, $17, $0
/* 70CEC 00170BEC 8000A527 */  addiu      $5, $sp, 0x80
/* 70CF0 00170BF0 A891040C */  jal        GetRef__7CCameraFPf
/* 70CF4 00170BF4 00000000 */   nop
/* 70CF8 00170BF8 A000A427 */  addiu      $4, $sp, 0xA0
/* 70CFC 00170BFC 8000A527 */  addiu      $5, $sp, 0x80
/* 70D00 00170C00 7000A627 */  addiu      $6, $sp, 0x70
/* 70D04 00170C04 EE85040C */  jal        sceVu0SubVector
/* 70D08 00170C08 00000000 */   nop
/* 70D0C 00170C0C A000ACC7 */  lwc1       $f12, 0xA0($sp)
/* 70D10 00170C10 A800ADC7 */  lwc1       $f13, 0xA8($sp)
/* 70D14 00170C14 5077040C */  jal        atan2f
/* 70D18 00170C18 00000000 */   nop
/* 70D1C 00170C1C 06050046 */  mov.s      $f20, $f0
/* 70D20 00170C20 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 70D24 00170C24 00A88244 */  mtc1       $2, $f21
/* 70D28 00170C28 CC01023C */  lui        $2, %hi(GamePad)
/* 70D2C 00170C2C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 70D30 00170C30 C4AD040C */  jal        GetLXf__8CGamePadFv
/* 70D34 00170C34 00000000 */   nop
/* 70D38 00170C38 87050046 */  neg.s      $f22, $f0
/* 70D3C 00170C3C CC01023C */  lui        $2, %hi(GamePad)
/* 70D40 00170C40 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 70D44 00170C44 B4AD040C */  jal        GetRYf__8CGamePadFv
/* 70D48 00170C48 00000000 */   nop
/* 70D4C 00170C4C C7050046 */  neg.s      $f23, $f0
/* 70D50 00170C50 CC01023C */  lui        $2, %hi(GamePad)
/* 70D54 00170C54 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 70D58 00170C58 D4AD040C */  jal        GetLYf__8CGamePadFv
/* 70D5C 00170C5C 00000000 */   nop
/* 70D60 00170C60 07060046 */  neg.s      $f24, $f0
/* 70D64 00170C64 CC01023C */  lui        $2, %hi(GamePad)
/* 70D68 00170C68 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 70D6C 00170C6C 08000524 */  addiu      $5, $0, 0x8
/* 70D70 00170C70 04AE040C */  jal        On__8CGamePadFi
/* 70D74 00170C74 00000000 */   nop
/* 70D78 00170C78 05004010 */  beqz       $2, .L00170C90
/* 70D7C 00170C7C 00000000 */   nop
/* 70D80 00170C80 9400A1C7 */  lwc1       $f1, 0x94($sp)
/* 70D84 00170C84 A48280C7 */  lwc1       $f0, -0x7D5C($gp)
/* 70D88 00170C88 00080046 */  add.s      $f0, $f1, $f0
/* 70D8C 00170C8C 9400A0E7 */  swc1       $f0, 0x94($sp)
.L00170C90:
/* 70D90 00170C90 CC01023C */  lui        $2, %hi(GamePad)
/* 70D94 00170C94 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 70D98 00170C98 04000524 */  addiu      $5, $0, 0x4
/* 70D9C 00170C9C 04AE040C */  jal        On__8CGamePadFi
/* 70DA0 00170CA0 00000000 */   nop
/* 70DA4 00170CA4 05004010 */  beqz       $2, .L00170CBC
/* 70DA8 00170CA8 00000000 */   nop
/* 70DAC 00170CAC 9400A1C7 */  lwc1       $f1, 0x94($sp)
/* 70DB0 00170CB0 A88280C7 */  lwc1       $f0, -0x7D58($gp)
/* 70DB4 00170CB4 00080046 */  add.s      $f0, $f1, $f0
/* 70DB8 00170CB8 9400A0E7 */  swc1       $f0, 0x94($sp)
.L00170CBC:
/* 70DBC 00170CBC 9400B027 */  addiu      $16, $sp, 0x94
/* 70DC0 00170CC0 000001C6 */  lwc1       $f1, 0x0($16)
/* 70DC4 00170CC4 288180C7 */  lwc1       $f0, -0x7ED8($gp)
/* 70DC8 00170CC8 36080046 */  c.le.s     $f1, $f0
/* 70DCC 00170CCC 00000000 */  nop
/* 70DD0 00170CD0 04000145 */  bc1t       .L00170CE4
/* 70DD4 00170CD4 00000000 */   nop
/* 70DD8 00170CD8 148280C7 */  lwc1       $f0, -0x7DEC($gp)
/* 70DDC 00170CDC 01080046 */  sub.s      $f0, $f1, $f0
/* 70DE0 00170CE0 000000E6 */  swc1       $f0, 0x0($16)
.L00170CE4:
/* 70DE4 00170CE4 000001C6 */  lwc1       $f1, 0x0($16)
/* 70DE8 00170CE8 AC8280C7 */  lwc1       $f0, -0x7D54($gp)
/* 70DEC 00170CEC 34080046 */  c.lt.s     $f1, $f0
/* 70DF0 00170CF0 00000000 */  nop
/* 70DF4 00170CF4 04000045 */  bc1f       .L00170D08
/* 70DF8 00170CF8 00000000 */   nop
/* 70DFC 00170CFC B08280C7 */  lwc1       $f0, -0x7D50($gp)
/* 70E00 00170D00 00080046 */  add.s      $f0, $f1, $f0
/* 70E04 00170D04 000000E6 */  swc1       $f0, 0x0($16)
.L00170D08:
/* 70E08 00170D08 06A30046 */  mov.s      $f12, $f20
/* 70E0C 00170D0C AC75040C */  jal        cosf
/* 70E10 00170D10 00000000 */   nop
/* 70E14 00170D14 42B60046 */  mul.s      $f25, $f22, $f0
/* 70E18 00170D18 06A30046 */  mov.s      $f12, $f20
/* 70E1C 00170D1C 2876040C */  jal        sinf
/* 70E20 00170D20 00000000 */   nop
/* 70E24 00170D24 02C00046 */  mul.s      $f0, $f24, $f0
/* 70E28 00170D28 00C80046 */  add.s      $f0, $f25, $f0
/* 70E2C 00170D2C B000A0E7 */  swc1       $f0, 0xB0($sp)
/* 70E30 00170D30 B400B7E7 */  swc1       $f23, 0xB4($sp)
/* 70E34 00170D34 06A30046 */  mov.s      $f12, $f20
/* 70E38 00170D38 AC75040C */  jal        cosf
/* 70E3C 00170D3C 00000000 */   nop
/* 70E40 00170D40 C2C50046 */  mul.s      $f23, $f24, $f0
/* 70E44 00170D44 06A30046 */  mov.s      $f12, $f20
/* 70E48 00170D48 2876040C */  jal        sinf
/* 70E4C 00170D4C 00000000 */   nop
/* 70E50 00170D50 02B00046 */  mul.s      $f0, $f22, $f0
/* 70E54 00170D54 01B80046 */  sub.s      $f0, $f23, $f0
/* 70E58 00170D58 B800A0E7 */  swc1       $f0, 0xB8($sp)
/* 70E5C 00170D5C CC01023C */  lui        $2, %hi(GamePad)
/* 70E60 00170D60 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 70E64 00170D64 80000524 */  addiu      $5, $0, 0x80
/* 70E68 00170D68 04AE040C */  jal        On__8CGamePadFi
/* 70E6C 00170D6C 00000000 */   nop
/* 70E70 00170D70 03004010 */  beqz       $2, .L00170D80
/* 70E74 00170D74 00000000 */   nop
/* 70E78 00170D78 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 70E7C 00170D7C 00A88244 */  mtc1       $2, $f21
.L00170D80:
/* 70E80 00170D80 B000A427 */  addiu      $4, $sp, 0xB0
/* 70E84 00170D84 282E8070 */  paddub     $5, $4, $0
/* 70E88 00170D88 06AB0046 */  mov.s      $f12, $f21
/* 70E8C 00170D8C FA85040C */  jal        sceVu0ScaleVector
/* 70E90 00170D90 00000000 */   nop
/* 70E94 00170D94 6000A427 */  addiu      $4, $sp, 0x60
/* 70E98 00170D98 282E8070 */  paddub     $5, $4, $0
/* 70E9C 00170D9C B000A627 */  addiu      $6, $sp, 0xB0
/* 70EA0 00170DA0 E885040C */  jal        sceVu0AddVector
/* 70EA4 00170DA4 00000000 */   nop
/* 70EA8 00170DA8 28264072 */  paddub     $4, $18, $0
/* 70EAC 00170DAC 6000A527 */  addiu      $5, $sp, 0x60
/* 70EB0 00170DB0 A000598E */  lw         $25, 0xA0($18)
/* 70EB4 00170DB4 1400398F */  lw         $25, 0x14($25)
/* 70EB8 00170DB8 09F82003 */  jalr       $25
/* 70EBC 00170DBC 00000000 */   nop
/* 70EC0 00170DC0 28264072 */  paddub     $4, $18, $0
/* 70EC4 00170DC4 9000A527 */  addiu      $5, $sp, 0x90
/* 70EC8 00170DC8 A000598E */  lw         $25, 0xA0($18)
/* 70ECC 00170DCC 3400398F */  lw         $25, 0x34($25)
/* 70ED0 00170DD0 09F82003 */  jalr       $25
/* 70ED4 00170DD4 00000000 */   nop
/* 70ED8 00170DD8 CC01023C */  lui        $2, %hi(GamePad)
/* 70EDC 00170DDC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 70EE0 00170DE0 10000524 */  addiu      $5, $0, 0x10
/* 70EE4 00170DE4 1CAE040C */  jal        Down__8CGamePadFi
/* 70EE8 00170DE8 00000000 */   nop
/* 70EEC 00170DEC 0F004010 */  beqz       $2, .L00170E2C
/* 70EF0 00170DF0 00000000 */   nop
/* 70EF4 00170DF4 8000A427 */  addiu      $4, $sp, 0x80
/* 70EF8 00170DF8 6000A527 */  addiu      $5, $sp, 0x60
/* 70EFC 00170DFC 0C86040C */  jal        sceVu0CopyVector
/* 70F00 00170E00 00000000 */   nop
/* 70F04 00170E04 D48081C7 */  lwc1       $f1, -0x7F2C($gp)
/* 70F08 00170E08 B40040C6 */  lwc1       $f0, 0xB4($18)
/* 70F0C 00170E0C 42080046 */  mul.s      $f1, $f1, $f0
/* 70F10 00170E10 8400A0C7 */  lwc1       $f0, 0x84($sp)
/* 70F14 00170E14 00000146 */  add.s      $f0, $f0, $f1
/* 70F18 00170E18 8400A0E7 */  swc1       $f0, 0x84($sp)
/* 70F1C 00170E1C 28262072 */  paddub     $4, $17, $0
/* 70F20 00170E20 8000A527 */  addiu      $5, $sp, 0x80
/* 70F24 00170E24 C490040C */  jal        SetRef__7CCameraFPf
/* 70F28 00170E28 00000000 */   nop
.L00170E2C:
/* 70F2C 00170E2C E00C54C6 */  lwc1       $f20, 0xCE0($18)
/* 70F30 00170E30 CC01023C */  lui        $2, %hi(GamePad)
/* 70F34 00170E34 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 70F38 00170E38 02000524 */  addiu      $5, $0, 0x2
/* 70F3C 00170E3C 04AE040C */  jal        On__8CGamePadFi
/* 70F40 00170E40 00000000 */   nop
/* 70F44 00170E44 03004010 */  beqz       $2, .L00170E54
/* 70F48 00170E48 00000000 */   nop
/* 70F4C 00170E4C 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* 70F50 00170E50 00A50046 */  add.s      $f20, $f20, $f0
.L00170E54:
/* 70F54 00170E54 CC01023C */  lui        $2, %hi(GamePad)
/* 70F58 00170E58 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 70F5C 00170E5C 01000524 */  addiu      $5, $0, 0x1
/* 70F60 00170E60 04AE040C */  jal        On__8CGamePadFi
/* 70F64 00170E64 00000000 */   nop
/* 70F68 00170E68 03004010 */  beqz       $2, .L00170E78
/* 70F6C 00170E6C 00000000 */   nop
/* 70F70 00170E70 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* 70F74 00170E74 01A50046 */  sub.s      $f20, $f20, $f0
.L00170E78:
/* 70F78 00170E78 E00C40C6 */  lwc1       $f0, 0xCE0($18)
/* 70F7C 00170E7C 32A00046 */  c.eq.s     $f20, $f0
/* 70F80 00170E80 00000000 */  nop
/* 70F84 00170E84 04000145 */  bc1t       .L00170E98
/* 70F88 00170E88 00000000 */   nop
/* 70F8C 00170E8C E00C54E6 */  swc1       $f20, 0xCE0($18)
/* 70F90 00170E90 E40C54E6 */  swc1       $f20, 0xCE4($18)
/* 70F94 00170E94 E80C54E6 */  swc1       $f20, 0xCE8($18)
.L00170E98:
/* 70F98 00170E98 C000A427 */  addiu      $4, $sp, 0xC0
/* 70F9C 00170E9C 70A8040C */  jal        __ct__6CFrameFv
/* 70FA0 00170EA0 00000000 */   nop
/* 70FA4 00170EA4 2003A327 */  addiu      $3, $sp, 0x320
/* 70FA8 00170EA8 488782DF */  ld         $2, -0x78B8($gp)
/* 70FAC 00170EAC 000062FC */  sd         $2, 0x0($3)
/* 70FB0 00170EB0 2803A327 */  addiu      $3, $sp, 0x328
/* 70FB4 00170EB4 508782DF */  ld         $2, -0x78B0($gp)
/* 70FB8 00170EB8 000062FC */  sd         $2, 0x0($3)
/* 70FBC 00170EBC 28260070 */  paddub     $4, $0, $0
/* 70FC0 00170EC0 18000010 */  b          .L00170F24
/* 70FC4 00170EC4 00000000 */   nop
.L00170EC8:
/* 70FC8 00170EC8 01008230 */  andi       $2, $4, 0x1
/* 70FCC 00170ECC 2B100200 */  sltu       $2, $0, $2
/* 70FD0 00170ED0 80100200 */  sll        $2, $2, 2
/* 70FD4 00170ED4 21105D00 */  addu       $2, $2, $sp
/* 70FD8 00170ED8 200340C4 */  lwc1       $f0, 0x320($2)
/* 70FDC 00170EDC 00110400 */  sll        $2, $4, 4
/* 70FE0 00170EE0 21185D00 */  addu       $3, $2, $sp
/* 70FE4 00170EE4 F00060E4 */  swc1       $f0, 0xF0($3)
/* 70FE8 00170EE8 02008230 */  andi       $2, $4, 0x2
/* 70FEC 00170EEC 2B100200 */  sltu       $2, $0, $2
/* 70FF0 00170EF0 80100200 */  sll        $2, $2, 2
/* 70FF4 00170EF4 21105D00 */  addu       $2, $2, $sp
/* 70FF8 00170EF8 280340C4 */  lwc1       $f0, 0x328($2)
/* 70FFC 00170EFC F40060E4 */  swc1       $f0, 0xF4($3)
/* 71000 00170F00 04008230 */  andi       $2, $4, 0x4
/* 71004 00170F04 2B100200 */  sltu       $2, $0, $2
/* 71008 00170F08 80100200 */  sll        $2, $2, 2
/* 7100C 00170F0C 21105D00 */  addu       $2, $2, $sp
/* 71010 00170F10 200340C4 */  lwc1       $f0, 0x320($2)
/* 71014 00170F14 F80060E4 */  swc1       $f0, 0xF8($3)
/* 71018 00170F18 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 7101C 00170F1C FC0062AC */  sw         $2, 0xFC($3)
/* 71020 00170F20 01008424 */  addiu      $4, $4, 0x1
.L00170F24:
/* 71024 00170F24 08008228 */  slti       $2, $4, 0x8
/* 71028 00170F28 E7FF4014 */  bnez       $2, .L00170EC8
/* 7102C 00170F2C 00000000 */   nop
/* 71030 00170F30 C000A427 */  addiu      $4, $sp, 0xC0
/* 71034 00170F34 6000A527 */  addiu      $5, $sp, 0x60
/* 71038 00170F38 B89F040C */  jal        SetPosition__6CFrameFPf
/* 7103C 00170F3C 00000000 */   nop
/* 71040 00170F40 C000A427 */  addiu      $4, $sp, 0xC0
/* 71044 00170F44 9000ACC7 */  lwc1       $f12, 0x90($sp)
/* 71048 00170F48 00000DC6 */  lwc1       $f13, 0x0($16)
/* 7104C 00170F4C 9800AEC7 */  lwc1       $f14, 0x98($sp)
/* 71050 00170F50 70A3040C */  jal        SetRotation__6CFrameFfff
/* 71054 00170F54 00000000 */   nop
/* 71058 00170F58 C000A427 */  addiu      $4, $sp, 0xC0
/* 7105C 00170F5C E8C3050C */  jal        DrawBound__FP6CFrame
/* 71060 00170F60 00000000 */   nop
.L00170F64:
/* 71064 00170F64 5000BF7B */  lq         $31, 0x50($sp)
/* 71068 00170F68 4000B27B */  lq         $18, 0x40($sp)
/* 7106C 00170F6C 3000B17B */  lq         $17, 0x30($sp)
/* 71070 00170F70 2000B07B */  lq         $16, 0x20($sp)
/* 71074 00170F74 1400B9C7 */  lwc1       $f25, 0x14($sp)
/* 71078 00170F78 1000B8C7 */  lwc1       $f24, 0x10($sp)
/* 7107C 00170F7C 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* 71080 00170F80 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 71084 00170F84 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 71088 00170F88 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 7108C 00170F8C 3003BD27 */  addiu      $sp, $sp, 0x330
/* 71090 00170F90 0800E003 */  jr         $31
/* 71094 00170F94 00000000 */   nop
/* 71098 00170F98 00000000 */  nop
/* 7109C 00170F9C 00000000 */  nop