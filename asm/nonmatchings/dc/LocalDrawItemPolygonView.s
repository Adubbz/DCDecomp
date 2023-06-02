.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LocalDrawItemPolygonView__Fv
/* 12B040 0022AF40 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 12B044 0022AF44 1000BF7F */  sq         $31, 0x10($sp)
/* 12B048 0022AF48 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 12B04C 0022AF4C 9897838F */  lw         $3, -0x6868($gp)
/* 12B050 0022AF50 91006010 */  beqz       $3, .L0022B198
/* 12B054 0022AF54 00000000 */   nop
/* 12B058 0022AF58 9497838F */  lw         $3, -0x686C($gp)
/* 12B05C 0022AF5C 8E006010 */  beqz       $3, .L0022B198
/* 12B060 0022AF60 00000000 */   nop
/* 12B064 0022AF64 9C97838F */  lw         $3, -0x6864($gp)
/* 12B068 0022AF68 8B006010 */  beqz       $3, .L0022B198
/* 12B06C 0022AF6C 00000000 */   nop
/* 12B070 0022AF70 CC01023C */  lui        $2, %hi(GamePad)
/* 12B074 0022AF74 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12B078 0022AF78 A4AD040C */  jal        GetRXf__8CGamePadFv
/* 12B07C 0022AF7C 00000000 */   nop
/* 12B080 0022AF80 06050046 */  mov.s      $f20, $f0
/* 12B084 0022AF84 CC01023C */  lui        $2, %hi(GamePad)
/* 12B088 0022AF88 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12B08C 0022AF8C B4AD040C */  jal        GetRYf__8CGamePadFv
/* 12B090 0022AF90 00000000 */   nop
/* 12B094 0022AF94 2900013C */  lui        $at, (0x294300 >> 16)
/* 12B098 0022AF98 004321C4 */  lwc1       $f1, (0x294300 & 0xFFFF)($at)
/* 12B09C 0022AF9C 0042023C */  lui        $2, (0x42000000 >> 16)
/* 12B0A0 0022AFA0 00108244 */  mtc1       $2, $f2
/* 12B0A4 0022AFA4 00000000 */  nop
/* 12B0A8 0022AFA8 03000246 */  div.s      $f0, $f0, $f2
/* 12B0AC 0022AFAC 00080046 */  add.s      $f0, $f1, $f0
/* 12B0B0 0022AFB0 2900013C */  lui        $at, (0x294300 >> 16)
/* 12B0B4 0022AFB4 004320E4 */  swc1       $f0, (0x294300 & 0xFFFF)($at)
/* 12B0B8 0022AFB8 2900013C */  lui        $at, (0x294304 >> 16)
/* 12B0BC 0022AFBC 044321C4 */  lwc1       $f1, (0x294304 & 0xFFFF)($at)
/* 12B0C0 0022AFC0 03A00246 */  div.s      $f0, $f20, $f2
/* 12B0C4 0022AFC4 00080046 */  add.s      $f0, $f1, $f0
/* 12B0C8 0022AFC8 2900013C */  lui        $at, (0x294304 >> 16)
/* 12B0CC 0022AFCC 044320E4 */  swc1       $f0, (0x294304 & 0xFFFF)($at)
/* 12B0D0 0022AFD0 28260070 */  paddub     $4, $0, $0
/* 12B0D4 0022AFD4 18000010 */  b          .L0022B038
/* 12B0D8 0022AFD8 00000000 */   nop
.L0022AFDC:
/* 12B0DC 0022AFDC 80180400 */  sll        $3, $4, 2
/* 12B0E0 0022AFE0 2900023C */  lui        $2, %hi(menudebugrot)
/* 12B0E4 0022AFE4 00434224 */  addiu      $2, $2, %lo(menudebugrot)
/* 12B0E8 0022AFE8 21104300 */  addu       $2, $2, $3
/* 12B0EC 0022AFEC 000041C4 */  lwc1       $f1, 0x0($2)
/* 12B0F0 0022AFF0 EC8280C7 */  lwc1       $f0, -0x7D14($gp)
/* 12B0F4 0022AFF4 34080046 */  c.lt.s     $f1, $f0
/* 12B0F8 0022AFF8 00000000 */  nop
/* 12B0FC 0022AFFC 04000045 */  bc1f       .L0022B010
/* 12B100 0022B000 00000000 */   nop
/* 12B104 0022B004 0C8380C7 */  lwc1       $f0, -0x7CF4($gp)
/* 12B108 0022B008 00080046 */  add.s      $f0, $f1, $f0
/* 12B10C 0022B00C 000040E4 */  swc1       $f0, 0x0($2)
.L0022B010:
/* 12B110 0022B010 000041C4 */  lwc1       $f1, 0x0($2)
/* 12B114 0022B014 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* 12B118 0022B018 36080046 */  c.le.s     $f1, $f0
/* 12B11C 0022B01C 00000000 */  nop
/* 12B120 0022B020 04000145 */  bc1t       .L0022B034
/* 12B124 0022B024 00000000 */   nop
/* 12B128 0022B028 0C8380C7 */  lwc1       $f0, -0x7CF4($gp)
/* 12B12C 0022B02C 01080046 */  sub.s      $f0, $f1, $f0
/* 12B130 0022B030 000040E4 */  swc1       $f0, 0x0($2)
.L0022B034:
/* 12B134 0022B034 01008424 */  addiu      $4, $4, 0x1
.L0022B038:
/* 12B138 0022B038 03008228 */  slti       $2, $4, 0x3
/* 12B13C 0022B03C E7FF4014 */  bnez       $2, .L0022AFDC
/* 12B140 0022B040 00000000 */   nop
/* 12B144 0022B044 CC01023C */  lui        $2, %hi(GamePad)
/* 12B148 0022B048 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12B14C 0022B04C 20000524 */  addiu      $5, $0, 0x20
/* 12B150 0022B050 2CAE040C */  jal        Down2__8CGamePadFi
/* 12B154 0022B054 00000000 */   nop
/* 12B158 0022B058 02004010 */  beqz       $2, .L0022B064
/* 12B15C 0022B05C 00000000 */   nop
/* 12B160 0022B060 989780AF */  sw         $0, -0x6868($gp)
.L0022B064:
/* 12B164 0022B064 CC01023C */  lui        $2, %hi(GamePad)
/* 12B168 0022B068 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12B16C 0022B06C 10000524 */  addiu      $5, $0, 0x10
/* 12B170 0022B070 10AE040C */  jal        On2__8CGamePadFi
/* 12B174 0022B074 00000000 */   nop
/* 12B178 0022B078 17004010 */  beqz       $2, .L0022B0D8
/* 12B17C 0022B07C 00000000 */   nop
/* 12B180 0022B080 28260070 */  paddub     $4, $0, $0
/* 12B184 0022B084 11000010 */  b          .L0022B0CC
/* 12B188 0022B088 00000000 */   nop
.L0022B08C:
/* 12B18C 0022B08C 80180400 */  sll        $3, $4, 2
/* 12B190 0022B090 2900023C */  lui        $2, %hi(menudebugrscale)
/* 12B194 0022B094 10434224 */  addiu      $2, $2, %lo(menudebugrscale)
/* 12B198 0022B098 21184300 */  addu       $3, $2, $3
/* 12B19C 0022B09C 000061C4 */  lwc1       $f1, 0x0($3)
/* 12B1A0 0022B0A0 A040023C */  lui        $2, (0x40A00000 >> 16)
/* 12B1A4 0022B0A4 00008244 */  mtc1       $2, $f0
/* 12B1A8 0022B0A8 00000000 */  nop
/* 12B1AC 0022B0AC 36080046 */  c.le.s     $f1, $f0
/* 12B1B0 0022B0B0 00000000 */  nop
/* 12B1B4 0022B0B4 04000045 */  bc1f       .L0022B0C8
/* 12B1B8 0022B0B8 00000000 */   nop
/* 12B1BC 0022B0BC 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* 12B1C0 0022B0C0 00080046 */  add.s      $f0, $f1, $f0
/* 12B1C4 0022B0C4 000060E4 */  swc1       $f0, 0x0($3)
.L0022B0C8:
/* 12B1C8 0022B0C8 01008424 */  addiu      $4, $4, 0x1
.L0022B0CC:
/* 12B1CC 0022B0CC 03008228 */  slti       $2, $4, 0x3
/* 12B1D0 0022B0D0 EEFF4014 */  bnez       $2, .L0022B08C
/* 12B1D4 0022B0D4 00000000 */   nop
.L0022B0D8:
/* 12B1D8 0022B0D8 CC01023C */  lui        $2, %hi(GamePad)
/* 12B1DC 0022B0DC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12B1E0 0022B0E0 80000524 */  addiu      $5, $0, 0x80
/* 12B1E4 0022B0E4 10AE040C */  jal        On2__8CGamePadFi
/* 12B1E8 0022B0E8 00000000 */   nop
/* 12B1EC 0022B0EC 14004010 */  beqz       $2, .L0022B140
/* 12B1F0 0022B0F0 00000000 */   nop
/* 12B1F4 0022B0F4 28260070 */  paddub     $4, $0, $0
/* 12B1F8 0022B0F8 0E000010 */  b          .L0022B134
/* 12B1FC 0022B0FC 00000000 */   nop
.L0022B100:
/* 12B200 0022B100 80180400 */  sll        $3, $4, 2
/* 12B204 0022B104 2900023C */  lui        $2, %hi(menudebugrscale)
/* 12B208 0022B108 10434224 */  addiu      $2, $2, %lo(menudebugrscale)
/* 12B20C 0022B10C 21104300 */  addu       $2, $2, $3
/* 12B210 0022B110 000041C4 */  lwc1       $f1, 0x0($2)
/* 12B214 0022B114 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* 12B218 0022B118 34000146 */  c.lt.s     $f0, $f1
/* 12B21C 0022B11C 00000000 */  nop
/* 12B220 0022B120 03000045 */  bc1f       .L0022B130
/* 12B224 0022B124 00000000 */   nop
/* 12B228 0022B128 01080046 */  sub.s      $f0, $f1, $f0
/* 12B22C 0022B12C 000040E4 */  swc1       $f0, 0x0($2)
.L0022B130:
/* 12B230 0022B130 01008424 */  addiu      $4, $4, 0x1
.L0022B134:
/* 12B234 0022B134 03008228 */  slti       $2, $4, 0x3
/* 12B238 0022B138 F1FF4014 */  bnez       $2, .L0022B100
/* 12B23C 0022B13C 00000000 */   nop
.L0022B140:
/* 12B240 0022B140 9497848F */  lw         $4, -0x686C($gp)
/* 12B244 0022B144 2900013C */  lui        $at, (0x294300 >> 16)
/* 12B248 0022B148 00432CC4 */  lwc1       $f12, (0x294300 & 0xFFFF)($at)
/* 12B24C 0022B14C 2900013C */  lui        $at, (0x294304 >> 16)
/* 12B250 0022B150 04432DC4 */  lwc1       $f13, (0x294304 & 0xFFFF)($at)
/* 12B254 0022B154 2900013C */  lui        $at, (0x294308 >> 16)
/* 12B258 0022B158 08432EC4 */  lwc1       $f14, (0x294308 & 0xFFFF)($at)
/* 12B25C 0022B15C 70A3040C */  jal        SetRotation__6CFrameFfff
/* 12B260 0022B160 00000000 */   nop
/* 12B264 0022B164 9497848F */  lw         $4, -0x686C($gp)
/* 12B268 0022B168 2900023C */  lui        $2, %hi(menudebugrscale)
/* 12B26C 0022B16C 10434524 */  addiu      $5, $2, %lo(menudebugrscale)
/* 12B270 0022B170 EC9F040C */  jal        SetScale__6CFrameFPf
/* 12B274 0022B174 00000000 */   nop
/* 12B278 0022B178 9497848F */  lw         $4, -0x686C($gp)
/* 12B27C 0022B17C 2900023C */  lui        $2, %hi(menudebugpos)
/* 12B280 0022B180 F0424524 */  addiu      $5, $2, %lo(menudebugpos)
/* 12B284 0022B184 B89F040C */  jal        SetPosition__6CFrameFPf
/* 12B288 0022B188 00000000 */   nop
/* 12B28C 0022B18C 9497848F */  lw         $4, -0x686C($gp)
/* 12B290 0022B190 60BB040C */  jal        MGDraw__FP6CFrame
/* 12B294 0022B194 00000000 */   nop
.L0022B198:
/* 12B298 0022B198 1000BF7B */  lq         $31, 0x10($sp)
/* 12B29C 0022B19C 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 12B2A0 0022B1A0 2000BD27 */  addiu      $sp, $sp, 0x20
/* 12B2A4 0022B1A4 0800E003 */  jr         $31
/* 12B2A8 0022B1A8 00000000 */   nop
/* 12B2AC 0022B1AC 00000000 */  nop
