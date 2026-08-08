.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__12CNPCharacterFv
/* 056B70 00156A70 E0FFBD27 */  addiu       $29, $29, -0x20
/* 056B74 00156A74 1000BF7F */  sq          $31, 0x10($29)
/* 056B78 00156A78 0000B07F */  sq          $16, 0x0($29)
/* 056B7C 00156A7C 28868070 */  paddub      $16, $4, $0
/* 056B80 00156A80 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 056B84 00156A84 00608244 */  mtc1        $2, $f12
/* 056B88 00156A88 045C050C */  jal         __ct__7CObjectFf
/* 056B8C 00156A8C 00000000 */   nop
/* 056B90 00156A90 2A00023C */  lui         $2, %hi(__vt__10CCharacter)
/* 056B94 00156A94 B0124224 */  addiu       $2, $2, %lo(__vt__10CCharacter)
/* 056B98 00156A98 A00002AE */  sw          $2, 0xA0($16)
/* 056B9C 00156A9C DC000426 */  addiu       $4, $16, 0xDC
/* 056BA0 00156AA0 282E0070 */  paddub      $5, $0, $0
/* 056BA4 00156AA4 28360070 */  paddub      $6, $0, $0
/* 056BA8 00156AA8 1C9E050C */  jal         __ct__13CTextureAnimeFP13CTexAnimeDatai
/* 056BAC 00156AAC 00000000 */   nop
/* 056BB0 00156AB0 20040426 */  addiu       $4, $16, 0x420
/* 056BB4 00156AB4 1400023C */  lui         $2, %hi(__ct__11MotionParamFv)
/* 056BB8 00156AB8 10364524 */  addiu       $5, $2, %lo(__ct__11MotionParamFv)
/* 056BBC 00156ABC 28360070 */  paddub      $6, $0, $0
/* 056BC0 00156AC0 80000724 */  addiu       $7, $0, 0x80
/* 056BC4 00156AC4 08000824 */  addiu       $8, $0, 0x8
/* 056BC8 00156AC8 B488040C */  jal         __construct_array
/* 056BCC 00156ACC 00000000 */   nop
/* 056BD0 00156AD0 20080426 */  addiu       $4, $16, 0x820
/* 056BD4 00156AD4 1400023C */  lui         $2, %hi(__ct__11MotionParamFv)
/* 056BD8 00156AD8 10364524 */  addiu       $5, $2, %lo(__ct__11MotionParamFv)
/* 056BDC 00156ADC 28360070 */  paddub      $6, $0, $0
/* 056BE0 00156AE0 80000724 */  addiu       $7, $0, 0x80
/* 056BE4 00156AE4 08000824 */  addiu       $8, $0, 0x8
/* 056BE8 00156AE8 B488040C */  jal         __construct_array
/* 056BEC 00156AEC 00000000 */   nop
/* 056BF0 00156AF0 000D0426 */  addiu       $4, $16, 0xD00
/* 056BF4 00156AF4 1500023C */  lui         $2, %hi(__ct__15CFakePointLightFv)
/* 056BF8 00156AF8 606B4524 */  addiu       $5, $2, %lo(__ct__15CFakePointLightFv)
/* 056BFC 00156AFC 28360070 */  paddub      $6, $0, $0
/* 056C00 00156B00 30000724 */  addiu       $7, $0, 0x30
/* 056C04 00156B04 02000824 */  addiu       $8, $0, 0x2
/* 056C08 00156B08 B488040C */  jal         __construct_array
/* 056C0C 00156B0C 00000000 */   nop
/* 056C10 00156B10 28260072 */  paddub      $4, $16, $0
/* 056C14 00156B14 A000198E */  lw          $25, 0xA0($16)
/* 056C18 00156B18 C400398F */  lw          $25, 0xC4($25)
/* 056C1C 00156B1C 09F82003 */  jalr        $25
/* 056C20 00156B20 00000000 */   nop
/* 056C24 00156B24 2A00023C */  lui         $2, %hi(__vt__12CNPCharacter)
/* 056C28 00156B28 C0134224 */  addiu       $2, $2, %lo(__vt__12CNPCharacter)
/* 056C2C 00156B2C A00002AE */  sw          $2, 0xA0($16)
/* 056C30 00156B30 28260072 */  paddub      $4, $16, $0
/* 056C34 00156B34 A000198E */  lw          $25, 0xA0($16)
/* 056C38 00156B38 C400398F */  lw          $25, 0xC4($25)
/* 056C3C 00156B3C 09F82003 */  jalr        $25
/* 056C40 00156B40 00000000 */   nop
/* 056C44 00156B44 28160072 */  paddub      $2, $16, $0
/* 056C48 00156B48 1000BF7B */  lq          $31, 0x10($29)
/* 056C4C 00156B4C 0000B07B */  lq          $16, 0x0($29)
/* 056C50 00156B50 2000BD27 */  addiu       $29, $29, 0x20
/* 056C54 00156B54 0800E003 */  jr          $31
/* 056C58 00156B58 00000000 */   nop
/* 056C5C 00156B5C 00000000 */  nop
