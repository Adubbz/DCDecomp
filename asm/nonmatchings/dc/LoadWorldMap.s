.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadWorldMap__Fv
/* 10A140 0020A040 00FFBD27 */  addiu      $sp, $sp, -0x100
/* 10A144 0020A044 2000BF7F */  sq         $31, 0x20($sp)
/* 10A148 0020A048 1000B17F */  sq         $17, 0x10($sp)
/* 10A14C 0020A04C 0000B07F */  sq         $16, 0x0($sp)
/* 10A150 0020A050 8CFB040C */  jal        ReadBGSync__Fv
/* 10A154 0020A054 00000000 */   nop
/* 10A158 0020A058 BD004014 */  bnez       $2, .L0020A350
/* 10A15C 0020A05C 00000000 */   nop
/* 10A160 0020A060 28260070 */  paddub     $4, $0, $0
/* 10A164 0020A064 18FB040C */  jal        GetReadBGFile__Fi
/* 10A168 0020A068 00000000 */   nop
/* 10A16C 0020A06C 28864070 */  paddub     $16, $2, $0
/* 10A170 0020A070 2900023C */  lui        $2, %hi(_6232)
/* 10A174 0020A074 E0374224 */  addiu      $2, $2, %lo(_6232)
/* 10A178 0020A078 3000A527 */  addiu      $5, $sp, 0x30
/* 10A17C 0020A07C 00004378 */  lq         $3, 0x0($2)
/* 10A180 0020A080 10004278 */  lq         $2, 0x10($2)
/* 10A184 0020A084 0000A37C */  sq         $3, 0x0($5)
/* 10A188 0020A088 1000A27C */  sq         $2, 0x10($5)
/* 10A18C 0020A08C 2900023C */  lui        $2, %hi(_6233)
/* 10A190 0020A090 00384224 */  addiu      $2, $2, %lo(_6233)
/* 10A194 0020A094 5000A427 */  addiu      $4, $sp, 0x50
/* 10A198 0020A098 00004378 */  lq         $3, 0x0($2)
/* 10A19C 0020A09C 10004278 */  lq         $2, 0x10($2)
/* 10A1A0 0020A0A0 0000837C */  sq         $3, 0x0($4)
/* 10A1A4 0020A0A4 1000827C */  sq         $2, 0x10($4)
/* 10A1A8 0020A0A8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 10A1AC 0020A0AC B8ED2284 */  lh         $2, -0x1248($at)
/* 10A1B0 0020A0B0 01004624 */  addiu      $6, $2, 0x1
/* 10A1B4 0020A0B4 7000A427 */  addiu      $4, $sp, 0x70
/* 10A1B8 0020A0B8 1614040C */  jal        sprintf
/* 10A1BC 0020A0BC 00000000 */   nop
/* 10A1C0 0020A0C0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 10A1C4 0020A0C4 B8ED2284 */  lh         $2, -0x1248($at)
/* 10A1C8 0020A0C8 01004624 */  addiu      $6, $2, 0x1
/* 10A1CC 0020A0CC 9000A427 */  addiu      $4, $sp, 0x90
/* 10A1D0 0020A0D0 5000A527 */  addiu      $5, $sp, 0x50
/* 10A1D4 0020A0D4 1614040C */  jal        sprintf
/* 10A1D8 0020A0D8 00000000 */   nop
/* 10A1DC 0020A0DC 2900023C */  lui        $2, %hi(_6235)
/* 10A1E0 0020A0E0 20384524 */  addiu      $5, $2, %lo(_6235)
/* 10A1E4 0020A0E4 B000A427 */  addiu      $4, $sp, 0xB0
/* 10A1E8 0020A0E8 03000324 */  addiu      $3, $0, 0x3
.L0020A0EC:
/* 10A1EC 0020A0EC 0000A278 */  lq         $2, 0x0($5)
/* 10A1F0 0020A0F0 1000A524 */  addiu      $5, $5, 0x10
/* 10A1F4 0020A0F4 FFFF6324 */  addiu      $3, $3, -0x1
/* 10A1F8 0020A0F8 0000827C */  sq         $2, 0x0($4)
/* 10A1FC 0020A0FC 10008424 */  addiu      $4, $4, 0x10
/* 10A200 0020A100 FAFF601C */  bgtz       $3, .L0020A0EC
/* 10A204 0020A104 00000000 */   nop
/* 10A208 0020A108 0000A3DC */  ld         $3, 0x0($5)
/* 10A20C 0020A10C 0800A2C4 */  lwc1       $f2, 0x8($5)
/* 10A210 0020A110 000083FC */  sd         $3, 0x0($4)
/* 10A214 0020A114 080082E4 */  swc1       $f2, 0x8($4)
/* 10A218 0020A118 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 10A21C 0020A11C C4ED228C */  lw         $2, -0x123C($at)
/* 10A220 0020A120 B400A2AF */  sw         $2, 0xB4($sp)
/* 10A224 0020A124 C000A2AF */  sw         $2, 0xC0($sp)
/* 10A228 0020A128 CC00A2AF */  sw         $2, 0xCC($sp)
/* 10A22C 0020A12C D800A2AF */  sw         $2, 0xD8($sp)
/* 10A230 0020A130 8C00048E */  lw         $4, 0x8C($16)
/* 10A234 0020A134 2A00023C */  lui        $2, %hi(_6248)
/* 10A238 0020A138 30DD4524 */  addiu      $5, $2, %lo(_6248)
/* 10A23C 0020A13C 28360070 */  paddub     $6, $0, $0
/* 10A240 0020A140 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 10A244 0020A144 00000000 */   nop
/* 10A248 0020A148 BC00A2AF */  sw         $2, 0xBC($sp)
/* 10A24C 0020A14C 8C00048E */  lw         $4, 0x8C($16)
/* 10A250 0020A150 7000A527 */  addiu      $5, $sp, 0x70
/* 10A254 0020A154 28360070 */  paddub     $6, $0, $0
/* 10A258 0020A158 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 10A25C 0020A15C 00000000 */   nop
/* 10A260 0020A160 C800A2AF */  sw         $2, 0xC8($sp)
/* 10A264 0020A164 8C00048E */  lw         $4, 0x8C($16)
/* 10A268 0020A168 2A00023C */  lui        $2, %hi(_6249)
/* 10A26C 0020A16C 40DD4524 */  addiu      $5, $2, %lo(_6249)
/* 10A270 0020A170 28360070 */  paddub     $6, $0, $0
/* 10A274 0020A174 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 10A278 0020A178 00000000 */   nop
/* 10A27C 0020A17C D400A2AF */  sw         $2, 0xD4($sp)
/* 10A280 0020A180 C701023C */  lui        $2, %hi(TexManager)
/* 10A284 0020A184 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10A288 0020A188 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 10A28C 0020A18C C4ED258C */  lw         $5, -0x123C($at)
/* 10A290 0020A190 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 10A294 0020A194 00000000 */   nop
/* 10A298 0020A198 F800A427 */  addiu      $4, $sp, 0xF8
/* 10A29C 0020A19C D08882DF */  ld         $2, -0x7730($gp)
/* 10A2A0 0020A1A0 000082FC */  sd         $2, 0x0($4)
/* 10A2A4 0020A1A4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 10A2A8 0020A1A8 C4ED228C */  lw         $2, -0x123C($at)
/* 10A2AC 0020A1AC F800A2AF */  sw         $2, 0xF8($sp)
/* 10A2B0 0020A1B0 4CB4080C */  jal        MenuTextureDelete__FPi
/* 10A2B4 0020A1B4 00000000 */   nop
/* 10A2B8 0020A1B8 C701023C */  lui        $2, %hi(TexManager)
/* 10A2BC 0020A1BC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10A2C0 0020A1C0 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* 10A2C4 0020A1C4 00000000 */   nop
/* 10A2C8 0020A1C8 28D6070C */  jal        BtlMenuTexBlockEnter__Fv
/* 10A2CC 0020A1CC 00000000 */   nop
/* 10A2D0 0020A1D0 C701023C */  lui        $2, %hi(TexManager)
/* 10A2D4 0020A1D4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10A2D8 0020A1D8 FFFF0524 */  addiu      $5, $0, -0x1
/* 10A2DC 0020A1DC B000A627 */  addiu      $6, $sp, 0xB0
/* 10A2E0 0020A1E0 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 10A2E4 0020A1E4 00000000 */   nop
/* 10A2E8 0020A1E8 C701023C */  lui        $2, %hi(TexManager)
/* 10A2EC 0020A1EC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10A2F0 0020A1F0 2A00023C */  lui        $2, %hi(_6250)
/* 10A2F4 0020A1F4 50DD4524 */  addiu      $5, $2, %lo(_6250)
/* 10A2F8 0020A1F8 FFFF0624 */  addiu      $6, $0, -0x1
/* 10A2FC 0020A1FC B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 10A300 0020A200 00000000 */   nop
/* 10A304 0020A204 D49582AF */  sw         $2, -0x6A2C($gp)
/* 10A308 0020A208 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 10A30C 0020A20C B0ED238C */  lw         $3, -0x1250($at)
/* 10A310 0020A210 05000224 */  addiu      $2, $0, 0x5
/* 10A314 0020A214 0B006214 */  bne        $3, $2, .L0020A244
/* 10A318 0020A218 00000000 */   nop
/* 10A31C 0020A21C 8C00048E */  lw         $4, 0x8C($16)
/* 10A320 0020A220 2A00023C */  lui        $2, %hi(_942)
/* 10A324 0020A224 B8D54524 */  addiu      $5, $2, %lo(_942)
/* 10A328 0020A228 28360070 */  paddub     $6, $0, $0
/* 10A32C 0020A22C C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 10A330 0020A230 00000000 */   nop
/* 10A334 0020A234 05000424 */  addiu      $4, $0, 0x5
/* 10A338 0020A238 282E4070 */  paddub     $5, $2, $0
/* 10A33C 0020A23C 50B0080C */  jal        InitMenuMesSet__FiPs
/* 10A340 0020A240 00000000 */   nop
.L0020A244:
/* 10A344 0020A244 9000028E */  lw         $2, 0x90($16)
/* 10A348 0020A248 83110200 */  sra        $2, $2, 6
/* 10A34C 0020A24C 01004224 */  addiu      $2, $2, 0x1
/* 10A350 0020A250 80110200 */  sll        $2, $2, 6
/* 10A354 0020A254 03110200 */  sra        $2, $2, 4
/* 10A358 0020A258 00190200 */  sll        $3, $2, 4
/* 10A35C 0020A25C 8C00028E */  lw         $2, 0x8C($16)
/* 10A360 0020A260 21884300 */  addu       $17, $2, $3
/* 10A364 0020A264 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 10A368 0020A268 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 10A36C 0020A26C 74E6040C */  jal        Initialize__10CCharacterFv
/* 10A370 0020A270 00000000 */   nop
/* 10A374 0020A274 D901013C */  lui        $at, (0x1D90410 >> 16)
/* 10A378 0020A278 100431AC */  sw         $17, (0x1D90410 & 0xFFFF)($at)
/* 10A37C 0020A27C 80CF0234 */  ori        $2, $0, 0xCF80
/* 10A380 0020A280 D901013C */  lui        $at, (0x1D9041C >> 16)
/* 10A384 0020A284 1C0422AC */  sw         $2, (0x1D9041C & 0xFFFF)($at)
/* 10A388 0020A288 D901013C */  lui        $at, (0x1D90418 >> 16)
/* 10A38C 0020A28C 180420AC */  sw         $0, (0x1D90418 & 0xFFFF)($at)
/* 10A390 0020A290 8C00058E */  lw         $5, 0x8C($16)
/* 10A394 0020A294 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 10A398 0020A298 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 10A39C 0020A29C 9000A627 */  addiu      $6, $sp, 0x90
/* 10A3A0 0020A2A0 D901023C */  lui        $2, %hi(MenuExCashBuffer)
/* 10A3A4 0020A2A4 10044724 */  addiu      $7, $2, %lo(MenuExCashBuffer)
/* 10A3A8 0020A2A8 D901023C */  lui        $2, %hi(MenuExCashBuffer)
/* 10A3AC 0020A2AC 10044824 */  addiu      $8, $2, %lo(MenuExCashBuffer)
/* 10A3B0 0020A2B0 284E0070 */  paddub     $9, $0, $0
/* 10A3B4 0020A2B4 08E6040C */  jal        LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_
/* 10A3B8 0020A2B8 00000000 */   nop
/* 10A3BC 0020A2BC 2900013C */  lui        $at, (0x2936C8 >> 16)
/* 10A3C0 0020A2C0 C83620AC */  sw         $0, (0x2936C8 & 0xFFFF)($at)
/* 10A3C4 0020A2C4 2900013C */  lui        $at, (0x2936C4 >> 16)
/* 10A3C8 0020A2C8 C43620AC */  sw         $0, (0x2936C4 & 0xFFFF)($at)
/* 10A3CC 0020A2CC 2900013C */  lui        $at, (0x2936C0 >> 16)
/* 10A3D0 0020A2D0 C03620AC */  sw         $0, (0x2936C0 & 0xFFFF)($at)
/* 10A3D4 0020A2D4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 10A3D8 0020A2D8 2900013C */  lui        $at, (0x2936CC >> 16)
/* 10A3DC 0020A2DC CC3622AC */  sw         $2, (0x2936CC & 0xFFFF)($at)
/* 10A3E0 0020A2E0 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 10A3E4 0020A2E4 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 10A3E8 0020A2E8 2900023C */  lui        $2, %hi(mapo)
/* 10A3EC 0020A2EC C0364524 */  addiu      $5, $2, %lo(mapo)
/* 10A3F0 0020A2F0 38E4040C */  jal        SetPosition__10CCharacterFPf
/* 10A3F4 0020A2F4 00000000 */   nop
/* 10A3F8 0020A2F8 D901013C */  lui        $at, (0x1D910E8 >> 16)
/* 10A3FC 0020A2FC E81020AC */  sw         $0, (0x1D910E8 & 0xFFFF)($at)
/* 10A400 0020A300 02000224 */  addiu      $2, $0, 0x2
/* 10A404 0020A304 D901013C */  lui        $at, (0x1D910E4 >> 16)
/* 10A408 0020A308 E41022AC */  sw         $2, (0x1D910E4 & 0xFFFF)($at)
/* 10A40C 0020A30C 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 10A410 0020A310 D901013C */  lui        $at, (0x1D910E0 >> 16)
/* 10A414 0020A314 E01022AC */  sw         $2, (0x1D910E0 & 0xFFFF)($at)
/* 10A418 0020A318 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 10A41C 0020A31C B4ED228C */  lw         $2, -0x124C($at)
/* 10A420 0020A320 00190200 */  sll        $3, $2, 4
/* 10A424 0020A324 2900023C */  lui        $2, %hi(TownOrDngPos)
/* 10A428 0020A328 C0354224 */  addiu      $2, $2, %lo(TownOrDngPos)
/* 10A42C 0020A32C 21284300 */  addu       $5, $2, $3
/* 10A430 0020A330 D901013C */  lui        $at, (0x1D9053C >> 16)
/* 10A434 0020A334 3C05248C */  lw         $4, (0x1D9053C & 0xFFFF)($at)
/* 10A438 0020A338 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* 10A43C 0020A33C 00000000 */   nop
/* 10A440 0020A340 D09582AF */  sw         $2, -0x6A30($gp)
/* 10A444 0020A344 01000224 */  addiu      $2, $0, 0x1
/* 10A448 0020A348 02000010 */  b          .L0020A354
/* 10A44C 0020A34C 00000000 */   nop
.L0020A350:
/* 10A450 0020A350 28160070 */  paddub     $2, $0, $0
.L0020A354:
/* 10A454 0020A354 2000BF7B */  lq         $31, 0x20($sp)
/* 10A458 0020A358 1000B17B */  lq         $17, 0x10($sp)
/* 10A45C 0020A35C 0000B07B */  lq         $16, 0x0($sp)
/* 10A460 0020A360 0001BD27 */  addiu      $sp, $sp, 0x100
/* 10A464 0020A364 0800E003 */  jr         $31
/* 10A468 0020A368 00000000 */   nop
/* 10A46C 0020A36C 00000000 */  nop
