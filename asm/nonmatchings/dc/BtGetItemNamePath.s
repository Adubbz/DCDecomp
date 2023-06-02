.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtGetItemNamePath__FPcPci
/* B7220 001B7120 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* B7224 001B7124 3000BF7F */  sq         $31, 0x30($sp)
/* B7228 001B7128 2000B27F */  sq         $18, 0x20($sp)
/* B722C 001B712C 1000B17F */  sq         $17, 0x10($sp)
/* B7230 001B7130 0000B07F */  sq         $16, 0x0($sp)
/* B7234 001B7134 28968070 */  paddub     $18, $4, $0
/* B7238 001B7138 288EA070 */  paddub     $17, $5, $0
/* B723C 001B713C 2886C070 */  paddub     $16, $6, $0
/* B7240 001B7140 28260072 */  paddub     $4, $16, $0
/* B7244 001B7144 8095080C */  jal        TransWepNo__Fi
/* B7248 001B7148 00000000 */   nop
/* B724C 001B714C 28864070 */  paddub     $16, $2, $0
/* B7250 001B7150 0101022A */  slti       $2, $16, 0x101
/* B7254 001B7154 07004014 */  bnez       $2, .L001B7174
/* B7258 001B7158 00000000 */   nop
/* B725C 001B715C 28264072 */  paddub     $4, $18, $0
/* B7260 001B7160 282E0072 */  paddub     $5, $16, $0
/* B7264 001B7164 E0DB060C */  jal        makeWeaponName__FPci
/* B7268 001B7168 00000000 */   nop
/* B726C 001B716C 16000010 */  b          .L001B71C8
/* B7270 001B7170 00000000 */   nop
.L001B7174:
/* B7274 001B7174 80181000 */  sll        $3, $16, 2
/* B7278 001B7178 2800023C */  lui        $2, %hi(ComItemInfo + 0x87C)
/* B727C 001B717C CCE64224 */  addiu      $2, $2, %lo(ComItemInfo + 0x87C)
/* B7280 001B7180 21104300 */  addu       $2, $2, $3
/* B7284 001B7184 0000428C */  lw         $2, 0x0($2)
/* B7288 001B7188 02004014 */  bnez       $2, .L001B7194
/* B728C 001B718C 00000000 */   nop
/* B7290 001B7190 91001024 */  addiu      $16, $0, 0x91
.L001B7194:
/* B7294 001B7194 28264072 */  paddub     $4, $18, $0
/* B7298 001B7198 2A00023C */  lui        $2, %hi(_928_2)
/* B729C 001B719C 10BC4524 */  addiu      $5, $2, %lo(_928_2)
/* B72A0 001B71A0 5A15040C */  jal        strcpy
/* B72A4 001B71A4 00000000 */   nop
/* B72A8 001B71A8 80181000 */  sll        $3, $16, 2
/* B72AC 001B71AC 2800023C */  lui        $2, %hi(ComItemInfo + 0x87C)
/* B72B0 001B71B0 CCE64224 */  addiu      $2, $2, %lo(ComItemInfo + 0x87C)
/* B72B4 001B71B4 21104300 */  addu       $2, $2, $3
/* B72B8 001B71B8 28264072 */  paddub     $4, $18, $0
/* B72BC 001B71BC 0000458C */  lw         $5, 0x0($2)
/* B72C0 001B71C0 BC14040C */  jal        strcat
/* B72C4 001B71C4 00000000 */   nop
.L001B71C8:
/* B72C8 001B71C8 28262072 */  paddub     $4, $17, $0
/* B72CC 001B71CC 282E4072 */  paddub     $5, $18, $0
/* B72D0 001B71D0 5A15040C */  jal        strcpy
/* B72D4 001B71D4 00000000 */   nop
/* B72D8 001B71D8 28264072 */  paddub     $4, $18, $0
/* B72DC 001B71DC 2A00023C */  lui        $2, %hi(_863)
/* B72E0 001B71E0 38BB4524 */  addiu      $5, $2, %lo(_863)
/* B72E4 001B71E4 BC14040C */  jal        strcat
/* B72E8 001B71E8 00000000 */   nop
/* B72EC 001B71EC 28262072 */  paddub     $4, $17, $0
/* B72F0 001B71F0 2A00023C */  lui        $2, %hi(_929_2)
/* B72F4 001B71F4 28BC4524 */  addiu      $5, $2, %lo(_929_2)
/* B72F8 001B71F8 BC14040C */  jal        strcat
/* B72FC 001B71FC 00000000 */   nop
/* B7300 001B7200 2A00023C */  lui        $2, %hi(_930_2)
/* B7304 001B7204 30BC4424 */  addiu      $4, $2, %lo(_930_2)
/* B7308 001B7208 282E4072 */  paddub     $5, $18, $0
/* B730C 001B720C A611040C */  jal        printf
/* B7310 001B7210 00000000 */   nop
/* B7314 001B7214 2A00023C */  lui        $2, %hi(_931_3)
/* B7318 001B7218 40BC4424 */  addiu      $4, $2, %lo(_931_3)
/* B731C 001B721C 282E2072 */  paddub     $5, $17, $0
/* B7320 001B7220 A611040C */  jal        printf
/* B7324 001B7224 00000000 */   nop
/* B7328 001B7228 3000BF7B */  lq         $31, 0x30($sp)
/* B732C 001B722C 2000B27B */  lq         $18, 0x20($sp)
/* B7330 001B7230 1000B17B */  lq         $17, 0x10($sp)
/* B7334 001B7234 0000B07B */  lq         $16, 0x0($sp)
/* B7338 001B7238 4000BD27 */  addiu      $sp, $sp, 0x40
/* B733C 001B723C 0800E003 */  jr         $31
/* B7340 001B7240 00000000 */   nop
/* B7344 001B7244 00000000 */  nop
/* B7348 001B7248 00000000 */  nop
/* B734C 001B724C 00000000 */  nop
