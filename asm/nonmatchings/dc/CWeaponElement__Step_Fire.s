.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step_Fire__14CWeaponElementFv
/* B9F20 001B9E20 90FFBD27 */  addiu      $sp, $sp, -0x70
/* B9F24 001B9E24 6000BF7F */  sq         $31, 0x60($sp)
/* B9F28 001B9E28 5000B47F */  sq         $20, 0x50($sp)
/* B9F2C 001B9E2C 4000B37F */  sq         $19, 0x40($sp)
/* B9F30 001B9E30 3000B27F */  sq         $18, 0x30($sp)
/* B9F34 001B9E34 2000B17F */  sq         $17, 0x20($sp)
/* B9F38 001B9E38 1000B07F */  sq         $16, 0x10($sp)
/* B9F3C 001B9E3C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* B9F40 001B9E40 28868070 */  paddub     $16, $4, $0
/* B9F44 001B9E44 288E0070 */  paddub     $17, $0, $0
/* B9F48 001B9E48 28960070 */  paddub     $18, $0, $0
/* B9F4C 001B9E4C 6C000010 */  b          .L001BA000
/* B9F50 001B9E50 00000000 */   nop
.L001B9E54:
/* B9F54 001B9E54 80981200 */  sll        $19, $18, 2
/* B9F58 001B9E58 21187002 */  addu       $3, $19, $16
/* B9F5C 001B9E5C 20057424 */  addiu      $20, $3, 0x520
/* B9F60 001B9E60 200561C4 */  lwc1       $f1, 0x520($3)
/* B9F64 001B9E64 00008044 */  mtc1       $0, $f0
/* B9F68 001B9E68 00000000 */  nop
/* B9F6C 001B9E6C 36080046 */  c.le.s     $f1, $f0
/* B9F70 001B9E70 00000000 */  nop
/* B9F74 001B9E74 04000045 */  bc1f       .L001B9E88
/* B9F78 001B9E78 00000000 */   nop
/* B9F7C 001B9E7C 01003126 */  addiu      $17, $17, 0x1
/* B9F80 001B9E80 5E000010 */  b          .L001B9FFC
/* B9F84 001B9E84 00000000 */   nop
.L001B9E88:
/* B9F88 001B9E88 BE11040C */  jal        rand
/* B9F8C 001B9E8C 00000000 */   nop
/* B9F90 001B9E90 00008244 */  mtc1       $2, $f0
/* B9F94 001B9E94 00000000 */  nop
/* B9F98 001B9E98 60008046 */  cvt.s.w    $f1, $f0
/* B9F9C 001B9E9C 448580C7 */  lwc1       $f0, -0x7ABC($gp)
/* B9FA0 001B9EA0 42000146 */  mul.s      $f1, $f0, $f1
/* B9FA4 001B9EA4 004F033C */  lui        $3, (0x4F000000 >> 16)
/* B9FA8 001B9EA8 00008344 */  mtc1       $3, $f0
/* B9FAC 001B9EAC 00000000 */  nop
/* B9FB0 001B9EB0 43080046 */  div.s      $f1, $f1, $f0
/* B9FB4 001B9EB4 148480C7 */  lwc1       $f0, -0x7BEC($gp)
/* B9FB8 001B9EB8 40000146 */  add.s      $f1, $f0, $f1
/* B9FBC 001B9EBC 00191200 */  sll        $3, $18, 4
/* B9FC0 001B9EC0 21187000 */  addu       $3, $3, $16
/* B9FC4 001B9EC4 240060C4 */  lwc1       $f0, 0x24($3)
/* B9FC8 001B9EC8 00000146 */  add.s      $f0, $f0, $f1
/* B9FCC 001B9ECC 240060E4 */  swc1       $f0, 0x24($3)
/* B9FD0 001B9ED0 21187002 */  addu       $3, $19, $16
/* B9FD4 001B9ED4 A0046424 */  addiu      $4, $3, 0x4A0
/* B9FD8 001B9ED8 A00461C4 */  lwc1       $f1, 0x4A0($3)
/* B9FDC 001B9EDC 148480C7 */  lwc1       $f0, -0x7BEC($gp)
/* B9FE0 001B9EE0 41080046 */  sub.s      $f1, $f1, $f0
/* B9FE4 001B9EE4 A00461E4 */  swc1       $f1, 0x4A0($3)
/* B9FE8 001B9EE8 00008044 */  mtc1       $0, $f0
/* B9FEC 001B9EEC 00000000 */  nop
/* B9FF0 001B9EF0 36080046 */  c.le.s     $f1, $f0
/* B9FF4 001B9EF4 00000000 */  nop
/* B9FF8 001B9EF8 03000045 */  bc1f       .L001B9F08
/* B9FFC 001B9EFC 00000000 */   nop
/* BA000 001B9F00 000080AC */  sw         $0, 0x0($4)
/* BA004 001B9F04 000080AE */  sw         $0, 0x0($20)
.L001B9F08:
/* BA008 001B9F08 3A070486 */  lh         $4, 0x73A($16)
/* BA00C 001B9F0C 04000324 */  addiu      $3, $0, 0x4
/* BA010 001B9F10 16008314 */  bne        $4, $3, .L001B9F6C
/* BA014 001B9F14 00000000 */   nop
/* BA018 001B9F18 BE11040C */  jal        rand
/* BA01C 001B9F1C 00000000 */   nop
/* BA020 001B9F20 00008244 */  mtc1       $2, $f0
/* BA024 001B9F24 00000000 */  nop
/* BA028 001B9F28 60008046 */  cvt.s.w    $f1, $f0
/* BA02C 001B9F2C A040023C */  lui        $2, (0x40A00000 >> 16)
/* BA030 001B9F30 00008244 */  mtc1       $2, $f0
/* BA034 001B9F34 00000000 */  nop
/* BA038 001B9F38 42000146 */  mul.s      $f1, $f0, $f1
/* BA03C 001B9F3C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA040 001B9F40 00008244 */  mtc1       $2, $f0
/* BA044 001B9F44 00000000 */  nop
/* BA048 001B9F48 030B0046 */  div.s      $f12, $f1, $f0
/* BA04C 001B9F4C 2C44040C */  jal        fptosi
/* BA050 001B9F50 00000000 */   nop
/* BA054 001B9F54 40180200 */  sll        $3, $2, 1
/* BA058 001B9F58 21186200 */  addu       $3, $3, $2
/* BA05C 001B9F5C 00210300 */  sll        $4, $3, 4
/* BA060 001B9F60 40181200 */  sll        $3, $18, 1
/* BA064 001B9F64 21187000 */  addu       $3, $3, $16
/* BA068 001B9F68 FA0664A4 */  sh         $4, 0x6FA($3)
.L001B9F6C:
/* BA06C 001B9F6C 40181200 */  sll        $3, $18, 1
/* BA070 001B9F70 21187000 */  addu       $3, $3, $16
/* BA074 001B9F74 BA066424 */  addiu      $4, $3, 0x6BA
/* BA078 001B9F78 BA066384 */  lh         $3, 0x6BA($3)
/* BA07C 001B9F7C 10006010 */  beqz       $3, .L001B9FC0
/* BA080 001B9F80 00000000 */   nop
/* BA084 001B9F84 000081C6 */  lwc1       $f1, 0x0($20)
/* BA088 001B9F88 0041033C */  lui        $3, (0x41000000 >> 16)
/* BA08C 001B9F8C 00008344 */  mtc1       $3, $f0
/* BA090 001B9F90 00000000 */  nop
/* BA094 001B9F94 41080046 */  sub.s      $f1, $f1, $f0
/* BA098 001B9F98 000081E6 */  swc1       $f1, 0x0($20)
/* BA09C 001B9F9C 00008044 */  mtc1       $0, $f0
/* BA0A0 001B9FA0 00000000 */  nop
/* BA0A4 001B9FA4 36080046 */  c.le.s     $f1, $f0
/* BA0A8 001B9FA8 00000000 */  nop
/* BA0AC 001B9FAC 13000045 */  bc1f       .L001B9FFC
/* BA0B0 001B9FB0 00000000 */   nop
/* BA0B4 001B9FB4 000080AE */  sw         $0, 0x0($20)
/* BA0B8 001B9FB8 10000010 */  b          .L001B9FFC
/* BA0BC 001B9FBC 00000000 */   nop
.L001B9FC0:
/* BA0C0 001B9FC0 000081C6 */  lwc1       $f1, 0x0($20)
/* BA0C4 001B9FC4 8041033C */  lui        $3, (0x41800000 >> 16)
/* BA0C8 001B9FC8 00008344 */  mtc1       $3, $f0
/* BA0CC 001B9FCC 00000000 */  nop
/* BA0D0 001B9FD0 40080046 */  add.s      $f1, $f1, $f0
/* BA0D4 001B9FD4 000081E6 */  swc1       $f1, 0x0($20)
/* BA0D8 001B9FD8 0043033C */  lui        $3, (0x43000000 >> 16)
/* BA0DC 001B9FDC 00008344 */  mtc1       $3, $f0
/* BA0E0 001B9FE0 00000000 */  nop
/* BA0E4 001B9FE4 34080046 */  c.lt.s     $f1, $f0
/* BA0E8 001B9FE8 00000000 */  nop
/* BA0EC 001B9FEC 03000145 */  bc1t       .L001B9FFC
/* BA0F0 001B9FF0 00000000 */   nop
/* BA0F4 001B9FF4 01000324 */  addiu      $3, $0, 0x1
/* BA0F8 001B9FF8 000083A4 */  sh         $3, 0x0($4)
.L001B9FFC:
/* BA0FC 001B9FFC 01005226 */  addiu      $18, $18, 0x1
.L001BA000:
/* BA100 001BA000 2000432A */  slti       $3, $18, 0x20
/* BA104 001BA004 93FF6014 */  bnez       $3, .L001B9E54
/* BA108 001BA008 00000000 */   nop
/* BA10C 001BA00C 3A070386 */  lh         $3, 0x73A($16)
/* BA110 001BA010 FFFF6324 */  addiu      $3, $3, -0x1
/* BA114 001BA014 3A0703A6 */  sh         $3, 0x73A($16)
/* BA118 001BA018 3A070386 */  lh         $3, 0x73A($16)
/* BA11C 001BA01C 03006014 */  bnez       $3, .L001BA02C
/* BA120 001BA020 00000000 */   nop
/* BA124 001BA024 04000324 */  addiu      $3, $0, 0x4
/* BA128 001BA028 3A0703A6 */  sh         $3, 0x73A($16)
.L001BA02C:
/* BA12C 001BA02C B8060386 */  lh         $3, 0x6B8($16)
/* BA130 001BA030 A5006018 */  blez       $3, .L001BA2C8
/* BA134 001BA034 00000000 */   nop
/* BA138 001BA038 FFFF6324 */  addiu      $3, $3, -0x1
/* BA13C 001BA03C B80603A6 */  sh         $3, 0x6B8($16)
/* BA140 001BA040 B6060386 */  lh         $3, 0x6B6($16)
/* BA144 001BA044 FFFF6324 */  addiu      $3, $3, -0x1
/* BA148 001BA048 B60603A6 */  sh         $3, 0x6B6($16)
/* BA14C 001BA04C B6060386 */  lh         $3, 0x6B6($16)
/* BA150 001BA050 9D00601C */  bgtz       $3, .L001BA2C8
/* BA154 001BA054 00000000 */   nop
/* BA158 001BA058 28960070 */  paddub     $18, $0, $0
/* BA15C 001BA05C 97000010 */  b          .L001BA2BC
/* BA160 001BA060 00000000 */   nop
.L001BA064:
/* BA164 001BA064 80981200 */  sll        $19, $18, 2
/* BA168 001BA068 21187002 */  addu       $3, $19, $16
/* BA16C 001BA06C 20057424 */  addiu      $20, $3, 0x520
/* BA170 001BA070 200561C4 */  lwc1       $f1, 0x520($3)
/* BA174 001BA074 00008044 */  mtc1       $0, $f0
/* BA178 001BA078 00000000 */  nop
/* BA17C 001BA07C 32000146 */  c.eq.s     $f0, $f1
/* BA180 001BA080 00000000 */  nop
/* BA184 001BA084 8C000045 */  bc1f       .L001BA2B8
/* BA188 001BA088 00000000 */   nop
/* BA18C 001BA08C BE11040C */  jal        rand
/* BA190 001BA090 00000000 */   nop
/* BA194 001BA094 00008244 */  mtc1       $2, $f0
/* BA198 001BA098 00000000 */  nop
/* BA19C 001BA09C 60008046 */  cvt.s.w    $f1, $f0
/* BA1A0 001BA0A0 C040023C */  lui        $2, (0x40C00000 >> 16)
/* BA1A4 001BA0A4 00008244 */  mtc1       $2, $f0
/* BA1A8 001BA0A8 00000000 */  nop
/* BA1AC 001BA0AC 42000146 */  mul.s      $f1, $f0, $f1
/* BA1B0 001BA0B0 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA1B4 001BA0B4 00008244 */  mtc1       $2, $f0
/* BA1B8 001BA0B8 00000000 */  nop
/* BA1BC 001BA0BC 43080046 */  div.s      $f1, $f1, $f0
/* BA1C0 001BA0C0 0040023C */  lui        $2, (0x40000000 >> 16)
/* BA1C4 001BA0C4 00008244 */  mtc1       $2, $f0
/* BA1C8 001BA0C8 00000000 */  nop
/* BA1CC 001BA0CC 00000146 */  add.s      $f0, $f0, $f1
/* BA1D0 001BA0D0 21187002 */  addu       $3, $19, $16
/* BA1D4 001BA0D4 200460E4 */  swc1       $f0, 0x420($3)
/* BA1D8 001BA0D8 803F023C */  lui        $2, (0x3F800000 >> 16)
/* BA1DC 001BA0DC A00462AC */  sw         $2, 0x4A0($3)
/* BA1E0 001BA0E0 BE11040C */  jal        rand
/* BA1E4 001BA0E4 00000000 */   nop
/* BA1E8 001BA0E8 00008244 */  mtc1       $2, $f0
/* BA1EC 001BA0EC 00000000 */  nop
/* BA1F0 001BA0F0 60008046 */  cvt.s.w    $f1, $f0
/* BA1F4 001BA0F4 4042023C */  lui        $2, (0x42400000 >> 16)
/* BA1F8 001BA0F8 00008244 */  mtc1       $2, $f0
/* BA1FC 001BA0FC 00000000 */  nop
/* BA200 001BA100 42000146 */  mul.s      $f1, $f0, $f1
/* BA204 001BA104 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA208 001BA108 00008244 */  mtc1       $2, $f0
/* BA20C 001BA10C 00000000 */  nop
/* BA210 001BA110 43080046 */  div.s      $f1, $f1, $f0
/* BA214 001BA114 803F023C */  lui        $2, (0x3F800000 >> 16)
/* BA218 001BA118 00008244 */  mtc1       $2, $f0
/* BA21C 001BA11C 00000000 */  nop
/* BA220 001BA120 00000146 */  add.s      $f0, $f0, $f1
/* BA224 001BA124 000080E6 */  swc1       $f0, 0x0($20)
/* BA228 001BA128 40981200 */  sll        $19, $18, 1
/* BA22C 001BA12C 21107002 */  addu       $2, $19, $16
/* BA230 001BA130 BA0640A4 */  sh         $0, 0x6BA($2)
/* BA234 001BA134 A00514C6 */  lwc1       $f20, 0x5A0($16)
/* BA238 001BA138 BE11040C */  jal        rand
/* BA23C 001BA13C 00000000 */   nop
/* BA240 001BA140 00008244 */  mtc1       $2, $f0
/* BA244 001BA144 00000000 */  nop
/* BA248 001BA148 20008046 */  cvt.s.w    $f0, $f0
/* BA24C 001BA14C 42A00046 */  mul.s      $f1, $f20, $f0
/* BA250 001BA150 0040023C */  lui        $2, (0x40000000 >> 16)
/* BA254 001BA154 00008244 */  mtc1       $2, $f0
/* BA258 001BA158 00000000 */  nop
/* BA25C 001BA15C 42000146 */  mul.s      $f1, $f0, $f1
/* BA260 001BA160 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA264 001BA164 00008244 */  mtc1       $2, $f0
/* BA268 001BA168 00000000 */  nop
/* BA26C 001BA16C 03080046 */  div.s      $f0, $f1, $f0
/* BA270 001BA170 01001446 */  sub.s      $f0, $f0, $f20
/* BA274 001BA174 00911200 */  sll        $18, $18, 4
/* BA278 001BA178 21105002 */  addu       $2, $18, $16
/* BA27C 001BA17C 200040E4 */  swc1       $f0, 0x20($2)
/* BA280 001BA180 A00514C6 */  lwc1       $f20, 0x5A0($16)
/* BA284 001BA184 BE11040C */  jal        rand
/* BA288 001BA188 00000000 */   nop
/* BA28C 001BA18C 00008244 */  mtc1       $2, $f0
/* BA290 001BA190 00000000 */  nop
/* BA294 001BA194 20008046 */  cvt.s.w    $f0, $f0
/* BA298 001BA198 42A00046 */  mul.s      $f1, $f20, $f0
/* BA29C 001BA19C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA2A0 001BA1A0 00008244 */  mtc1       $2, $f0
/* BA2A4 001BA1A4 00000000 */  nop
/* BA2A8 001BA1A8 43080046 */  div.s      $f1, $f1, $f0
/* BA2AC 001BA1AC 0040023C */  lui        $2, (0x40000000 >> 16)
/* BA2B0 001BA1B0 00008244 */  mtc1       $2, $f0
/* BA2B4 001BA1B4 00000000 */  nop
/* BA2B8 001BA1B8 03A00046 */  div.s      $f0, $f20, $f0
/* BA2BC 001BA1BC 01080046 */  sub.s      $f0, $f1, $f0
/* BA2C0 001BA1C0 21105002 */  addu       $2, $18, $16
/* BA2C4 001BA1C4 240040E4 */  swc1       $f0, 0x24($2)
/* BA2C8 001BA1C8 A00514C6 */  lwc1       $f20, 0x5A0($16)
/* BA2CC 001BA1CC BE11040C */  jal        rand
/* BA2D0 001BA1D0 00000000 */   nop
/* BA2D4 001BA1D4 00008244 */  mtc1       $2, $f0
/* BA2D8 001BA1D8 00000000 */  nop
/* BA2DC 001BA1DC 20008046 */  cvt.s.w    $f0, $f0
/* BA2E0 001BA1E0 42A00046 */  mul.s      $f1, $f20, $f0
/* BA2E4 001BA1E4 0040023C */  lui        $2, (0x40000000 >> 16)
/* BA2E8 001BA1E8 00008244 */  mtc1       $2, $f0
/* BA2EC 001BA1EC 00000000 */  nop
/* BA2F0 001BA1F0 42000146 */  mul.s      $f1, $f0, $f1
/* BA2F4 001BA1F4 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA2F8 001BA1F8 00008244 */  mtc1       $2, $f0
/* BA2FC 001BA1FC 00000000 */  nop
/* BA300 001BA200 03080046 */  div.s      $f0, $f1, $f0
/* BA304 001BA204 01001446 */  sub.s      $f0, $f0, $f20
/* BA308 001BA208 21185002 */  addu       $3, $18, $16
/* BA30C 001BA20C 280060E4 */  swc1       $f0, 0x28($3)
/* BA310 001BA210 803F023C */  lui        $2, (0x3F800000 >> 16)
/* BA314 001BA214 2C0062AC */  sw         $2, 0x2C($3)
/* BA318 001BA218 BE11040C */  jal        rand
/* BA31C 001BA21C 00000000 */   nop
/* BA320 001BA220 00008244 */  mtc1       $2, $f0
/* BA324 001BA224 00000000 */  nop
/* BA328 001BA228 60008046 */  cvt.s.w    $f1, $f0
/* BA32C 001BA22C A040023C */  lui        $2, (0x40A00000 >> 16)
/* BA330 001BA230 00008244 */  mtc1       $2, $f0
/* BA334 001BA234 00000000 */  nop
/* BA338 001BA238 42000146 */  mul.s      $f1, $f0, $f1
/* BA33C 001BA23C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA340 001BA240 00008244 */  mtc1       $2, $f0
/* BA344 001BA244 00000000 */  nop
/* BA348 001BA248 030B0046 */  div.s      $f12, $f1, $f0
/* BA34C 001BA24C 2C44040C */  jal        fptosi
/* BA350 001BA250 00000000 */   nop
/* BA354 001BA254 40180200 */  sll        $3, $2, 1
/* BA358 001BA258 21106200 */  addu       $2, $3, $2
/* BA35C 001BA25C 00190200 */  sll        $3, $2, 4
/* BA360 001BA260 21107002 */  addu       $2, $19, $16
/* BA364 001BA264 FA0643A4 */  sh         $3, 0x6FA($2)
/* BA368 001BA268 BE11040C */  jal        rand
/* BA36C 001BA26C 00000000 */   nop
/* BA370 001BA270 00008244 */  mtc1       $2, $f0
/* BA374 001BA274 00000000 */  nop
/* BA378 001BA278 60008046 */  cvt.s.w    $f1, $f0
/* BA37C 001BA27C B4060286 */  lh         $2, 0x6B4($16)
/* BA380 001BA280 00008244 */  mtc1       $2, $f0
/* BA384 001BA284 00000000 */  nop
/* BA388 001BA288 20008046 */  cvt.s.w    $f0, $f0
/* BA38C 001BA28C 42000146 */  mul.s      $f1, $f0, $f1
/* BA390 001BA290 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA394 001BA294 00008244 */  mtc1       $2, $f0
/* BA398 001BA298 00000000 */  nop
/* BA39C 001BA29C 030B0046 */  div.s      $f12, $f1, $f0
/* BA3A0 001BA2A0 2C44040C */  jal        fptosi
/* BA3A4 001BA2A4 00000000 */   nop
/* BA3A8 001BA2A8 01004324 */  addiu      $3, $2, 0x1
/* BA3AC 001BA2AC B60603A6 */  sh         $3, 0x6B6($16)
/* BA3B0 001BA2B0 05000010 */  b          .L001BA2C8
/* BA3B4 001BA2B4 00000000 */   nop
.L001BA2B8:
/* BA3B8 001BA2B8 01005226 */  addiu      $18, $18, 0x1
.L001BA2BC:
/* BA3BC 001BA2BC 2000432A */  slti       $3, $18, 0x20
/* BA3C0 001BA2C0 68FF6014 */  bnez       $3, .L001BA064
/* BA3C4 001BA2C4 00000000 */   nop
.L001BA2C8:
/* BA3C8 001BA2C8 2000232A */  slti       $3, $17, 0x20
/* BA3CC 001BA2CC 02006014 */  bnez       $3, .L001BA2D8
/* BA3D0 001BA2D0 00000000 */   nop
/* BA3D4 001BA2D4 AC0500A6 */  sh         $0, 0x5AC($16)
.L001BA2D8:
/* BA3D8 001BA2D8 6000BF7B */  lq         $31, 0x60($sp)
/* BA3DC 001BA2DC 5000B47B */  lq         $20, 0x50($sp)
/* BA3E0 001BA2E0 4000B37B */  lq         $19, 0x40($sp)
/* BA3E4 001BA2E4 3000B27B */  lq         $18, 0x30($sp)
/* BA3E8 001BA2E8 2000B17B */  lq         $17, 0x20($sp)
/* BA3EC 001BA2EC 1000B07B */  lq         $16, 0x10($sp)
/* BA3F0 001BA2F0 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* BA3F4 001BA2F4 7000BD27 */  addiu      $sp, $sp, 0x70
/* BA3F8 001BA2F8 0800E003 */  jr         $31
/* BA3FC 001BA2FC 00000000 */   nop
