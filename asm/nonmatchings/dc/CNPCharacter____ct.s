.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__12CNPCharacterFv
/* 56B70 00156A70 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 56B74 00156A74 1000BF7F */  sq         $31, 0x10($sp)
/* 56B78 00156A78 0000B07F */  sq         $16, 0x0($sp)
/* 56B7C 00156A7C 28868070 */  paddub     $16, $4, $0
/* 56B80 00156A80 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 56B84 00156A84 00608244 */  mtc1       $2, $f12
/* 56B88 00156A88 045C050C */  jal        __ct__7CObjectFf
/* 56B8C 00156A8C 00000000 */   nop
/* 56B90 00156A90 2A00023C */  lui        $2, %hi(__vt__10CCharacter)
/* 56B94 00156A94 B0124224 */  addiu      $2, $2, %lo(__vt__10CCharacter)
/* 56B98 00156A98 A00002AE */  sw         $2, 0xA0($16)
/* 56B9C 00156A9C DC000426 */  addiu      $4, $16, 0xDC
/* 56BA0 00156AA0 282E0070 */  paddub     $5, $0, $0
/* 56BA4 00156AA4 28360070 */  paddub     $6, $0, $0
/* 56BA8 00156AA8 1C9E050C */  jal        __ct__13CTextureAnimeFP13CTexAnimeDatai
/* 56BAC 00156AAC 00000000 */   nop
/* 56BB0 00156AB0 20040426 */  addiu      $4, $16, 0x420
/* 56BB4 00156AB4 1400023C */  lui        $2, %hi(__ct__11MotionParamFv)
/* 56BB8 00156AB8 10364524 */  addiu      $5, $2, %lo(__ct__11MotionParamFv)
/* 56BBC 00156ABC 28360070 */  paddub     $6, $0, $0
/* 56BC0 00156AC0 80000724 */  addiu      $7, $0, 0x80
/* 56BC4 00156AC4 08000824 */  addiu      $8, $0, 0x8
/* 56BC8 00156AC8 B488040C */  jal        __construct_array
/* 56BCC 00156ACC 00000000 */   nop
/* 56BD0 00156AD0 20080426 */  addiu      $4, $16, 0x820
/* 56BD4 00156AD4 1400023C */  lui        $2, %hi(__ct__11MotionParamFv)
/* 56BD8 00156AD8 10364524 */  addiu      $5, $2, %lo(__ct__11MotionParamFv)
/* 56BDC 00156ADC 28360070 */  paddub     $6, $0, $0
/* 56BE0 00156AE0 80000724 */  addiu      $7, $0, 0x80
/* 56BE4 00156AE4 08000824 */  addiu      $8, $0, 0x8
/* 56BE8 00156AE8 B488040C */  jal        __construct_array
/* 56BEC 00156AEC 00000000 */   nop
/* 56BF0 00156AF0 000D0426 */  addiu      $4, $16, 0xD00
/* 56BF4 00156AF4 1500023C */  lui        $2, %hi(__ct__15CFakePointLightFv)
/* 56BF8 00156AF8 606B4524 */  addiu      $5, $2, %lo(__ct__15CFakePointLightFv)
/* 56BFC 00156AFC 28360070 */  paddub     $6, $0, $0
/* 56C00 00156B00 30000724 */  addiu      $7, $0, 0x30
/* 56C04 00156B04 02000824 */  addiu      $8, $0, 0x2
/* 56C08 00156B08 B488040C */  jal        __construct_array
/* 56C0C 00156B0C 00000000 */   nop
/* 56C10 00156B10 28260072 */  paddub     $4, $16, $0
/* 56C14 00156B14 A000198E */  lw         $25, 0xA0($16)
/* 56C18 00156B18 C400398F */  lw         $25, 0xC4($25)
/* 56C1C 00156B1C 09F82003 */  jalr       $25
/* 56C20 00156B20 00000000 */   nop
/* 56C24 00156B24 2A00023C */  lui        $2, %hi(__vt__12CNPCharacter)
/* 56C28 00156B28 C0134224 */  addiu      $2, $2, %lo(__vt__12CNPCharacter)
/* 56C2C 00156B2C A00002AE */  sw         $2, 0xA0($16)
/* 56C30 00156B30 28260072 */  paddub     $4, $16, $0
/* 56C34 00156B34 A000198E */  lw         $25, 0xA0($16)
/* 56C38 00156B38 C400398F */  lw         $25, 0xC4($25)
/* 56C3C 00156B3C 09F82003 */  jalr       $25
/* 56C40 00156B40 00000000 */   nop
/* 56C44 00156B44 28160072 */  paddub     $2, $16, $0
/* 56C48 00156B48 1000BF7B */  lq         $31, 0x10($sp)
/* 56C4C 00156B4C 0000B07B */  lq         $16, 0x0($sp)
/* 56C50 00156B50 2000BD27 */  addiu      $sp, $sp, 0x20
/* 56C54 00156B54 0800E003 */  jr         $31
/* 56C58 00156B58 00000000 */   nop
/* 56C5C 00156B5C 00000000 */  nop
