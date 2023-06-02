.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawRipple__11CEditGroundFi
/* A3A40 001A3940 80FFBD27 */  addiu      $sp, $sp, -0x80
/* A3A44 001A3944 5000BF7F */  sq         $31, 0x50($sp)
/* A3A48 001A3948 4000B47F */  sq         $20, 0x40($sp)
/* A3A4C 001A394C 3000B37F */  sq         $19, 0x30($sp)
/* A3A50 001A3950 2000B27F */  sq         $18, 0x20($sp)
/* A3A54 001A3954 1000B17F */  sq         $17, 0x10($sp)
/* A3A58 001A3958 0000B07F */  sq         $16, 0x0($sp)
/* A3A5C 001A395C 289E8070 */  paddub     $19, $4, $0
/* A3A60 001A3960 2896A070 */  paddub     $18, $5, $0
/* A3A64 001A3964 30007026 */  addiu      $16, $19, 0x30
/* A3A68 001A3968 288E0070 */  paddub     $17, $0, $0
/* A3A6C 001A396C 59000010 */  b          .L001A3AD4
/* A3A70 001A3970 00000000 */   nop
.L001A3974:
/* A3A74 001A3974 0200013C */  lui        $at, (0x2095C >> 16)
/* A3A78 001A3978 21086102 */  addu       $at, $19, $at
/* A3A7C 001A397C 5C09238C */  lw         $3, (0x2095C & 0xFFFF)($at)
/* A3A80 001A3980 57006014 */  bnez       $3, .L001A3AE0
/* A3A84 001A3984 00000000 */   nop
/* A3A88 001A3988 E800038E */  lw         $3, 0xE8($16)
/* A3A8C 001A398C 4F006004 */  bltz       $3, .L001A3ACC
/* A3A90 001A3990 00000000 */   nop
/* A3A94 001A3994 0401038E */  lw         $3, 0x104($16)
/* A3A98 001A3998 4C006010 */  beqz       $3, .L001A3ACC
/* A3A9C 001A399C 00000000 */   nop
/* A3AA0 001A39A0 C400038E */  lw         $3, 0xC4($16)
/* A3AA4 001A39A4 49006010 */  beqz       $3, .L001A3ACC
/* A3AA8 001A39A8 00000000 */   nop
/* A3AAC 001A39AC F400038E */  lw         $3, 0xF4($16)
/* A3AB0 001A39B0 06006004 */  bltz       $3, .L001A39CC
/* A3AB4 001A39B4 00000000 */   nop
/* A3AB8 001A39B8 80180300 */  sll        $3, $3, 2
/* A3ABC 001A39BC 21187300 */  addu       $3, $3, $19
/* A3AC0 001A39C0 1400638C */  lw         $3, 0x14($3)
/* A3AC4 001A39C4 41006010 */  beqz       $3, .L001A3ACC
/* A3AC8 001A39C8 00000000 */   nop
.L001A39CC:
/* A3ACC 001A39CC 0100013C */  lui        $at, (0x15F2C >> 16)
/* A3AD0 001A39D0 21086102 */  addu       $at, $19, $at
/* A3AD4 001A39D4 2C5F21C4 */  lwc1       $f1, (0x15F2C & 0xFFFF)($at)
/* A3AD8 001A39D8 00008044 */  mtc1       $0, $f0
/* A3ADC 001A39DC 00000000 */  nop
/* A3AE0 001A39E0 36080046 */  c.le.s     $f1, $f0
/* A3AE4 001A39E4 00000000 */  nop
/* A3AE8 001A39E8 17000145 */  bc1t       .L001A3A48
/* A3AEC 001A39EC 00000000 */   nop
/* A3AF0 001A39F0 28260072 */  paddub     $4, $16, $0
/* A3AF4 001A39F4 7000A527 */  addiu      $5, $sp, 0x70
/* A3AF8 001A39F8 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* A3AFC 001A39FC 00000000 */   nop
/* A3B00 001A3A00 7000A427 */  addiu      $4, $sp, 0x70
/* A3B04 001A3A04 0100013C */  lui        $at, (0x15F20 >> 16)
/* A3B08 001A3A08 205F2134 */  ori        $at, $at, (0x15F20 & 0xFFFF)
/* A3B0C 001A3A0C 21286102 */  addu       $5, $19, $at
/* A3B10 001A3A10 648D040C */  jal        DistVector__FPfPf
/* A3B14 001A3A14 00000000 */   nop
/* A3B18 001A3A18 0100013C */  lui        $at, (0x15F2C >> 16)
/* A3B1C 001A3A1C 21086102 */  addu       $at, $19, $at
/* A3B20 001A3A20 2C5F21C4 */  lwc1       $f1, (0x15F2C & 0xFFFF)($at)
/* A3B24 001A3A24 36000146 */  c.le.s     $f0, $f1
/* A3B28 001A3A28 00000000 */  nop
/* A3B2C 001A3A2C 06000145 */  bc1t       .L001A3A48
/* A3B30 001A3A30 00000000 */   nop
/* A3B34 001A3A34 28260072 */  paddub     $4, $16, $0
/* A3B38 001A3A38 386B060C */  jal        ChangeDigData__9CMapPartsFv
/* A3B3C 001A3A3C 00000000 */   nop
/* A3B40 001A3A40 22004010 */  beqz       $2, .L001A3ACC
/* A3B44 001A3A44 00000000 */   nop
.L001A3A48:
/* A3B48 001A3A48 0401038E */  lw         $3, 0x104($16)
/* A3B4C 001A3A4C 1F006010 */  beqz       $3, .L001A3ACC
/* A3B50 001A3A50 00000000 */   nop
/* A3B54 001A3A54 28260072 */  paddub     $4, $16, $0
/* A3B58 001A3A58 6000A527 */  addiu      $5, $sp, 0x60
/* A3B5C 001A3A5C EC69060C */  jal        GetPosition__9CMapPartsFPf
/* A3B60 001A3A60 00000000 */   nop
/* A3B64 001A3A64 0401048E */  lw         $4, 0x104($16)
/* A3B68 001A3A68 6000A527 */  addiu      $5, $sp, 0x60
/* A3B6C 001A3A6C B89F040C */  jal        SetPosition__6CFrameFPf
/* A3B70 001A3A70 00000000 */   nop
/* A3B74 001A3A74 28260072 */  paddub     $4, $16, $0
/* A3B78 001A3A78 2C6A060C */  jal        GetRotY__9CMapPartsFv
/* A3B7C 001A3A7C 00000000 */   nop
/* A3B80 001A3A80 28260072 */  paddub     $4, $16, $0
/* A3B84 001A3A84 282E4070 */  paddub     $5, $2, $0
/* A3B88 001A3A88 146A060C */  jal        SetRotY__9CMapPartsFi
/* A3B8C 001A3A8C 00000000 */   nop
/* A3B90 001A3A90 28260072 */  paddub     $4, $16, $0
/* A3B94 001A3A94 6000A527 */  addiu      $5, $sp, 0x60
/* A3B98 001A3A98 A000198E */  lw         $25, 0xA0($16)
/* A3B9C 001A3A9C 5800398F */  lw         $25, 0x58($25)
/* A3BA0 001A3AA0 09F82003 */  jalr       $25
/* A3BA4 001A3AA4 00000000 */   nop
/* A3BA8 001A3AA8 0401048E */  lw         $4, 0x104($16)
/* A3BAC 001A3AAC 6000ACC7 */  lwc1       $f12, 0x60($sp)
/* A3BB0 001A3AB0 6400ADC7 */  lwc1       $f13, 0x64($sp)
/* A3BB4 001A3AB4 6800AEC7 */  lwc1       $f14, 0x68($sp)
/* A3BB8 001A3AB8 70A3040C */  jal        SetRotation__6CFrameFfff
/* A3BBC 001A3ABC 00000000 */   nop
/* A3BC0 001A3AC0 0401048E */  lw         $4, 0x104($16)
/* A3BC4 001A3AC4 60BB040C */  jal        MGDraw__FP6CFrame
/* A3BC8 001A3AC8 00000000 */   nop
.L001A3ACC:
/* A3BCC 001A3ACC 01003126 */  addiu      $17, $17, 0x1
/* A3BD0 001A3AD0 A0021026 */  addiu      $16, $16, 0x2A0
.L001A3AD4:
/* A3BD4 001A3AD4 8000232A */  slti       $3, $17, 0x80
/* A3BD8 001A3AD8 A6FF6014 */  bnez       $3, .L001A3974
/* A3BDC 001A3ADC 00000000 */   nop
.L001A3AE0:
/* A3BE0 001A3AE0 28860070 */  paddub     $16, $0, $0
/* A3BE4 001A3AE4 32000010 */  b          .L001A3BB0
/* A3BE8 001A3AE8 00000000 */   nop
.L001A3AEC:
/* A3BEC 001A3AEC C0181000 */  sll        $3, $16, 3
/* A3BF0 001A3AF0 23207000 */  subu       $4, $3, $16
/* A3BF4 001A3AF4 80180400 */  sll        $3, $4, 2
/* A3BF8 001A3AF8 23186400 */  subu       $3, $3, $4
/* A3BFC 001A3AFC 40190300 */  sll        $3, $3, 5
/* A3C00 001A3B00 21207300 */  addu       $4, $3, $19
/* A3C04 001A3B04 0100013C */  lui        $at, (0x16024 >> 16)
/* A3C08 001A3B08 21088100 */  addu       $at, $4, $at
/* A3C0C 001A3B0C 2460238C */  lw         $3, (0x16024 & 0xFFFF)($at)
/* A3C10 001A3B10 26007214 */  bne        $3, $18, .L001A3BAC
/* A3C14 001A3B14 00000000 */   nop
/* A3C18 001A3B18 0100013C */  lui        $at, (0x16044 >> 16)
/* A3C1C 001A3B1C 44602134 */  ori        $at, $at, (0x16044 & 0xFFFF)
/* A3C20 001A3B20 21888100 */  addu       $17, $4, $at
/* A3C24 001A3B24 0000238E */  lw         $3, 0x0($17)
/* A3C28 001A3B28 20006010 */  beqz       $3, .L001A3BAC
/* A3C2C 001A3B2C 00000000 */   nop
/* A3C30 001A3B30 0100013C */  lui        $at, (0x16004 >> 16)
/* A3C34 001A3B34 21088100 */  addu       $at, $4, $at
/* A3C38 001A3B38 0460238C */  lw         $3, (0x16004 & 0xFFFF)($at)
/* A3C3C 001A3B3C 1B006010 */  beqz       $3, .L001A3BAC
/* A3C40 001A3B40 00000000 */   nop
/* A3C44 001A3B44 0100013C */  lui        $at, (0x15F40 >> 16)
/* A3C48 001A3B48 405F2134 */  ori        $at, $at, (0x15F40 & 0xFFFF)
/* A3C4C 001A3B4C 21A08100 */  addu       $20, $4, $at
/* A3C50 001A3B50 28268072 */  paddub     $4, $20, $0
/* A3C54 001A3B54 6000A527 */  addiu      $5, $sp, 0x60
/* A3C58 001A3B58 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* A3C5C 001A3B5C 00000000 */   nop
/* A3C60 001A3B60 0000248E */  lw         $4, 0x0($17)
/* A3C64 001A3B64 6000A527 */  addiu      $5, $sp, 0x60
/* A3C68 001A3B68 B89F040C */  jal        SetPosition__6CFrameFPf
/* A3C6C 001A3B6C 00000000 */   nop
/* A3C70 001A3B70 28268072 */  paddub     $4, $20, $0
/* A3C74 001A3B74 6000A527 */  addiu      $5, $sp, 0x60
/* A3C78 001A3B78 A000998E */  lw         $25, 0xA0($20)
/* A3C7C 001A3B7C 5800398F */  lw         $25, 0x58($25)
/* A3C80 001A3B80 09F82003 */  jalr       $25
/* A3C84 001A3B84 00000000 */   nop
/* A3C88 001A3B88 0000248E */  lw         $4, 0x0($17)
/* A3C8C 001A3B8C 6000ACC7 */  lwc1       $f12, 0x60($sp)
/* A3C90 001A3B90 6400ADC7 */  lwc1       $f13, 0x64($sp)
/* A3C94 001A3B94 6800AEC7 */  lwc1       $f14, 0x68($sp)
/* A3C98 001A3B98 70A3040C */  jal        SetRotation__6CFrameFfff
/* A3C9C 001A3B9C 00000000 */   nop
/* A3CA0 001A3BA0 0000248E */  lw         $4, 0x0($17)
/* A3CA4 001A3BA4 60BB040C */  jal        MGDraw__FP6CFrame
/* A3CA8 001A3BA8 00000000 */   nop
.L001A3BAC:
/* A3CAC 001A3BAC 01001026 */  addiu      $16, $16, 0x1
.L001A3BB0:
/* A3CB0 001A3BB0 4000032A */  slti       $3, $16, 0x40
/* A3CB4 001A3BB4 CDFF6014 */  bnez       $3, .L001A3AEC
/* A3CB8 001A3BB8 00000000 */   nop
/* A3CBC 001A3BBC 5000BF7B */  lq         $31, 0x50($sp)
/* A3CC0 001A3BC0 4000B47B */  lq         $20, 0x40($sp)
/* A3CC4 001A3BC4 3000B37B */  lq         $19, 0x30($sp)
/* A3CC8 001A3BC8 2000B27B */  lq         $18, 0x20($sp)
/* A3CCC 001A3BCC 1000B17B */  lq         $17, 0x10($sp)
/* A3CD0 001A3BD0 0000B07B */  lq         $16, 0x0($sp)
/* A3CD4 001A3BD4 8000BD27 */  addiu      $sp, $sp, 0x80
/* A3CD8 001A3BD8 0800E003 */  jr         $31
/* A3CDC 001A3BDC 00000000 */   nop
