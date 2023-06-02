.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MakeDir__17CMemoryCardAccessFv
/* 114E20 00214D20 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 114E24 00214D24 1000BF7F */  sq         $31, 0x10($sp)
/* 114E28 00214D28 0000B07F */  sq         $16, 0x0($sp)
/* 114E2C 00214D2C 28868070 */  paddub     $16, $4, $0
/* 114E30 00214D30 A800A0AF */  sw         $0, 0xA8($sp)
/* 114E34 00214D34 9C968283 */  lb         $2, -0x6964($gp)
/* 114E38 00214D38 05004014 */  bnez       $2, .L00214D50
/* 114E3C 00214D3C 00000000 */   nop
/* 114E40 00214D40 FFFF0224 */  addiu      $2, $0, -0x1
/* 114E44 00214D44 989682AF */  sw         $2, -0x6968($gp)
/* 114E48 00214D48 01000224 */  addiu      $2, $0, 0x1
/* 114E4C 00214D4C 9C9682A3 */  sb         $2, -0x6964($gp)
.L00214D50:
/* 114E50 00214D50 C400048E */  lw         $4, 0xC4($16)
/* 114E54 00214D54 1600812C */  sltiu      $at, $4, 0x16
/* 114E58 00214D58 C9012010 */  beqz       $at, .L00215480
/* 114E5C 00214D5C 00000000 */   nop
/* 114E60 00214D60 2A00023C */  lui        $2, %hi(_817_2)
/* 114E64 00214D64 30E74324 */  addiu      $3, $2, %lo(_817_2)
/* 114E68 00214D68 80100400 */  sll        $2, $4, 2
/* 114E6C 00214D6C 21104300 */  addu       $2, $2, $3
/* 114E70 00214D70 0000428C */  lw         $2, 0x0($2)
/* 114E74 00214D74 08004000 */  jr         $2
/* 114E78 00214D78 00000000 */   nop
/* 114E7C 00214D7C 0000048E */  lw         $4, 0x0($16)
/* 114E80 00214D80 01000524 */  addiu      $5, $0, 0x1
/* 114E84 00214D84 3C000626 */  addiu      $6, $16, 0x3C
/* 114E88 00214D88 C078040C */  jal        sceMcMkdir
/* 114E8C 00214D8C 00000000 */   nop
/* 114E90 00214D90 06004014 */  bnez       $2, .L00214DAC
/* 114E94 00214D94 00000000 */   nop
/* 114E98 00214D98 C400028E */  lw         $2, 0xC4($16)
/* 114E9C 00214D9C 01004224 */  addiu      $2, $2, 0x1
/* 114EA0 00214DA0 C40002AE */  sw         $2, 0xC4($16)
/* 114EA4 00214DA4 B6010010 */  b          .L00215480
/* 114EA8 00214DA8 00000000 */   nop
.L00214DAC:
/* 114EAC 00214DAC FFFF0224 */  addiu      $2, $0, -0x1
/* 114EB0 00214DB0 B4010010 */  b          .L00215484
/* 114EB4 00214DB4 00000000 */   nop
/* 114EB8 00214DB8 01000424 */  addiu      $4, $0, 0x1
/* 114EBC 00214DBC AC00A527 */  addiu      $5, $sp, 0xAC
/* 114EC0 00214DC0 A800A627 */  addiu      $6, $sp, 0xA8
/* 114EC4 00214DC4 C079040C */  jal        sceMcSync
/* 114EC8 00214DC8 00000000 */   nop
/* 114ECC 00214DCC AC014010 */  beqz       $2, .L00215480
/* 114ED0 00214DD0 00000000 */   nop
/* 114ED4 00214DD4 AC00A38F */  lw         $3, 0xAC($sp)
/* 114ED8 00214DD8 0B000224 */  addiu      $2, $0, 0xB
/* 114EDC 00214DDC A8016214 */  bne        $3, $2, .L00215480
/* 114EE0 00214DE0 00000000 */   nop
/* 114EE4 00214DE4 07006214 */  bne        $3, $2, .L00214E04
/* 114EE8 00214DE8 00000000 */   nop
/* 114EEC 00214DEC A800A28F */  lw         $2, 0xA8($sp)
/* 114EF0 00214DF0 04004104 */  bgez       $2, .L00214E04
/* 114EF4 00214DF4 00000000 */   nop
/* 114EF8 00214DF8 FFFF0224 */  addiu      $2, $0, -0x1
/* 114EFC 00214DFC A1010010 */  b          .L00215484
/* 114F00 00214E00 00000000 */   nop
.L00214E04:
/* 114F04 00214E04 2000A427 */  addiu      $4, $sp, 0x20
/* 114F08 00214E08 3C000526 */  addiu      $5, $16, 0x3C
/* 114F0C 00214E0C 5A15040C */  jal        strcpy
/* 114F10 00214E10 00000000 */   nop
/* 114F14 00214E14 2000A427 */  addiu      $4, $sp, 0x20
/* 114F18 00214E18 2A00023C */  lui        $2, %hi(_531_2)
/* 114F1C 00214E1C 40E64524 */  addiu      $5, $2, %lo(_531_2)
/* 114F20 00214E20 BC14040C */  jal        strcat
/* 114F24 00214E24 00000000 */   nop
/* 114F28 00214E28 0000048E */  lw         $4, 0x0($16)
/* 114F2C 00214E2C 01000524 */  addiu      $5, $0, 0x1
/* 114F30 00214E30 2000A627 */  addiu      $6, $sp, 0x20
/* 114F34 00214E34 7C000726 */  addiu      $7, $16, 0x7C
/* 114F38 00214E38 BA7A040C */  jal        sceMcChdir
/* 114F3C 00214E3C 00000000 */   nop
/* 114F40 00214E40 06004014 */  bnez       $2, .L00214E5C
/* 114F44 00214E44 00000000 */   nop
/* 114F48 00214E48 C400028E */  lw         $2, 0xC4($16)
/* 114F4C 00214E4C 01004224 */  addiu      $2, $2, 0x1
/* 114F50 00214E50 C40002AE */  sw         $2, 0xC4($16)
/* 114F54 00214E54 8A010010 */  b          .L00215480
/* 114F58 00214E58 00000000 */   nop
.L00214E5C:
/* 114F5C 00214E5C FFFF0224 */  addiu      $2, $0, -0x1
/* 114F60 00214E60 88010010 */  b          .L00215484
/* 114F64 00214E64 00000000 */   nop
/* 114F68 00214E68 01000424 */  addiu      $4, $0, 0x1
/* 114F6C 00214E6C AC00A527 */  addiu      $5, $sp, 0xAC
/* 114F70 00214E70 A800A627 */  addiu      $6, $sp, 0xA8
/* 114F74 00214E74 C079040C */  jal        sceMcSync
/* 114F78 00214E78 00000000 */   nop
/* 114F7C 00214E7C 80014010 */  beqz       $2, .L00215480
/* 114F80 00214E80 00000000 */   nop
/* 114F84 00214E84 AC00A38F */  lw         $3, 0xAC($sp)
/* 114F88 00214E88 0C000224 */  addiu      $2, $0, 0xC
/* 114F8C 00214E8C 06006214 */  bne        $3, $2, .L00214EA8
/* 114F90 00214E90 00000000 */   nop
/* 114F94 00214E94 07006214 */  bne        $3, $2, .L00214EB4
/* 114F98 00214E98 00000000 */   nop
/* 114F9C 00214E9C A800A28F */  lw         $2, 0xA8($sp)
/* 114FA0 00214EA0 04004104 */  bgez       $2, .L00214EB4
/* 114FA4 00214EA4 00000000 */   nop
.L00214EA8:
/* 114FA8 00214EA8 FFFF0224 */  addiu      $2, $0, -0x1
/* 114FAC 00214EAC 75010010 */  b          .L00215484
/* 114FB0 00214EB0 00000000 */   nop
.L00214EB4:
/* 114FB4 00214EB4 0000048E */  lw         $4, 0x0($16)
/* 114FB8 00214EB8 01000524 */  addiu      $5, $0, 0x1
/* 114FBC 00214EBC 3C000626 */  addiu      $6, $16, 0x3C
/* 114FC0 00214EC0 02020724 */  addiu      $7, $0, 0x202
/* 114FC4 00214EC4 8678040C */  jal        sceMcOpen
/* 114FC8 00214EC8 00000000 */   nop
/* 114FCC 00214ECC AC00A2AF */  sw         $2, 0xAC($sp)
/* 114FD0 00214ED0 AC00A28F */  lw         $2, 0xAC($sp)
/* 114FD4 00214ED4 06004014 */  bnez       $2, .L00214EF0
/* 114FD8 00214ED8 00000000 */   nop
/* 114FDC 00214EDC C400028E */  lw         $2, 0xC4($16)
/* 114FE0 00214EE0 01004224 */  addiu      $2, $2, 0x1
/* 114FE4 00214EE4 C40002AE */  sw         $2, 0xC4($16)
/* 114FE8 00214EE8 65010010 */  b          .L00215480
/* 114FEC 00214EEC 00000000 */   nop
.L00214EF0:
/* 114FF0 00214EF0 FFFF0224 */  addiu      $2, $0, -0x1
/* 114FF4 00214EF4 63010010 */  b          .L00215484
/* 114FF8 00214EF8 00000000 */   nop
/* 114FFC 00214EFC 01000424 */  addiu      $4, $0, 0x1
/* 115000 00214F00 AC00A527 */  addiu      $5, $sp, 0xAC
/* 115004 00214F04 A800A627 */  addiu      $6, $sp, 0xA8
/* 115008 00214F08 C079040C */  jal        sceMcSync
/* 11500C 00214F0C 00000000 */   nop
/* 115010 00214F10 5B014010 */  beqz       $2, .L00215480
/* 115014 00214F14 00000000 */   nop
/* 115018 00214F18 AC00A38F */  lw         $3, 0xAC($sp)
/* 11501C 00214F1C 02000224 */  addiu      $2, $0, 0x2
/* 115020 00214F20 06006214 */  bne        $3, $2, .L00214F3C
/* 115024 00214F24 00000000 */   nop
/* 115028 00214F28 07006214 */  bne        $3, $2, .L00214F48
/* 11502C 00214F2C 00000000 */   nop
/* 115030 00214F30 A800A28F */  lw         $2, 0xA8($sp)
/* 115034 00214F34 04004104 */  bgez       $2, .L00214F48
/* 115038 00214F38 00000000 */   nop
.L00214F3C:
/* 11503C 00214F3C FFFF0224 */  addiu      $2, $0, -0x1
/* 115040 00214F40 50010010 */  b          .L00215484
/* 115044 00214F44 00000000 */   nop
.L00214F48:
/* 115048 00214F48 A800A28F */  lw         $2, 0xA8($sp)
/* 11504C 00214F4C C80002AE */  sw         $2, 0xC8($16)
/* 115050 00214F50 E40000AE */  sw         $0, 0xE4($16)
/* 115054 00214F54 40000624 */  addiu      $6, $0, 0x40
/* 115058 00214F58 E80006AE */  sw         $6, 0xE8($16)
/* 11505C 00214F5C DA01023C */  lui        $2, %hi(mcdmybuf)
/* 115060 00214F60 40084424 */  addiu      $4, $2, %lo(mcdmybuf)
/* 115064 00214F64 282E0070 */  paddub     $5, $0, $0
/* 115068 00214F68 5A0D040C */  jal        memset
/* 11506C 00214F6C 00000000 */   nop
/* 115070 00214F70 01000224 */  addiu      $2, $0, 0x1
/* 115074 00214F74 DA01013C */  lui        $at, (0x1DA0851 >> 16)
/* 115078 00214F78 510822A0 */  sb         $2, (0x1DA0851 & 0xFFFF)($at)
/* 11507C 00214F7C C800048E */  lw         $4, 0xC8($16)
/* 115080 00214F80 DA01023C */  lui        $2, %hi(mcdmybuf)
/* 115084 00214F84 40084524 */  addiu      $5, $2, %lo(mcdmybuf)
/* 115088 00214F88 E800068E */  lw         $6, 0xE8($16)
/* 11508C 00214F8C 7079040C */  jal        sceMcWrite
/* 115090 00214F90 00000000 */   nop
/* 115094 00214F94 06004014 */  bnez       $2, .L00214FB0
/* 115098 00214F98 00000000 */   nop
/* 11509C 00214F9C C400028E */  lw         $2, 0xC4($16)
/* 1150A0 00214FA0 01004224 */  addiu      $2, $2, 0x1
/* 1150A4 00214FA4 C40002AE */  sw         $2, 0xC4($16)
/* 1150A8 00214FA8 35010010 */  b          .L00215480
/* 1150AC 00214FAC 00000000 */   nop
.L00214FB0:
/* 1150B0 00214FB0 FFFF0224 */  addiu      $2, $0, -0x1
/* 1150B4 00214FB4 33010010 */  b          .L00215484
/* 1150B8 00214FB8 00000000 */   nop
/* 1150BC 00214FBC 01000424 */  addiu      $4, $0, 0x1
/* 1150C0 00214FC0 AC00A527 */  addiu      $5, $sp, 0xAC
/* 1150C4 00214FC4 A800A627 */  addiu      $6, $sp, 0xA8
/* 1150C8 00214FC8 C079040C */  jal        sceMcSync
/* 1150CC 00214FCC 00000000 */   nop
/* 1150D0 00214FD0 2B014010 */  beqz       $2, .L00215480
/* 1150D4 00214FD4 00000000 */   nop
/* 1150D8 00214FD8 AC00A38F */  lw         $3, 0xAC($sp)
/* 1150DC 00214FDC 06000224 */  addiu      $2, $0, 0x6
/* 1150E0 00214FE0 06006214 */  bne        $3, $2, .L00214FFC
/* 1150E4 00214FE4 00000000 */   nop
/* 1150E8 00214FE8 07006214 */  bne        $3, $2, .L00215008
/* 1150EC 00214FEC 00000000 */   nop
/* 1150F0 00214FF0 A800A28F */  lw         $2, 0xA8($sp)
/* 1150F4 00214FF4 04004104 */  bgez       $2, .L00215008
/* 1150F8 00214FF8 00000000 */   nop
.L00214FFC:
/* 1150FC 00214FFC FFFF0224 */  addiu      $2, $0, -0x1
/* 115100 00215000 20010010 */  b          .L00215484
/* 115104 00215004 00000000 */   nop
.L00215008:
/* 115108 00215008 E400038E */  lw         $3, 0xE4($16)
/* 11510C 0021500C A800A28F */  lw         $2, 0xA8($sp)
/* 115110 00215010 21106200 */  addu       $2, $3, $2
/* 115114 00215014 E40002AE */  sw         $2, 0xE4($16)
/* 115118 00215018 2A00023C */  lui        $2, %hi(_814)
/* 11511C 0021501C F0E64424 */  addiu      $4, $2, %lo(_814)
/* 115120 00215020 E800058E */  lw         $5, 0xE8($16)
/* 115124 00215024 A611040C */  jal        printf
/* 115128 00215028 00000000 */   nop
/* 11512C 0021502C E400038E */  lw         $3, 0xE4($16)
/* 115130 00215030 E800028E */  lw         $2, 0xE8($16)
/* 115134 00215034 2A106200 */  slt        $2, $3, $2
/* 115138 00215038 11014014 */  bnez       $2, .L00215480
/* 11513C 0021503C 00000000 */   nop
/* 115140 00215040 C800048E */  lw         $4, 0xC8($16)
/* 115144 00215044 CE78040C */  jal        sceMcClose
/* 115148 00215048 00000000 */   nop
/* 11514C 0021504C 06004014 */  bnez       $2, .L00215068
/* 115150 00215050 00000000 */   nop
/* 115154 00215054 C400028E */  lw         $2, 0xC4($16)
/* 115158 00215058 01004224 */  addiu      $2, $2, 0x1
/* 11515C 0021505C C40002AE */  sw         $2, 0xC4($16)
/* 115160 00215060 07010010 */  b          .L00215480
/* 115164 00215064 00000000 */   nop
.L00215068:
/* 115168 00215068 FFFF0224 */  addiu      $2, $0, -0x1
/* 11516C 0021506C 05010010 */  b          .L00215484
/* 115170 00215070 00000000 */   nop
/* 115174 00215074 01000424 */  addiu      $4, $0, 0x1
/* 115178 00215078 AC00A527 */  addiu      $5, $sp, 0xAC
/* 11517C 0021507C A800A627 */  addiu      $6, $sp, 0xA8
/* 115180 00215080 C079040C */  jal        sceMcSync
/* 115184 00215084 00000000 */   nop
/* 115188 00215088 FD004010 */  beqz       $2, .L00215480
/* 11518C 0021508C 00000000 */   nop
/* 115190 00215090 AC00A38F */  lw         $3, 0xAC($sp)
/* 115194 00215094 03000224 */  addiu      $2, $0, 0x3
/* 115198 00215098 06006214 */  bne        $3, $2, .L002150B4
/* 11519C 0021509C 00000000 */   nop
/* 1151A0 002150A0 07006214 */  bne        $3, $2, .L002150C0
/* 1151A4 002150A4 00000000 */   nop
/* 1151A8 002150A8 A800A28F */  lw         $2, 0xA8($sp)
/* 1151AC 002150AC 04004104 */  bgez       $2, .L002150C0
/* 1151B0 002150B0 00000000 */   nop
.L002150B4:
/* 1151B4 002150B4 FFFF0224 */  addiu      $2, $0, -0x1
/* 1151B8 002150B8 F2000010 */  b          .L00215484
/* 1151BC 002150BC 00000000 */   nop
.L002150C0:
/* 1151C0 002150C0 0000048E */  lw         $4, 0x0($16)
/* 1151C4 002150C4 01000524 */  addiu      $5, $0, 0x1
/* 1151C8 002150C8 2A00023C */  lui        $2, %hi(_815_2)
/* 1151CC 002150CC 00E74624 */  addiu      $6, $2, %lo(_815_2)
/* 1151D0 002150D0 02020724 */  addiu      $7, $0, 0x202
/* 1151D4 002150D4 8678040C */  jal        sceMcOpen
/* 1151D8 002150D8 00000000 */   nop
/* 1151DC 002150DC 08004014 */  bnez       $2, .L00215100
/* 1151E0 002150E0 00000000 */   nop
/* 1151E4 002150E4 FFFF0224 */  addiu      $2, $0, -0x1
/* 1151E8 002150E8 989682AF */  sw         $2, -0x6968($gp)
/* 1151EC 002150EC C400028E */  lw         $2, 0xC4($16)
/* 1151F0 002150F0 01004224 */  addiu      $2, $2, 0x1
/* 1151F4 002150F4 C40002AE */  sw         $2, 0xC4($16)
/* 1151F8 002150F8 E1000010 */  b          .L00215480
/* 1151FC 002150FC 00000000 */   nop
.L00215100:
/* 115200 00215100 FFFF0224 */  addiu      $2, $0, -0x1
/* 115204 00215104 DF000010 */  b          .L00215484
/* 115208 00215108 00000000 */   nop
/* 11520C 0021510C 01000424 */  addiu      $4, $0, 0x1
/* 115210 00215110 AC00A527 */  addiu      $5, $sp, 0xAC
/* 115214 00215114 A800A627 */  addiu      $6, $sp, 0xA8
/* 115218 00215118 C079040C */  jal        sceMcSync
/* 11521C 0021511C 00000000 */   nop
/* 115220 00215120 D7004010 */  beqz       $2, .L00215480
/* 115224 00215124 00000000 */   nop
/* 115228 00215128 AC00A38F */  lw         $3, 0xAC($sp)
/* 11522C 0021512C 02000224 */  addiu      $2, $0, 0x2
/* 115230 00215130 06006214 */  bne        $3, $2, .L0021514C
/* 115234 00215134 00000000 */   nop
/* 115238 00215138 0C006214 */  bne        $3, $2, .L0021516C
/* 11523C 0021513C 00000000 */   nop
/* 115240 00215140 A800A28F */  lw         $2, 0xA8($sp)
/* 115244 00215144 09004104 */  bgez       $2, .L0021516C
/* 115248 00215148 00000000 */   nop
.L0021514C:
/* 11524C 0021514C 2A00023C */  lui        $2, %hi(_816)
/* 115250 00215150 10E74424 */  addiu      $4, $2, %lo(_816)
/* 115254 00215154 A800A58F */  lw         $5, 0xA8($sp)
/* 115258 00215158 A611040C */  jal        printf
/* 11525C 0021515C 00000000 */   nop
/* 115260 00215160 FFFF0224 */  addiu      $2, $0, -0x1
/* 115264 00215164 C7000010 */  b          .L00215484
/* 115268 00215168 00000000 */   nop
.L0021516C:
/* 11526C 0021516C A800A28F */  lw         $2, 0xA8($sp)
/* 115270 00215170 C80002AE */  sw         $2, 0xC8($16)
/* 115274 00215174 E40000AE */  sw         $0, 0xE4($16)
/* 115278 00215178 C4030224 */  addiu      $2, $0, 0x3C4
/* 11527C 0021517C E80002AE */  sw         $2, 0xE8($16)
/* 115280 00215180 C800048E */  lw         $4, 0xC8($16)
/* 115284 00215184 EC000526 */  addiu      $5, $16, 0xEC
/* 115288 00215188 E800068E */  lw         $6, 0xE8($16)
/* 11528C 0021518C 7079040C */  jal        sceMcWrite
/* 115290 00215190 00000000 */   nop
/* 115294 00215194 06004014 */  bnez       $2, .L002151B0
/* 115298 00215198 00000000 */   nop
/* 11529C 0021519C C400028E */  lw         $2, 0xC4($16)
/* 1152A0 002151A0 01004224 */  addiu      $2, $2, 0x1
/* 1152A4 002151A4 C40002AE */  sw         $2, 0xC4($16)
/* 1152A8 002151A8 B5000010 */  b          .L00215480
/* 1152AC 002151AC 00000000 */   nop
.L002151B0:
/* 1152B0 002151B0 FFFF0224 */  addiu      $2, $0, -0x1
/* 1152B4 002151B4 B3000010 */  b          .L00215484
/* 1152B8 002151B8 00000000 */   nop
/* 1152BC 002151BC 01000424 */  addiu      $4, $0, 0x1
/* 1152C0 002151C0 AC00A527 */  addiu      $5, $sp, 0xAC
/* 1152C4 002151C4 A800A627 */  addiu      $6, $sp, 0xA8
/* 1152C8 002151C8 C079040C */  jal        sceMcSync
/* 1152CC 002151CC 00000000 */   nop
/* 1152D0 002151D0 AB004010 */  beqz       $2, .L00215480
/* 1152D4 002151D4 00000000 */   nop
/* 1152D8 002151D8 AC00A38F */  lw         $3, 0xAC($sp)
/* 1152DC 002151DC 06000224 */  addiu      $2, $0, 0x6
/* 1152E0 002151E0 06006214 */  bne        $3, $2, .L002151FC
/* 1152E4 002151E4 00000000 */   nop
/* 1152E8 002151E8 07006214 */  bne        $3, $2, .L00215208
/* 1152EC 002151EC 00000000 */   nop
/* 1152F0 002151F0 A800A28F */  lw         $2, 0xA8($sp)
/* 1152F4 002151F4 04004104 */  bgez       $2, .L00215208
/* 1152F8 002151F8 00000000 */   nop
.L002151FC:
/* 1152FC 002151FC FFFF0224 */  addiu      $2, $0, -0x1
/* 115300 00215200 A0000010 */  b          .L00215484
/* 115304 00215204 00000000 */   nop
.L00215208:
/* 115308 00215208 E400038E */  lw         $3, 0xE4($16)
/* 11530C 0021520C A800A28F */  lw         $2, 0xA8($sp)
/* 115310 00215210 21106200 */  addu       $2, $3, $2
/* 115314 00215214 E40002AE */  sw         $2, 0xE4($16)
/* 115318 00215218 E400038E */  lw         $3, 0xE4($16)
/* 11531C 0021521C E800028E */  lw         $2, 0xE8($16)
/* 115320 00215220 2A106200 */  slt        $2, $3, $2
/* 115324 00215224 96004014 */  bnez       $2, .L00215480
/* 115328 00215228 00000000 */   nop
/* 11532C 0021522C C800048E */  lw         $4, 0xC8($16)
/* 115330 00215230 4E7B040C */  jal        sceMcFlush
/* 115334 00215234 00000000 */   nop
/* 115338 00215238 06004014 */  bnez       $2, .L00215254
/* 11533C 0021523C 00000000 */   nop
/* 115340 00215240 C400028E */  lw         $2, 0xC4($16)
/* 115344 00215244 01004224 */  addiu      $2, $2, 0x1
/* 115348 00215248 C40002AE */  sw         $2, 0xC4($16)
/* 11534C 0021524C 8C000010 */  b          .L00215480
/* 115350 00215250 00000000 */   nop
.L00215254:
/* 115354 00215254 FFFF0224 */  addiu      $2, $0, -0x1
/* 115358 00215258 8A000010 */  b          .L00215484
/* 11535C 0021525C 00000000 */   nop
/* 115360 00215260 01000424 */  addiu      $4, $0, 0x1
/* 115364 00215264 AC00A527 */  addiu      $5, $sp, 0xAC
/* 115368 00215268 A800A627 */  addiu      $6, $sp, 0xA8
/* 11536C 0021526C C079040C */  jal        sceMcSync
/* 115370 00215270 00000000 */   nop
/* 115374 00215274 82004010 */  beqz       $2, .L00215480
/* 115378 00215278 00000000 */   nop
/* 11537C 0021527C AC00A38F */  lw         $3, 0xAC($sp)
/* 115380 00215280 0A000224 */  addiu      $2, $0, 0xA
/* 115384 00215284 06006214 */  bne        $3, $2, .L002152A0
/* 115388 00215288 00000000 */   nop
/* 11538C 0021528C 07006214 */  bne        $3, $2, .L002152AC
/* 115390 00215290 00000000 */   nop
/* 115394 00215294 A800A28F */  lw         $2, 0xA8($sp)
/* 115398 00215298 04004104 */  bgez       $2, .L002152AC
/* 11539C 0021529C 00000000 */   nop
.L002152A0:
/* 1153A0 002152A0 FFFF0224 */  addiu      $2, $0, -0x1
/* 1153A4 002152A4 77000010 */  b          .L00215484
/* 1153A8 002152A8 00000000 */   nop
.L002152AC:
/* 1153AC 002152AC C800048E */  lw         $4, 0xC8($16)
/* 1153B0 002152B0 CE78040C */  jal        sceMcClose
/* 1153B4 002152B4 00000000 */   nop
/* 1153B8 002152B8 AC00A2AF */  sw         $2, 0xAC($sp)
/* 1153BC 002152BC AC00A28F */  lw         $2, 0xAC($sp)
/* 1153C0 002152C0 06004014 */  bnez       $2, .L002152DC
/* 1153C4 002152C4 00000000 */   nop
/* 1153C8 002152C8 C400028E */  lw         $2, 0xC4($16)
/* 1153CC 002152CC 01004224 */  addiu      $2, $2, 0x1
/* 1153D0 002152D0 C40002AE */  sw         $2, 0xC4($16)
/* 1153D4 002152D4 6A000010 */  b          .L00215480
/* 1153D8 002152D8 00000000 */   nop
.L002152DC:
/* 1153DC 002152DC FFFF0224 */  addiu      $2, $0, -0x1
/* 1153E0 002152E0 68000010 */  b          .L00215484
/* 1153E4 002152E4 00000000 */   nop
/* 1153E8 002152E8 01000424 */  addiu      $4, $0, 0x1
/* 1153EC 002152EC AC00A527 */  addiu      $5, $sp, 0xAC
/* 1153F0 002152F0 A800A627 */  addiu      $6, $sp, 0xA8
/* 1153F4 002152F4 C079040C */  jal        sceMcSync
/* 1153F8 002152F8 00000000 */   nop
/* 1153FC 002152FC 60004010 */  beqz       $2, .L00215480
/* 115400 00215300 00000000 */   nop
/* 115404 00215304 AC00A38F */  lw         $3, 0xAC($sp)
/* 115408 00215308 03000224 */  addiu      $2, $0, 0x3
/* 11540C 0021530C 06006214 */  bne        $3, $2, .L00215328
/* 115410 00215310 00000000 */   nop
/* 115414 00215314 07006214 */  bne        $3, $2, .L00215334
/* 115418 00215318 00000000 */   nop
/* 11541C 0021531C A800A28F */  lw         $2, 0xA8($sp)
/* 115420 00215320 04004104 */  bgez       $2, .L00215334
/* 115424 00215324 00000000 */   nop
.L00215328:
/* 115428 00215328 FFFF0224 */  addiu      $2, $0, -0x1
/* 11542C 0021532C 55000010 */  b          .L00215484
/* 115430 00215330 00000000 */   nop
.L00215334:
/* 115434 00215334 9896828F */  lw         $2, -0x6968($gp)
/* 115438 00215338 01004224 */  addiu      $2, $2, 0x1
/* 11543C 0021533C 989682AF */  sw         $2, -0x6968($gp)
/* 115440 00215340 9896838F */  lw         $3, -0x6968($gp)
/* 115444 00215344 03006128 */  slti       $at, $3, 0x3
/* 115448 00215348 17002010 */  beqz       $at, .L002153A8
/* 11544C 0021534C 00000000 */   nop
/* 115450 00215350 40100300 */  sll        $2, $3, 1
/* 115454 00215354 21104300 */  addu       $2, $2, $3
/* 115458 00215358 80100200 */  sll        $2, $2, 2
/* 11545C 0021535C 21105000 */  addu       $2, $2, $16
/* 115460 00215360 0000048E */  lw         $4, 0x0($16)
/* 115464 00215364 01000524 */  addiu      $5, $0, 0x1
/* 115468 00215368 B004468C */  lw         $6, 0x4B0($2)
/* 11546C 0021536C 03020724 */  addiu      $7, $0, 0x203
/* 115470 00215370 8678040C */  jal        sceMcOpen
/* 115474 00215374 00000000 */   nop
/* 115478 00215378 AC00A2AF */  sw         $2, 0xAC($sp)
/* 11547C 0021537C AC00A28F */  lw         $2, 0xAC($sp)
/* 115480 00215380 06004014 */  bnez       $2, .L0021539C
/* 115484 00215384 00000000 */   nop
/* 115488 00215388 C400028E */  lw         $2, 0xC4($16)
/* 11548C 0021538C 01004224 */  addiu      $2, $2, 0x1
/* 115490 00215390 C40002AE */  sw         $2, 0xC4($16)
/* 115494 00215394 3A000010 */  b          .L00215480
/* 115498 00215398 00000000 */   nop
.L0021539C:
/* 11549C 0021539C FFFF0224 */  addiu      $2, $0, -0x1
/* 1154A0 002153A0 38000010 */  b          .L00215484
/* 1154A4 002153A4 00000000 */   nop
.L002153A8:
/* 1154A8 002153A8 01000224 */  addiu      $2, $0, 0x1
/* 1154AC 002153AC 35000010 */  b          .L00215484
/* 1154B0 002153B0 00000000 */   nop
/* 1154B4 002153B4 01000424 */  addiu      $4, $0, 0x1
/* 1154B8 002153B8 AC00A527 */  addiu      $5, $sp, 0xAC
/* 1154BC 002153BC A800A627 */  addiu      $6, $sp, 0xA8
/* 1154C0 002153C0 C079040C */  jal        sceMcSync
/* 1154C4 002153C4 00000000 */   nop
/* 1154C8 002153C8 2D004010 */  beqz       $2, .L00215480
/* 1154CC 002153CC 00000000 */   nop
/* 1154D0 002153D0 AC00A38F */  lw         $3, 0xAC($sp)
/* 1154D4 002153D4 02000224 */  addiu      $2, $0, 0x2
/* 1154D8 002153D8 06006214 */  bne        $3, $2, .L002153F4
/* 1154DC 002153DC 00000000 */   nop
/* 1154E0 002153E0 07006214 */  bne        $3, $2, .L00215400
/* 1154E4 002153E4 00000000 */   nop
/* 1154E8 002153E8 A800A28F */  lw         $2, 0xA8($sp)
/* 1154EC 002153EC 04004104 */  bgez       $2, .L00215400
/* 1154F0 002153F0 00000000 */   nop
.L002153F4:
/* 1154F4 002153F4 FFFF0224 */  addiu      $2, $0, -0x1
/* 1154F8 002153F8 22000010 */  b          .L00215484
/* 1154FC 002153FC 00000000 */   nop
.L00215400:
/* 115500 00215400 A800A28F */  lw         $2, 0xA8($sp)
/* 115504 00215404 C80002AE */  sw         $2, 0xC8($16)
/* 115508 00215408 E40000AE */  sw         $0, 0xE4($16)
/* 11550C 0021540C 9896838F */  lw         $3, -0x6968($gp)
/* 115510 00215410 40100300 */  sll        $2, $3, 1
/* 115514 00215414 21104300 */  addu       $2, $2, $3
/* 115518 00215418 80100200 */  sll        $2, $2, 2
/* 11551C 0021541C 21105000 */  addu       $2, $2, $16
/* 115520 00215420 B804428C */  lw         $2, 0x4B8($2)
/* 115524 00215424 E80002AE */  sw         $2, 0xE8($16)
/* 115528 00215428 9896838F */  lw         $3, -0x6968($gp)
/* 11552C 0021542C 40100300 */  sll        $2, $3, 1
/* 115530 00215430 21104300 */  addu       $2, $2, $3
/* 115534 00215434 80100200 */  sll        $2, $2, 2
/* 115538 00215438 21105000 */  addu       $2, $2, $16
/* 11553C 0021543C C800048E */  lw         $4, 0xC8($16)
/* 115540 00215440 B404458C */  lw         $5, 0x4B4($2)
/* 115544 00215444 E800068E */  lw         $6, 0xE8($16)
/* 115548 00215448 7079040C */  jal        sceMcWrite
/* 11554C 0021544C 00000000 */   nop
/* 115550 00215450 AC00A2AF */  sw         $2, 0xAC($sp)
/* 115554 00215454 AC00A28F */  lw         $2, 0xAC($sp)
/* 115558 00215458 06004014 */  bnez       $2, .L00215474
/* 11555C 0021545C 00000000 */   nop
/* 115560 00215460 C400028E */  lw         $2, 0xC4($16)
/* 115564 00215464 01004224 */  addiu      $2, $2, 0x1
/* 115568 00215468 C40002AE */  sw         $2, 0xC4($16)
/* 11556C 0021546C 04000010 */  b          .L00215480
/* 115570 00215470 00000000 */   nop
.L00215474:
/* 115574 00215474 FFFF0224 */  addiu      $2, $0, -0x1
/* 115578 00215478 02000010 */  b          .L00215484
/* 11557C 0021547C 00000000 */   nop
.L00215480:
/* 115580 00215480 28160070 */  paddub     $2, $0, $0
.L00215484:
/* 115584 00215484 1000BF7B */  lq         $31, 0x10($sp)
/* 115588 00215488 0000B07B */  lq         $16, 0x0($sp)
/* 11558C 0021548C B000BD27 */  addiu      $sp, $sp, 0xB0
/* 115590 00215490 0800E003 */  jr         $31
/* 115594 00215494 00000000 */   nop
/* 115598 00215498 00000000 */  nop
/* 11559C 0021549C 00000000 */  nop
