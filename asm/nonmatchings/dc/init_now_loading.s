.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel init_now_loading__Fi
/* 540C0 00153FC0 3885BD27 */  addiu      $sp, $sp, -0x7AC8
/* 540C4 00153FC4 0880BD27 */  addiu      $sp, $sp, -0x7FF8
/* 540C8 00153FC8 2000BF7F */  sq         $31, 0x20($sp)
/* 540CC 00153FCC 1000B17F */  sq         $17, 0x10($sp)
/* 540D0 00153FD0 0000B07F */  sq         $16, 0x0($sp)
/* 540D4 00153FD4 288E8070 */  paddub     $17, $4, $0
/* 540D8 00153FD8 01000324 */  addiu      $3, $0, 0x1
/* 540DC 00153FDC E08683AF */  sw         $3, -0x7920($gp)
/* 540E0 00153FE0 E48D838F */  lw         $3, -0x721C($gp)
/* 540E4 00153FE4 04006010 */  beqz       $3, .L00153FF8
/* 540E8 00153FE8 00000000 */   nop
/* 540EC 00153FEC E48D80AF */  sw         $0, -0x721C($gp)
/* 540F0 00153FF0 C1000010 */  b          .L001542F8
/* 540F4 00153FF4 00000000 */   nop
.L00153FF8:
/* 540F8 00153FF8 4000B027 */  addiu      $16, $sp, 0x40
/* 540FC 00153FFC 3F000332 */  andi       $3, $16, 0x3F
/* 54100 00154000 04000106 */  bgez       $16, .L00154014
/* 54104 00154004 00000000 */   nop
/* 54108 00154008 02006010 */  beqz       $3, .L00154014
/* 5410C 0015400C 00000000 */   nop
/* 54110 00154010 C0FF6324 */  addiu      $3, $3, -0x40
.L00154014:
/* 54114 00154014 04006010 */  beqz       $3, .L00154028
/* 54118 00154018 00000000 */   nop
/* 5411C 0015401C 40000224 */  addiu      $2, $0, 0x40
/* 54120 00154020 23104300 */  subu       $2, $2, $3
/* 54124 00154024 21800202 */  addu       $16, $16, $2
.L00154028:
/* 54128 00154028 C88D80AF */  sw         $0, -0x7238($gp)
/* 5412C 0015402C 2500023C */  lui        $2, %hi(_263)
/* 54130 00154030 30404524 */  addiu      $5, $2, %lo(_263)
/* 54134 00154034 487AA427 */  addiu      $4, $sp, 0x7A48
/* 54138 00154038 F87F8424 */  addiu      $4, $4, 0x7FF8
/* 5413C 0015403C 04000324 */  addiu      $3, $0, 0x4
.L00154040:
/* 54140 00154040 0000A278 */  lq         $2, 0x0($5)
/* 54144 00154044 1000A524 */  addiu      $5, $5, 0x10
/* 54148 00154048 FFFF6324 */  addiu      $3, $3, -0x1
/* 5414C 0015404C 0000827C */  sq         $2, 0x0($4)
/* 54150 00154050 10008424 */  addiu      $4, $4, 0x10
/* 54154 00154054 FAFF601C */  bgtz       $3, .L00154040
/* 54158 00154058 00000000 */   nop
/* 5415C 0015405C 9886868F */  lw         $6, -0x7968($gp)
/* 54160 00154060 0700C018 */  blez       $6, .L00154080
/* 54164 00154064 00000000 */   nop
/* 54168 00154068 487AA427 */  addiu      $4, $sp, 0x7A48
/* 5416C 0015406C F87F8424 */  addiu      $4, $4, 0x7FF8
/* 54170 00154070 2A00023C */  lui        $2, %hi(_285_2)
/* 54174 00154074 A89B4524 */  addiu      $5, $2, %lo(_285_2)
/* 54178 00154078 1614040C */  jal        sprintf
/* 5417C 0015407C 00000000 */   nop
.L00154080:
/* 54180 00154080 2500023C */  lui        $2, %hi(_266)
/* 54184 00154084 70404524 */  addiu      $5, $2, %lo(_266)
/* 54188 00154088 887AA427 */  addiu      $4, $sp, 0x7A88
/* 5418C 0015408C F87F8424 */  addiu      $4, $4, 0x7FF8
/* 54190 00154090 04000324 */  addiu      $3, $0, 0x4
.L00154094:
/* 54194 00154094 0000A278 */  lq         $2, 0x0($5)
/* 54198 00154098 1000A524 */  addiu      $5, $5, 0x10
/* 5419C 0015409C FFFF6324 */  addiu      $3, $3, -0x1
/* 541A0 001540A0 0000827C */  sq         $2, 0x0($4)
/* 541A4 001540A4 10008424 */  addiu      $4, $4, 0x10
/* 541A8 001540A8 FAFF601C */  bgtz       $3, .L00154094
/* 541AC 001540AC 00000000 */   nop
/* 541B0 001540B0 0500212A */  slti       $at, $17, 0x5
/* 541B4 001540B4 0C002010 */  beqz       $at, .L001540E8
/* 541B8 001540B8 00000000 */   nop
/* 541BC 001540BC 01002726 */  addiu      $7, $17, 0x1
/* 541C0 001540C0 887AA427 */  addiu      $4, $sp, 0x7A88
/* 541C4 001540C4 F87F8424 */  addiu      $4, $4, 0x7FF8
/* 541C8 001540C8 2A00023C */  lui        $2, %hi(_286)
/* 541CC 001540CC B09B4524 */  addiu      $5, $2, %lo(_286)
/* 541D0 001540D0 487AA627 */  addiu      $6, $sp, 0x7A48
/* 541D4 001540D4 F87FC624 */  addiu      $6, $6, 0x7FF8
/* 541D8 001540D8 1614040C */  jal        sprintf
/* 541DC 001540DC 00000000 */   nop
/* 541E0 001540E0 18000010 */  b          .L00154144
/* 541E4 001540E4 00000000 */   nop
.L001540E8:
/* 541E8 001540E8 6400212A */  slti       $at, $17, 0x64
/* 541EC 001540EC 0C002010 */  beqz       $at, .L00154120
/* 541F0 001540F0 00000000 */   nop
/* 541F4 001540F4 887AA427 */  addiu      $4, $sp, 0x7A88
/* 541F8 001540F8 F87F8424 */  addiu      $4, $4, 0x7FF8
/* 541FC 001540FC 2A00023C */  lui        $2, %hi(_287)
/* 54200 00154100 C09B4524 */  addiu      $5, $2, %lo(_287)
/* 54204 00154104 487AA627 */  addiu      $6, $sp, 0x7A48
/* 54208 00154108 F87FC624 */  addiu      $6, $6, 0x7FF8
/* 5420C 0015410C 283E2072 */  paddub     $7, $17, $0
/* 54210 00154110 1614040C */  jal        sprintf
/* 54214 00154114 00000000 */   nop
/* 54218 00154118 0A000010 */  b          .L00154144
/* 5421C 0015411C 00000000 */   nop
.L00154120:
/* 54220 00154120 9DFF2726 */  addiu      $7, $17, -0x63
/* 54224 00154124 887AA427 */  addiu      $4, $sp, 0x7A88
/* 54228 00154128 F87F8424 */  addiu      $4, $4, 0x7FF8
/* 5422C 0015412C 2A00023C */  lui        $2, %hi(_287)
/* 54230 00154130 C09B4524 */  addiu      $5, $2, %lo(_287)
/* 54234 00154134 487AA627 */  addiu      $6, $sp, 0x7A48
/* 54238 00154138 F87FC624 */  addiu      $6, $6, 0x7FF8
/* 5423C 0015413C 1614040C */  jal        sprintf
/* 54240 00154140 00000000 */   nop
.L00154144:
/* 54244 00154144 21030324 */  addiu      $3, $0, 0x321
/* 54248 00154148 26002316 */  bne        $17, $3, .L001541E4
/* 5424C 0015414C 00000000 */   nop
/* 54250 00154150 887AA427 */  addiu      $4, $sp, 0x7A88
/* 54254 00154154 F87F8424 */  addiu      $4, $4, 0x7FF8
/* 54258 00154158 2A00023C */  lui        $2, %hi(_288)
/* 5425C 0015415C D09B4524 */  addiu      $5, $2, %lo(_288)
/* 54260 00154160 487AA627 */  addiu      $6, $sp, 0x7A48
/* 54264 00154164 F87FC624 */  addiu      $6, $6, 0x7FF8
/* 54268 00154168 1614040C */  jal        sprintf
/* 5426C 0015416C 00000000 */   nop
/* 54270 00154170 887AA427 */  addiu      $4, $sp, 0x7A88
/* 54274 00154174 F87F8424 */  addiu      $4, $4, 0x7FF8
/* 54278 00154178 282E0072 */  paddub     $5, $16, $0
/* 5427C 0015417C 3C00A627 */  addiu      $6, $sp, 0x3C
/* 54280 00154180 283E0070 */  paddub     $7, $0, $0
/* 54284 00154184 F4FC040C */  jal        LoadFile2__FPcPvPii
/* 54288 00154188 00000000 */   nop
/* 5428C 0015418C 5A004010 */  beqz       $2, .L001542F8
/* 54290 00154190 00000000 */   nop
/* 54294 00154194 2A00023C */  lui        $2, %hi(_289)
/* 54298 00154198 E09B4424 */  addiu      $4, $2, %lo(_289)
/* 5429C 0015419C 282E0072 */  paddub     $5, $16, $0
/* 542A0 001541A0 D001023C */  lui        $2, %hi(nl_tex)
/* 542A4 001541A4 90B34624 */  addiu      $6, $2, %lo(nl_tex)
/* 542A8 001541A8 401A0724 */  addiu      $7, $0, 0x1A40
/* 542AC 001541AC 10270824 */  addiu      $8, $0, 0x2710
/* 542B0 001541B0 DC51050C */  jal        LoadTexture__FPcPUcP8CTextureii
/* 542B4 001541B4 00000000 */   nop
/* 542B8 001541B8 2A00023C */  lui        $2, %hi(_290)
/* 542BC 001541BC E89B4424 */  addiu      $4, $2, %lo(_290)
/* 542C0 001541C0 282E0072 */  paddub     $5, $16, $0
/* 542C4 001541C4 D001023C */  lui        $2, %hi(nl_tex2)
/* 542C8 001541C8 E0B34624 */  addiu      $6, $2, %lo(nl_tex2)
/* 542CC 001541CC 401F0724 */  addiu      $7, $0, 0x1F40
/* 542D0 001541D0 74270824 */  addiu      $8, $0, 0x2774
/* 542D4 001541D4 DC51050C */  jal        LoadTexture__FPcPUcP8CTextureii
/* 542D8 001541D8 00000000 */   nop
/* 542DC 001541DC 16000010 */  b          .L00154238
/* 542E0 001541E0 00000000 */   nop
.L001541E4:
/* 542E4 001541E4 0100013C */  lui        $at, (0x10000 >> 16)
/* 542E8 001541E8 2108A103 */  addu       $at, $sp, $at
/* 542EC 001541EC 80FA2380 */  lb         $3, -0x580($at)
/* 542F0 001541F0 41006010 */  beqz       $3, .L001542F8
/* 542F4 001541F4 00000000 */   nop
/* 542F8 001541F8 887AA427 */  addiu      $4, $sp, 0x7A88
/* 542FC 001541FC F87F8424 */  addiu      $4, $4, 0x7FF8
/* 54300 00154200 282E0072 */  paddub     $5, $16, $0
/* 54304 00154204 3C00A627 */  addiu      $6, $sp, 0x3C
/* 54308 00154208 283E0070 */  paddub     $7, $0, $0
/* 5430C 0015420C F4FC040C */  jal        LoadFile2__FPcPvPii
/* 54310 00154210 00000000 */   nop
/* 54314 00154214 38004010 */  beqz       $2, .L001542F8
/* 54318 00154218 00000000 */   nop
/* 5431C 0015421C 28260072 */  paddub     $4, $16, $0
/* 54320 00154220 D001023C */  lui        $2, %hi(nl_tex)
/* 54324 00154224 90B34524 */  addiu      $5, $2, %lo(nl_tex)
/* 54328 00154228 401A0624 */  addiu      $6, $0, 0x1A40
/* 5432C 0015422C 401F0724 */  addiu      $7, $0, 0x1F40
/* 54330 00154230 5452050C */  jal        LoadTexture__FP8TM2_headP8CTextureii
/* 54334 00154234 00000000 */   nop
.L00154238:
/* 54338 00154238 E08D91AF */  sw         $17, -0x7220($gp)
/* 5433C 0015423C 14000224 */  addiu      $2, $0, 0x14
/* 54340 00154240 CC8D82AF */  sw         $2, -0x7234($gp)
/* 54344 00154244 D001023C */  lui        $2, %hi(nowloadDB)
/* 54348 00154248 40B14424 */  addiu      $4, $2, %lo(nowloadDB)
/* 5434C 0015424C 282E0070 */  paddub     $5, $0, $0
/* 54350 00154250 80020624 */  addiu      $6, $0, 0x280
/* 54354 00154254 E0000724 */  addiu      $7, $0, 0xE0
/* 54358 00154258 02000824 */  addiu      $8, $0, 0x2
/* 5435C 0015425C 31000924 */  addiu      $9, $0, 0x31
/* 54360 00154260 01000A24 */  addiu      $10, $0, 0x1
/* 54364 00154264 024B040C */  jal        sceGsSetDefDBuff
/* 54368 00154268 00000000 */   nop
/* 5436C 0015426C D001013C */  lui        $at, (0x1D00000 >> 16)
/* 54370 00154270 40B220A0 */  sb         $0, -0x4DC0($at)
/* 54374 00154274 D001013C */  lui        $at, (0x1D00000 >> 16)
/* 54378 00154278 41B220A0 */  sb         $0, -0x4DBF($at)
/* 5437C 0015427C D001013C */  lui        $at, (0x1D00000 >> 16)
/* 54380 00154280 42B220A0 */  sb         $0, -0x4DBE($at)
/* 54384 00154284 80000224 */  addiu      $2, $0, 0x80
/* 54388 00154288 D001013C */  lui        $at, (0x1D00000 >> 16)
/* 5438C 0015428C 43B222A0 */  sb         $2, -0x4DBD($at)
/* 54390 00154290 D001013C */  lui        $at, (0x1D00000 >> 16)
/* 54394 00154294 30B320A0 */  sb         $0, -0x4CD0($at)
/* 54398 00154298 D001013C */  lui        $at, (0x1D00000 >> 16)
/* 5439C 0015429C 31B320A0 */  sb         $0, -0x4CCF($at)
/* 543A0 001542A0 D001013C */  lui        $at, (0x1D00000 >> 16)
/* 543A4 001542A4 32B320A0 */  sb         $0, -0x4CCE($at)
/* 543A8 001542A8 D001013C */  lui        $at, (0x1D00000 >> 16)
/* 543AC 001542AC 33B322A0 */  sb         $2, -0x4CCD($at)
/* 543B0 001542B0 D001023C */  lui        $2, %hi(nlPacket)
/* 543B4 001542B4 70B34424 */  addiu      $4, $2, %lo(nlPacket)
/* 543B8 001542B8 D001023C */  lui        $2, %hi(now_load)
/* 543BC 001542BC 00924524 */  addiu      $5, $2, %lo(now_load)
/* 543C0 001542C0 0283040C */  jal        sceVif1PkInit
/* 543C4 001542C4 00000000 */   nop
/* 543C8 001542C8 D08D80AF */  sw         $0, -0x7230($gp)
/* 543CC 001542CC 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 543D0 001542D0 D48D82AF */  sw         $2, -0x722C($gp)
/* 543D4 001542D4 DC8D80AF */  sw         $0, -0x7224($gp)
/* 543D8 001542D8 D88D80AF */  sw         $0, -0x7228($gp)
/* 543DC 001542DC E08680AF */  sw         $0, -0x7920($gp)
/* 543E0 001542E0 01000224 */  addiu      $2, $0, 0x1
/* 543E4 001542E4 E88D82AF */  sw         $2, -0x7218($gp)
/* 543E8 001542E8 1500023C */  lui        $2, %hi(VSyncCallBack_Load__Fi)
/* 543EC 001542EC 20434424 */  addiu      $4, $2, %lo(VSyncCallBack_Load__Fi)
/* 543F0 001542F0 C0B1040C */  jal        MGInitVSyncCallBack__FPFi_i
/* 543F4 001542F4 00000000 */   nop
.L001542F8:
/* 543F8 001542F8 2000BF7B */  lq         $31, 0x20($sp)
/* 543FC 001542FC 1000B17B */  lq         $17, 0x10($sp)
/* 54400 00154300 0000B07B */  lq         $16, 0x0($sp)
/* 54404 00154304 C87ABD27 */  addiu      $sp, $sp, 0x7AC8
/* 54408 00154308 F87FBD27 */  addiu      $sp, $sp, 0x7FF8
/* 5440C 0015430C 0800E003 */  jr         $31
/* 54410 00154310 00000000 */   nop
/* 54414 00154314 00000000 */  nop
/* 54418 00154318 00000000 */  nop
/* 5441C 0015431C 00000000 */  nop