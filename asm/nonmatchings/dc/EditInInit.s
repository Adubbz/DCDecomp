.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EditInInit__FfPc
/* 9BF30 0019BE30 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 9BF34 0019BE34 3000BF7F */  sq         $31, 0x30($sp)
/* 9BF38 0019BE38 2000B17F */  sq         $17, 0x20($sp)
/* 9BF3C 0019BE3C 1000B07F */  sq         $16, 0x10($sp)
/* 9BF40 0019BE40 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 9BF44 0019BE44 06650046 */  mov.s      $f20, $f12
/* 9BF48 0019BE48 28868070 */  paddub     $16, $4, $0
/* 9BF4C 0019BE4C 10270224 */  addiu      $2, $0, 0x2710
/* 9BF50 0019BE50 00008244 */  mtc1       $2, $f0
/* 9BF54 0019BE54 00000000 */  nop
/* 9BF58 0019BE58 20038046 */  cvt.s.w    $f12, $f0
/* 9BF5C 0019BE5C 50C30234 */  ori        $2, $0, 0xC350
/* 9BF60 0019BE60 00008244 */  mtc1       $2, $f0
/* 9BF64 0019BE64 00000000 */  nop
/* 9BF68 0019BE68 60038046 */  cvt.s.w    $f13, $f0
/* 9BF6C 0019BE6C 7F43023C */  lui        $2, (0x437F0000 >> 16)
/* 9BF70 0019BE70 00708244 */  mtc1       $2, $f14
/* 9BF74 0019BE74 00000000 */  nop
/* 9BF78 0019BE78 C6730046 */  mov.s      $f15, $f14
/* 9BF7C 0019BE7C 28260070 */  paddub     $4, $0, $0
/* 9BF80 0019BE80 282E0070 */  paddub     $5, $0, $0
/* 9BF84 0019BE84 28360070 */  paddub     $6, $0, $0
/* 9BF88 0019BE88 04B8040C */  jal        MGSetFogParm__FffUcUcUcff
/* 9BF8C 0019BE8C 00000000 */   nop
/* 9BF90 0019BE90 9092848F */  lw         $4, -0x6D70($gp)
/* 9BF94 0019BE94 282E0070 */  paddub     $5, $0, $0
/* 9BF98 0019BE98 C0440624 */  addiu      $6, $0, 0x44C0
/* 9BF9C 0019BE9C 5A0D040C */  jal        memset
/* 9BFA0 0019BEA0 00000000 */   nop
/* 9BFA4 0019BEA4 4844033C */  lui        $3, (0x44480000 >> 16)
/* 9BFA8 0019BEA8 9092828F */  lw         $2, -0x6D70($gp)
/* 9BFAC 0019BEAC C00443AC */  sw         $3, 0x4C0($2)
/* 9BFB0 0019BEB0 9092848F */  lw         $4, -0x6D70($gp)
/* 9BFB4 0019BEB4 282E0072 */  paddub     $5, $16, $0
/* 9BFB8 0019BEB8 5A15040C */  jal        strcpy
/* 9BFBC 0019BEBC 00000000 */   nop
/* 9BFC0 0019BEC0 01000424 */  addiu      $4, $0, 0x1
/* 9BFC4 0019BEC4 C803050C */  jal        PlayTimeCountFlag__Fi
/* 9BFC8 0019BEC8 00000000 */   nop
/* 9BFCC 0019BECC 149280AF */  sw         $0, -0x6DEC($gp)
/* 9BFD0 0019BED0 686E060C */  jal        LoadScript__Fv_2
/* 9BFD4 0019BED4 00000000 */   nop
/* 9BFD8 0019BED8 B09294E7 */  swc1       $f20, -0x6D50($gp)
/* 9BFDC 0019BEDC 4040023C */  lui        $2, (0x40400000 >> 16)
/* 9BFE0 0019BEE0 00008244 */  mtc1       $2, $f0
/* 9BFE4 0019BEE4 00000000 */  nop
/* 9BFE8 0019BEE8 03A30046 */  div.s      $f12, $f20, $f0
/* 9BFEC 0019BEEC 2C44040C */  jal        fptosi
/* 9BFF0 0019BEF0 00000000 */   nop
/* 9BFF4 0019BEF4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BFF8 0019BEF8 58B320AC */  sw         $0, -0x4CA8($at)
/* 9BFFC 0019BEFC 28860070 */  paddub     $16, $0, $0
/* 9C000 0019BF00 11000010 */  b          .L0019BF48
/* 9C004 0019BF04 00000000 */   nop
.L0019BF08:
/* 9C008 0019BF08 40111000 */  sll        $2, $16, 5
/* 9C00C 0019BF0C 21185000 */  addu       $3, $2, $16
/* 9C010 0019BF10 80100300 */  sll        $2, $3, 2
/* 9C014 0019BF14 21106200 */  addu       $2, $3, $2
/* 9C018 0019BF18 40890200 */  sll        $17, $2, 5
/* 9C01C 0019BF1C D201023C */  lui        $2, %hi(EdVillager)
/* 9C020 0019BF20 905B4224 */  addiu      $2, $2, %lo(EdVillager)
/* 9C024 0019BF24 21205100 */  addu       $4, $2, $17
/* 9C028 0019BF28 785A050C */  jal        Initialize__12CNPCharacterFv
/* 9C02C 0019BF2C 00000000 */   nop
/* 9C030 0019BF30 36000324 */  addiu      $3, $0, 0x36
/* 9C034 0019BF34 D201023C */  lui        $2, %hi(D_1D2701C)
/* 9C038 0019BF38 1C704224 */  addiu      $2, $2, %lo(D_1D2701C)
/* 9C03C 0019BF3C 21105100 */  addu       $2, $2, $17
/* 9C040 0019BF40 000043AC */  sw         $3, 0x0($2)
/* 9C044 0019BF44 01001026 */  addiu      $16, $16, 0x1
.L0019BF48:
/* 9C048 0019BF48 0A00022A */  slti       $2, $16, 0xA
/* 9C04C 0019BF4C EEFF4014 */  bnez       $2, .L0019BF08
/* 9C050 0019BF50 00000000 */   nop
/* 9C054 0019BF54 2C7B060C */  jal        LoadTexture__Fv_2
/* 9C058 0019BF58 00000000 */   nop
/* 9C05C 0019BF5C 01000424 */  addiu      $4, $0, 0x1
/* 9C060 0019BF60 18FB040C */  jal        GetReadBGFile__Fi
/* 9C064 0019BF64 00000000 */   nop
/* 9C068 0019BF68 28864070 */  paddub     $16, $2, $0
/* 9C06C 0019BF6C 12000012 */  beqz       $16, .L0019BFB8
/* 9C070 0019BF70 00000000 */   nop
/* 9C074 0019BF74 9000028E */  lw         $2, 0x90($16)
/* 9C078 0019BF78 03110200 */  sra        $2, $2, 4
/* 9C07C 0019BF7C 01004524 */  addiu      $5, $2, 0x1
/* 9C080 0019BF80 D201023C */  lui        $2, %hi(EdNPCBuffer)
/* 9C084 0019BF84 50B34424 */  addiu      $4, $2, %lo(EdNPCBuffer)
/* 9C088 0019BF88 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 9C08C 0019BF8C 00000000 */   nop
/* 9C090 0019BF90 288E4070 */  paddub     $17, $2, $0
/* 9C094 0019BF94 9000068E */  lw         $6, 0x90($16)
/* 9C098 0019BF98 28262072 */  paddub     $4, $17, $0
/* 9C09C 0019BF9C 8C00058E */  lw         $5, 0x8C($16)
/* 9C0A0 0019BFA0 EC0C040C */  jal        memcpy
/* 9C0A4 0019BFA4 00000000 */   nop
/* 9C0A8 0019BFA8 28262072 */  paddub     $4, $17, $0
/* 9C0AC 0019BFAC 9000058E */  lw         $5, 0x90($16)
/* 9C0B0 0019BFB0 DC7E060C */  jal        LoadInfo__FPci
/* 9C0B4 0019BFB4 00000000 */   nop
.L0019BFB8:
/* 9C0B8 0019BFB8 B47B060C */  jal        LoadData__Fv
/* 9C0BC 0019BFBC 00000000 */   nop
/* 9C0C0 0019BFC0 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9C0C4 0019BFC4 58B3248C */  lw         $4, -0x4CA8($at)
/* 9C0C8 0019BFC8 00190400 */  sll        $3, $4, 4
/* 9C0CC 0019BFCC D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9C0D0 0019BFD0 50B3228C */  lw         $2, -0x4CB0($at)
/* 9C0D4 0019BFD4 21184300 */  addu       $3, $2, $3
/* 9C0D8 0019BFD8 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9C0DC 0019BFDC 5CB3228C */  lw         $2, -0x4CA4($at)
/* 9C0E0 0019BFE0 23284400 */  subu       $5, $2, $4
/* 9C0E4 0019BFE4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9C0E8 0019BFE8 60B323AC */  sw         $3, -0x4CA0($at)
/* 9C0EC 0019BFEC D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9C0F0 0019BFF0 6CB325AC */  sw         $5, -0x4C94($at)
/* 9C0F4 0019BFF4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9C0F8 0019BFF8 68B320AC */  sw         $0, -0x4C98($at)
/* 9C0FC 0019BFFC 2A00023C */  lui        $2, %hi(_469_4)
/* 9C100 0019C000 B8B24424 */  addiu      $4, $2, %lo(_469_4)
/* 9C104 0019C004 A611040C */  jal        printf
/* 9C108 0019C008 00000000 */   nop
/* 9C10C 0019C00C B07B060C */  jal        LoadChara__Fv
/* 9C110 0019C010 00000000 */   nop
/* 9C114 0019C014 A040023C */  lui        $2, (0x40A00000 >> 16)
/* 9C118 0019C018 00688244 */  mtc1       $2, $f13
/* 9C11C 0019C01C 9092838F */  lw         $3, -0x6D70($gp)
/* 9C120 0019C020 FFFF0234 */  ori        $2, $0, 0xFFFF
/* 9C124 0019C024 00008244 */  mtc1       $2, $f0
/* 9C128 0019C028 00000000 */  nop
/* 9C12C 0019C02C A0038046 */  cvt.s.w    $f14, $f0
/* 9C130 0019C030 C0046CC4 */  lwc1       $f12, 0x4C0($3)
/* 9C134 0019C034 B8B5040C */  jal        MGSetRenderInfo__Ffff
/* 9C138 0019C038 00000000 */   nop
/* 9C13C 0019C03C 9092828F */  lw         $2, -0x6D70($gp)
/* 9C140 0019C040 E0044424 */  addiu      $4, $2, 0x4E0
/* 9C144 0019C044 20054524 */  addiu      $5, $2, 0x520
/* 9C148 0019C048 08B7040C */  jal        MGSetPLight__FPA4_fPA4_f
/* 9C14C 0019C04C 00000000 */   nop
/* 9C150 0019C050 9092828F */  lw         $2, -0x6D70($gp)
/* 9C154 0019C054 D0044424 */  addiu      $4, $2, 0x4D0
/* 9C158 0019C058 40B7040C */  jal        MGSetAmbient__FPf
/* 9C15C 0019C05C 00000000 */   nop
/* 9C160 0019C060 9092828F */  lw         $2, -0x6D70($gp)
/* 9C164 0019C064 60054424 */  addiu      $4, $2, 0x560
/* 9C168 0019C068 84B8040C */  jal        MGSetBGColor__FPf
/* 9C16C 0019C06C 00000000 */   nop
/* 9C170 0019C070 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9C174 0019C074 B09B228C */  lw         $2, -0x6450($at)
/* 9C178 0019C078 AC9282AF */  sw         $2, -0x6D54($gp)
/* 9C17C 0019C07C 01000224 */  addiu      $2, $0, 0x1
/* 9C180 0019C080 A48782AF */  sw         $2, -0x785C($gp)
/* 9C184 0019C084 AC92848F */  lw         $4, -0x6D54($gp)
/* 9C188 0019C088 09008010 */  beqz       $4, .L0019C0B0
/* 9C18C 0019C08C 00000000 */   nop
/* 9C190 0019C090 00688044 */  mtc1       $0, $f13
/* 9C194 0019C094 00000000 */  nop
/* 9C198 0019C098 066B0046 */  mov.s      $f12, $f13
/* 9C19C 0019C09C 866B0046 */  mov.s      $f14, $f13
/* 9C1A0 0019C0A0 A000998C */  lw         $25, 0xA0($4)
/* 9C1A4 0019C0A4 1800398F */  lw         $25, 0x18($25)
/* 9C1A8 0019C0A8 09F82003 */  jalr       $25
/* 9C1AC 0019C0AC 00000000 */   nop
.L0019C0B0:
/* 9C1B0 0019C0B0 00608044 */  mtc1       $0, $f12
/* 9C1B4 0019C0B4 00000000 */  nop
/* 9C1B8 0019C0B8 46630046 */  mov.s      $f13, $f12
/* 9C1BC 0019C0BC 86630046 */  mov.s      $f14, $f12
/* 9C1C0 0019C0C0 40000424 */  addiu      $4, $0, 0x40
/* 9C1C4 0019C0C4 C425060C */  jal        EdFadeIn__Fifff
/* 9C1C8 0019C0C8 00000000 */   nop
/* 9C1CC 0019C0CC A49280AF */  sw         $0, -0x6D5C($gp)
/* 9C1D0 0019C0D0 949280AF */  sw         $0, -0x6D6C($gp)
/* 9C1D4 0019C0D4 AC92828F */  lw         $2, -0x6D54($gp)
/* 9C1D8 0019C0D8 980C40AC */  sw         $0, 0xC98($2)
/* 9C1DC 0019C0DC 00608044 */  mtc1       $0, $f12
/* 9C1E0 0019C0E0 00000000 */  nop
/* 9C1E4 0019C0E4 46630046 */  mov.s      $f13, $f12
/* 9C1E8 0019C0E8 86630046 */  mov.s      $f14, $f12
/* 9C1EC 0019C0EC AC92848F */  lw         $4, -0x6D54($gp)
/* 9C1F0 0019C0F0 A000998C */  lw         $25, 0xA0($4)
/* 9C1F4 0019C0F4 1800398F */  lw         $25, 0x18($25)
/* 9C1F8 0019C0F8 09F82003 */  jalr       $25
/* 9C1FC 0019C0FC 00000000 */   nop
/* 9C200 0019C100 00608044 */  mtc1       $0, $f12
/* 9C204 0019C104 00000000 */  nop
/* 9C208 0019C108 46630046 */  mov.s      $f13, $f12
/* 9C20C 0019C10C 86630046 */  mov.s      $f14, $f12
/* 9C210 0019C110 AC92848F */  lw         $4, -0x6D54($gp)
/* 9C214 0019C114 A000998C */  lw         $25, 0xA0($4)
/* 9C218 0019C118 3000398F */  lw         $25, 0x30($25)
/* 9C21C 0019C11C 09F82003 */  jalr       $25
/* 9C220 0019C120 00000000 */   nop
/* 9C224 0019C124 AC92848F */  lw         $4, -0x6D54($gp)
/* 9C228 0019C128 BC78060C */  jal        GetMapJumpPos__FP10CCharacter
/* 9C22C 0019C12C 00000000 */   nop
/* 9C230 0019C130 AC92848F */  lw         $4, -0x6D54($gp)
/* 9C234 0019C134 FFFF0524 */  addiu      $5, $0, -0x1
/* 9C238 0019C138 A000998C */  lw         $25, 0xA0($4)
/* 9C23C 0019C13C 9400398F */  lw         $25, 0x94($25)
/* 9C240 0019C140 09F82003 */  jalr       $25
/* 9C244 0019C144 00000000 */   nop
/* 9C248 0019C148 3890828F */  lw         $2, -0x6FC8($gp)
/* 9C24C 0019C14C 20004004 */  bltz       $2, .L0019C1D0
/* 9C250 0019C150 00000000 */   nop
/* 9C254 0019C154 2700023C */  lui        $2, %hi(_458)
/* 9C258 0019C158 40A64224 */  addiu      $2, $2, %lo(_458)
/* 9C25C 0019C15C 5000A327 */  addiu      $3, $sp, 0x50
/* 9C260 0019C160 00004278 */  lq         $2, 0x0($2)
/* 9C264 0019C164 0000627C */  sq         $2, 0x0($3)
/* 9C268 0019C168 AC92848F */  lw         $4, -0x6D54($gp)
/* 9C26C 0019C16C 4000A527 */  addiu      $5, $sp, 0x40
/* 9C270 0019C170 A000998C */  lw         $25, 0xA0($4)
/* 9C274 0019C174 A000398F */  lw         $25, 0xA0($25)
/* 9C278 0019C178 09F82003 */  jalr       $25
/* 9C27C 0019C17C 00000000 */   nop
/* 9C280 0019C180 4800A1C7 */  lwc1       $f1, 0x48($sp)
/* 9C284 0019C184 2041023C */  lui        $2, (0x41200000 >> 16)
/* 9C288 0019C188 00008244 */  mtc1       $2, $f0
/* 9C28C 0019C18C 00000000 */  nop
/* 9C290 0019C190 01080046 */  sub.s      $f0, $f1, $f0
/* 9C294 0019C194 4800A0E7 */  swc1       $f0, 0x48($sp)
/* 9C298 0019C198 4000A427 */  addiu      $4, $sp, 0x40
/* 9C29C 0019C19C 5000A527 */  addiu      $5, $sp, 0x50
/* 9C2A0 0019C1A0 D065050C */  jal        SndSetCamera__FPfPf
/* 9C2A4 0019C1A4 00000000 */   nop
/* 9C2A8 0019C1A8 AC92848F */  lw         $4, -0x6D54($gp)
/* 9C2AC 0019C1AC 4000A527 */  addiu      $5, $sp, 0x40
/* 9C2B0 0019C1B0 A000998C */  lw         $25, 0xA0($4)
/* 9C2B4 0019C1B4 A000398F */  lw         $25, 0xA0($25)
/* 9C2B8 0019C1B8 09F82003 */  jalr       $25
/* 9C2BC 0019C1BC 00000000 */   nop
/* 9C2C0 0019C1C0 3890848F */  lw         $4, -0x6FC8($gp)
/* 9C2C4 0019C1C4 4000A527 */  addiu      $5, $sp, 0x40
/* 9C2C8 0019C1C8 58C8050C */  jal        EdDoorCloseSe__FiPf
/* 9C2CC 0019C1CC 00000000 */   nop
.L0019C1D0:
/* 9C2D0 0019C1D0 F4A7050C */  jal        EdMoveCharaInit__Fv
/* 9C2D4 0019C1D4 00000000 */   nop
/* 9C2D8 0019C1D8 989280AF */  sw         $0, -0x6D68($gp)
/* 9C2DC 0019C1DC 9C9280AF */  sw         $0, -0x6D64($gp)
/* 9C2E0 0019C1E0 D501023C */  lui        $2, %hi(MainCamera_2)
/* 9C2E4 0019C1E4 B03A4424 */  addiu      $4, $2, %lo(MainCamera_2)
/* 9C2E8 0019C1E8 C492040C */  jal        FollowOff__13CCameraFollowFv
/* 9C2EC 0019C1EC 00000000 */   nop
/* 9C2F0 0019C1F0 D501023C */  lui        $2, %hi(MainCamera_2)
/* 9C2F4 0019C1F4 B03A4224 */  addiu      $2, $2, %lo(MainCamera_2)
/* 9C2F8 0019C1F8 A89282AF */  sw         $2, -0x6D58($gp)
/* 9C2FC 0019C1FC 3C90828F */  lw         $2, -0x6FC4($gp)
/* 9C300 0019C200 C89282AF */  sw         $2, -0x6D38($gp)
/* 9C304 0019C204 FFFF0224 */  addiu      $2, $0, -0x1
/* 9C308 0019C208 CC9282AF */  sw         $2, -0x6D34($gp)
/* 9C30C 0019C20C D09280AF */  sw         $0, -0x6D30($gp)
/* 9C310 0019C210 D49280AF */  sw         $0, -0x6D2C($gp)
/* 9C314 0019C214 D89280AF */  sw         $0, -0x6D28($gp)
/* 9C318 0019C218 DC9280AF */  sw         $0, -0x6D24($gp)
/* 9C31C 0019C21C BC92828F */  lw         $2, -0x6D44($gp)
/* 9C320 0019C220 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 9C324 0019C224 24D422AC */  sw         $2, -0x2BDC($at)
/* 9C328 0019C228 D501023C */  lui        $2, %hi(InteriorParts)
/* 9C32C 0019C22C F0D54224 */  addiu      $2, $2, %lo(InteriorParts)
/* 9C330 0019C230 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 9C334 0019C234 28D422AC */  sw         $2, -0x2BD8($at)
/* 9C338 0019C238 885C060C */  jal        EdInitEventParam__Fv
/* 9C33C 0019C23C 00000000 */   nop
/* 9C340 0019C240 686F060C */  jal        InitWorkBuffer__Fv_2
/* 9C344 0019C244 00000000 */   nop
/* 9C348 0019C248 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9C34C 0019C24C CCB3238C */  lw         $3, -0x4C34($at)
/* 9C350 0019C250 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9C354 0019C254 C8B3228C */  lw         $2, -0x4C38($at)
/* 9C358 0019C258 23286200 */  subu       $5, $3, $2
/* 9C35C 0019C25C 2A00023C */  lui        $2, %hi(_469_4)
/* 9C360 0019C260 B8B24424 */  addiu      $4, $2, %lo(_469_4)
/* 9C364 0019C264 A611040C */  jal        printf
/* 9C368 0019C268 00000000 */   nop
/* 9C36C 0019C26C B4CF050C */  jal        EdSaveFrameImageInit__Fv
/* 9C370 0019C270 00000000 */   nop
/* 9C374 0019C274 FFFF0424 */  addiu      $4, $0, -0x1
/* 9C378 0019C278 34CB050C */  jal        EdInitMenu__Fi
/* 9C37C 0019C27C 00000000 */   nop
/* 9C380 0019C280 00C6050C */  jal        EdInitSoundSrc__Fv
/* 9C384 0019C284 00000000 */   nop
/* 9C388 0019C288 28160070 */  paddub     $2, $0, $0
/* 9C38C 0019C28C 3000BF7B */  lq         $31, 0x30($sp)
/* 9C390 0019C290 2000B17B */  lq         $17, 0x20($sp)
/* 9C394 0019C294 1000B07B */  lq         $16, 0x10($sp)
/* 9C398 0019C298 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 9C39C 0019C29C 6000BD27 */  addiu      $sp, $sp, 0x60
/* 9C3A0 0019C2A0 0800E003 */  jr         $31
/* 9C3A4 0019C2A4 00000000 */   nop
/* 9C3A8 0019C2A8 00000000 */  nop
/* 9C3AC 0019C2AC 00000000 */  nop
