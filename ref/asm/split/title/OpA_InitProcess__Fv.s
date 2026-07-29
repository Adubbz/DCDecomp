.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpA_InitProcess__Fv
/* 0091C0 01DB4EC0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0091C4 01DB4EC4 0000BF7F */  sq          $31, 0x0($29)
/* 0091C8 01DB4EC8 B89880AF */  sw          $0, -0x6748($28)
/* 0091CC 01DB4ECC B49880AF */  sw          $0, -0x674C($28)
/* 0091D0 01DB4ED0 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 0091D4 01DB4ED4 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 0091D8 01DB4ED8 A80E050C */  jal         Initialize__4CMapFv
/* 0091DC 01DB4EDC 00000000 */   nop
/* 0091E0 01DB4EE0 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 0091E4 01DB4EE4 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 0091E8 01DB4EE8 A80E050C */  jal         Initialize__4CMapFv
/* 0091EC 01DB4EEC 00000000 */   nop
/* 0091F0 01DB4EF0 DE01023C */  lui         $2, %hi(LIT_286__4)
/* 0091F4 01DB4EF4 10DA4424 */  addiu       $4, $2, %lo(LIT_286__4)
/* 0091F8 01DB4EF8 00C5760C */  jal         OPAnalyz__FPc
/* 0091FC 01DB4EFC 00000000 */   nop
/* 009200 01DB4F00 1CD4760C */  jal         LoadTexture__Fv__3
/* 009204 01DB4F04 00000000 */   nop
/* 009208 01DB4F08 4CCA760C */  jal         OPMdsLoad__Fv
/* 00920C 01DB4F0C 00000000 */   nop
/* 009210 01DB4F10 DE01023C */  lui         $2, %hi(LIT_287__4)
/* 009214 01DB4F14 30DA4424 */  addiu       $4, $2, %lo(LIT_287__4)
/* 009218 01DB4F18 948B858F */  lw          $5, -0x746C($28)
/* 00921C 01DB4F1C 28360070 */  paddub      $6, $0, $0
/* 009220 01DB4F20 D8FC040C */  jal         LoadFile__FPcPvPi
/* 009224 01DB4F24 00000000 */   nop
/* 009228 01DB4F28 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 00922C 01DB4F2C 00000000 */   nop
/* 009230 01DB4F30 08D5760C */  jal         LoadData__Fv__2
/* 009234 01DB4F34 00000000 */   nop
/* 009238 01DB4F38 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00923C 01DB4F3C 282E0070 */  paddub      $5, $0, $0
/* 009240 01DB4F40 04000624 */  addiu       $6, $0, 0x4
/* 009244 01DB4F44 50000724 */  addiu       $7, $0, 0x50
/* 009248 01DB4F48 140F050C */  jal         SetReverb__6CSoundFiii
/* 00924C 01DB4F4C 00000000 */   nop
/* 009250 01DB4F50 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 009254 01DB4F54 01000524 */  addiu       $5, $0, 0x1
/* 009258 01DB4F58 04000624 */  addiu       $6, $0, 0x4
/* 00925C 01DB4F5C 3C000724 */  addiu       $7, $0, 0x3C
/* 009260 01DB4F60 140F050C */  jal         SetReverb__6CSoundFiii
/* 009264 01DB4F64 00000000 */   nop
/* 009268 01DB4F68 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00926C 01DB4F6C DE01023C */  lui         $2, %hi(LIT_288__4)
/* 009270 01DB4F70 50DA4524 */  addiu       $5, $2, %lo(LIT_288__4)
/* 009274 01DB4F74 948B868F */  lw          $6, -0x746C($28)
/* 009278 01DB4F78 3410050C */  jal         LoadSoundFileFromPack__6CSoundFPcPUi
/* 00927C 01DB4F7C 00000000 */   nop
/* 009280 01DB4F80 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 009284 01DB4F84 0F000524 */  addiu       $5, $0, 0xF
/* 009288 01DB4F88 00010624 */  addiu       $6, $0, 0x100
/* 00928C 01DB4F8C 581A050C */  jal         SetVol__6CSoundFii
/* 009290 01DB4F90 00000000 */   nop
/* 009294 01DB4F94 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 009298 01DB4F98 0E000524 */  addiu       $5, $0, 0xE
/* 00929C 01DB4F9C 00010624 */  addiu       $6, $0, 0x100
/* 0092A0 01DB4FA0 581A050C */  jal         SetVol__6CSoundFii
/* 0092A4 01DB4FA4 00000000 */   nop
/* 0092A8 01DB4FA8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0092AC 01DB4FAC 0D000524 */  addiu       $5, $0, 0xD
/* 0092B0 01DB4FB0 00010624 */  addiu       $6, $0, 0x100
/* 0092B4 01DB4FB4 581A050C */  jal         SetVol__6CSoundFii
/* 0092B8 01DB4FB8 00000000 */   nop
/* 0092BC 01DB4FBC 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0092C0 01DB4FC0 0C000524 */  addiu       $5, $0, 0xC
/* 0092C4 01DB4FC4 00010624 */  addiu       $6, $0, 0x100
/* 0092C8 01DB4FC8 581A050C */  jal         SetVol__6CSoundFii
/* 0092CC 01DB4FCC 00000000 */   nop
/* 0092D0 01DB4FD0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0092D4 01DB4FD4 0F000524 */  addiu       $5, $0, 0xF
/* 0092D8 01DB4FD8 10000624 */  addiu       $6, $0, 0x10
/* 0092DC 01DB4FDC 14000724 */  addiu       $7, $0, 0x14
/* 0092E0 01DB4FE0 28460070 */  paddub      $8, $0, $0
/* 0092E4 01DB4FE4 284E0070 */  paddub      $9, $0, $0
/* 0092E8 01DB4FE8 0816050C */  jal         SE_Play__6CSoundFiiiii
/* 0092EC 01DB4FEC 00000000 */   nop
/* 0092F0 01DB4FF0 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 0092F4 01DB4FF4 00000000 */   nop
/* 0092F8 01DB4FF8 D4D5760C */  jal         SetDanceMotion__Fv
/* 0092FC 01DB4FFC 00000000 */   nop
/* 009300 01DB5000 948B828F */  lw          $2, -0x746C($28)
/* 009304 01DB5004 1000013C */  lui         $1, (0x10C900 >> 16)
/* 009308 01DB5008 00C92134 */  ori         $1, $1, (0x10C900 & 0xFFFF)
/* 00930C 01DB500C 21284100 */  addu        $5, $2, $1
/* 009310 01DB5010 DE01023C */  lui         $2, %hi(LIT_289__4)
/* 009314 01DB5014 60DA4424 */  addiu       $4, $2, %lo(LIT_289__4)
/* 009318 01DB5018 28360070 */  paddub      $6, $0, $0
/* 00931C 01DB501C D8FC040C */  jal         LoadFile__FPcPvPi
/* 009320 01DB5020 00000000 */   nop
/* 009324 01DB5024 948B858F */  lw          $5, -0x746C($28)
/* 009328 01DB5028 DE01023C */  lui         $2, %hi(LIT_290__4)
/* 00932C 01DB502C 80DA4424 */  addiu       $4, $2, %lo(LIT_290__4)
/* 009330 01DB5030 28360070 */  paddub      $6, $0, $0
/* 009334 01DB5034 D8FC040C */  jal         LoadFile__FPcPvPi
/* 009338 01DB5038 00000000 */   nop
/* 00933C 01DB503C 30FB040C */  jal         StartReadBG__Fv
/* 009340 01DB5040 00000000 */   nop
/* 009344 01DB5044 E49880AF */  sw          $0, -0x671C($28)
/* 009348 01DB5048 01000324 */  addiu       $3, $0, 0x1
/* 00934C 01DB504C E89883AF */  sw          $3, -0x6718($28)
/* 009350 01DB5050 EC9880AF */  sw          $0, -0x6714($28)
/* 009354 01DB5054 C89880A3 */  sb          $0, -0x6738($28)
/* 009358 01DB5058 0000BF7B */  lq          $31, 0x0($29)
/* 00935C 01DB505C 1000BD27 */  addiu       $29, $29, 0x10
/* 009360 01DB5060 0800E003 */  jr          $31
/* 009364 01DB5064 00000000 */   nop
/* 009368 01DB5068 00000000 */  nop
/* 00936C 01DB506C 00000000 */  nop
