.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ShopPolySetInit__Fii
/* E7180 001E7080 D0FBBD27 */  addiu      $sp, $sp, -0x430
/* E7184 001E7084 0000BF7F */  sq         $31, 0x0($sp)
/* E7188 001E7088 2900023C */  lui        $2, %hi(_649_2)
/* E718C 001E708C F0224724 */  addiu      $7, $2, %lo(_649_2)
/* E7190 001E7090 1000A627 */  addiu      $6, $sp, 0x10
/* E7194 001E7094 1B000324 */  addiu      $3, $0, 0x1B
.L001E7098:
/* E7198 001E7098 0000E278 */  lq         $2, 0x0($7)
/* E719C 001E709C 1000E724 */  addiu      $7, $7, 0x10
/* E71A0 001E70A0 FFFF6324 */  addiu      $3, $3, -0x1
/* E71A4 001E70A4 0000C27C */  sq         $2, 0x0($6)
/* E71A8 001E70A8 1000C624 */  addiu      $6, $6, 0x10
/* E71AC 001E70AC FAFF601C */  bgtz       $3, .L001E7098
/* E71B0 001E70B0 00000000 */   nop
/* E71B4 001E70B4 2900023C */  lui        $2, %hi(_650_4)
/* E71B8 001E70B8 A0244824 */  addiu      $8, $2, %lo(_650_4)
/* E71BC 001E70BC C001A727 */  addiu      $7, $sp, 0x1C0
/* E71C0 001E70C0 12000624 */  addiu      $6, $0, 0x12
.L001E70C4:
/* E71C4 001E70C4 00000379 */  lq         $3, 0x0($8)
/* E71C8 001E70C8 10000279 */  lq         $2, 0x10($8)
/* E71CC 001E70CC 20000825 */  addiu      $8, $8, 0x20
/* E71D0 001E70D0 FFFFC624 */  addiu      $6, $6, -0x1
/* E71D4 001E70D4 0000E37C */  sq         $3, 0x0($7)
/* E71D8 001E70D8 1000E27C */  sq         $2, 0x10($7)
/* E71DC 001E70DC 2000E724 */  addiu      $7, $7, 0x20
/* E71E0 001E70E0 F8FFC01C */  bgtz       $6, .L001E70C4
/* E71E4 001E70E4 00000000 */   nop
/* E71E8 001E70E8 C0100400 */  sll        $2, $4, 3
/* E71EC 001E70EC 21184400 */  addu       $3, $2, $4
/* E71F0 001E70F0 80100300 */  sll        $2, $3, 2
/* E71F4 001E70F4 23104300 */  subu       $2, $2, $3
/* E71F8 001E70F8 C0480200 */  sll        $9, $2, 3
/* E71FC 001E70FC 21183D01 */  addu       $3, $9, $sp
/* E7200 001E7100 40100500 */  sll        $2, $5, 1
/* E7204 001E7104 21104500 */  addu       $2, $2, $5
/* E7208 001E7108 80400200 */  sll        $8, $2, 2
/* E720C 001E710C 21100301 */  addu       $2, $8, $3
/* E7210 001E7110 100040C4 */  lwc1       $f0, 0x10($2)
/* E7214 001E7114 0004A0E7 */  swc1       $f0, 0x400($sp)
/* E7218 001E7118 140040C4 */  lwc1       $f0, 0x14($2)
/* E721C 001E711C 0404A0E7 */  swc1       $f0, 0x404($sp)
/* E7220 001E7120 803F023C */  lui        $2, (0x3F800000 >> 16)
/* E7224 001E7124 0804A2AF */  sw         $2, 0x408($sp)
/* E7228 001E7128 0C04A0AF */  sw         $0, 0x40C($sp)
/* E722C 001E712C 283E0070 */  paddub     $7, $0, $0
/* E7230 001E7130 11000010 */  b          .L001E7178
/* E7234 001E7134 00000000 */   nop
.L001E7138:
/* E7238 001E7138 21103D01 */  addu       $2, $9, $sp
/* E723C 001E713C 21100201 */  addu       $2, $8, $2
/* E7240 001E7140 180040C4 */  lwc1       $f0, 0x18($2)
/* E7244 001E7144 80500700 */  sll        $10, $7, 2
/* E7248 001E7148 21305D01 */  addu       $6, $10, $sp
/* E724C 001E714C 1004C0E4 */  swc1       $f0, 0x410($6)
/* E7250 001E7150 C0100400 */  sll        $2, $4, 3
/* E7254 001E7154 21104400 */  addu       $2, $2, $4
/* E7258 001E7158 40110200 */  sll        $2, $2, 5
/* E725C 001E715C 21185D00 */  addu       $3, $2, $sp
/* E7260 001E7160 00110500 */  sll        $2, $5, 4
/* E7264 001E7164 21104300 */  addu       $2, $2, $3
/* E7268 001E7168 21104201 */  addu       $2, $10, $2
/* E726C 001E716C C00140C4 */  lwc1       $f0, 0x1C0($2)
/* E7270 001E7170 2004C0E4 */  swc1       $f0, 0x420($6)
/* E7274 001E7174 0100E724 */  addiu      $7, $7, 0x1
.L001E7178:
/* E7278 001E7178 0400E228 */  slti       $2, $7, 0x4
/* E727C 001E717C EEFF4014 */  bnez       $2, .L001E7138
/* E7280 001E7180 00000000 */   nop
/* E7284 001E7184 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* E7288 001E7188 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* E728C 001E718C 0004A527 */  addiu      $5, $sp, 0x400
/* E7290 001E7190 38E4040C */  jal        SetPosition__10CCharacterFPf
/* E7294 001E7194 00000000 */   nop
/* E7298 001E7198 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* E729C 001E719C 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* E72A0 001E71A0 1004A527 */  addiu      $5, $sp, 0x410
/* E72A4 001E71A4 B8E4040C */  jal        SetScale__10CCharacterFPf
/* E72A8 001E71A8 00000000 */   nop
/* E72AC 001E71AC D901023C */  lui        $2, %hi(MenuCharaFrame)
/* E72B0 001E71B0 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* E72B4 001E71B4 2004A527 */  addiu      $5, $sp, 0x420
/* E72B8 001E71B8 78E4040C */  jal        SetRotation__10CCharacterFPf
/* E72BC 001E71BC 00000000 */   nop
/* E72C0 001E71C0 0000BF7B */  lq         $31, 0x0($sp)
/* E72C4 001E71C4 3004BD27 */  addiu      $sp, $sp, 0x430
/* E72C8 001E71C8 0800E003 */  jr         $31
/* E72CC 001E71CC 00000000 */   nop
