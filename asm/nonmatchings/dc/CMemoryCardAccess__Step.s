.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__17CMemoryCardAccessFv
/* 113CF0 00213BF0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 113CF4 00213BF4 2000BF7F */  sq         $31, 0x20($sp)
/* 113CF8 00213BF8 1000B17F */  sq         $17, 0x10($sp)
/* 113CFC 00213BFC 0000B07F */  sq         $16, 0x0($sp)
/* 113D00 00213C00 28868070 */  paddub     $16, $4, $0
/* 113D04 00213C04 288E0070 */  paddub     $17, $0, $0
/* 113D08 00213C08 BC00858C */  lw         $5, 0xBC($4)
/* 113D0C 00213C0C 1000A12C */  sltiu      $at, $5, 0x10
/* 113D10 00213C10 53002010 */  beqz       $at, .L00213D60
/* 113D14 00213C14 00000000 */   nop
/* 113D18 00213C18 2A00023C */  lui        $2, %hi(_435_2)
/* 113D1C 00213C1C 00E64324 */  addiu      $3, $2, %lo(_435_2)
/* 113D20 00213C20 80100500 */  sll        $2, $5, 2
/* 113D24 00213C24 21104300 */  addu       $2, $2, $3
/* 113D28 00213C28 0000428C */  lw         $2, 0x0($2)
/* 113D2C 00213C2C 08004000 */  jr         $2
/* 113D30 00213C30 00000000 */   nop
/* 113D34 00213C34 28260072 */  paddub     $4, $16, $0
/* 113D38 00213C38 7C4F080C */  jal        SearchMcType__17CMemoryCardAccessFv
/* 113D3C 00213C3C 00000000 */   nop
/* 113D40 00213C40 288E4070 */  paddub     $17, $2, $0
/* 113D44 00213C44 46000010 */  b          .L00213D60
/* 113D48 00213C48 00000000 */   nop
/* 113D4C 00213C4C 2450080C */  jal        GetDir__17CMemoryCardAccessFv
/* 113D50 00213C50 00000000 */   nop
/* 113D54 00213C54 288E4070 */  paddub     $17, $2, $0
/* 113D58 00213C58 41000010 */  b          .L00213D60
/* 113D5C 00213C5C 00000000 */   nop
/* 113D60 00213C60 4853080C */  jal        MakeDir__17CMemoryCardAccessFv
/* 113D64 00213C64 00000000 */   nop
/* 113D68 00213C68 288E4070 */  paddub     $17, $2, $0
/* 113D6C 00213C6C 3C000010 */  b          .L00213D60
/* 113D70 00213C70 00000000 */   nop
/* 113D74 00213C74 8C56080C */  jal        GetAllSaveFileInfo__17CMemoryCardAccessFv
/* 113D78 00213C78 00000000 */   nop
/* 113D7C 00213C7C 288E4070 */  paddub     $17, $2, $0
/* 113D80 00213C80 37000010 */  b          .L00213D60
/* 113D84 00213C84 00000000 */   nop
/* 113D88 00213C88 0400058E */  lw         $5, 0x4($16)
/* 113D8C 00213C8C E456080C */  jal        SaveToMc__17CMemoryCardAccessFi
/* 113D90 00213C90 00000000 */   nop
/* 113D94 00213C94 288E4070 */  paddub     $17, $2, $0
/* 113D98 00213C98 31000010 */  b          .L00213D60
/* 113D9C 00213C9C 00000000 */   nop
/* 113DA0 00213CA0 0400058E */  lw         $5, 0x4($16)
/* 113DA4 00213CA4 9058080C */  jal        LoadFromMc__17CMemoryCardAccessFi
/* 113DA8 00213CA8 00000000 */   nop
/* 113DAC 00213CAC 288E4070 */  paddub     $17, $2, $0
/* 113DB0 00213CB0 2B000010 */  b          .L00213D60
/* 113DB4 00213CB4 00000000 */   nop
/* 113DB8 00213CB8 9459080C */  jal        FormatForMc__17CMemoryCardAccessFv
/* 113DBC 00213CBC 00000000 */   nop
/* 113DC0 00213CC0 288E4070 */  paddub     $17, $2, $0
/* 113DC4 00213CC4 26000010 */  b          .L00213D60
/* 113DC8 00213CC8 00000000 */   nop
/* 113DCC 00213CCC 105B080C */  jal        McUnFormatForDebug__17CMemoryCardAccessFv
/* 113DD0 00213CD0 00000000 */   nop
/* 113DD4 00213CD4 288E4070 */  paddub     $17, $2, $0
/* 113DD8 00213CD8 21000010 */  b          .L00213D60
/* 113DDC 00213CDC 00000000 */   nop
/* 113DE0 00213CE0 0800028E */  lw         $2, 0x8($16)
/* 113DE4 00213CE4 04004014 */  bnez       $2, .L00213CF8
/* 113DE8 00213CE8 00000000 */   nop
/* 113DEC 00213CEC 0400058E */  lw         $5, 0x4($16)
/* 113DF0 00213CF0 03000010 */  b          .L00213D00
/* 113DF4 00213CF4 00000000 */   nop
.L00213CF8:
/* 113DF8 00213CF8 1000058E */  lw         $5, 0x10($16)
/* 113DFC 00213CFC 00000000 */  nop
.L00213D00:
/* 113E00 00213D00 28260072 */  paddub     $4, $16, $0
/* 113E04 00213D04 085A080C */  jal        DeleteFile__17CMemoryCardAccessFi
/* 113E08 00213D08 00000000 */   nop
/* 113E0C 00213D0C 288E4070 */  paddub     $17, $2, $0
/* 113E10 00213D10 13000010 */  b          .L00213D60
/* 113E14 00213D14 00000000 */   nop
/* 113E18 00213D18 CC50080C */  jal        LoadSysConfig__17CMemoryCardAccessFv
/* 113E1C 00213D1C 00000000 */   nop
/* 113E20 00213D20 288E4070 */  paddub     $17, $2, $0
/* 113E24 00213D24 0E000010 */  b          .L00213D60
/* 113E28 00213D28 00000000 */   nop
/* 113E2C 00213D2C 7451080C */  jal        SaveSysConfig__17CMemoryCardAccessFv
/* 113E30 00213D30 00000000 */   nop
/* 113E34 00213D34 288E4070 */  paddub     $17, $2, $0
/* 113E38 00213D38 09000010 */  b          .L00213D60
/* 113E3C 00213D3C 00000000 */   nop
/* 113E40 00213D40 3852080C */  jal        Write__17CMemoryCardAccessFv
/* 113E44 00213D44 00000000 */   nop
/* 113E48 00213D48 288E4070 */  paddub     $17, $2, $0
/* 113E4C 00213D4C 04000010 */  b          .L00213D60
/* 113E50 00213D50 00000000 */   nop
/* 113E54 00213D54 7852080C */  jal        Convert__17CMemoryCardAccessFv
/* 113E58 00213D58 00000000 */   nop
/* 113E5C 00213D5C 288E4070 */  paddub     $17, $2, $0
.L00213D60:
/* 113E60 00213D60 01000524 */  addiu      $5, $0, 0x1
/* 113E64 00213D64 07002516 */  bne        $17, $5, .L00213D84
/* 113E68 00213D68 00000000 */   nop
/* 113E6C 00213D6C C40000AE */  sw         $0, 0xC4($16)
/* 113E70 00213D70 28260072 */  paddub     $4, $16, $0
/* 113E74 00213D74 E44E080C */  jal        SetFuncNo__17CMemoryCardAccessFi
/* 113E78 00213D78 00000000 */   nop
/* 113E7C 00213D7C 05000010 */  b          .L00213D94
/* 113E80 00213D80 00000000 */   nop
.L00213D84:
/* 113E84 00213D84 28260072 */  paddub     $4, $16, $0
/* 113E88 00213D88 282E2072 */  paddub     $5, $17, $0
/* 113E8C 00213D8C 945A080C */  jal        McError__17CMemoryCardAccessFi
/* 113E90 00213D90 00000000 */   nop
.L00213D94:
/* 113E94 00213D94 28162072 */  paddub     $2, $17, $0
/* 113E98 00213D98 2000BF7B */  lq         $31, 0x20($sp)
/* 113E9C 00213D9C 1000B17B */  lq         $17, 0x10($sp)
/* 113EA0 00213DA0 0000B07B */  lq         $16, 0x0($sp)
/* 113EA4 00213DA4 3000BD27 */  addiu      $sp, $sp, 0x30
/* 113EA8 00213DA8 0800E003 */  jr         $31
/* 113EAC 00213DAC 00000000 */   nop
