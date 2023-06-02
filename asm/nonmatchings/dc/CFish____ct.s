.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__5CFishFv
/* A8EC0 001A8DC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A8EC4 001A8DC4 1000BF7F */  sq         $31, 0x10($sp)
/* A8EC8 001A8DC8 0000B07F */  sq         $16, 0x0($sp)
/* A8ECC 001A8DCC 28868070 */  paddub     $16, $4, $0
/* A8ED0 001A8DD0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* A8ED4 001A8DD4 00608244 */  mtc1       $2, $f12
/* A8ED8 001A8DD8 A0000426 */  addiu      $4, $16, 0xA0
/* A8EDC 001A8DDC 045C050C */  jal        __ct__7CObjectFf
/* A8EE0 001A8DE0 00000000 */   nop
/* A8EE4 001A8DE4 2A00023C */  lui        $2, %hi(__vt__10CCharacter)
/* A8EE8 001A8DE8 B0124224 */  addiu      $2, $2, %lo(__vt__10CCharacter)
/* A8EEC 001A8DEC 400102AE */  sw         $2, 0x140($16)
/* A8EF0 001A8DF0 7C010426 */  addiu      $4, $16, 0x17C
/* A8EF4 001A8DF4 282E0070 */  paddub     $5, $0, $0
/* A8EF8 001A8DF8 28360070 */  paddub     $6, $0, $0
/* A8EFC 001A8DFC 1C9E050C */  jal        __ct__13CTextureAnimeFP13CTexAnimeDatai
/* A8F00 001A8E00 00000000 */   nop
/* A8F04 001A8E04 C0040426 */  addiu      $4, $16, 0x4C0
/* A8F08 001A8E08 1400023C */  lui        $2, %hi(__ct__11MotionParamFv)
/* A8F0C 001A8E0C 10364524 */  addiu      $5, $2, %lo(__ct__11MotionParamFv)
/* A8F10 001A8E10 28360070 */  paddub     $6, $0, $0
/* A8F14 001A8E14 80000724 */  addiu      $7, $0, 0x80
/* A8F18 001A8E18 08000824 */  addiu      $8, $0, 0x8
/* A8F1C 001A8E1C B488040C */  jal        __construct_array
/* A8F20 001A8E20 00000000 */   nop
/* A8F24 001A8E24 C0080426 */  addiu      $4, $16, 0x8C0
/* A8F28 001A8E28 1400023C */  lui        $2, %hi(__ct__11MotionParamFv)
/* A8F2C 001A8E2C 10364524 */  addiu      $5, $2, %lo(__ct__11MotionParamFv)
/* A8F30 001A8E30 28360070 */  paddub     $6, $0, $0
/* A8F34 001A8E34 80000724 */  addiu      $7, $0, 0x80
/* A8F38 001A8E38 08000824 */  addiu      $8, $0, 0x8
/* A8F3C 001A8E3C B488040C */  jal        __construct_array
/* A8F40 001A8E40 00000000 */   nop
/* A8F44 001A8E44 A00D0426 */  addiu      $4, $16, 0xDA0
/* A8F48 001A8E48 1500023C */  lui        $2, %hi(__ct__15CFakePointLightFv)
/* A8F4C 001A8E4C 606B4524 */  addiu      $5, $2, %lo(__ct__15CFakePointLightFv)
/* A8F50 001A8E50 28360070 */  paddub     $6, $0, $0
/* A8F54 001A8E54 30000724 */  addiu      $7, $0, 0x30
/* A8F58 001A8E58 02000824 */  addiu      $8, $0, 0x2
/* A8F5C 001A8E5C B488040C */  jal        __construct_array
/* A8F60 001A8E60 00000000 */   nop
/* A8F64 001A8E64 A0000426 */  addiu      $4, $16, 0xA0
/* A8F68 001A8E68 4001198E */  lw         $25, 0x140($16)
/* A8F6C 001A8E6C C400398F */  lw         $25, 0xC4($25)
/* A8F70 001A8E70 09F82003 */  jalr       $25
/* A8F74 001A8E74 00000000 */   nop
/* A8F78 001A8E78 803F023C */  lui        $2, (0x3F800000 >> 16)
/* A8F7C 001A8E7C 00608244 */  mtc1       $2, $f12
/* A8F80 001A8E80 50120426 */  addiu      $4, $16, 0x1250
/* A8F84 001A8E84 045C050C */  jal        __ct__7CObjectFf
/* A8F88 001A8E88 00000000 */   nop
/* A8F8C 001A8E8C 2A00023C */  lui        $2, %hi(__vt__10CCharacter)
/* A8F90 001A8E90 B0124224 */  addiu      $2, $2, %lo(__vt__10CCharacter)
/* A8F94 001A8E94 F01202AE */  sw         $2, 0x12F0($16)
/* A8F98 001A8E98 2C130426 */  addiu      $4, $16, 0x132C
/* A8F9C 001A8E9C 282E0070 */  paddub     $5, $0, $0
/* A8FA0 001A8EA0 28360070 */  paddub     $6, $0, $0
/* A8FA4 001A8EA4 1C9E050C */  jal        __ct__13CTextureAnimeFP13CTexAnimeDatai
/* A8FA8 001A8EA8 00000000 */   nop
/* A8FAC 001A8EAC 70160426 */  addiu      $4, $16, 0x1670
/* A8FB0 001A8EB0 1400023C */  lui        $2, %hi(__ct__11MotionParamFv)
/* A8FB4 001A8EB4 10364524 */  addiu      $5, $2, %lo(__ct__11MotionParamFv)
/* A8FB8 001A8EB8 28360070 */  paddub     $6, $0, $0
/* A8FBC 001A8EBC 80000724 */  addiu      $7, $0, 0x80
/* A8FC0 001A8EC0 08000824 */  addiu      $8, $0, 0x8
/* A8FC4 001A8EC4 B488040C */  jal        __construct_array
/* A8FC8 001A8EC8 00000000 */   nop
/* A8FCC 001A8ECC 701A0426 */  addiu      $4, $16, 0x1A70
/* A8FD0 001A8ED0 1400023C */  lui        $2, %hi(__ct__11MotionParamFv)
/* A8FD4 001A8ED4 10364524 */  addiu      $5, $2, %lo(__ct__11MotionParamFv)
/* A8FD8 001A8ED8 28360070 */  paddub     $6, $0, $0
/* A8FDC 001A8EDC 80000724 */  addiu      $7, $0, 0x80
/* A8FE0 001A8EE0 08000824 */  addiu      $8, $0, 0x8
/* A8FE4 001A8EE4 B488040C */  jal        __construct_array
/* A8FE8 001A8EE8 00000000 */   nop
/* A8FEC 001A8EEC 501F0426 */  addiu      $4, $16, 0x1F50
/* A8FF0 001A8EF0 1500023C */  lui        $2, %hi(__ct__15CFakePointLightFv)
/* A8FF4 001A8EF4 606B4524 */  addiu      $5, $2, %lo(__ct__15CFakePointLightFv)
/* A8FF8 001A8EF8 28360070 */  paddub     $6, $0, $0
/* A8FFC 001A8EFC 30000724 */  addiu      $7, $0, 0x30
/* A9000 001A8F00 02000824 */  addiu      $8, $0, 0x2
/* A9004 001A8F04 B488040C */  jal        __construct_array
/* A9008 001A8F08 00000000 */   nop
/* A900C 001A8F0C 50120426 */  addiu      $4, $16, 0x1250
/* A9010 001A8F10 F012198E */  lw         $25, 0x12F0($16)
/* A9014 001A8F14 C400398F */  lw         $25, 0xC4($25)
/* A9018 001A8F18 09F82003 */  jalr       $25
/* A901C 001A8F1C 00000000 */   nop
/* A9020 001A8F20 28260072 */  paddub     $4, $16, $0
/* A9024 001A8F24 5004090C */  jal        Initialize__5CFishFv
/* A9028 001A8F28 00000000 */   nop
/* A902C 001A8F2C 28160072 */  paddub     $2, $16, $0
/* A9030 001A8F30 1000BF7B */  lq         $31, 0x10($sp)
/* A9034 001A8F34 0000B07B */  lq         $16, 0x0($sp)
/* A9038 001A8F38 2000BD27 */  addiu      $sp, $sp, 0x20
/* A903C 001A8F3C 0800E003 */  jr         $31
/* A9040 001A8F40 00000000 */   nop
/* A9044 001A8F44 00000000 */  nop
/* A9048 001A8F48 00000000 */  nop
/* A904C 001A8F4C 00000000 */  nop
