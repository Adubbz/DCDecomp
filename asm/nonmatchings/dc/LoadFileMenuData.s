.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadFileMenuData__FPcPUi
/* 12BC40 0022BB40 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 12BC44 0022BB44 2000BF7F */  sq         $31, 0x20($sp)
/* 12BC48 0022BB48 1000B17F */  sq         $17, 0x10($sp)
/* 12BC4C 0022BB4C 0000B07F */  sq         $16, 0x0($sp)
/* 12BC50 0022BB50 288E8070 */  paddub     $17, $4, $0
/* 12BC54 0022BB54 2886A070 */  paddub     $16, $5, $0
/* 12BC58 0022BB58 DB01023C */  lui        $2, %hi(MenuGrobalDir)
/* 12BC5C 0022BB5C D08F4424 */  addiu      $4, $2, %lo(MenuGrobalDir)
/* 12BC60 0022BB60 94AE080C */  jal        GetPathReadDifferntLang__FPc
/* 12BC64 0022BB64 00000000 */   nop
/* 12BC68 0022BB68 DB01023C */  lui        $2, %hi(MenuGrobalDir)
/* 12BC6C 0022BB6C D08F4424 */  addiu      $4, $2, %lo(MenuGrobalDir)
/* 12BC70 0022BB70 282E2072 */  paddub     $5, $17, $0
/* 12BC74 0022BB74 BC14040C */  jal        strcat
/* 12BC78 0022BB78 00000000 */   nop
/* 12BC7C 0022BB7C DB01023C */  lui        $2, %hi(MenuGrobalDir)
/* 12BC80 0022BB80 D08F4424 */  addiu      $4, $2, %lo(MenuGrobalDir)
/* 12BC84 0022BB84 282E0072 */  paddub     $5, $16, $0
/* 12BC88 0022BB88 3C00A627 */  addiu      $6, $sp, 0x3C
/* 12BC8C 0022BB8C D8FC040C */  jal        LoadFile__FPcPvPi
/* 12BC90 0022BB90 00000000 */   nop
/* 12BC94 0022BB94 3C00A28F */  lw         $2, 0x3C($sp)
/* 12BC98 0022BB98 2000BF7B */  lq         $31, 0x20($sp)
/* 12BC9C 0022BB9C 1000B17B */  lq         $17, 0x10($sp)
/* 12BCA0 0022BBA0 0000B07B */  lq         $16, 0x0($sp)
/* 12BCA4 0022BBA4 4000BD27 */  addiu      $sp, $sp, 0x40
/* 12BCA8 0022BBA8 0800E003 */  jr         $31
/* 12BCAC 0022BBAC 00000000 */   nop
