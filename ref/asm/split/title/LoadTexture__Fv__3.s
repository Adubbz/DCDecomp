.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadTexture__Fv__3
/* 009370 01DB5070 80FEBD27 */  addiu       $29, $29, -0x180
/* 009374 01DB5074 0000BF7F */  sq          $31, 0x0($29)
/* 009378 01DB5078 DD01023C */  lui         $2, %hi(LIT_296__3)
/* 00937C 01DB507C 80624624 */  addiu       $6, $2, %lo(LIT_296__3)
/* 009380 01DB5080 1000A527 */  addiu       $5, $29, 0x10
/* 009384 01DB5084 0B000424 */  addiu       $4, $0, 0xB
.L01DB5088_2BA888:
/* 009388 01DB5088 0000C378 */  lq          $3, 0x0($6)
/* 00938C 01DB508C 1000C278 */  lq          $2, 0x10($6)
/* 009390 01DB5090 2000C624 */  addiu       $6, $6, 0x20
/* 009394 01DB5094 FFFF8424 */  addiu       $4, $4, -0x1
/* 009398 01DB5098 0000A37C */  sq          $3, 0x0($5)
/* 00939C 01DB509C 1000A27C */  sq          $2, 0x10($5)
/* 0093A0 01DB50A0 2000A524 */  addiu       $5, $5, 0x20
/* 0093A4 01DB50A4 F8FF801C */  bgtz        $4, .L01DB5088_2BA888
/* 0093A8 01DB50A8 00000000 */   nop
/* 0093AC 01DB50AC 0000C2DC */  ld          $2, 0x0($6)
/* 0093B0 01DB50B0 0000A2FC */  sd          $2, 0x0($5)
/* 0093B4 01DB50B4 C701023C */  lui         $2, %hi(TexManager)
/* 0093B8 01DB50B8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0093BC 01DB50BC E03F0524 */  addiu       $5, $0, 0x3FE0
/* 0093C0 01DB50C0 F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 0093C4 01DB50C4 00000000 */   nop
/* 0093C8 01DB50C8 948B858F */  lw          $5, -0x746C($28)
/* 0093CC 01DB50CC DE01023C */  lui         $2, %hi(LIT_298__5)
/* 0093D0 01DB50D0 20DB4424 */  addiu       $4, $2, %lo(LIT_298__5)
/* 0093D4 01DB50D4 28360070 */  paddub      $6, $0, $0
/* 0093D8 01DB50D8 D8FC040C */  jal         LoadFile__FPcPvPi
/* 0093DC 01DB50DC 00000000 */   nop
/* 0093E0 01DB50E0 948B848F */  lw          $4, -0x746C($28)
/* 0093E4 01DB50E4 DE01023C */  lui         $2, %hi(LIT_299__5)
/* 0093E8 01DB50E8 40DB4524 */  addiu       $5, $2, %lo(LIT_299__5)
/* 0093EC 01DB50EC 28360070 */  paddub      $6, $0, $0
/* 0093F0 01DB50F0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0093F4 01DB50F4 00000000 */   nop
/* 0093F8 01DB50F8 4000A2AF */  sw          $2, 0x40($29)
/* 0093FC 01DB50FC 948B848F */  lw          $4, -0x746C($28)
/* 009400 01DB5100 DE01023C */  lui         $2, %hi(LIT_300__4)
/* 009404 01DB5104 50DB4524 */  addiu       $5, $2, %lo(LIT_300__4)
/* 009408 01DB5108 28360070 */  paddub      $6, $0, $0
/* 00940C 01DB510C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 009410 01DB5110 00000000 */   nop
/* 009414 01DB5114 4C00A2AF */  sw          $2, 0x4C($29)
/* 009418 01DB5118 948B848F */  lw          $4, -0x746C($28)
/* 00941C 01DB511C DE01023C */  lui         $2, %hi(LIT_301__3)
/* 009420 01DB5120 60DB4524 */  addiu       $5, $2, %lo(LIT_301__3)
/* 009424 01DB5124 28360070 */  paddub      $6, $0, $0
/* 009428 01DB5128 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00942C 01DB512C 00000000 */   nop
/* 009430 01DB5130 5800A2AF */  sw          $2, 0x58($29)
/* 009434 01DB5134 948B848F */  lw          $4, -0x746C($28)
/* 009438 01DB5138 DE01023C */  lui         $2, %hi(LIT_302__3)
/* 00943C 01DB513C 70DB4524 */  addiu       $5, $2, %lo(LIT_302__3)
/* 009440 01DB5140 28360070 */  paddub      $6, $0, $0
/* 009444 01DB5144 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 009448 01DB5148 00000000 */   nop
/* 00944C 01DB514C 6400A2AF */  sw          $2, 0x64($29)
/* 009450 01DB5150 948B848F */  lw          $4, -0x746C($28)
/* 009454 01DB5154 DE01023C */  lui         $2, %hi(LIT_303__3)
/* 009458 01DB5158 80DB4524 */  addiu       $5, $2, %lo(LIT_303__3)
/* 00945C 01DB515C 28360070 */  paddub      $6, $0, $0
/* 009460 01DB5160 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 009464 01DB5164 00000000 */   nop
/* 009468 01DB5168 7000A2AF */  sw          $2, 0x70($29)
/* 00946C 01DB516C 948B848F */  lw          $4, -0x746C($28)
/* 009470 01DB5170 DE01023C */  lui         $2, %hi(LIT_304__3)
/* 009474 01DB5174 90DB4524 */  addiu       $5, $2, %lo(LIT_304__3)
/* 009478 01DB5178 28360070 */  paddub      $6, $0, $0
/* 00947C 01DB517C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 009480 01DB5180 00000000 */   nop
/* 009484 01DB5184 7C00A2AF */  sw          $2, 0x7C($29)
/* 009488 01DB5188 948B848F */  lw          $4, -0x746C($28)
/* 00948C 01DB518C DE01023C */  lui         $2, %hi(LIT_305__3)
/* 009490 01DB5190 A0DB4524 */  addiu       $5, $2, %lo(LIT_305__3)
/* 009494 01DB5194 28360070 */  paddub      $6, $0, $0
/* 009498 01DB5198 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00949C 01DB519C 00000000 */   nop
/* 0094A0 01DB51A0 8800A2AF */  sw          $2, 0x88($29)
/* 0094A4 01DB51A4 948B848F */  lw          $4, -0x746C($28)
/* 0094A8 01DB51A8 DE01023C */  lui         $2, %hi(LIT_306__3)
/* 0094AC 01DB51AC B0DB4524 */  addiu       $5, $2, %lo(LIT_306__3)
/* 0094B0 01DB51B0 28360070 */  paddub      $6, $0, $0
/* 0094B4 01DB51B4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0094B8 01DB51B8 00000000 */   nop
/* 0094BC 01DB51BC 9400A2AF */  sw          $2, 0x94($29)
/* 0094C0 01DB51C0 948B848F */  lw          $4, -0x746C($28)
/* 0094C4 01DB51C4 DE01023C */  lui         $2, %hi(LIT_307__3)
/* 0094C8 01DB51C8 C0DB4524 */  addiu       $5, $2, %lo(LIT_307__3)
/* 0094CC 01DB51CC 28360070 */  paddub      $6, $0, $0
/* 0094D0 01DB51D0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0094D4 01DB51D4 00000000 */   nop
/* 0094D8 01DB51D8 A000A2AF */  sw          $2, 0xA0($29)
/* 0094DC 01DB51DC 948B848F */  lw          $4, -0x746C($28)
/* 0094E0 01DB51E0 DE01023C */  lui         $2, %hi(LIT_308__4)
/* 0094E4 01DB51E4 D0DB4524 */  addiu       $5, $2, %lo(LIT_308__4)
/* 0094E8 01DB51E8 28360070 */  paddub      $6, $0, $0
/* 0094EC 01DB51EC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0094F0 01DB51F0 00000000 */   nop
/* 0094F4 01DB51F4 AC00A2AF */  sw          $2, 0xAC($29)
/* 0094F8 01DB51F8 948B848F */  lw          $4, -0x746C($28)
/* 0094FC 01DB51FC DE01023C */  lui         $2, %hi(LIT_309__3)
/* 009500 01DB5200 E0DB4524 */  addiu       $5, $2, %lo(LIT_309__3)
/* 009504 01DB5204 28360070 */  paddub      $6, $0, $0
/* 009508 01DB5208 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00950C 01DB520C 00000000 */   nop
/* 009510 01DB5210 B800A2AF */  sw          $2, 0xB8($29)
/* 009514 01DB5214 948B848F */  lw          $4, -0x746C($28)
/* 009518 01DB5218 DE01023C */  lui         $2, %hi(LIT_310__3)
/* 00951C 01DB521C F0DB4524 */  addiu       $5, $2, %lo(LIT_310__3)
/* 009520 01DB5220 28360070 */  paddub      $6, $0, $0
/* 009524 01DB5224 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 009528 01DB5228 00000000 */   nop
/* 00952C 01DB522C C400A2AF */  sw          $2, 0xC4($29)
/* 009530 01DB5230 948B848F */  lw          $4, -0x746C($28)
/* 009534 01DB5234 DE01023C */  lui         $2, %hi(LIT_311__3)
/* 009538 01DB5238 00DC4524 */  addiu       $5, $2, %lo(LIT_311__3)
/* 00953C 01DB523C 28360070 */  paddub      $6, $0, $0
/* 009540 01DB5240 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 009544 01DB5244 00000000 */   nop
/* 009548 01DB5248 D000A2AF */  sw          $2, 0xD0($29)
/* 00954C 01DB524C 948B848F */  lw          $4, -0x746C($28)
/* 009550 01DB5250 DE01023C */  lui         $2, %hi(LIT_312__3)
/* 009554 01DB5254 10DC4524 */  addiu       $5, $2, %lo(LIT_312__3)
/* 009558 01DB5258 28360070 */  paddub      $6, $0, $0
/* 00955C 01DB525C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 009560 01DB5260 00000000 */   nop
/* 009564 01DB5264 DC00A2AF */  sw          $2, 0xDC($29)
/* 009568 01DB5268 948B848F */  lw          $4, -0x746C($28)
/* 00956C 01DB526C DE01023C */  lui         $2, %hi(LIT_313__2)
/* 009570 01DB5270 18DC4524 */  addiu       $5, $2, %lo(LIT_313__2)
/* 009574 01DB5274 28360070 */  paddub      $6, $0, $0
/* 009578 01DB5278 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00957C 01DB527C 00000000 */   nop
/* 009580 01DB5280 E800A2AF */  sw          $2, 0xE8($29)
/* 009584 01DB5284 948B848F */  lw          $4, -0x746C($28)
/* 009588 01DB5288 DE01023C */  lui         $2, %hi(LIT_314__4)
/* 00958C 01DB528C 28DC4524 */  addiu       $5, $2, %lo(LIT_314__4)
/* 009590 01DB5290 28360070 */  paddub      $6, $0, $0
/* 009594 01DB5294 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 009598 01DB5298 00000000 */   nop
/* 00959C 01DB529C F400A2AF */  sw          $2, 0xF4($29)
/* 0095A0 01DB52A0 948B848F */  lw          $4, -0x746C($28)
/* 0095A4 01DB52A4 DE01023C */  lui         $2, %hi(LIT_315__4)
/* 0095A8 01DB52A8 38DC4524 */  addiu       $5, $2, %lo(LIT_315__4)
/* 0095AC 01DB52AC 28360070 */  paddub      $6, $0, $0
/* 0095B0 01DB52B0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0095B4 01DB52B4 00000000 */   nop
/* 0095B8 01DB52B8 0001A2AF */  sw          $2, 0x100($29)
/* 0095BC 01DB52BC 948B848F */  lw          $4, -0x746C($28)
/* 0095C0 01DB52C0 DE01023C */  lui         $2, %hi(LIT_316__3)
/* 0095C4 01DB52C4 48DC4524 */  addiu       $5, $2, %lo(LIT_316__3)
/* 0095C8 01DB52C8 28360070 */  paddub      $6, $0, $0
/* 0095CC 01DB52CC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0095D0 01DB52D0 00000000 */   nop
/* 0095D4 01DB52D4 0C01A2AF */  sw          $2, 0x10C($29)
/* 0095D8 01DB52D8 948B848F */  lw          $4, -0x746C($28)
/* 0095DC 01DB52DC DE01023C */  lui         $2, %hi(LIT_317__3)
/* 0095E0 01DB52E0 58DC4524 */  addiu       $5, $2, %lo(LIT_317__3)
/* 0095E4 01DB52E4 28360070 */  paddub      $6, $0, $0
/* 0095E8 01DB52E8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0095EC 01DB52EC 00000000 */   nop
/* 0095F0 01DB52F0 1801A2AF */  sw          $2, 0x118($29)
/* 0095F4 01DB52F4 948B848F */  lw          $4, -0x746C($28)
/* 0095F8 01DB52F8 DE01023C */  lui         $2, %hi(LIT_318__3)
/* 0095FC 01DB52FC 68DC4524 */  addiu       $5, $2, %lo(LIT_318__3)
/* 009600 01DB5300 28360070 */  paddub      $6, $0, $0
/* 009604 01DB5304 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 009608 01DB5308 00000000 */   nop
/* 00960C 01DB530C 2401A2AF */  sw          $2, 0x124($29)
/* 009610 01DB5310 948B848F */  lw          $4, -0x746C($28)
/* 009614 01DB5314 DE01023C */  lui         $2, %hi(LIT_319__4)
/* 009618 01DB5318 78DC4524 */  addiu       $5, $2, %lo(LIT_319__4)
/* 00961C 01DB531C 28360070 */  paddub      $6, $0, $0
/* 009620 01DB5320 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 009624 01DB5324 00000000 */   nop
/* 009628 01DB5328 3001A2AF */  sw          $2, 0x130($29)
/* 00962C 01DB532C 948B848F */  lw          $4, -0x746C($28)
/* 009630 01DB5330 DE01023C */  lui         $2, %hi(LIT_320__4)
/* 009634 01DB5334 88DC4524 */  addiu       $5, $2, %lo(LIT_320__4)
/* 009638 01DB5338 28360070 */  paddub      $6, $0, $0
/* 00963C 01DB533C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 009640 01DB5340 00000000 */   nop
/* 009644 01DB5344 3C01A2AF */  sw          $2, 0x13C($29)
/* 009648 01DB5348 948B848F */  lw          $4, -0x746C($28)
/* 00964C 01DB534C DE01023C */  lui         $2, %hi(LIT_321__3)
/* 009650 01DB5350 98DC4524 */  addiu       $5, $2, %lo(LIT_321__3)
/* 009654 01DB5354 28360070 */  paddub      $6, $0, $0
/* 009658 01DB5358 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00965C 01DB535C 00000000 */   nop
/* 009660 01DB5360 4801A2AF */  sw          $2, 0x148($29)
/* 009664 01DB5364 948B848F */  lw          $4, -0x746C($28)
/* 009668 01DB5368 DE01023C */  lui         $2, %hi(LIT_322__3)
/* 00966C 01DB536C A8DC4524 */  addiu       $5, $2, %lo(LIT_322__3)
/* 009670 01DB5370 28360070 */  paddub      $6, $0, $0
/* 009674 01DB5374 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 009678 01DB5378 00000000 */   nop
/* 00967C 01DB537C 5401A2AF */  sw          $2, 0x154($29)
/* 009680 01DB5380 948B848F */  lw          $4, -0x746C($28)
/* 009684 01DB5384 DE01023C */  lui         $2, %hi(LIT_323__3)
/* 009688 01DB5388 B8DC4524 */  addiu       $5, $2, %lo(LIT_323__3)
/* 00968C 01DB538C 28360070 */  paddub      $6, $0, $0
/* 009690 01DB5390 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 009694 01DB5394 00000000 */   nop
/* 009698 01DB5398 6001A2AF */  sw          $2, 0x160($29)
/* 00969C 01DB539C C701023C */  lui         $2, %hi(TexManager)
/* 0096A0 01DB53A0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0096A4 01DB53A4 FFFF0524 */  addiu       $5, $0, -0x1
/* 0096A8 01DB53A8 1000A627 */  addiu       $6, $29, 0x10
/* 0096AC 01DB53AC C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0096B0 01DB53B0 00000000 */   nop
/* 0096B4 01DB53B4 01000324 */  addiu       $3, $0, 0x1
/* 0096B8 01DB53B8 E101013C */  lui         $1, %hi(CharaTex__2)
/* 0096BC 01DB53BC B09523A0 */  sb          $3, %lo(CharaTex__2)($1)
/* 0096C0 01DB53C0 02000324 */  addiu       $3, $0, 0x2
/* 0096C4 01DB53C4 E101013C */  lui         $1, %hi(CharaTex__2 + 0x1)
/* 0096C8 01DB53C8 B19523A0 */  sb          $3, %lo(CharaTex__2 + 0x1)($1)
/* 0096CC 01DB53CC E101013C */  lui         $1, %hi(CharaTex__2 + 0x4)
/* 0096D0 01DB53D0 B49523A0 */  sb          $3, %lo(CharaTex__2 + 0x4)($1)
/* 0096D4 01DB53D4 E101013C */  lui         $1, %hi(CharaTex__2 + 0x5)
/* 0096D8 01DB53D8 B59523A0 */  sb          $3, %lo(CharaTex__2 + 0x5)($1)
/* 0096DC 01DB53DC 04000324 */  addiu       $3, $0, 0x4
/* 0096E0 01DB53E0 E101013C */  lui         $1, %hi(CharaTex__2 + 0x3)
/* 0096E4 01DB53E4 B39523A0 */  sb          $3, %lo(CharaTex__2 + 0x3)($1)
/* 0096E8 01DB53E8 03000324 */  addiu       $3, $0, 0x3
/* 0096EC 01DB53EC E101013C */  lui         $1, %hi(CharaTex__2 + 0x2)
/* 0096F0 01DB53F0 B29523A0 */  sb          $3, %lo(CharaTex__2 + 0x2)($1)
/* 0096F4 01DB53F4 05000324 */  addiu       $3, $0, 0x5
/* 0096F8 01DB53F8 E101013C */  lui         $1, %hi(CharaTex__2 + 0x6)
/* 0096FC 01DB53FC B69523A0 */  sb          $3, %lo(CharaTex__2 + 0x6)($1)
/* 009700 01DB5400 06000324 */  addiu       $3, $0, 0x6
/* 009704 01DB5404 E101013C */  lui         $1, %hi(CharaTex__2 + 0x7)
/* 009708 01DB5408 B79523A0 */  sb          $3, %lo(CharaTex__2 + 0x7)($1)
/* 00970C 01DB540C 0000BF7B */  lq          $31, 0x0($29)
/* 009710 01DB5410 8001BD27 */  addiu       $29, $29, 0x180
/* 009714 01DB5414 0800E003 */  jr          $31
/* 009718 01DB5418 00000000 */   nop
/* 00971C 01DB541C 00000000 */  nop
