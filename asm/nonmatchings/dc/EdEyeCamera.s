.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdEyeCamera__FP7CCameraP10CCharacter
/* 6A0F0 00169FF0 10FFBD27 */  addiu      $sp, $sp, -0xF0
/* 6A0F4 00169FF4 4000BF7F */  sq         $31, 0x40($sp)
/* 6A0F8 00169FF8 3000B37F */  sq         $19, 0x30($sp)
/* 6A0FC 00169FFC 2000B27F */  sq         $18, 0x20($sp)
/* 6A100 0016A000 1000B17F */  sq         $17, 0x10($sp)
/* 6A104 0016A004 0000B07F */  sq         $16, 0x0($sp)
/* 6A108 0016A008 28868070 */  paddub     $16, $4, $0
/* 6A10C 0016A00C 289EA070 */  paddub     $19, $5, $0
/* 6A110 0016A010 6000A0AF */  sw         $0, 0x60($sp)
/* 6A114 0016A014 6400B127 */  addiu      $17, $sp, 0x64
/* 6A118 0016A018 000020AE */  sw         $0, 0x0($17)
/* 6A11C 0016A01C 2041023C */  lui        $2, (0x41200000 >> 16)
/* 6A120 0016A020 6800B227 */  addiu      $18, $sp, 0x68
/* 6A124 0016A024 000042AE */  sw         $2, 0x0($18)
/* 6A128 0016A028 6C00A0AF */  sw         $0, 0x6C($sp)
/* 6A12C 0016A02C B000A427 */  addiu      $4, $sp, 0xB0
/* 6A130 0016A030 2A86040C */  jal        sceVu0UnitMatrix
/* 6A134 0016A034 00000000 */   nop
/* 6A138 0016A038 7000A427 */  addiu      $4, $sp, 0x70
/* 6A13C 0016A03C B000A527 */  addiu      $5, $sp, 0xB0
/* 6A140 0016A040 048F8CC7 */  lwc1       $f12, -0x70FC($gp)
/* 6A144 0016A044 7C86040C */  jal        sceVu0RotMatrixX
/* 6A148 0016A048 00000000 */   nop
/* 6A14C 0016A04C 7000A427 */  addiu      $4, $sp, 0x70
/* 6A150 0016A050 282E8070 */  paddub     $5, $4, $0
/* 6A154 0016A054 008F8CC7 */  lwc1       $f12, -0x7100($gp)
/* 6A158 0016A058 A686040C */  jal        sceVu0RotMatrixY
/* 6A15C 0016A05C 00000000 */   nop
/* 6A160 0016A060 6000A427 */  addiu      $4, $sp, 0x60
/* 6A164 0016A064 7000A527 */  addiu      $5, $sp, 0x70
/* 6A168 0016A068 28368070 */  paddub     $6, $4, $0
/* 6A16C 0016A06C 6285040C */  jal        sceVu0ApplyMatrix
/* 6A170 0016A070 00000000 */   nop
/* 6A174 0016A074 28266072 */  paddub     $4, $19, $0
/* 6A178 0016A078 5000A527 */  addiu      $5, $sp, 0x50
/* 6A17C 0016A07C A000798E */  lw         $25, 0xA0($19)
/* 6A180 0016A080 A000398F */  lw         $25, 0xA0($25)
/* 6A184 0016A084 09F82003 */  jalr       $25
/* 6A188 0016A088 00000000 */   nop
/* 6A18C 0016A08C 5400A327 */  addiu      $3, $sp, 0x54
/* 6A190 0016A090 000061C4 */  lwc1       $f1, 0x0($3)
/* 6A194 0016A094 6041023C */  lui        $2, (0x41600000 >> 16)
/* 6A198 0016A098 00008244 */  mtc1       $2, $f0
/* 6A19C 0016A09C 00000000 */  nop
/* 6A1A0 0016A0A0 00080046 */  add.s      $f0, $f1, $f0
/* 6A1A4 0016A0A4 000060E4 */  swc1       $f0, 0x0($3)
/* 6A1A8 0016A0A8 6000A1C7 */  lwc1       $f1, 0x60($sp)
/* 6A1AC 0016A0AC 5000A0C7 */  lwc1       $f0, 0x50($sp)
/* 6A1B0 0016A0B0 00080046 */  add.s      $f0, $f1, $f0
/* 6A1B4 0016A0B4 6000A0E7 */  swc1       $f0, 0x60($sp)
/* 6A1B8 0016A0B8 000021C6 */  lwc1       $f1, 0x0($17)
/* 6A1BC 0016A0BC 000060C4 */  lwc1       $f0, 0x0($3)
/* 6A1C0 0016A0C0 00080046 */  add.s      $f0, $f1, $f0
/* 6A1C4 0016A0C4 000020E6 */  swc1       $f0, 0x0($17)
/* 6A1C8 0016A0C8 000041C6 */  lwc1       $f1, 0x0($18)
/* 6A1CC 0016A0CC 5800A0C7 */  lwc1       $f0, 0x58($sp)
/* 6A1D0 0016A0D0 00080046 */  add.s      $f0, $f1, $f0
/* 6A1D4 0016A0D4 000040E6 */  swc1       $f0, 0x0($18)
/* 6A1D8 0016A0D8 28260072 */  paddub     $4, $16, $0
/* 6A1DC 0016A0DC 5000A527 */  addiu      $5, $sp, 0x50
/* 6A1E0 0016A0E0 A490040C */  jal        SetPos__7CCameraFPf
/* 6A1E4 0016A0E4 00000000 */   nop
/* 6A1E8 0016A0E8 28260072 */  paddub     $4, $16, $0
/* 6A1EC 0016A0EC 6000A527 */  addiu      $5, $sp, 0x60
/* 6A1F0 0016A0F0 C490040C */  jal        SetRef__7CCameraFPf
/* 6A1F4 0016A0F4 00000000 */   nop
/* 6A1F8 0016A0F8 4000BF7B */  lq         $31, 0x40($sp)
/* 6A1FC 0016A0FC 3000B37B */  lq         $19, 0x30($sp)
/* 6A200 0016A100 2000B27B */  lq         $18, 0x20($sp)
/* 6A204 0016A104 1000B17B */  lq         $17, 0x10($sp)
/* 6A208 0016A108 0000B07B */  lq         $16, 0x0($sp)
/* 6A20C 0016A10C F000BD27 */  addiu      $sp, $sp, 0xF0
/* 6A210 0016A110 0800E003 */  jr         $31
/* 6A214 0016A114 00000000 */   nop
/* 6A218 0016A118 00000000 */  nop
/* 6A21C 0016A11C 00000000 */  nop
