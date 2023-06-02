.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ShopMenuInit__FPiii
/* E7A50 001E7950 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* E7A54 001E7954 4000BF7F */  sq         $31, 0x40($sp)
/* E7A58 001E7958 3000B37F */  sq         $19, 0x30($sp)
/* E7A5C 001E795C 2000B27F */  sq         $18, 0x20($sp)
/* E7A60 001E7960 1000B17F */  sq         $17, 0x10($sp)
/* E7A64 001E7964 0000B07F */  sq         $16, 0x0($sp)
/* E7A68 001E7968 28968070 */  paddub     $18, $4, $0
/* E7A6C 001E796C 288EA070 */  paddub     $17, $5, $0
/* E7A70 001E7970 2886C070 */  paddub     $16, $6, $0
/* E7A74 001E7974 28260072 */  paddub     $4, $16, $0
/* E7A78 001E7978 ECAE080C */  jal        BtlMenuBufferSet__Fi
/* E7A7C 001E797C 00000000 */   nop
/* E7A80 001E7980 289E4070 */  paddub     $19, $2, $0
/* E7A84 001E7984 28266072 */  paddub     $4, $19, $0
/* E7A88 001E7988 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* E7A8C 001E798C 00000000 */   nop
/* E7A90 001E7990 289E4070 */  paddub     $19, $2, $0
/* E7A94 001E7994 D201013C */  lui        $at, (0x1D20000 >> 16)
/* E7A98 001E7998 DCB3228C */  lw         $2, -0x4C24($at)
/* E7A9C 001E799C 43100200 */  sra        $2, $2, 1
/* E7AA0 001E79A0 D901013C */  lui        $at, (0x1D900B0 >> 16)
/* E7AA4 001E79A4 B00033AC */  sw         $19, (0x1D900B0 & 0xFFFF)($at)
/* E7AA8 001E79A8 D901013C */  lui        $at, (0x1D900BC >> 16)
/* E7AAC 001E79AC BC0022AC */  sw         $2, (0x1D900BC & 0xFFFF)($at)
/* E7AB0 001E79B0 D901013C */  lui        $at, (0x1D900B8 >> 16)
/* E7AB4 001E79B4 B80020AC */  sw         $0, (0x1D900B8 & 0xFFFF)($at)
/* E7AB8 001E79B8 1C8D848F */  lw         $4, -0x72E4($gp)
/* E7ABC 001E79BC 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* E7AC0 001E79C0 00000000 */   nop
/* E7AC4 001E79C4 849482AF */  sw         $2, -0x6B7C($gp)
/* E7AC8 001E79C8 80AE080C */  jal        GetMenuLangFlag__Fv
/* E7ACC 001E79CC 00000000 */   nop
/* E7AD0 001E79D0 D901013C */  lui        $at, (0x1D90260 >> 16)
/* E7AD4 001E79D4 600222A4 */  sh         $2, (0x1D90260 & 0xFFFF)($at)
/* E7AD8 001E79D8 30FB040C */  jal        StartReadBG__Fv
/* E7ADC 001E79DC 00000000 */   nop
/* E7AE0 001E79E0 2A00023C */  lui        $2, %hi(_760)
/* E7AE4 001E79E4 50D14424 */  addiu      $4, $2, %lo(_760)
/* E7AE8 001E79E8 282E6072 */  paddub     $5, $19, $0
/* E7AEC 001E79EC ACAE080C */  jal        LoadFileBGMenuData__FPcP1
/* E7AF0 001E79F0 00000000 */   nop
/* E7AF4 001E79F4 03110200 */  sra        $2, $2, 4
/* E7AF8 001E79F8 02014524 */  addiu      $5, $2, 0x102
/* E7AFC 001E79FC D901023C */  lui        $2, %hi(ShopCashBuffer)
/* E7B00 001E7A00 B0004424 */  addiu      $4, $2, %lo(ShopCashBuffer)
/* E7B04 001E7A04 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* E7B08 001E7A08 00000000 */   nop
/* E7B0C 001E7A0C D901013C */  lui        $at, (0x1D900D0 >> 16)
/* E7B10 001E7A10 D00031A4 */  sh         $17, (0x1D900D0 & 0xFFFF)($at)
/* E7B14 001E7A14 D901013C */  lui        $at, (0x1D900D4 >> 16)
/* E7B18 001E7A18 D40030A4 */  sh         $16, (0x1D900D4 & 0xFFFF)($at)
/* E7B1C 001E7A1C 00004286 */  lh         $2, 0x0($18)
/* E7B20 001E7A20 D901013C */  lui        $at, (0x1D9025A >> 16)
/* E7B24 001E7A24 5A0222A4 */  sh         $2, (0x1D9025A & 0xFFFF)($at)
/* E7B28 001E7A28 D901013C */  lui        $at, (0x1D90258 >> 16)
/* E7B2C 001E7A2C 580220A4 */  sh         $0, (0x1D90258 & 0xFFFF)($at)
/* E7B30 001E7A30 04004286 */  lh         $2, 0x4($18)
/* E7B34 001E7A34 D901013C */  lui        $at, (0x1D90266 >> 16)
/* E7B38 001E7A38 660222A4 */  sh         $2, (0x1D90266 & 0xFFFF)($at)
/* E7B3C 001E7A3C 01000224 */  addiu      $2, $0, 0x1
/* E7B40 001E7A40 D901013C */  lui        $at, (0x1D90264 >> 16)
/* E7B44 001E7A44 640222A4 */  sh         $2, (0x1D90264 & 0xFFFF)($at)
/* E7B48 001E7A48 D901013C */  lui        $at, (0x1D9025E >> 16)
/* E7B4C 001E7A4C 5E0220A4 */  sh         $0, (0x1D9025E & 0xFFFF)($at)
/* E7B50 001E7A50 D901013C */  lui        $at, (0x1D900D2 >> 16)
/* E7B54 001E7A54 D20022A4 */  sh         $2, (0x1D900D2 & 0xFFFF)($at)
/* E7B58 001E7A58 8494848F */  lw         $4, -0x6B7C($gp)
/* E7B5C 001E7A5C D901023C */  lui        $2, %hi(D_1D900D8)
/* E7B60 001E7A60 D8004524 */  addiu      $5, $2, %lo(D_1D900D8)
/* E7B64 001E7A64 28360070 */  paddub     $6, $0, $0
/* E7B68 001E7A68 283E0070 */  paddub     $7, $0, $0
/* E7B6C 001E7A6C D0B9080C */  jal        InitPersonalBoardMode__FP11CUserStatusP14PERSONAL_BOARDii
/* E7B70 001E7A70 00000000 */   nop
/* E7B74 001E7A74 D901023C */  lui        $2, %hi(D_1D90108)
/* E7B78 001E7A78 08014224 */  addiu      $2, $2, %lo(D_1D90108)
/* E7B7C 001E7A7C B89482AF */  sw         $2, -0x6B48($gp)
/* E7B80 001E7A80 D901023C */  lui        $2, %hi(D_1D9011C)
/* E7B84 001E7A84 1C014224 */  addiu      $2, $2, %lo(D_1D9011C)
/* E7B88 001E7A88 BC9482AF */  sw         $2, -0x6B44($gp)
/* E7B8C 001E7A8C D901023C */  lui        $2, %hi(D_1D90214)
/* E7B90 001E7A90 14024224 */  addiu      $2, $2, %lo(D_1D90214)
/* E7B94 001E7A94 C09482AF */  sw         $2, -0x6B40($gp)
/* E7B98 001E7A98 D901013C */  lui        $at, (0x1D90246 >> 16)
/* E7B9C 001E7A9C 460220A0 */  sb         $0, (0x1D90246 & 0xFFFF)($at)
/* E7BA0 001E7AA0 D901013C */  lui        $at, (0x1D90244 >> 16)
/* E7BA4 001E7AA4 440220A4 */  sh         $0, (0x1D90244 & 0xFFFF)($at)
/* E7BA8 001E7AA8 D901013C */  lui        $at, (0x1D90254 >> 16)
/* E7BAC 001E7AAC 540220AC */  sw         $0, (0x1D90254 & 0xFFFF)($at)
/* E7BB0 001E7AB0 01000224 */  addiu      $2, $0, 0x1
/* E7BB4 001E7AB4 D901013C */  lui        $at, (0x1D90250 >> 16)
/* E7BB8 001E7AB8 500222A4 */  sh         $2, (0x1D90250 & 0xFFFF)($at)
/* E7BBC 001E7ABC C701023C */  lui        $2, %hi(TexManager)
/* E7BC0 001E7AC0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* E7BC4 001E7AC4 2A00023C */  lui        $2, %hi(_761)
/* E7BC8 001E7AC8 60D14524 */  addiu      $5, $2, %lo(_761)
/* E7BCC 001E7ACC FFFF0624 */  addiu      $6, $0, -0x1
/* E7BD0 001E7AD0 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* E7BD4 001E7AD4 00000000 */   nop
/* E7BD8 001E7AD8 A09682AF */  sw         $2, -0x6960($gp)
/* E7BDC 001E7ADC DB01023C */  lui        $2, %hi(ItemVolumeStep)
/* E7BE0 001E7AE0 10BC4424 */  addiu      $4, $2, %lo(ItemVolumeStep)
/* E7BE4 001E7AE4 C8D5080C */  jal        CheckItemVolume__13CMenuItemStepFv
/* E7BE8 001E7AE8 00000000 */   nop
/* E7BEC 001E7AEC FFFF0224 */  addiu      $2, $0, -0x1
/* E7BF0 001E7AF0 D901013C */  lui        $at, (0x1D90282 >> 16)
/* E7BF4 001E7AF4 820222A4 */  sh         $2, (0x1D90282 & 0xFFFF)($at)
/* E7BF8 001E7AF8 D901013C */  lui        $at, (0x1D90284 >> 16)
/* E7BFC 001E7AFC 840222A4 */  sh         $2, (0x1D90284 & 0xFFFF)($at)
/* E7C00 001E7B00 D901013C */  lui        $at, (0x1D90286 >> 16)
/* E7C04 001E7B04 860222A4 */  sh         $2, (0x1D90286 & 0xFFFF)($at)
/* E7C08 001E7B08 D901013C */  lui        $at, (0x1D90290 >> 16)
/* E7C0C 001E7B0C 900222A4 */  sh         $2, (0x1D90290 & 0xFFFF)($at)
/* E7C10 001E7B10 D901013C */  lui        $at, (0x1D9028C >> 16)
/* E7C14 001E7B14 8C0220AC */  sw         $0, (0x1D9028C & 0xFFFF)($at)
/* E7C18 001E7B18 D901013C */  lui        $at, (0x1D90288 >> 16)
/* E7C1C 001E7B1C 880220AC */  sw         $0, (0x1D90288 & 0xFFFF)($at)
/* E7C20 001E7B20 D901023C */  lui        $2, %hi(D_1D90294)
/* E7C24 001E7B24 94024424 */  addiu      $4, $2, %lo(D_1D90294)
/* E7C28 001E7B28 282E0070 */  paddub     $5, $0, $0
/* E7C2C 001E7B2C F8000624 */  addiu      $6, $0, 0xF8
/* E7C30 001E7B30 5A0D040C */  jal        memset
/* E7C34 001E7B34 00000000 */   nop
/* E7C38 001E7B38 8494828F */  lw         $2, -0x6B7C($gp)
/* E7C3C 001E7B3C 60434424 */  addiu      $4, $2, 0x4360
/* E7C40 001E7B40 98B9080C */  jal        SetMenuTrushMark__FP9ITEM_PACK
/* E7C44 001E7B44 00000000 */   nop
/* E7C48 001E7B48 CC01023C */  lui        $2, %hi(GamePad)
/* E7C4C 001E7B4C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* E7C50 001E7B50 00F00534 */  ori        $5, $0, 0xF000
/* E7C54 001E7B54 1E000624 */  addiu      $6, $0, 0x1E
/* E7C58 001E7B58 05000724 */  addiu      $7, $0, 0x5
/* E7C5C 001E7B5C 58AD040C */  jal        SetAutoRepeat__8CGamePadFiii
/* E7C60 001E7B60 00000000 */   nop
/* E7C64 001E7B64 CC01023C */  lui        $2, %hi(GamePad)
/* E7C68 001E7B68 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* E7C6C 001E7B6C 78000524 */  addiu      $5, $0, 0x78
/* E7C70 001E7B70 48AE040C */  jal        MenuModeOn__8CGamePadFi
/* E7C74 001E7B74 00000000 */   nop
/* E7C78 001E7B78 4000BF7B */  lq         $31, 0x40($sp)
/* E7C7C 001E7B7C 3000B37B */  lq         $19, 0x30($sp)
/* E7C80 001E7B80 2000B27B */  lq         $18, 0x20($sp)
/* E7C84 001E7B84 1000B17B */  lq         $17, 0x10($sp)
/* E7C88 001E7B88 0000B07B */  lq         $16, 0x0($sp)
/* E7C8C 001E7B8C 5000BD27 */  addiu      $sp, $sp, 0x50
/* E7C90 001E7B90 0800E003 */  jr         $31
/* E7C94 001E7B94 00000000 */   nop
/* E7C98 001E7B98 00000000 */  nop
/* E7C9C 001E7B9C 00000000 */  nop
