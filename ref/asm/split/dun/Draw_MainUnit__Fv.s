.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw_MainUnit__Fv
/* 002110 01DADE10 20FEBD27 */  addiu       $29, $29, -0x1E0
/* 002114 01DADE14 3000BF7F */  sq          $31, 0x30($29)
/* 002118 01DADE18 2000B17F */  sq          $17, 0x20($29)
/* 00211C 01DADE1C 1000B07F */  sq          $16, 0x10($29)
/* 002120 01DADE20 0000B4E7 */  swc1        $f20, 0x0($29)
/* 002124 01DADE24 DC01013C */  lui         $1, %hi(BtActStatus)
/* 002128 01DADE28 8044238C */  lw          $3, %lo(BtActStatus)($1)
/* 00212C 01DADE2C 09006014 */  bnez        $3, .L01DADE54_2E9454
/* 002130 01DADE30 00000000 */   nop
/* 002134 01DADE34 D401013C */  lui         $1, %hi(EdEventInfo + 0x60)
/* 002138 01DADE38 30D2238C */  lw          $3, %lo(EdEventInfo + 0x60)($1)
/* 00213C 01DADE3C 05006010 */  beqz        $3, .L01DADE54_2E9454
/* 002140 01DADE40 00000000 */   nop
/* 002144 01DADE44 D401013C */  lui         $1, %hi(EdEventInfo + 0x64)
/* 002148 01DADE48 34D2238C */  lw          $3, %lo(EdEventInfo + 0x64)($1)
/* 00214C 01DADE4C 0D016014 */  bnez        $3, .L01DAE284_2E9884
/* 002150 01DADE50 00000000 */   nop
.L01DADE54_2E9454:
/* 002154 01DADE54 4000A427 */  addiu       $4, $29, 0x40
/* 002158 01DADE58 8000A527 */  addiu       $5, $29, 0x80
/* 00215C 01DADE5C 2CB7040C */  jal         MGGetPLight__FPA4_fPA4_f
/* 002160 01DADE60 00000000 */   nop
/* 002164 01DADE64 C000A427 */  addiu       $4, $29, 0xC0
/* 002168 01DADE68 4000A527 */  addiu       $5, $29, 0x40
/* 00216C 01DADE6C 1086040C */  jal         sceVu0CopyMatrix
/* 002170 01DADE70 00000000 */   nop
/* 002174 01DADE74 0001A427 */  addiu       $4, $29, 0x100
/* 002178 01DADE78 8000A527 */  addiu       $5, $29, 0x80
/* 00217C 01DADE7C 1086040C */  jal         sceVu0CopyMatrix
/* 002180 01DADE80 00000000 */   nop
/* 002184 01DADE84 349D828F */  lw          $2, -0x62CC($28)
/* 002188 01DADE88 77004010 */  beqz        $2, .L01DAE068_2E9668
/* 00218C 01DADE8C 00000000 */   nop
/* 002190 01DADE90 EB01013C */  lui         $1, %hi(shortAtraEffect + 0xBC)
/* 002194 01DADE94 5C4D248C */  lw          $4, %lo(shortAtraEffect + 0xBC)($1)
/* 002198 01DADE98 DC01023C */  lui         $2, %hi(LIT_1059__2)
/* 00219C 01DADE9C 902E4524 */  addiu       $5, $2, %lo(LIT_1059__2)
/* 0021A0 01DADEA0 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 0021A4 01DADEA4 00000000 */   nop
/* 0021A8 01DADEA8 28864070 */  paddub      $16, $2, $0
/* 0021AC 01DADEAC 8001A427 */  addiu       $4, $29, 0x180
/* 0021B0 01DADEB0 D0010526 */  addiu       $5, $16, 0x1D0
/* 0021B4 01DADEB4 1086040C */  jal         sceVu0CopyMatrix
/* 0021B8 01DADEB8 00000000 */   nop
/* 0021BC 01DADEBC B001A0C7 */  lwc1        $f0, 0x1B0($29)
/* 0021C0 01DADEC0 4001A0E7 */  swc1        $f0, 0x140($29)
/* 0021C4 01DADEC4 B401A0C7 */  lwc1        $f0, 0x1B4($29)
/* 0021C8 01DADEC8 4401A0E7 */  swc1        $f0, 0x144($29)
/* 0021CC 01DADECC B801A0C7 */  lwc1        $f0, 0x1B8($29)
/* 0021D0 01DADED0 4801A0E7 */  swc1        $f0, 0x148($29)
/* 0021D4 01DADED4 28260072 */  paddub      $4, $16, $0
/* 0021D8 01DADED8 7001A527 */  addiu       $5, $29, 0x170
/* 0021DC 01DADEDC 4001A627 */  addiu       $6, $29, 0x140
/* 0021E0 01DADEE0 58A3040C */  jal         GetWorldPosition__6CFrameFPfPf
/* 0021E4 01DADEE4 00000000 */   nop
/* 0021E8 01DADEE8 109D828F */  lw          $2, -0x62F0($28)
/* 0021EC 01DADEEC 5001A427 */  addiu       $4, $29, 0x150
/* 0021F0 01DADEF0 20024524 */  addiu       $5, $2, 0x220
/* 0021F4 01DADEF4 0C86040C */  jal         sceVu0CopyVector
/* 0021F8 01DADEF8 00000000 */   nop
/* 0021FC 01DADEFC 7001A1C7 */  lwc1        $f1, 0x170($29)
/* 002200 01DADF00 5001A0C7 */  lwc1        $f0, 0x150($29)
/* 002204 01DADF04 01080046 */  sub.s       $f0, $f1, $f0
/* 002208 01DADF08 6001A0E7 */  swc1        $f0, 0x160($29)
/* 00220C 01DADF0C 7401A1C7 */  lwc1        $f1, 0x174($29)
/* 002210 01DADF10 5401A0C7 */  lwc1        $f0, 0x154($29)
/* 002214 01DADF14 41080046 */  sub.s       $f1, $f1, $f0
/* 002218 01DADF18 4041023C */  lui         $2, (0x41400000 >> 16)
/* 00221C 01DADF1C 00008244 */  mtc1        $2, $f0
/* 002220 01DADF20 00000000 */  nop
/* 002224 01DADF24 01080046 */  sub.s       $f0, $f1, $f0
/* 002228 01DADF28 6401B027 */  addiu       $16, $29, 0x164
/* 00222C 01DADF2C 000000E6 */  swc1        $f0, 0x0($16)
/* 002230 01DADF30 7801A1C7 */  lwc1        $f1, 0x178($29)
/* 002234 01DADF34 5801A0C7 */  lwc1        $f0, 0x158($29)
/* 002238 01DADF38 01080046 */  sub.s       $f0, $f1, $f0
/* 00223C 01DADF3C 6801B127 */  addiu       $17, $29, 0x168
/* 002240 01DADF40 000020E6 */  swc1        $f0, 0x0($17)
/* 002244 01DADF44 6001A0C7 */  lwc1        $f0, 0x160($29)
/* 002248 01DADF48 42000046 */  mul.s       $f1, $f0, $f0
/* 00224C 01DADF4C 000000C6 */  lwc1        $f0, 0x0($16)
/* 002250 01DADF50 02000046 */  mul.s       $f0, $f0, $f0
/* 002254 01DADF54 18080046 */  adda.s      $f1, $f0
/* 002258 01DADF58 000020C6 */  lwc1        $f0, 0x0($17)
/* 00225C 01DADF5C 1C030046 */  madd.s      $f12, $f0, $f0
/* 002260 01DADF60 9044040C */  jal         fptodp
/* 002264 01DADF64 00000000 */   nop
/* 002268 01DADF68 28264070 */  paddub      $4, $2, $0
/* 00226C 01DADF6C CC76040C */  jal         sqrt
/* 002270 01DADF70 00000000 */   nop
/* 002274 01DADF74 28264070 */  paddub      $4, $2, $0
/* 002278 01DADF78 9241040C */  jal         dptofp
/* 00227C 01DADF7C 00000000 */   nop
/* 002280 01DADF80 2041023C */  lui         $2, (0x41200000 >> 16)
/* 002284 01DADF84 00088244 */  mtc1        $2, $f1
/* 002288 01DADF88 00000000 */  nop
/* 00228C 01DADF8C 36000146 */  c.le.s      $f0, $f1
/* 002290 01DADF90 00000000 */  nop
/* 002294 01DADF94 02000045 */  bc1f        .L01DADFA0_2E95A0
/* 002298 01DADF98 00000000 */   nop
/* 00229C 01DADF9C 06080046 */  mov.s       $f0, $f1
.L01DADFA0_2E95A0:
/* 0022A0 01DADFA0 42000046 */  mul.s       $f1, $f0, $f0
/* 0022A4 01DADFA4 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 0022A8 01DADFA8 00008244 */  mtc1        $2, $f0
/* 0022AC 01DADFAC 00000000 */  nop
/* 0022B0 01DADFB0 43000146 */  div.s       $f1, $f0, $f1
/* 0022B4 01DADFB4 A040023C */  lui         $2, (0x40A00000 >> 16)
/* 0022B8 01DADFB8 00008244 */  mtc1        $2, $f0
/* 0022BC 01DADFBC 00000000 */  nop
/* 0022C0 01DADFC0 02050146 */  mul.s       $f20, $f0, $f1
/* 0022C4 01DADFC4 6001A427 */  addiu       $4, $29, 0x160
/* 0022C8 01DADFC8 282E8070 */  paddub      $5, $4, $0
/* 0022CC 01DADFCC 9285040C */  jal         sceVu0Normalize
/* 0022D0 01DADFD0 00000000 */   nop
/* 0022D4 01DADFD4 6001A0C7 */  lwc1        $f0, 0x160($29)
/* 0022D8 01DADFD8 02001446 */  mul.s       $f0, $f0, $f20
/* 0022DC 01DADFDC 6001A0E7 */  swc1        $f0, 0x160($29)
/* 0022E0 01DADFE0 000000C6 */  lwc1        $f0, 0x0($16)
/* 0022E4 01DADFE4 02001446 */  mul.s       $f0, $f0, $f20
/* 0022E8 01DADFE8 000000E6 */  swc1        $f0, 0x0($16)
/* 0022EC 01DADFEC 000020C6 */  lwc1        $f0, 0x0($17)
/* 0022F0 01DADFF0 02001446 */  mul.s       $f0, $f0, $f20
/* 0022F4 01DADFF4 000020E6 */  swc1        $f0, 0x0($17)
/* 0022F8 01DADFF8 6C01A0AF */  sw          $0, 0x16C($29)
/* 0022FC 01DADFFC 6001A0C7 */  lwc1        $f0, 0x160($29)
/* 002300 01DAE000 4C00A0E7 */  swc1        $f0, 0x4C($29)
/* 002304 01DAE004 000000C6 */  lwc1        $f0, 0x0($16)
/* 002308 01DAE008 5C00A0E7 */  swc1        $f0, 0x5C($29)
/* 00230C 01DAE00C 000020C6 */  lwc1        $f0, 0x0($17)
/* 002310 01DAE010 6C00A0E7 */  swc1        $f0, 0x6C($29)
/* 002314 01DAE014 7C00A0AF */  sw          $0, 0x7C($29)
/* 002318 01DAE018 563F023C */  lui         $2, (0x3F560000 >> 16)
/* 00231C 01DAE01C 00008244 */  mtc1        $2, $f0
/* 002320 01DAE020 309D81C7 */  lwc1        $f1, -0x62D0($28)
/* 002324 01DAE024 02000146 */  mul.s       $f0, $f0, $f1
/* 002328 01DAE028 B000A0E7 */  swc1        $f0, 0xB0($29)
/* 00232C 01DAE02C 7A3F023C */  lui         $2, (0x3F7A0000 >> 16)
/* 002330 01DAE030 00008244 */  mtc1        $2, $f0
/* 002334 01DAE034 00000000 */  nop
/* 002338 01DAE038 02000146 */  mul.s       $f0, $f0, $f1
/* 00233C 01DAE03C B400A0E7 */  swc1        $f0, 0xB4($29)
/* 002340 01DAE040 293F023C */  lui         $2, (0x3F290000 >> 16)
/* 002344 01DAE044 00008244 */  mtc1        $2, $f0
/* 002348 01DAE048 00000000 */  nop
/* 00234C 01DAE04C 02000146 */  mul.s       $f0, $f0, $f1
/* 002350 01DAE050 B800A0E7 */  swc1        $f0, 0xB8($29)
/* 002354 01DAE054 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 002358 01DAE058 00008244 */  mtc1        $2, $f0
/* 00235C 01DAE05C 00000000 */  nop
/* 002360 01DAE060 02000146 */  mul.s       $f0, $f0, $f1
/* 002364 01DAE064 BC00A0E7 */  swc1        $f0, 0xBC($29)
.L01DAE068_2E9668:
/* 002368 01DAE068 4000A427 */  addiu       $4, $29, 0x40
/* 00236C 01DAE06C 8000A527 */  addiu       $5, $29, 0x80
/* 002370 01DAE070 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 002374 01DAE074 00000000 */   nop
/* 002378 01DAE078 D001A427 */  addiu       $4, $29, 0x1D0
/* 00237C 01DAE07C 4CB7040C */  jal         MGGetAmbient__FPf
/* 002380 01DAE080 00000000 */   nop
/* 002384 01DAE084 C001A427 */  addiu       $4, $29, 0x1C0
/* 002388 01DAE088 4CB7040C */  jal         MGGetAmbient__FPf
/* 00238C 01DAE08C 00000000 */   nop
/* 002390 01DAE090 189E828F */  lw          $2, -0x61E8($28)
/* 002394 01DAE094 45004014 */  bnez        $2, .L01DAE1AC_2E97AC
/* 002398 01DAE098 00000000 */   nop
/* 00239C 01DAE09C DC01013C */  lui         $1, %hi(BtActStatus + 0x9C)
/* 0023A0 01DAE0A0 1C45228C */  lw          $2, %lo(BtActStatus + 0x9C)($1)
/* 0023A4 01DAE0A4 41004014 */  bnez        $2, .L01DAE1AC_2E97AC
/* 0023A8 01DAE0A8 00000000 */   nop
/* 0023AC 01DAE0AC D09D828F */  lw          $2, -0x6230($28)
/* 0023B0 01DAE0B0 20004010 */  beqz        $2, .L01DAE134_2E9734
/* 0023B4 01DAE0B4 00000000 */   nop
/* 0023B8 01DAE0B8 3C9E8283 */  lb          $2, -0x61C4($28)
/* 0023BC 01DAE0BC 04004014 */  bnez        $2, .L01DAE0D0_2E96D0
/* 0023C0 01DAE0C0 00000000 */   nop
/* 0023C4 01DAE0C4 389E80AF */  sw          $0, -0x61C8($28)
/* 0023C8 01DAE0C8 01000224 */  addiu       $2, $0, 0x1
/* 0023CC 01DAE0CC 3C9E82A3 */  sb          $2, -0x61C4($28)
.L01DAE0D0_2E96D0:
/* 0023D0 01DAE0D0 389E81C7 */  lwc1        $f1, -0x61C8($28)
/* 0023D4 01DAE0D4 B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 0023D8 01DAE0D8 34080046 */  c.lt.s      $f1, $f0
/* 0023DC 01DAE0DC 00000000 */  nop
/* 0023E0 01DAE0E0 05000145 */  bc1t        .L01DAE0F8_2E96F8
/* 0023E4 01DAE0E4 00000000 */   nop
/* 0023E8 01DAE0E8 01080046 */  sub.s       $f0, $f1, $f0
/* 0023EC 01DAE0EC 389E80E7 */  swc1        $f0, -0x61C8($28)
/* 0023F0 01DAE0F0 04000010 */  b           .L01DAE104_2E9704
/* 0023F4 01DAE0F4 00000000 */   nop
.L01DAE0F8_2E96F8:
/* 0023F8 01DAE0F8 D08580C7 */  lwc1        $f0, -0x7A30($28)
/* 0023FC 01DAE0FC 00080046 */  add.s       $f0, $f1, $f0
/* 002400 01DAE100 389E80E7 */  swc1        $f0, -0x61C8($28)
.L01DAE104_2E9704:
/* 002404 01DAE104 C042023C */  lui         $2, (0x42C00000 >> 16)
/* 002408 01DAE108 C001A2AF */  sw          $2, 0x1C0($29)
/* 00240C 01DAE10C C401A2AF */  sw          $2, 0x1C4($29)
/* 002410 01DAE110 389E8CC7 */  lwc1        $f12, -0x61C8($28)
/* 002414 01DAE114 2876040C */  jal         sinf
/* 002418 01DAE118 00000000 */   nop
/* 00241C 01DAE11C C042023C */  lui         $2, (0x42C00000 >> 16)
/* 002420 01DAE120 00088244 */  mtc1        $2, $f1
/* 002424 01DAE124 00000000 */  nop
/* 002428 01DAE128 02080046 */  mul.s       $f0, $f1, $f0
/* 00242C 01DAE12C 00080046 */  add.s       $f0, $f1, $f0
/* 002430 01DAE130 C801A0E7 */  swc1        $f0, 0x1C8($29)
.L01DAE134_2E9734:
/* 002434 01DAE134 58C6060C */  jal         BtStatusErrColorSet__Fv
/* 002438 01DAE138 00000000 */   nop
/* 00243C 01DAE13C 0A004010 */  beqz        $2, .L01DAE168_2E9768
/* 002440 01DAE140 00000000 */   nop
/* 002444 01DAE144 D501013C */  lui         $1, %hi(StatusColor)
/* 002448 01DAE148 B86420C4 */  lwc1        $f0, %lo(StatusColor)($1)
/* 00244C 01DAE14C C001A0E7 */  swc1        $f0, 0x1C0($29)
/* 002450 01DAE150 D501013C */  lui         $1, %hi(StatusColor + 0x4)
/* 002454 01DAE154 BC6420C4 */  lwc1        $f0, %lo(StatusColor + 0x4)($1)
/* 002458 01DAE158 C401A0E7 */  swc1        $f0, 0x1C4($29)
/* 00245C 01DAE15C D501013C */  lui         $1, %hi(StatusColor + 0x8)
/* 002460 01DAE160 C06420C4 */  lwc1        $f0, %lo(StatusColor + 0x8)($1)
/* 002464 01DAE164 C801A0E7 */  swc1        $f0, 0x1C8($29)
.L01DAE168_2E9768:
/* 002468 01DAE168 28260070 */  paddub      $4, $0, $0
/* 00246C 01DAE16C C803770C */  jal         setUnitDamageColor__Fi
/* 002470 01DAE170 00000000 */   nop
/* 002474 01DAE174 0043023C */  lui         $2, (0x43000000 >> 16)
/* 002478 01DAE178 00088244 */  mtc1        $2, $f1
/* 00247C 01DAE17C 00000000 */  nop
/* 002480 01DAE180 32080046 */  c.eq.s      $f1, $f0
/* 002484 01DAE184 00000000 */  nop
/* 002488 01DAE188 05000145 */  bc1t        .L01DAE1A0_2E97A0
/* 00248C 01DAE18C 00000000 */   nop
/* 002490 01DAE190 C001A0E7 */  swc1        $f0, 0x1C0($29)
/* 002494 01DAE194 C401A0E7 */  swc1        $f0, 0x1C4($29)
/* 002498 01DAE198 C801A0E7 */  swc1        $f0, 0x1C8($29)
/* 00249C 01DAE19C CC01A2AF */  sw          $2, 0x1CC($29)
.L01DAE1A0_2E97A0:
/* 0024A0 01DAE1A0 C001A427 */  addiu       $4, $29, 0x1C0
/* 0024A4 01DAE1A4 1404770C */  jal         unitAmbientAnime__FPf
/* 0024A8 01DAE1A8 00000000 */   nop
.L01DAE1AC_2E97AC:
/* 0024AC 01DAE1AC C001A427 */  addiu       $4, $29, 0x1C0
/* 0024B0 01DAE1B0 40B7040C */  jal         MGSetAmbient__FPf
/* 0024B4 01DAE1B4 00000000 */   nop
/* 0024B8 01DAE1B8 C701023C */  lui         $2, %hi(TexManager)
/* 0024BC 01DAE1BC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0024C0 01DAE1C0 D48B858F */  lw          $5, -0x742C($28)
/* 0024C4 01DAE1C4 11000624 */  addiu       $6, $0, 0x11
/* 0024C8 01DAE1C8 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0024CC 01DAE1CC 00000000 */   nop
/* 0024D0 01DAE1D0 EA01023C */  lui         $2, %hi(CharaMain)
/* 0024D4 01DAE1D4 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 0024D8 01DAE1D8 11000524 */  addiu       $5, $0, 0x11
/* 0024DC 01DAE1DC 14E0040C */  jal         TextureAnime__10CCharacterFi
/* 0024E0 01DAE1E0 00000000 */   nop
/* 0024E4 01DAE1E4 EA01023C */  lui         $2, %hi(CharaMain)
/* 0024E8 01DAE1E8 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 0024EC 01DAE1EC C4E4040C */  jal         Draw__10CCharacterFv
/* 0024F0 01DAE1F0 00000000 */   nop
/* 0024F4 01DAE1F4 009D828F */  lw          $2, -0x6300($28)
/* 0024F8 01DAE1F8 13004010 */  beqz        $2, .L01DAE248_2E9848
/* 0024FC 01DAE1FC 00000000 */   nop
/* 002500 01DAE200 BC00428C */  lw          $2, 0xBC($2)
/* 002504 01DAE204 10004010 */  beqz        $2, .L01DAE248_2E9848
/* 002508 01DAE208 00000000 */   nop
/* 00250C 01DAE20C DC01013C */  lui         $1, %hi(BtActStatus + 0x58)
/* 002510 01DAE210 D844228C */  lw          $2, %lo(BtActStatus + 0x58)($1)
/* 002514 01DAE214 0C004010 */  beqz        $2, .L01DAE248_2E9848
/* 002518 01DAE218 00000000 */   nop
/* 00251C 01DAE21C C701023C */  lui         $2, %hi(TexManager)
/* 002520 01DAE220 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002524 01DAE224 D48B858F */  lw          $5, -0x742C($28)
/* 002528 01DAE228 1D000624 */  addiu       $6, $0, 0x1D
/* 00252C 01DAE22C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 002530 01DAE230 00000000 */   nop
/* 002534 01DAE234 009D848F */  lw          $4, -0x6300($28)
/* 002538 01DAE238 A000998C */  lw          $25, 0xA0($4)
/* 00253C 01DAE23C AC00398F */  lw          $25, 0xAC($25)
/* 002540 01DAE240 09F82003 */  jalr        $25
/* 002544 01DAE244 00000000 */   nop
.L01DAE248_2E9848:
/* 002548 01DAE248 D001A427 */  addiu       $4, $29, 0x1D0
/* 00254C 01DAE24C 40B7040C */  jal         MGSetAmbient__FPf
/* 002550 01DAE250 00000000 */   nop
/* 002554 01DAE254 4000A427 */  addiu       $4, $29, 0x40
/* 002558 01DAE258 C000A527 */  addiu       $5, $29, 0xC0
/* 00255C 01DAE25C 1086040C */  jal         sceVu0CopyMatrix
/* 002560 01DAE260 00000000 */   nop
/* 002564 01DAE264 8000A427 */  addiu       $4, $29, 0x80
/* 002568 01DAE268 0001A527 */  addiu       $5, $29, 0x100
/* 00256C 01DAE26C 1086040C */  jal         sceVu0CopyMatrix
/* 002570 01DAE270 00000000 */   nop
/* 002574 01DAE274 4000A427 */  addiu       $4, $29, 0x40
/* 002578 01DAE278 8000A527 */  addiu       $5, $29, 0x80
/* 00257C 01DAE27C 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 002580 01DAE280 00000000 */   nop
.L01DAE284_2E9884:
/* 002584 01DAE284 3000BF7B */  lq          $31, 0x30($29)
/* 002588 01DAE288 2000B17B */  lq          $17, 0x20($29)
/* 00258C 01DAE28C 1000B07B */  lq          $16, 0x10($29)
/* 002590 01DAE290 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 002594 01DAE294 E001BD27 */  addiu       $29, $29, 0x1E0
/* 002598 01DAE298 0800E003 */  jr          $31
/* 00259C 01DAE29C 00000000 */   nop
