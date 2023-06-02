.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__11CEditGroundFv
/* A5AF0 001A59F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A5AF4 001A59F4 1000BF7F */  sq         $31, 0x10($sp)
/* A5AF8 001A59F8 0000B07F */  sq         $16, 0x0($sp)
/* A5AFC 001A59FC 28868070 */  paddub     $16, $4, $0
/* A5B00 001A5A00 30000426 */  addiu      $4, $16, 0x30
/* A5B04 001A5A04 1A00023C */  lui        $2, %hi(__ct__9CMapPartsFv)
/* A5B08 001A5A08 60A94524 */  addiu      $5, $2, %lo(__ct__9CMapPartsFv)
/* A5B0C 001A5A0C 28360070 */  paddub     $6, $0, $0
/* A5B10 001A5A10 A0020724 */  addiu      $7, $0, 0x2A0
/* A5B14 001A5A14 80000824 */  addiu      $8, $0, 0x80
/* A5B18 001A5A18 B488040C */  jal        __construct_array
/* A5B1C 001A5A1C 00000000 */   nop
/* A5B20 001A5A20 0100013C */  lui        $at, (0x15040 >> 16)
/* A5B24 001A5A24 40502134 */  ori        $at, $at, (0x15040 & 0xFFFF)
/* A5B28 001A5A28 21200102 */  addu       $4, $16, $at
/* A5B2C 001A5A2C 1A00023C */  lui        $2, %hi(__ct__12CGroundWaterFv)
/* A5B30 001A5A30 E05A4524 */  addiu      $5, $2, %lo(__ct__12CGroundWaterFv)
/* A5B34 001A5A34 28360070 */  paddub     $6, $0, $0
/* A5B38 001A5A38 B0030724 */  addiu      $7, $0, 0x3B0
/* A5B3C 001A5A3C 04000824 */  addiu      $8, $0, 0x4
/* A5B40 001A5A40 B488040C */  jal        __construct_array
/* A5B44 001A5A44 00000000 */   nop
/* A5B48 001A5A48 0100013C */  lui        $at, (0x15F40 >> 16)
/* A5B4C 001A5A4C 405F2134 */  ori        $at, $at, (0x15F40 & 0xFFFF)
/* A5B50 001A5A50 21200102 */  addu       $4, $16, $at
/* A5B54 001A5A54 1A00023C */  lui        $2, %hi(__ct__9CMapPartsFv)
/* A5B58 001A5A58 60A94524 */  addiu      $5, $2, %lo(__ct__9CMapPartsFv)
/* A5B5C 001A5A5C 28360070 */  paddub     $6, $0, $0
/* A5B60 001A5A60 A0020724 */  addiu      $7, $0, 0x2A0
/* A5B64 001A5A64 40000824 */  addiu      $8, $0, 0x40
/* A5B68 001A5A68 B488040C */  jal        __construct_array
/* A5B6C 001A5A6C 00000000 */   nop
/* A5B70 001A5A70 0200013C */  lui        $at, (0x20744 >> 16)
/* A5B74 001A5A74 21080102 */  addu       $at, $16, $at
/* A5B78 001A5A78 440720AC */  sw         $0, (0x20744 & 0xFFFF)($at)
/* A5B7C 001A5A7C 0200013C */  lui        $at, (0x20758 >> 16)
/* A5B80 001A5A80 21080102 */  addu       $at, $16, $at
/* A5B84 001A5A84 580720AC */  sw         $0, (0x20758 & 0xFFFF)($at)
/* A5B88 001A5A88 0200013C */  lui        $at, (0x20750 >> 16)
/* A5B8C 001A5A8C 21080102 */  addu       $at, $16, $at
/* A5B90 001A5A90 500720AC */  sw         $0, (0x20750 & 0xFFFF)($at)
/* A5B94 001A5A94 0200013C */  lui        $at, (0x2074C >> 16)
/* A5B98 001A5A98 21080102 */  addu       $at, $16, $at
/* A5B9C 001A5A9C 4C0720AC */  sw         $0, (0x2074C & 0xFFFF)($at)
/* A5BA0 001A5AA0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* A5BA4 001A5AA4 0200013C */  lui        $at, (0x20748 >> 16)
/* A5BA8 001A5AA8 21080102 */  addu       $at, $16, $at
/* A5BAC 001A5AAC 480722AC */  sw         $2, (0x20748 & 0xFFFF)($at)
/* A5BB0 001A5AB0 28260072 */  paddub     $4, $16, $0
/* A5BB4 001A5AB4 0096060C */  jal        Initialize__11CEditGroundFv
/* A5BB8 001A5AB8 00000000 */   nop
/* A5BBC 001A5ABC 28160072 */  paddub     $2, $16, $0
/* A5BC0 001A5AC0 1000BF7B */  lq         $31, 0x10($sp)
/* A5BC4 001A5AC4 0000B07B */  lq         $16, 0x0($sp)
/* A5BC8 001A5AC8 2000BD27 */  addiu      $sp, $sp, 0x20
/* A5BCC 001A5ACC 0800E003 */  jr         $31
/* A5BD0 001A5AD0 00000000 */   nop
/* A5BD4 001A5AD4 00000000 */  nop
/* A5BD8 001A5AD8 00000000 */  nop
/* A5BDC 001A5ADC 00000000 */  nop
