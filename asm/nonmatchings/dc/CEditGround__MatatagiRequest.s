.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MatatagiRequest__11CEditGroundFPA64_P9CMapParts
/* A6E90 001A6D90 20F7BD27 */  addiu      $sp, $sp, -0x8E0
/* A6E94 001A6D94 3000BF7F */  sq         $31, 0x30($sp)
/* A6E98 001A6D98 2000B27F */  sq         $18, 0x20($sp)
/* A6E9C 001A6D9C 1000B17F */  sq         $17, 0x10($sp)
/* A6EA0 001A6DA0 0000B07F */  sq         $16, 0x0($sp)
/* A6EA4 001A6DA4 288E8070 */  paddub     $17, $4, $0
/* A6EA8 001A6DA8 2886A070 */  paddub     $16, $5, $0
/* A6EAC 001A6DAC 0A000524 */  addiu      $5, $0, 0xA
/* A6EB0 001A6DB0 0100013C */  lui        $at, (0x15030 >> 16)
/* A6EB4 001A6DB4 21088100 */  addu       $at, $4, $at
/* A6EB8 001A6DB8 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A6EBC 001A6DBC 000065AC */  sw         $5, 0x0($3)
/* A6EC0 001A6DC0 0400848C */  lw         $4, 0x4($4)
/* A6EC4 001A6DC4 07008010 */  beqz       $4, .L001A6DE4
/* A6EC8 001A6DC8 00000000 */   nop
/* A6ECC 001A6DCC 0800238E */  lw         $3, 0x8($17)
/* A6ED0 001A6DD0 04006010 */  beqz       $3, .L001A6DE4
/* A6ED4 001A6DD4 00000000 */   nop
/* A6ED8 001A6DD8 0C00238E */  lw         $3, 0xC($17)
/* A6EDC 001A6DDC 03006014 */  bnez       $3, .L001A6DEC
/* A6EE0 001A6DE0 00000000 */   nop
.L001A6DE4:
/* A6EE4 001A6DE4 7A010010 */  b          .L001A73D0
/* A6EE8 001A6DE8 00000000 */   nop
.L001A6DEC:
/* A6EEC 001A6DEC 28BF050C */  jal        ChainWorkClear__9CEditAreaFv
/* A6EF0 001A6DF0 00000000 */   nop
/* A6EF4 001A6DF4 0400248E */  lw         $4, 0x4($17)
/* A6EF8 001A6DF8 05000524 */  addiu      $5, $0, 0x5
/* A6EFC 001A6DFC 28360070 */  paddub     $6, $0, $0
/* A6F00 001A6E00 02000724 */  addiu      $7, $0, 0x2
/* A6F04 001A6E04 07000824 */  addiu      $8, $0, 0x7
/* A6F08 001A6E08 40BF050C */  jal        CheckRiverChain__9CEditAreaFiiii
/* A6F0C 001A6E0C 00000000 */   nop
/* A6F10 001A6E10 28964070 */  paddub     $18, $2, $0
/* A6F14 001A6E14 0800248E */  lw         $4, 0x8($17)
/* A6F18 001A6E18 28BF050C */  jal        ChainWorkClear__9CEditAreaFv
/* A6F1C 001A6E1C 00000000 */   nop
/* A6F20 001A6E20 0800248E */  lw         $4, 0x8($17)
/* A6F24 001A6E24 03000524 */  addiu      $5, $0, 0x3
/* A6F28 001A6E28 05000624 */  addiu      $6, $0, 0x5
/* A6F2C 001A6E2C 0B000724 */  addiu      $7, $0, 0xB
/* A6F30 001A6E30 2846A070 */  paddub     $8, $5, $0
/* A6F34 001A6E34 40BF050C */  jal        CheckRiverChain__9CEditAreaFiiii
/* A6F38 001A6E38 00000000 */   nop
/* A6F3C 001A6E3C 24904202 */  and        $18, $18, $2
/* A6F40 001A6E40 0C00248E */  lw         $4, 0xC($17)
/* A6F44 001A6E44 28BF050C */  jal        ChainWorkClear__9CEditAreaFv
/* A6F48 001A6E48 00000000 */   nop
/* A6F4C 001A6E4C 0C00248E */  lw         $4, 0xC($17)
/* A6F50 001A6E50 04000524 */  addiu      $5, $0, 0x4
/* A6F54 001A6E54 28360070 */  paddub     $6, $0, $0
/* A6F58 001A6E58 03000724 */  addiu      $7, $0, 0x3
/* A6F5C 001A6E5C 07000824 */  addiu      $8, $0, 0x7
/* A6F60 001A6E60 40BF050C */  jal        CheckRiverChain__9CEditAreaFiiii
/* A6F64 001A6E64 00000000 */   nop
/* A6F68 001A6E68 24904202 */  and        $18, $18, $2
/* A6F6C 001A6E6C 06004012 */  beqz       $18, .L001A6E88
/* A6F70 001A6E70 00000000 */   nop
/* A6F74 001A6E74 01000424 */  addiu      $4, $0, 0x1
/* A6F78 001A6E78 0100013C */  lui        $at, (0x15030 >> 16)
/* A6F7C 001A6E7C 21082102 */  addu       $at, $17, $at
/* A6F80 001A6E80 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A6F84 001A6E84 440064AC */  sw         $4, 0x44($3)
.L001A6E88:
/* A6F88 001A6E88 0000038E */  lw         $3, 0x0($16)
/* A6F8C 001A6E8C 26006010 */  beqz       $3, .L001A6F28
/* A6F90 001A6E90 00000000 */   nop
/* A6F94 001A6E94 B008A0AF */  sw         $0, 0x8B0($sp)
/* A6F98 001A6E98 B408A0AF */  sw         $0, 0x8B4($sp)
/* A6F9C 001A6E9C 04000224 */  addiu      $2, $0, 0x4
/* A6FA0 001A6EA0 B808A2AF */  sw         $2, 0x8B8($sp)
/* A6FA4 001A6EA4 01000224 */  addiu      $2, $0, 0x1
/* A6FA8 001A6EA8 BC08A2AF */  sw         $2, 0x8BC($sp)
/* A6FAC 001A6EAC 28262072 */  paddub     $4, $17, $0
/* A6FB0 001A6EB0 282E0070 */  paddub     $5, $0, $0
/* A6FB4 001A6EB4 28360070 */  paddub     $6, $0, $0
/* A6FB8 001A6EB8 B008A727 */  addiu      $7, $sp, 0x8B0
/* A6FBC 001A6EBC 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A6FC0 001A6EC0 00000000 */   nop
/* A6FC4 001A6EC4 06004010 */  beqz       $2, .L001A6EE0
/* A6FC8 001A6EC8 00000000 */   nop
/* A6FCC 001A6ECC 01000324 */  addiu      $3, $0, 0x1
/* A6FD0 001A6ED0 0100013C */  lui        $at, (0x15030 >> 16)
/* A6FD4 001A6ED4 21082102 */  addu       $at, $17, $at
/* A6FD8 001A6ED8 3050228C */  lw         $2, (0x15030 & 0xFFFF)($at)
/* A6FDC 001A6EDC 040043AC */  sw         $3, 0x4($2)
.L001A6EE0:
/* A6FE0 001A6EE0 C008A0AF */  sw         $0, 0x8C0($sp)
/* A6FE4 001A6EE4 05000224 */  addiu      $2, $0, 0x5
/* A6FE8 001A6EE8 C408A2AF */  sw         $2, 0x8C4($sp)
/* A6FEC 001A6EEC 01000624 */  addiu      $6, $0, 0x1
/* A6FF0 001A6EF0 C808A6AF */  sw         $6, 0x8C8($sp)
/* A6FF4 001A6EF4 CC08A6AF */  sw         $6, 0x8CC($sp)
/* A6FF8 001A6EF8 28262072 */  paddub     $4, $17, $0
/* A6FFC 001A6EFC 282E0070 */  paddub     $5, $0, $0
/* A7000 001A6F00 C008A727 */  addiu      $7, $sp, 0x8C0
/* A7004 001A6F04 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A7008 001A6F08 00000000 */   nop
/* A700C 001A6F0C 06004010 */  beqz       $2, .L001A6F28
/* A7010 001A6F10 00000000 */   nop
/* A7014 001A6F14 01000424 */  addiu      $4, $0, 0x1
/* A7018 001A6F18 0100013C */  lui        $at, (0x15030 >> 16)
/* A701C 001A6F1C 21082102 */  addu       $at, $17, $at
/* A7020 001A6F20 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A7024 001A6F24 040064AC */  sw         $4, 0x4($3)
.L001A6F28:
/* A7028 001A6F28 0001038E */  lw         $3, 0x100($16)
/* A702C 001A6F2C 35006010 */  beqz       $3, .L001A7004
/* A7030 001A6F30 00000000 */   nop
/* A7034 001A6F34 4C04A0AF */  sw         $0, 0x44C($sp)
/* A7038 001A6F38 4804A0AF */  sw         $0, 0x448($sp)
/* A703C 001A6F3C 4404A0AF */  sw         $0, 0x444($sp)
/* A7040 001A6F40 4004A0AF */  sw         $0, 0x440($sp)
/* A7044 001A6F44 28262072 */  paddub     $4, $17, $0
/* A7048 001A6F48 4004A527 */  addiu      $5, $sp, 0x440
/* A704C 001A6F4C 0001068E */  lw         $6, 0x100($16)
/* A7050 001A6F50 01000724 */  addiu      $7, $0, 0x1
/* A7054 001A6F54 B098060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsi
/* A7058 001A6F58 00000000 */   nop
/* A705C 001A6F5C 0001028E */  lw         $2, 0x100($16)
/* A7060 001A6F60 F400428C */  lw         $2, 0xF4($2)
/* A7064 001A6F64 80100200 */  sll        $2, $2, 2
/* A7068 001A6F68 21105100 */  addu       $2, $2, $17
/* A706C 001A6F6C 0400448C */  lw         $4, 0x4($2)
/* A7070 001A6F70 4004A527 */  addiu      $5, $sp, 0x440
/* A7074 001A6F74 4000A627 */  addiu      $6, $sp, 0x40
/* A7078 001A6F78 00010724 */  addiu      $7, $0, 0x100
/* A707C 001A6F7C D4BE050C */  jal        GetPartsRect__9CEditAreaFR8CRect_i_Pii
/* A7080 001A6F80 00000000 */   nop
/* A7084 001A6F84 282E0070 */  paddub     $5, $0, $0
/* A7088 001A6F88 28360070 */  paddub     $6, $0, $0
/* A708C 001A6F8C 1A000010 */  b          .L001A6FF8
/* A7090 001A6F90 00000000 */   nop
.L001A6F94:
/* A7094 001A6F94 80180600 */  sll        $3, $6, 2
/* A7098 001A6F98 21187D00 */  addu       $3, $3, $sp
/* A709C 001A6F9C 4000648C */  lw         $4, 0x40($3)
/* A70A0 001A6FA0 C0180400 */  sll        $3, $4, 3
/* A70A4 001A6FA4 23206400 */  subu       $4, $3, $4
/* A70A8 001A6FA8 80180400 */  sll        $3, $4, 2
/* A70AC 001A6FAC 23186400 */  subu       $3, $3, $4
/* A70B0 001A6FB0 40190300 */  sll        $3, $3, 5
/* A70B4 001A6FB4 21187100 */  addu       $3, $3, $17
/* A70B8 001A6FB8 2001648C */  lw         $4, 0x120($3)
/* A70BC 001A6FBC 0F000324 */  addiu      $3, $0, 0xF
/* A70C0 001A6FC0 02008314 */  bne        $4, $3, .L001A6FCC
/* A70C4 001A6FC4 00000000 */   nop
/* A70C8 001A6FC8 0100A524 */  addiu      $5, $5, 0x1
.L001A6FCC:
/* A70CC 001A6FCC 0400A328 */  slti       $3, $5, 0x4
/* A70D0 001A6FD0 08006014 */  bnez       $3, .L001A6FF4
/* A70D4 001A6FD4 00000000 */   nop
/* A70D8 001A6FD8 01000424 */  addiu      $4, $0, 0x1
/* A70DC 001A6FDC 0100013C */  lui        $at, (0x15030 >> 16)
/* A70E0 001A6FE0 21082102 */  addu       $at, $17, $at
/* A70E4 001A6FE4 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A70E8 001A6FE8 080064AC */  sw         $4, 0x8($3)
/* A70EC 001A6FEC 05000010 */  b          .L001A7004
/* A70F0 001A6FF0 00000000 */   nop
.L001A6FF4:
/* A70F4 001A6FF4 0100C624 */  addiu      $6, $6, 0x1
.L001A6FF8:
/* A70F8 001A6FF8 2A18C200 */  slt        $3, $6, $2
/* A70FC 001A6FFC E5FF6014 */  bnez       $3, .L001A6F94
/* A7100 001A7000 00000000 */   nop
.L001A7004:
/* A7104 001A7004 0002038E */  lw         $3, 0x200($16)
/* A7108 001A7008 34006010 */  beqz       $3, .L001A70DC
/* A710C 001A700C 00000000 */   nop
/* A7110 001A7010 5C04A0AF */  sw         $0, 0x45C($sp)
/* A7114 001A7014 5804A0AF */  sw         $0, 0x458($sp)
/* A7118 001A7018 5404A0AF */  sw         $0, 0x454($sp)
/* A711C 001A701C 5004A0AF */  sw         $0, 0x450($sp)
/* A7120 001A7020 28262072 */  paddub     $4, $17, $0
/* A7124 001A7024 5004A527 */  addiu      $5, $sp, 0x450
/* A7128 001A7028 0002068E */  lw         $6, 0x200($16)
/* A712C 001A702C 03000724 */  addiu      $7, $0, 0x3
/* A7130 001A7030 B098060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsi
/* A7134 001A7034 00000000 */   nop
/* A7138 001A7038 0002028E */  lw         $2, 0x200($16)
/* A713C 001A703C F400528C */  lw         $18, 0xF4($2)
/* A7140 001A7040 28262072 */  paddub     $4, $17, $0
/* A7144 001A7044 0B000524 */  addiu      $5, $0, 0xB
/* A7148 001A7048 28364072 */  paddub     $6, $18, $0
/* A714C 001A704C 5004A727 */  addiu      $7, $sp, 0x450
/* A7150 001A7050 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A7154 001A7054 00000000 */   nop
/* A7158 001A7058 06004010 */  beqz       $2, .L001A7074
/* A715C 001A705C 00000000 */   nop
/* A7160 001A7060 01000324 */  addiu      $3, $0, 0x1
/* A7164 001A7064 0100013C */  lui        $at, (0x15030 >> 16)
/* A7168 001A7068 21082102 */  addu       $at, $17, $at
/* A716C 001A706C 3050228C */  lw         $2, (0x15030 & 0xFFFF)($at)
/* A7170 001A7070 0C0043AC */  sw         $3, 0xC($2)
.L001A7074:
/* A7174 001A7074 28262072 */  paddub     $4, $17, $0
/* A7178 001A7078 0C000524 */  addiu      $5, $0, 0xC
/* A717C 001A707C 28364072 */  paddub     $6, $18, $0
/* A7180 001A7080 5004A727 */  addiu      $7, $sp, 0x450
/* A7184 001A7084 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A7188 001A7088 00000000 */   nop
/* A718C 001A708C 06004010 */  beqz       $2, .L001A70A8
/* A7190 001A7090 00000000 */   nop
/* A7194 001A7094 01000324 */  addiu      $3, $0, 0x1
/* A7198 001A7098 0100013C */  lui        $at, (0x15030 >> 16)
/* A719C 001A709C 21082102 */  addu       $at, $17, $at
/* A71A0 001A70A0 3050228C */  lw         $2, (0x15030 & 0xFFFF)($at)
/* A71A4 001A70A4 0C0043AC */  sw         $3, 0xC($2)
.L001A70A8:
/* A71A8 001A70A8 28262072 */  paddub     $4, $17, $0
/* A71AC 001A70AC 0D000524 */  addiu      $5, $0, 0xD
/* A71B0 001A70B0 28364072 */  paddub     $6, $18, $0
/* A71B4 001A70B4 5004A727 */  addiu      $7, $sp, 0x450
/* A71B8 001A70B8 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A71BC 001A70BC 00000000 */   nop
/* A71C0 001A70C0 06004010 */  beqz       $2, .L001A70DC
/* A71C4 001A70C4 00000000 */   nop
/* A71C8 001A70C8 01000424 */  addiu      $4, $0, 0x1
/* A71CC 001A70CC 0100013C */  lui        $at, (0x15030 >> 16)
/* A71D0 001A70D0 21082102 */  addu       $at, $17, $at
/* A71D4 001A70D4 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A71D8 001A70D8 0C0064AC */  sw         $4, 0xC($3)
.L001A70DC:
/* A71DC 001A70DC 0003038E */  lw         $3, 0x300($16)
/* A71E0 001A70E0 19006010 */  beqz       $3, .L001A7148
/* A71E4 001A70E4 00000000 */   nop
/* A71E8 001A70E8 6C04A0AF */  sw         $0, 0x46C($sp)
/* A71EC 001A70EC 6804A0AF */  sw         $0, 0x468($sp)
/* A71F0 001A70F0 6404A0AF */  sw         $0, 0x464($sp)
/* A71F4 001A70F4 6004A0AF */  sw         $0, 0x460($sp)
/* A71F8 001A70F8 28262072 */  paddub     $4, $17, $0
/* A71FC 001A70FC 6004A527 */  addiu      $5, $sp, 0x460
/* A7200 001A7100 0003068E */  lw         $6, 0x300($16)
/* A7204 001A7104 04000724 */  addiu      $7, $0, 0x4
/* A7208 001A7108 B098060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsi
/* A720C 001A710C 00000000 */   nop
/* A7210 001A7110 0003028E */  lw         $2, 0x300($16)
/* A7214 001A7114 F400468C */  lw         $6, 0xF4($2)
/* A7218 001A7118 28262072 */  paddub     $4, $17, $0
/* A721C 001A711C 0E000524 */  addiu      $5, $0, 0xE
/* A7220 001A7120 6004A727 */  addiu      $7, $sp, 0x460
/* A7224 001A7124 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A7228 001A7128 00000000 */   nop
/* A722C 001A712C 06004010 */  beqz       $2, .L001A7148
/* A7230 001A7130 00000000 */   nop
/* A7234 001A7134 01000424 */  addiu      $4, $0, 0x1
/* A7238 001A7138 0100013C */  lui        $at, (0x15030 >> 16)
/* A723C 001A713C 21082102 */  addu       $at, $17, $at
/* A7240 001A7140 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A7244 001A7144 100064AC */  sw         $4, 0x10($3)
.L001A7148:
/* A7248 001A7148 0004038E */  lw         $3, 0x400($16)
/* A724C 001A714C 15006010 */  beqz       $3, .L001A71A4
/* A7250 001A7150 00000000 */   nop
/* A7254 001A7154 D008A0AF */  sw         $0, 0x8D0($sp)
/* A7258 001A7158 05000224 */  addiu      $2, $0, 0x5
/* A725C 001A715C D408A2AF */  sw         $2, 0x8D4($sp)
/* A7260 001A7160 07000224 */  addiu      $2, $0, 0x7
/* A7264 001A7164 D808A2AF */  sw         $2, 0x8D8($sp)
/* A7268 001A7168 03000224 */  addiu      $2, $0, 0x3
/* A726C 001A716C DC08A2AF */  sw         $2, 0x8DC($sp)
/* A7270 001A7170 28262072 */  paddub     $4, $17, $0
/* A7274 001A7174 04000524 */  addiu      $5, $0, 0x4
/* A7278 001A7178 02000624 */  addiu      $6, $0, 0x2
/* A727C 001A717C D008A727 */  addiu      $7, $sp, 0x8D0
/* A7280 001A7180 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A7284 001A7184 00000000 */   nop
/* A7288 001A7188 06004010 */  beqz       $2, .L001A71A4
/* A728C 001A718C 00000000 */   nop
/* A7290 001A7190 01000424 */  addiu      $4, $0, 0x1
/* A7294 001A7194 0100013C */  lui        $at, (0x15030 >> 16)
/* A7298 001A7198 21082102 */  addu       $at, $17, $at
/* A729C 001A719C 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A72A0 001A71A0 140064AC */  sw         $4, 0x14($3)
.L001A71A4:
/* A72A4 001A71A4 0005048E */  lw         $4, 0x500($16)
/* A72A8 001A71A8 11008010 */  beqz       $4, .L001A71F0
/* A72AC 001A71AC 00000000 */   nop
/* A72B0 001A71B0 7004A527 */  addiu      $5, $sp, 0x470
/* A72B4 001A71B4 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* A72B8 001A71B8 00000000 */   nop
/* A72BC 001A71BC 28262072 */  paddub     $4, $17, $0
/* A72C0 001A71C0 7004ACC7 */  lwc1       $f12, 0x470($sp)
/* A72C4 001A71C4 7404ADC7 */  lwc1       $f13, 0x474($sp)
/* A72C8 001A71C8 7804AEC7 */  lwc1       $f14, 0x478($sp)
/* A72CC 001A71CC FC85060C */  jal        GetAlt_i__11CEditGroundFfff
/* A72D0 001A71D0 00000000 */   nop
/* A72D4 001A71D4 06004018 */  blez       $2, .L001A71F0
/* A72D8 001A71D8 00000000 */   nop
/* A72DC 001A71DC 01000424 */  addiu      $4, $0, 0x1
/* A72E0 001A71E0 0100013C */  lui        $at, (0x15030 >> 16)
/* A72E4 001A71E4 21082102 */  addu       $at, $17, $at
/* A72E8 001A71E8 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A72EC 001A71EC 180064AC */  sw         $4, 0x18($3)
.L001A71F0:
/* A72F0 001A71F0 0006038E */  lw         $3, 0x600($16)
/* A72F4 001A71F4 1C006010 */  beqz       $3, .L001A7268
/* A72F8 001A71F8 00000000 */   nop
/* A72FC 001A71FC 0003038E */  lw         $3, 0x300($16)
/* A7300 001A7200 19006010 */  beqz       $3, .L001A7268
/* A7304 001A7204 00000000 */   nop
/* A7308 001A7208 8C04A0AF */  sw         $0, 0x48C($sp)
/* A730C 001A720C 8804A0AF */  sw         $0, 0x488($sp)
/* A7310 001A7210 8404A0AF */  sw         $0, 0x484($sp)
/* A7314 001A7214 8004A0AF */  sw         $0, 0x480($sp)
/* A7318 001A7218 28262072 */  paddub     $4, $17, $0
/* A731C 001A721C 8004A527 */  addiu      $5, $sp, 0x480
/* A7320 001A7220 0003068E */  lw         $6, 0x300($16)
/* A7324 001A7224 03000724 */  addiu      $7, $0, 0x3
/* A7328 001A7228 B098060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsi
/* A732C 001A722C 00000000 */   nop
/* A7330 001A7230 0003028E */  lw         $2, 0x300($16)
/* A7334 001A7234 28262072 */  paddub     $4, $17, $0
/* A7338 001A7238 06000524 */  addiu      $5, $0, 0x6
/* A733C 001A723C F400468C */  lw         $6, 0xF4($2)
/* A7340 001A7240 8004A727 */  addiu      $7, $sp, 0x480
/* A7344 001A7244 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A7348 001A7248 00000000 */   nop
/* A734C 001A724C 06004010 */  beqz       $2, .L001A7268
/* A7350 001A7250 00000000 */   nop
/* A7354 001A7254 01000424 */  addiu      $4, $0, 0x1
/* A7358 001A7258 0100013C */  lui        $at, (0x15030 >> 16)
/* A735C 001A725C 21082102 */  addu       $at, $17, $at
/* A7360 001A7260 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A7364 001A7264 1C0064AC */  sw         $4, 0x1C($3)
.L001A7268:
/* A7368 001A7268 0007048E */  lw         $4, 0x700($16)
/* A736C 001A726C 11008010 */  beqz       $4, .L001A72B4
/* A7370 001A7270 00000000 */   nop
/* A7374 001A7274 9004A527 */  addiu      $5, $sp, 0x490
/* A7378 001A7278 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* A737C 001A727C 00000000 */   nop
/* A7380 001A7280 28262072 */  paddub     $4, $17, $0
/* A7384 001A7284 9004ACC7 */  lwc1       $f12, 0x490($sp)
/* A7388 001A7288 9404ADC7 */  lwc1       $f13, 0x494($sp)
/* A738C 001A728C 9804AEC7 */  lwc1       $f14, 0x498($sp)
/* A7390 001A7290 FC85060C */  jal        GetAlt_i__11CEditGroundFfff
/* A7394 001A7294 00000000 */   nop
/* A7398 001A7298 06004018 */  blez       $2, .L001A72B4
/* A739C 001A729C 00000000 */   nop
/* A73A0 001A72A0 01000424 */  addiu      $4, $0, 0x1
/* A73A4 001A72A4 0100013C */  lui        $at, (0x15030 >> 16)
/* A73A8 001A72A8 21082102 */  addu       $at, $17, $at
/* A73AC 001A72AC 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A73B0 001A72B0 200064AC */  sw         $4, 0x20($3)
.L001A72B4:
/* A73B4 001A72B4 000E038E */  lw         $3, 0xE00($16)
/* A73B8 001A72B8 45006010 */  beqz       $3, .L001A73D0
/* A73BC 001A72BC 00000000 */   nop
/* A73C0 001A72C0 AC08A0AF */  sw         $0, 0x8AC($sp)
/* A73C4 001A72C4 A808A0AF */  sw         $0, 0x8A8($sp)
/* A73C8 001A72C8 A408A0AF */  sw         $0, 0x8A4($sp)
/* A73CC 001A72CC A008A0AF */  sw         $0, 0x8A0($sp)
/* A73D0 001A72D0 28262072 */  paddub     $4, $17, $0
/* A73D4 001A72D4 A008A527 */  addiu      $5, $sp, 0x8A0
/* A73D8 001A72D8 000E068E */  lw         $6, 0xE00($16)
/* A73DC 001A72DC 01000724 */  addiu      $7, $0, 0x1
/* A73E0 001A72E0 B098060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsi
/* A73E4 001A72E4 00000000 */   nop
/* A73E8 001A72E8 000E028E */  lw         $2, 0xE00($16)
/* A73EC 001A72EC F400428C */  lw         $2, 0xF4($2)
/* A73F0 001A72F0 80100200 */  sll        $2, $2, 2
/* A73F4 001A72F4 21105100 */  addu       $2, $2, $17
/* A73F8 001A72F8 0400448C */  lw         $4, 0x4($2)
/* A73FC 001A72FC A008A527 */  addiu      $5, $sp, 0x8A0
/* A7400 001A7300 A004A627 */  addiu      $6, $sp, 0x4A0
/* A7404 001A7304 00010724 */  addiu      $7, $0, 0x100
/* A7408 001A7308 D4BE050C */  jal        GetPartsRect__9CEditAreaFR8CRect_i_Pii
/* A740C 001A730C 00000000 */   nop
/* A7410 001A7310 282E0070 */  paddub     $5, $0, $0
/* A7414 001A7314 28360070 */  paddub     $6, $0, $0
/* A7418 001A7318 2A000010 */  b          .L001A73C4
/* A741C 001A731C 00000000 */   nop
.L001A7320:
/* A7420 001A7320 80180600 */  sll        $3, $6, 2
/* A7424 001A7324 21187D00 */  addu       $3, $3, $sp
/* A7428 001A7328 A004648C */  lw         $4, 0x4A0($3)
/* A742C 001A732C C0180400 */  sll        $3, $4, 3
/* A7430 001A7330 23206400 */  subu       $4, $3, $4
/* A7434 001A7334 80180400 */  sll        $3, $4, 2
/* A7438 001A7338 23186400 */  subu       $3, $3, $4
/* A743C 001A733C 40190300 */  sll        $3, $3, 5
/* A7440 001A7340 21187100 */  addu       $3, $3, $17
/* A7444 001A7344 2001648C */  lw         $4, 0x120($3)
/* A7448 001A7348 10000324 */  addiu      $3, $0, 0x10
/* A744C 001A734C 02008314 */  bne        $4, $3, .L001A7358
/* A7450 001A7350 00000000 */   nop
/* A7454 001A7354 0100A524 */  addiu      $5, $5, 0x1
.L001A7358:
/* A7458 001A7358 11000324 */  addiu      $3, $0, 0x11
/* A745C 001A735C 02008314 */  bne        $4, $3, .L001A7368
/* A7460 001A7360 00000000 */   nop
/* A7464 001A7364 0100A524 */  addiu      $5, $5, 0x1
.L001A7368:
/* A7468 001A7368 0B000324 */  addiu      $3, $0, 0xB
/* A746C 001A736C 02008314 */  bne        $4, $3, .L001A7378
/* A7470 001A7370 00000000 */   nop
/* A7474 001A7374 0100A524 */  addiu      $5, $5, 0x1
.L001A7378:
/* A7478 001A7378 0C000324 */  addiu      $3, $0, 0xC
/* A747C 001A737C 02008314 */  bne        $4, $3, .L001A7388
/* A7480 001A7380 00000000 */   nop
/* A7484 001A7384 0100A524 */  addiu      $5, $5, 0x1
.L001A7388:
/* A7488 001A7388 0D000324 */  addiu      $3, $0, 0xD
/* A748C 001A738C 02008314 */  bne        $4, $3, .L001A7398
/* A7490 001A7390 00000000 */   nop
/* A7494 001A7394 0100A524 */  addiu      $5, $5, 0x1
.L001A7398:
/* A7498 001A7398 0E00A328 */  slti       $3, $5, 0xE
/* A749C 001A739C 08006014 */  bnez       $3, .L001A73C0
/* A74A0 001A73A0 00000000 */   nop
/* A74A4 001A73A4 01000424 */  addiu      $4, $0, 0x1
/* A74A8 001A73A8 0100013C */  lui        $at, (0x15030 >> 16)
/* A74AC 001A73AC 21082102 */  addu       $at, $17, $at
/* A74B0 001A73B0 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A74B4 001A73B4 3C0064AC */  sw         $4, 0x3C($3)
/* A74B8 001A73B8 05000010 */  b          .L001A73D0
/* A74BC 001A73BC 00000000 */   nop
.L001A73C0:
/* A74C0 001A73C0 0100C624 */  addiu      $6, $6, 0x1
.L001A73C4:
/* A74C4 001A73C4 2A18C200 */  slt        $3, $6, $2
/* A74C8 001A73C8 D5FF6014 */  bnez       $3, .L001A7320
/* A74CC 001A73CC 00000000 */   nop
.L001A73D0:
/* A74D0 001A73D0 3000BF7B */  lq         $31, 0x30($sp)
/* A74D4 001A73D4 2000B27B */  lq         $18, 0x20($sp)
/* A74D8 001A73D8 1000B17B */  lq         $17, 0x10($sp)
/* A74DC 001A73DC 0000B07B */  lq         $16, 0x0($sp)
/* A74E0 001A73E0 E008BD27 */  addiu      $sp, $sp, 0x8E0
/* A74E4 001A73E4 0800E003 */  jr         $31
/* A74E8 001A73E8 00000000 */   nop
/* A74EC 001A73EC 00000000 */  nop
