.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetBombEffect__FPfiif
/* D5A40 001D5940 80FFBD27 */  addiu      $sp, $sp, -0x80
/* D5A44 001D5944 7000BF7F */  sq         $31, 0x70($sp)
/* D5A48 001D5948 6000B57F */  sq         $21, 0x60($sp)
/* D5A4C 001D594C 5000B47F */  sq         $20, 0x50($sp)
/* D5A50 001D5950 4000B37F */  sq         $19, 0x40($sp)
/* D5A54 001D5954 3000B27F */  sq         $18, 0x30($sp)
/* D5A58 001D5958 2000B17F */  sq         $17, 0x20($sp)
/* D5A5C 001D595C 1000B07F */  sq         $16, 0x10($sp)
/* D5A60 001D5960 0000B4E7 */  swc1       $f20, 0x0($sp)
/* D5A64 001D5964 28AE8070 */  paddub     $21, $4, $0
/* D5A68 001D5968 28A6A070 */  paddub     $20, $5, $0
/* D5A6C 001D596C 289EC070 */  paddub     $19, $6, $0
/* D5A70 001D5970 06650046 */  mov.s      $f20, $f12
/* D5A74 001D5974 FFFF1024 */  addiu      $16, $0, -0x1
/* D5A78 001D5978 288E0070 */  paddub     $17, $0, $0
/* D5A7C 001D597C 5D000010 */  b          .L001D5AF4
/* D5A80 001D5980 00000000 */   nop
.L001D5984:
/* D5A84 001D5984 40101100 */  sll        $2, $17, 1
/* D5A88 001D5988 21105100 */  addu       $2, $2, $17
/* D5A8C 001D598C 80910200 */  sll        $18, $2, 6
/* D5A90 001D5990 F49D828F */  lw         $2, -0x620C($gp)
/* D5A94 001D5994 21205200 */  addu       $4, $2, $18
/* D5A98 001D5998 5858070C */  jal        CheckBomb__15CItemBombEffectFv
/* D5A9C 001D599C 00000000 */   nop
/* D5AA0 001D59A0 53004014 */  bnez       $2, .L001D5AF0
/* D5AA4 001D59A4 00000000 */   nop
/* D5AA8 001D59A8 F49D828F */  lw         $2, -0x620C($gp)
/* D5AAC 001D59AC 21205200 */  addu       $4, $2, $18
/* D5AB0 001D59B0 282EA072 */  paddub     $5, $21, $0
/* D5AB4 001D59B4 06A30046 */  mov.s      $f12, $f20
/* D5AB8 001D59B8 2858070C */  jal        SetBomb__15CItemBombEffectFPff
/* D5ABC 001D59BC 00000000 */   nop
/* D5AC0 001D59C0 6C000424 */  addiu      $4, $0, 0x6C
/* D5AC4 001D59C4 FFFF0524 */  addiu      $5, $0, -0x1
/* D5AC8 001D59C8 28360070 */  paddub     $6, $0, $0
/* D5ACC 001D59CC AC69050C */  jal        SndSePlay__Fiii
/* D5AD0 001D59D0 00000000 */   nop
/* D5AD4 001D59D4 3442023C */  lui        $2, (0x42340000 >> 16)
/* D5AD8 001D59D8 00008244 */  mtc1       $2, $f0
/* D5ADC 001D59DC 00000000 */  nop
/* D5AE0 001D59E0 02031446 */  mul.s      $f12, $f0, $f20
/* D5AE4 001D59E4 2C44040C */  jal        fptosi
/* D5AE8 001D59E8 00000000 */   nop
/* D5AEC 001D59EC 00688044 */  mtc1       $0, $f13
/* D5AF0 001D59F0 A041033C */  lui        $3, (0x41A00000 >> 16)
/* D5AF4 001D59F4 00008344 */  mtc1       $3, $f0
/* D5AF8 001D59F8 00000000 */  nop
/* D5AFC 001D59FC 02031446 */  mul.s      $f12, $f0, $f20
/* D5B00 001D5A00 F09D848F */  lw         $4, -0x6210($gp)
/* D5B04 001D5A04 282EA072 */  paddub     $5, $21, $0
/* D5B08 001D5A08 28366072 */  paddub     $6, $19, $0
/* D5B0C 001D5A0C 283E4070 */  paddub     $7, $2, $0
/* D5B10 001D5A10 28468072 */  paddub     $8, $20, $0
/* D5B14 001D5A14 03000924 */  addiu      $9, $0, 0x3
/* D5B18 001D5A18 28560070 */  paddub     $10, $0, $0
/* D5B1C 001D5A1C 285E0070 */  paddub     $11, $0, $0
/* D5B20 001D5A20 E8D5060C */  jal        Set__14CCollisionDataFPfiiffiiii
/* D5B24 001D5A24 00000000 */   nop
/* D5B28 001D5A28 28864070 */  paddub     $16, $2, $0
/* D5B2C 001D5A2C FFFF0224 */  addiu      $2, $0, -0x1
/* D5B30 001D5A30 0F000212 */  beq        $16, $2, .L001D5A70
/* D5B34 001D5A34 00000000 */   nop
/* D5B38 001D5A38 F09D858F */  lw         $5, -0x6210($gp)
/* D5B3C 001D5A3C 0A000424 */  addiu      $4, $0, 0xA
/* D5B40 001D5A40 803DA38C */  lw         $3, 0x3D80($5)
/* D5B44 001D5A44 80100300 */  sll        $2, $3, 2
/* D5B48 001D5A48 21104300 */  addu       $2, $2, $3
/* D5B4C 001D5A4C 40110200 */  sll        $2, $2, 5
/* D5B50 001D5A50 21104500 */  addu       $2, $2, $5
/* D5B54 001D5A54 700044AC */  sw         $4, 0x70($2)
/* D5B58 001D5A58 803DA38C */  lw         $3, 0x3D80($5)
/* D5B5C 001D5A5C 80100300 */  sll        $2, $3, 2
/* D5B60 001D5A60 21104300 */  addu       $2, $2, $3
/* D5B64 001D5A64 40110200 */  sll        $2, $2, 5
/* D5B68 001D5A68 21104500 */  addu       $2, $2, $5
/* D5B6C 001D5A6C 740044AC */  sw         $4, 0x74($2)
.L001D5A70:
/* D5B70 001D5A70 803F023C */  lui        $2, (0x3F800000 >> 16)
/* D5B74 001D5A74 00008244 */  mtc1       $2, $f0
/* D5B78 001D5A78 00000000 */  nop
/* D5B7C 001D5A7C 36A00046 */  c.le.s     $f20, $f0
/* D5B80 001D5A80 00000000 */  nop
/* D5B84 001D5A84 1E000145 */  bc1t       .L001D5B00
/* D5B88 001D5A88 00000000 */   nop
/* D5B8C 001D5A8C F89D848F */  lw         $4, -0x6208($gp)
/* D5B90 001D5A90 288E8070 */  paddub     $17, $4, $0
/* D5B94 001D5A94 282EA072 */  paddub     $5, $21, $0
/* D5B98 001D5A98 0C86040C */  jal        sceVu0CopyVector
/* D5B9C 001D5A9C 00000000 */   nop
/* D5BA0 001D5AA0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* D5BA4 001D5AA4 0C0022AE */  sw         $2, 0xC($17)
/* D5BA8 001D5AA8 F041023C */  lui        $2, (0x41F00000 >> 16)
/* D5BAC 001D5AAC 00008244 */  mtc1       $2, $f0
/* D5BB0 001D5AB0 00000000 */  nop
/* D5BB4 001D5AB4 02001446 */  mul.s      $f0, $f0, $f20
/* D5BB8 001D5AB8 100020E6 */  swc1       $f0, 0x10($17)
/* D5BBC 001D5ABC 140020E6 */  swc1       $f0, 0x14($17)
/* D5BC0 001D5AC0 180020AE */  sw         $0, 0x18($17)
/* D5BC4 001D5AC4 7041023C */  lui        $2, (0x41700000 >> 16)
/* D5BC8 001D5AC8 00008244 */  mtc1       $2, $f0
/* D5BCC 001D5ACC 00000000 */  nop
/* D5BD0 001D5AD0 02001446 */  mul.s      $f0, $f0, $f20
/* D5BD4 001D5AD4 1C0020E6 */  swc1       $f0, 0x1C($17)
/* D5BD8 001D5AD8 200020AE */  sw         $0, 0x20($17)
/* D5BDC 001D5ADC 240020AE */  sw         $0, 0x24($17)
/* D5BE0 001D5AE0 01000224 */  addiu      $2, $0, 0x1
/* D5BE4 001D5AE4 280022AE */  sw         $2, 0x28($17)
/* D5BE8 001D5AE8 05000010 */  b          .L001D5B00
/* D5BEC 001D5AEC 00000000 */   nop
.L001D5AF0:
/* D5BF0 001D5AF0 01003126 */  addiu      $17, $17, 0x1
.L001D5AF4:
/* D5BF4 001D5AF4 0300222A */  slti       $2, $17, 0x3
/* D5BF8 001D5AF8 A2FF4014 */  bnez       $2, .L001D5984
/* D5BFC 001D5AFC 00000000 */   nop
.L001D5B00:
/* D5C00 001D5B00 28160072 */  paddub     $2, $16, $0
/* D5C04 001D5B04 7000BF7B */  lq         $31, 0x70($sp)
/* D5C08 001D5B08 6000B57B */  lq         $21, 0x60($sp)
/* D5C0C 001D5B0C 5000B47B */  lq         $20, 0x50($sp)
/* D5C10 001D5B10 4000B37B */  lq         $19, 0x40($sp)
/* D5C14 001D5B14 3000B27B */  lq         $18, 0x30($sp)
/* D5C18 001D5B18 2000B17B */  lq         $17, 0x20($sp)
/* D5C1C 001D5B1C 1000B07B */  lq         $16, 0x10($sp)
/* D5C20 001D5B20 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* D5C24 001D5B24 8000BD27 */  addiu      $sp, $sp, 0x80
/* D5C28 001D5B28 0800E003 */  jr         $31
/* D5C2C 001D5B2C 00000000 */   nop
