.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step_Holy__14CWeaponElementFv
/* B7EE0 001B7DE0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* B7EE4 001B7DE4 6000BF7F */  sq         $31, 0x60($sp)
/* B7EE8 001B7DE8 5000B47F */  sq         $20, 0x50($sp)
/* B7EEC 001B7DEC 4000B37F */  sq         $19, 0x40($sp)
/* B7EF0 001B7DF0 3000B27F */  sq         $18, 0x30($sp)
/* B7EF4 001B7DF4 2000B17F */  sq         $17, 0x20($sp)
/* B7EF8 001B7DF8 1000B07F */  sq         $16, 0x10($sp)
/* B7EFC 001B7DFC 0000B4E7 */  swc1       $f20, 0x0($sp)
/* B7F00 001B7E00 28868070 */  paddub     $16, $4, $0
/* B7F04 001B7E04 288E0070 */  paddub     $17, $0, $0
/* B7F08 001B7E08 28960070 */  paddub     $18, $0, $0
/* B7F0C 001B7E0C 5F000010 */  b          .L001B7F8C
/* B7F10 001B7E10 00000000 */   nop
.L001B7E14:
/* B7F14 001B7E14 80181200 */  sll        $3, $18, 2
/* B7F18 001B7E18 21287000 */  addu       $5, $3, $16
/* B7F1C 001B7E1C 2005B324 */  addiu      $19, $5, 0x520
/* B7F20 001B7E20 2005A0C4 */  lwc1       $f0, 0x520($5)
/* B7F24 001B7E24 00108044 */  mtc1       $0, $f2
/* B7F28 001B7E28 00000000 */  nop
/* B7F2C 001B7E2C 36000246 */  c.le.s     $f0, $f2
/* B7F30 001B7E30 00000000 */  nop
/* B7F34 001B7E34 04000045 */  bc1f       .L001B7E48
/* B7F38 001B7E38 00000000 */   nop
/* B7F3C 001B7E3C 01003126 */  addiu      $17, $17, 0x1
/* B7F40 001B7E40 51000010 */  b          .L001B7F88
/* B7F44 001B7E44 00000000 */   nop
.L001B7E48:
/* B7F48 001B7E48 00191200 */  sll        $3, $18, 4
/* B7F4C 001B7E4C 21207000 */  addu       $4, $3, $16
/* B7F50 001B7E50 240081C4 */  lwc1       $f1, 0x24($4)
/* B7F54 001B7E54 003F033C */  lui        $3, (0x3F000000 >> 16)
/* B7F58 001B7E58 00008344 */  mtc1       $3, $f0
/* B7F5C 001B7E5C 00000000 */  nop
/* B7F60 001B7E60 00080046 */  add.s      $f0, $f1, $f0
/* B7F64 001B7E64 240080E4 */  swc1       $f0, 0x24($4)
/* B7F68 001B7E68 A004A324 */  addiu      $3, $5, 0x4A0
/* B7F6C 001B7E6C A004A1C4 */  lwc1       $f1, 0x4A0($5)
/* B7F70 001B7E70 148480C7 */  lwc1       $f0, -0x7BEC($gp)
/* B7F74 001B7E74 01080046 */  sub.s      $f0, $f1, $f0
/* B7F78 001B7E78 A004A0E4 */  swc1       $f0, 0x4A0($5)
/* B7F7C 001B7E7C 36000246 */  c.le.s     $f0, $f2
/* B7F80 001B7E80 00000000 */  nop
/* B7F84 001B7E84 03000045 */  bc1f       .L001B7E94
/* B7F88 001B7E88 00000000 */   nop
/* B7F8C 001B7E8C 000060AC */  sw         $0, 0x0($3)
/* B7F90 001B7E90 000060AE */  sw         $0, 0x0($19)
.L001B7E94:
/* B7F94 001B7E94 3A070486 */  lh         $4, 0x73A($16)
/* B7F98 001B7E98 04000324 */  addiu      $3, $0, 0x4
/* B7F9C 001B7E9C 16008314 */  bne        $4, $3, .L001B7EF8
/* B7FA0 001B7EA0 00000000 */   nop
/* B7FA4 001B7EA4 BE11040C */  jal        rand
/* B7FA8 001B7EA8 00000000 */   nop
/* B7FAC 001B7EAC 00008244 */  mtc1       $2, $f0
/* B7FB0 001B7EB0 00000000 */  nop
/* B7FB4 001B7EB4 60008046 */  cvt.s.w    $f1, $f0
/* B7FB8 001B7EB8 A040023C */  lui        $2, (0x40A00000 >> 16)
/* B7FBC 001B7EBC 00008244 */  mtc1       $2, $f0
/* B7FC0 001B7EC0 00000000 */  nop
/* B7FC4 001B7EC4 42000146 */  mul.s      $f1, $f0, $f1
/* B7FC8 001B7EC8 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B7FCC 001B7ECC 00008244 */  mtc1       $2, $f0
/* B7FD0 001B7ED0 00000000 */  nop
/* B7FD4 001B7ED4 030B0046 */  div.s      $f12, $f1, $f0
/* B7FD8 001B7ED8 2C44040C */  jal        fptosi
/* B7FDC 001B7EDC 00000000 */   nop
/* B7FE0 001B7EE0 40180200 */  sll        $3, $2, 1
/* B7FE4 001B7EE4 21186200 */  addu       $3, $3, $2
/* B7FE8 001B7EE8 00210300 */  sll        $4, $3, 4
/* B7FEC 001B7EEC 40181200 */  sll        $3, $18, 1
/* B7FF0 001B7EF0 21187000 */  addu       $3, $3, $16
/* B7FF4 001B7EF4 FA0664A4 */  sh         $4, 0x6FA($3)
.L001B7EF8:
/* B7FF8 001B7EF8 40181200 */  sll        $3, $18, 1
/* B7FFC 001B7EFC 21187000 */  addu       $3, $3, $16
/* B8000 001B7F00 BA066424 */  addiu      $4, $3, 0x6BA
/* B8004 001B7F04 BA066384 */  lh         $3, 0x6BA($3)
/* B8008 001B7F08 10006010 */  beqz       $3, .L001B7F4C
/* B800C 001B7F0C 00000000 */   nop
/* B8010 001B7F10 000061C6 */  lwc1       $f1, 0x0($19)
/* B8014 001B7F14 0041033C */  lui        $3, (0x41000000 >> 16)
/* B8018 001B7F18 00008344 */  mtc1       $3, $f0
/* B801C 001B7F1C 00000000 */  nop
/* B8020 001B7F20 41080046 */  sub.s      $f1, $f1, $f0
/* B8024 001B7F24 000061E6 */  swc1       $f1, 0x0($19)
/* B8028 001B7F28 00008044 */  mtc1       $0, $f0
/* B802C 001B7F2C 00000000 */  nop
/* B8030 001B7F30 36080046 */  c.le.s     $f1, $f0
/* B8034 001B7F34 00000000 */  nop
/* B8038 001B7F38 13000045 */  bc1f       .L001B7F88
/* B803C 001B7F3C 00000000 */   nop
/* B8040 001B7F40 000060AE */  sw         $0, 0x0($19)
/* B8044 001B7F44 10000010 */  b          .L001B7F88
/* B8048 001B7F48 00000000 */   nop
.L001B7F4C:
/* B804C 001B7F4C 000061C6 */  lwc1       $f1, 0x0($19)
/* B8050 001B7F50 8041033C */  lui        $3, (0x41800000 >> 16)
/* B8054 001B7F54 00008344 */  mtc1       $3, $f0
/* B8058 001B7F58 00000000 */  nop
/* B805C 001B7F5C 40080046 */  add.s      $f1, $f1, $f0
/* B8060 001B7F60 000061E6 */  swc1       $f1, 0x0($19)
/* B8064 001B7F64 0043033C */  lui        $3, (0x43000000 >> 16)
/* B8068 001B7F68 00008344 */  mtc1       $3, $f0
/* B806C 001B7F6C 00000000 */  nop
/* B8070 001B7F70 34080046 */  c.lt.s     $f1, $f0
/* B8074 001B7F74 00000000 */  nop
/* B8078 001B7F78 03000145 */  bc1t       .L001B7F88
/* B807C 001B7F7C 00000000 */   nop
/* B8080 001B7F80 01000324 */  addiu      $3, $0, 0x1
/* B8084 001B7F84 000083A4 */  sh         $3, 0x0($4)
.L001B7F88:
/* B8088 001B7F88 01005226 */  addiu      $18, $18, 0x1
.L001B7F8C:
/* B808C 001B7F8C 2000432A */  slti       $3, $18, 0x20
/* B8090 001B7F90 A0FF6014 */  bnez       $3, .L001B7E14
/* B8094 001B7F94 00000000 */   nop
/* B8098 001B7F98 3A070386 */  lh         $3, 0x73A($16)
/* B809C 001B7F9C FFFF6324 */  addiu      $3, $3, -0x1
/* B80A0 001B7FA0 3A0703A6 */  sh         $3, 0x73A($16)
/* B80A4 001B7FA4 3A070386 */  lh         $3, 0x73A($16)
/* B80A8 001B7FA8 03006014 */  bnez       $3, .L001B7FB8
/* B80AC 001B7FAC 00000000 */   nop
/* B80B0 001B7FB0 04000324 */  addiu      $3, $0, 0x4
/* B80B4 001B7FB4 3A0703A6 */  sh         $3, 0x73A($16)
.L001B7FB8:
/* B80B8 001B7FB8 B8060386 */  lh         $3, 0x6B8($16)
/* B80BC 001B7FBC A5006018 */  blez       $3, .L001B8254
/* B80C0 001B7FC0 00000000 */   nop
/* B80C4 001B7FC4 FFFF6324 */  addiu      $3, $3, -0x1
/* B80C8 001B7FC8 B80603A6 */  sh         $3, 0x6B8($16)
/* B80CC 001B7FCC B6060386 */  lh         $3, 0x6B6($16)
/* B80D0 001B7FD0 FFFF6324 */  addiu      $3, $3, -0x1
/* B80D4 001B7FD4 B60603A6 */  sh         $3, 0x6B6($16)
/* B80D8 001B7FD8 B6060386 */  lh         $3, 0x6B6($16)
/* B80DC 001B7FDC 9D00601C */  bgtz       $3, .L001B8254
/* B80E0 001B7FE0 00000000 */   nop
/* B80E4 001B7FE4 28960070 */  paddub     $18, $0, $0
/* B80E8 001B7FE8 97000010 */  b          .L001B8248
/* B80EC 001B7FEC 00000000 */   nop
.L001B7FF0:
/* B80F0 001B7FF0 80981200 */  sll        $19, $18, 2
/* B80F4 001B7FF4 21187002 */  addu       $3, $19, $16
/* B80F8 001B7FF8 20057424 */  addiu      $20, $3, 0x520
/* B80FC 001B7FFC 200561C4 */  lwc1       $f1, 0x520($3)
/* B8100 001B8000 00008044 */  mtc1       $0, $f0
/* B8104 001B8004 00000000 */  nop
/* B8108 001B8008 32000146 */  c.eq.s     $f0, $f1
/* B810C 001B800C 00000000 */  nop
/* B8110 001B8010 8C000045 */  bc1f       .L001B8244
/* B8114 001B8014 00000000 */   nop
/* B8118 001B8018 BE11040C */  jal        rand
/* B811C 001B801C 00000000 */   nop
/* B8120 001B8020 00008244 */  mtc1       $2, $f0
/* B8124 001B8024 00000000 */  nop
/* B8128 001B8028 60008046 */  cvt.s.w    $f1, $f0
/* B812C 001B802C C040023C */  lui        $2, (0x40C00000 >> 16)
/* B8130 001B8030 00008244 */  mtc1       $2, $f0
/* B8134 001B8034 00000000 */  nop
/* B8138 001B8038 42000146 */  mul.s      $f1, $f0, $f1
/* B813C 001B803C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B8140 001B8040 00008244 */  mtc1       $2, $f0
/* B8144 001B8044 00000000 */  nop
/* B8148 001B8048 43080046 */  div.s      $f1, $f1, $f0
/* B814C 001B804C 0040023C */  lui        $2, (0x40000000 >> 16)
/* B8150 001B8050 00008244 */  mtc1       $2, $f0
/* B8154 001B8054 00000000 */  nop
/* B8158 001B8058 00000146 */  add.s      $f0, $f0, $f1
/* B815C 001B805C 21187002 */  addu       $3, $19, $16
/* B8160 001B8060 200460E4 */  swc1       $f0, 0x420($3)
/* B8164 001B8064 803F023C */  lui        $2, (0x3F800000 >> 16)
/* B8168 001B8068 A00462AC */  sw         $2, 0x4A0($3)
/* B816C 001B806C BE11040C */  jal        rand
/* B8170 001B8070 00000000 */   nop
/* B8174 001B8074 00008244 */  mtc1       $2, $f0
/* B8178 001B8078 00000000 */  nop
/* B817C 001B807C 60008046 */  cvt.s.w    $f1, $f0
/* B8180 001B8080 4042023C */  lui        $2, (0x42400000 >> 16)
/* B8184 001B8084 00008244 */  mtc1       $2, $f0
/* B8188 001B8088 00000000 */  nop
/* B818C 001B808C 42000146 */  mul.s      $f1, $f0, $f1
/* B8190 001B8090 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B8194 001B8094 00008244 */  mtc1       $2, $f0
/* B8198 001B8098 00000000 */  nop
/* B819C 001B809C 43080046 */  div.s      $f1, $f1, $f0
/* B81A0 001B80A0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* B81A4 001B80A4 00008244 */  mtc1       $2, $f0
/* B81A8 001B80A8 00000000 */  nop
/* B81AC 001B80AC 00000146 */  add.s      $f0, $f0, $f1
/* B81B0 001B80B0 000080E6 */  swc1       $f0, 0x0($20)
/* B81B4 001B80B4 40981200 */  sll        $19, $18, 1
/* B81B8 001B80B8 21107002 */  addu       $2, $19, $16
/* B81BC 001B80BC BA0640A4 */  sh         $0, 0x6BA($2)
/* B81C0 001B80C0 A00514C6 */  lwc1       $f20, 0x5A0($16)
/* B81C4 001B80C4 BE11040C */  jal        rand
/* B81C8 001B80C8 00000000 */   nop
/* B81CC 001B80CC 00008244 */  mtc1       $2, $f0
/* B81D0 001B80D0 00000000 */  nop
/* B81D4 001B80D4 20008046 */  cvt.s.w    $f0, $f0
/* B81D8 001B80D8 42A00046 */  mul.s      $f1, $f20, $f0
/* B81DC 001B80DC 0040023C */  lui        $2, (0x40000000 >> 16)
/* B81E0 001B80E0 00008244 */  mtc1       $2, $f0
/* B81E4 001B80E4 00000000 */  nop
/* B81E8 001B80E8 42000146 */  mul.s      $f1, $f0, $f1
/* B81EC 001B80EC 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B81F0 001B80F0 00008244 */  mtc1       $2, $f0
/* B81F4 001B80F4 00000000 */  nop
/* B81F8 001B80F8 03080046 */  div.s      $f0, $f1, $f0
/* B81FC 001B80FC 01001446 */  sub.s      $f0, $f0, $f20
/* B8200 001B8100 00911200 */  sll        $18, $18, 4
/* B8204 001B8104 21105002 */  addu       $2, $18, $16
/* B8208 001B8108 200040E4 */  swc1       $f0, 0x20($2)
/* B820C 001B810C A00514C6 */  lwc1       $f20, 0x5A0($16)
/* B8210 001B8110 BE11040C */  jal        rand
/* B8214 001B8114 00000000 */   nop
/* B8218 001B8118 00008244 */  mtc1       $2, $f0
/* B821C 001B811C 00000000 */  nop
/* B8220 001B8120 20008046 */  cvt.s.w    $f0, $f0
/* B8224 001B8124 42A00046 */  mul.s      $f1, $f20, $f0
/* B8228 001B8128 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B822C 001B812C 00008244 */  mtc1       $2, $f0
/* B8230 001B8130 00000000 */  nop
/* B8234 001B8134 43080046 */  div.s      $f1, $f1, $f0
/* B8238 001B8138 0040023C */  lui        $2, (0x40000000 >> 16)
/* B823C 001B813C 00008244 */  mtc1       $2, $f0
/* B8240 001B8140 00000000 */  nop
/* B8244 001B8144 03A00046 */  div.s      $f0, $f20, $f0
/* B8248 001B8148 01080046 */  sub.s      $f0, $f1, $f0
/* B824C 001B814C 21105002 */  addu       $2, $18, $16
/* B8250 001B8150 240040E4 */  swc1       $f0, 0x24($2)
/* B8254 001B8154 A00514C6 */  lwc1       $f20, 0x5A0($16)
/* B8258 001B8158 BE11040C */  jal        rand
/* B825C 001B815C 00000000 */   nop
/* B8260 001B8160 00008244 */  mtc1       $2, $f0
/* B8264 001B8164 00000000 */  nop
/* B8268 001B8168 20008046 */  cvt.s.w    $f0, $f0
/* B826C 001B816C 42A00046 */  mul.s      $f1, $f20, $f0
/* B8270 001B8170 0040023C */  lui        $2, (0x40000000 >> 16)
/* B8274 001B8174 00008244 */  mtc1       $2, $f0
/* B8278 001B8178 00000000 */  nop
/* B827C 001B817C 42000146 */  mul.s      $f1, $f0, $f1
/* B8280 001B8180 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B8284 001B8184 00008244 */  mtc1       $2, $f0
/* B8288 001B8188 00000000 */  nop
/* B828C 001B818C 03080046 */  div.s      $f0, $f1, $f0
/* B8290 001B8190 01001446 */  sub.s      $f0, $f0, $f20
/* B8294 001B8194 21185002 */  addu       $3, $18, $16
/* B8298 001B8198 280060E4 */  swc1       $f0, 0x28($3)
/* B829C 001B819C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* B82A0 001B81A0 2C0062AC */  sw         $2, 0x2C($3)
/* B82A4 001B81A4 BE11040C */  jal        rand
/* B82A8 001B81A8 00000000 */   nop
/* B82AC 001B81AC 00008244 */  mtc1       $2, $f0
/* B82B0 001B81B0 00000000 */  nop
/* B82B4 001B81B4 60008046 */  cvt.s.w    $f1, $f0
/* B82B8 001B81B8 A040023C */  lui        $2, (0x40A00000 >> 16)
/* B82BC 001B81BC 00008244 */  mtc1       $2, $f0
/* B82C0 001B81C0 00000000 */  nop
/* B82C4 001B81C4 42000146 */  mul.s      $f1, $f0, $f1
/* B82C8 001B81C8 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B82CC 001B81CC 00008244 */  mtc1       $2, $f0
/* B82D0 001B81D0 00000000 */  nop
/* B82D4 001B81D4 030B0046 */  div.s      $f12, $f1, $f0
/* B82D8 001B81D8 2C44040C */  jal        fptosi
/* B82DC 001B81DC 00000000 */   nop
/* B82E0 001B81E0 40180200 */  sll        $3, $2, 1
/* B82E4 001B81E4 21106200 */  addu       $2, $3, $2
/* B82E8 001B81E8 00190200 */  sll        $3, $2, 4
/* B82EC 001B81EC 21107002 */  addu       $2, $19, $16
/* B82F0 001B81F0 FA0643A4 */  sh         $3, 0x6FA($2)
/* B82F4 001B81F4 BE11040C */  jal        rand
/* B82F8 001B81F8 00000000 */   nop
/* B82FC 001B81FC 00008244 */  mtc1       $2, $f0
/* B8300 001B8200 00000000 */  nop
/* B8304 001B8204 60008046 */  cvt.s.w    $f1, $f0
/* B8308 001B8208 B4060286 */  lh         $2, 0x6B4($16)
/* B830C 001B820C 00008244 */  mtc1       $2, $f0
/* B8310 001B8210 00000000 */  nop
/* B8314 001B8214 20008046 */  cvt.s.w    $f0, $f0
/* B8318 001B8218 42000146 */  mul.s      $f1, $f0, $f1
/* B831C 001B821C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B8320 001B8220 00008244 */  mtc1       $2, $f0
/* B8324 001B8224 00000000 */  nop
/* B8328 001B8228 030B0046 */  div.s      $f12, $f1, $f0
/* B832C 001B822C 2C44040C */  jal        fptosi
/* B8330 001B8230 00000000 */   nop
/* B8334 001B8234 01004324 */  addiu      $3, $2, 0x1
/* B8338 001B8238 B60603A6 */  sh         $3, 0x6B6($16)
/* B833C 001B823C 05000010 */  b          .L001B8254
/* B8340 001B8240 00000000 */   nop
.L001B8244:
/* B8344 001B8244 01005226 */  addiu      $18, $18, 0x1
.L001B8248:
/* B8348 001B8248 2000432A */  slti       $3, $18, 0x20
/* B834C 001B824C 68FF6014 */  bnez       $3, .L001B7FF0
/* B8350 001B8250 00000000 */   nop
.L001B8254:
/* B8354 001B8254 2000232A */  slti       $3, $17, 0x20
/* B8358 001B8258 02006014 */  bnez       $3, .L001B8264
/* B835C 001B825C 00000000 */   nop
/* B8360 001B8260 AC0500A6 */  sh         $0, 0x5AC($16)
.L001B8264:
/* B8364 001B8264 6000BF7B */  lq         $31, 0x60($sp)
/* B8368 001B8268 5000B47B */  lq         $20, 0x50($sp)
/* B836C 001B826C 4000B37B */  lq         $19, 0x40($sp)
/* B8370 001B8270 3000B27B */  lq         $18, 0x30($sp)
/* B8374 001B8274 2000B17B */  lq         $17, 0x20($sp)
/* B8378 001B8278 1000B07B */  lq         $16, 0x10($sp)
/* B837C 001B827C 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* B8380 001B8280 7000BD27 */  addiu      $sp, $sp, 0x70
/* B8384 001B8284 0800E003 */  jr         $31
/* B8388 001B8288 00000000 */   nop
/* B838C 001B828C 00000000 */  nop