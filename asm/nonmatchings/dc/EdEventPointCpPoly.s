.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdEventPointCpPoly__FPfP14ED_EVENT_POINTiP6CCPolyf
/* 84B50 00184A50 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 84B54 00184A54 8000BF7F */  sq         $31, 0x80($sp)
/* 84B58 00184A58 7000B67F */  sq         $22, 0x70($sp)
/* 84B5C 00184A5C 6000B57F */  sq         $21, 0x60($sp)
/* 84B60 00184A60 5000B47F */  sq         $20, 0x50($sp)
/* 84B64 00184A64 4000B37F */  sq         $19, 0x40($sp)
/* 84B68 00184A68 3000B27F */  sq         $18, 0x30($sp)
/* 84B6C 00184A6C 2000B17F */  sq         $17, 0x20($sp)
/* 84B70 00184A70 1000B07F */  sq         $16, 0x10($sp)
/* 84B74 00184A74 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 84B78 00184A78 289E8070 */  paddub     $19, $4, $0
/* 84B7C 00184A7C 2896A070 */  paddub     $18, $5, $0
/* 84B80 00184A80 288EC070 */  paddub     $17, $6, $0
/* 84B84 00184A84 2886E070 */  paddub     $16, $7, $0
/* 84B88 00184A88 06650046 */  mov.s      $f20, $f12
/* 84B8C 00184A8C D201013C */  lui        $at, (0x1D20000 >> 16)
/* 84B90 00184A90 BC9B348C */  lw         $20, -0x6444($at)
/* 84B94 00184A94 04928283 */  lb         $2, -0x6DFC($gp)
/* 84B98 00184A98 34004014 */  bnez       $2, .L00184B6C
/* 84B9C 00184A9C 00000000 */   nop
/* 84BA0 00184AA0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 84BA4 00184AA4 00608244 */  mtc1       $2, $f12
/* 84BA8 00184AA8 D401023C */  lui        $2, %hi(chara$631)
/* 84BAC 00184AAC 50B94424 */  addiu      $4, $2, %lo(chara$631)
/* 84BB0 00184AB0 045C050C */  jal        __ct__7CObjectFf
/* 84BB4 00184AB4 00000000 */   nop
/* 84BB8 00184AB8 2A00023C */  lui        $2, %hi(__vt__10CCharacter)
/* 84BBC 00184ABC B0124224 */  addiu      $2, $2, %lo(__vt__10CCharacter)
/* 84BC0 00184AC0 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 84BC4 00184AC4 F0B922AC */  sw         $2, -0x4610($at)
/* 84BC8 00184AC8 D401023C */  lui        $2, %hi(D_1D3BA2C)
/* 84BCC 00184ACC 2CBA4424 */  addiu      $4, $2, %lo(D_1D3BA2C)
/* 84BD0 00184AD0 282E0070 */  paddub     $5, $0, $0
/* 84BD4 00184AD4 28360070 */  paddub     $6, $0, $0
/* 84BD8 00184AD8 1C9E050C */  jal        __ct__13CTextureAnimeFP13CTexAnimeDatai
/* 84BDC 00184ADC 00000000 */   nop
/* 84BE0 00184AE0 D401023C */  lui        $2, %hi(D_1D3BD70)
/* 84BE4 00184AE4 70BD4424 */  addiu      $4, $2, %lo(D_1D3BD70)
/* 84BE8 00184AE8 1400023C */  lui        $2, %hi(__ct__11MotionParamFv)
/* 84BEC 00184AEC 10364524 */  addiu      $5, $2, %lo(__ct__11MotionParamFv)
/* 84BF0 00184AF0 28360070 */  paddub     $6, $0, $0
/* 84BF4 00184AF4 80000724 */  addiu      $7, $0, 0x80
/* 84BF8 00184AF8 08000824 */  addiu      $8, $0, 0x8
/* 84BFC 00184AFC B488040C */  jal        __construct_array
/* 84C00 00184B00 00000000 */   nop
/* 84C04 00184B04 D401023C */  lui        $2, %hi(D_1D3C170)
/* 84C08 00184B08 70C14424 */  addiu      $4, $2, %lo(D_1D3C170)
/* 84C0C 00184B0C 1400023C */  lui        $2, %hi(__ct__11MotionParamFv)
/* 84C10 00184B10 10364524 */  addiu      $5, $2, %lo(__ct__11MotionParamFv)
/* 84C14 00184B14 28360070 */  paddub     $6, $0, $0
/* 84C18 00184B18 80000724 */  addiu      $7, $0, 0x80
/* 84C1C 00184B1C 08000824 */  addiu      $8, $0, 0x8
/* 84C20 00184B20 B488040C */  jal        __construct_array
/* 84C24 00184B24 00000000 */   nop
/* 84C28 00184B28 D401023C */  lui        $2, %hi(D_1D3C650)
/* 84C2C 00184B2C 50C64424 */  addiu      $4, $2, %lo(D_1D3C650)
/* 84C30 00184B30 1500023C */  lui        $2, %hi(__ct__15CFakePointLightFv)
/* 84C34 00184B34 606B4524 */  addiu      $5, $2, %lo(__ct__15CFakePointLightFv)
/* 84C38 00184B38 28360070 */  paddub     $6, $0, $0
/* 84C3C 00184B3C 30000724 */  addiu      $7, $0, 0x30
/* 84C40 00184B40 02000824 */  addiu      $8, $0, 0x2
/* 84C44 00184B44 B488040C */  jal        __construct_array
/* 84C48 00184B48 00000000 */   nop
/* 84C4C 00184B4C D401023C */  lui        $2, %hi(chara$631)
/* 84C50 00184B50 50B94424 */  addiu      $4, $2, %lo(chara$631)
/* 84C54 00184B54 A000998C */  lw         $25, 0xA0($4)
/* 84C58 00184B58 C400398F */  lw         $25, 0xC4($25)
/* 84C5C 00184B5C 09F82003 */  jalr       $25
/* 84C60 00184B60 00000000 */   nop
/* 84C64 00184B64 01000224 */  addiu      $2, $0, 0x1
/* 84C68 00184B68 049282A3 */  sb         $2, -0x6DFC($gp)
.L00184B6C:
/* 84C6C 00184B6C 4040023C */  lui        $2, (0x40400000 >> 16)
/* 84C70 00184B70 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 84C74 00184B74 00BA22AC */  sw         $2, -0x4600($at)
/* 84C78 00184B78 28B60070 */  paddub     $22, $0, $0
/* 84C7C 00184B7C 28AE0070 */  paddub     $21, $0, $0
/* 84C80 00184B80 38000010 */  b          .L00184C64
/* 84C84 00184B84 00000000 */   nop
.L00184B88:
/* 84C88 00184B88 1000438E */  lw         $3, 0x10($18)
/* 84C8C 00184B8C 02000224 */  addiu      $2, $0, 0x2
/* 84C90 00184B90 32006214 */  bne        $3, $2, .L00184C5C
/* 84C94 00184B94 00000000 */   nop
/* 84C98 00184B98 28264072 */  paddub     $4, $18, $0
/* 84C9C 00184B9C 06A30046 */  mov.s      $f12, $f20
/* 84CA0 00184BA0 980E060C */  jal        CheckEventPoint__FP14ED_EVENT_POINTf
/* 84CA4 00184BA4 00000000 */   nop
/* 84CA8 00184BA8 2C004010 */  beqz       $2, .L00184C5C
/* 84CAC 00184BAC 00000000 */   nop
/* 84CB0 00184BB0 9000A427 */  addiu      $4, $sp, 0x90
/* 84CB4 00184BB4 50004526 */  addiu      $5, $18, 0x50
/* 84CB8 00184BB8 0C86040C */  jal        sceVu0CopyVector
/* 84CBC 00184BBC 00000000 */   nop
/* 84CC0 00184BC0 A000A427 */  addiu      $4, $sp, 0xA0
/* 84CC4 00184BC4 70004526 */  addiu      $5, $18, 0x70
/* 84CC8 00184BC8 0C86040C */  jal        sceVu0CopyVector
/* 84CCC 00184BCC 00000000 */   nop
/* 84CD0 00184BD0 1400428E */  lw         $2, 0x14($18)
/* 84CD4 00184BD4 0C00458E */  lw         $5, 0xC($18)
/* 84CD8 00184BD8 0D00A004 */  bltz       $5, .L00184C10
/* 84CDC 00184BDC 00000000 */   nop
/* 84CE0 00184BE0 28268072 */  paddub     $4, $20, $0
/* 84CE4 00184BE4 2086060C */  jal        GetPartsObject__11CEditGroundFi
/* 84CE8 00184BE8 00000000 */   nop
/* 84CEC 00184BEC 1B004010 */  beqz       $2, .L00184C5C
/* 84CF0 00184BF0 00000000 */   nop
/* 84CF4 00184BF4 28264070 */  paddub     $4, $2, $0
/* 84CF8 00184BF8 9000A527 */  addiu      $5, $sp, 0x90
/* 84CFC 00184BFC A000A627 */  addiu      $6, $sp, 0xA0
/* 84D00 00184C00 3C0E060C */  jal        GetPosRot__FP10CMapObjectPfPf
/* 84D04 00184C04 00000000 */   nop
/* 84D08 00184C08 08000010 */  b          .L00184C2C
/* 84D0C 00184C0C 00000000 */   nop
.L00184C10:
/* 84D10 00184C10 06004010 */  beqz       $2, .L00184C2C
/* 84D14 00184C14 00000000 */   nop
/* 84D18 00184C18 28264070 */  paddub     $4, $2, $0
/* 84D1C 00184C1C 9000A527 */  addiu      $5, $sp, 0x90
/* 84D20 00184C20 A000A627 */  addiu      $6, $sp, 0xA0
/* 84D24 00184C24 3C0E060C */  jal        GetPosRot__FP10CMapObjectPfPf
/* 84D28 00184C28 00000000 */   nop
.L00184C2C:
/* 84D2C 00184C2C D401023C */  lui        $2, %hi(chara$631)
/* 84D30 00184C30 50B94424 */  addiu      $4, $2, %lo(chara$631)
/* 84D34 00184C34 9000A527 */  addiu      $5, $sp, 0x90
/* 84D38 00184C38 38E4040C */  jal        SetPosition__10CCharacterFPf
/* 84D3C 00184C3C 00000000 */   nop
/* 84D40 00184C40 D401023C */  lui        $2, %hi(chara$631)
/* 84D44 00184C44 50B94424 */  addiu      $4, $2, %lo(chara$631)
/* 84D48 00184C48 282E6072 */  paddub     $5, $19, $0
/* 84D4C 00184C4C 28360072 */  paddub     $6, $16, $0
/* 84D50 00184C50 C459050C */  jal        PickUpPoly__10CCharacterFPfP6CCPoly
/* 84D54 00184C54 00000000 */   nop
/* 84D58 00184C58 21B0C202 */  addu       $22, $22, $2
.L00184C5C:
/* 84D5C 00184C5C 0100B526 */  addiu      $21, $21, 0x1
/* 84D60 00184C60 90005226 */  addiu      $18, $18, 0x90
.L00184C64:
/* 84D64 00184C64 2A10B102 */  slt        $2, $21, $17
/* 84D68 00184C68 C7FF4014 */  bnez       $2, .L00184B88
/* 84D6C 00184C6C 00000000 */   nop
/* 84D70 00184C70 2816C072 */  paddub     $2, $22, $0
/* 84D74 00184C74 8000BF7B */  lq         $31, 0x80($sp)
/* 84D78 00184C78 7000B67B */  lq         $22, 0x70($sp)
/* 84D7C 00184C7C 6000B57B */  lq         $21, 0x60($sp)
/* 84D80 00184C80 5000B47B */  lq         $20, 0x50($sp)
/* 84D84 00184C84 4000B37B */  lq         $19, 0x40($sp)
/* 84D88 00184C88 3000B27B */  lq         $18, 0x30($sp)
/* 84D8C 00184C8C 2000B17B */  lq         $17, 0x20($sp)
/* 84D90 00184C90 1000B07B */  lq         $16, 0x10($sp)
/* 84D94 00184C94 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 84D98 00184C98 B000BD27 */  addiu      $sp, $sp, 0xB0
/* 84D9C 00184C9C 0800E003 */  jr         $31
/* 84DA0 00184CA0 00000000 */   nop
/* 84DA4 00184CA4 00000000 */  nop
/* 84DA8 00184CA8 00000000 */  nop
/* 84DAC 00184CAC 00000000 */  nop
