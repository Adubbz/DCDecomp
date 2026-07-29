.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MoveCharacter__Fv
/* 09DDF0 0019DCF0 90FFBD27 */  addiu       $29, $29, -0x70
/* 09DDF4 0019DCF4 1000BF7F */  sq          $31, 0x10($29)
/* 09DDF8 0019DCF8 0000B07F */  sq          $16, 0x0($29)
/* 09DDFC 0019DCFC B09280C7 */  lwc1        $f0, -0x6D50($28)
/* 09DE00 0019DD00 D201013C */  lui         $1, %hi(EdMoveCharaInfo)
/* 09DE04 0019DD04 709620E4 */  swc1        $f0, %lo(EdMoveCharaInfo)($1)
/* 09DE08 0019DD08 D501023C */  lui         $2, %hi(MainCamera__2)
/* 09DE0C 0019DD0C B03A4224 */  addiu       $2, $2, %lo(MainCamera__2)
/* 09DE10 0019DD10 D201013C */  lui         $1, %hi(EdMoveCharaInfo + 0x8)
/* 09DE14 0019DD14 789622AC */  sw          $2, %lo(EdMoveCharaInfo + 0x8)($1)
/* 09DE18 0019DD18 D501023C */  lui         $2, %hi(ViewCamera__2)
/* 09DE1C 0019DD1C B0434224 */  addiu       $2, $2, %lo(ViewCamera__2)
/* 09DE20 0019DD20 D201013C */  lui         $1, %hi(EdMoveCharaInfo + 0xC)
/* 09DE24 0019DD24 7C9622AC */  sw          $2, %lo(EdMoveCharaInfo + 0xC)($1)
/* 09DE28 0019DD28 D201013C */  lui         $1, %hi(EdMoveCharaInfo + 0x10)
/* 09DE2C 0019DD2C 809620AC */  sw          $0, %lo(EdMoveCharaInfo + 0x10)($1)
/* 09DE30 0019DD30 AC92828F */  lw          $2, -0x6D54($28)
/* 09DE34 0019DD34 D201013C */  lui         $1, %hi(EdMoveCharaInfo + 0x4)
/* 09DE38 0019DD38 749622AC */  sw          $2, %lo(EdMoveCharaInfo + 0x4)($1)
/* 09DE3C 0019DD3C 01000224 */  addiu       $2, $0, 0x1
/* 09DE40 0019DD40 D201013C */  lui         $1, %hi(EdMoveCharaInfo + 0x18)
/* 09DE44 0019DD44 889622AC */  sw          $2, %lo(EdMoveCharaInfo + 0x18)($1)
/* 09DE48 0019DD48 D501023C */  lui         $2, %hi(InteriorParts)
/* 09DE4C 0019DD4C F0D54224 */  addiu       $2, $2, %lo(InteriorParts)
/* 09DE50 0019DD50 D201013C */  lui         $1, %hi(EdMoveCharaInfo + 0x20)
/* 09DE54 0019DD54 909622AC */  sw          $2, %lo(EdMoveCharaInfo + 0x20)($1)
/* 09DE58 0019DD58 BC92828F */  lw          $2, -0x6D44($28)
/* 09DE5C 0019DD5C D201013C */  lui         $1, %hi(EdMoveCharaInfo + 0x24)
/* 09DE60 0019DD60 949622AC */  sw          $2, %lo(EdMoveCharaInfo + 0x24)($1)
/* 09DE64 0019DD64 9092828F */  lw          $2, -0x6D70($28)
/* 09DE68 0019DD68 302B4224 */  addiu       $2, $2, 0x2B30
/* 09DE6C 0019DD6C D201013C */  lui         $1, %hi(EdMoveCharaInfo + 0x90)
/* 09DE70 0019DD70 009722AC */  sw          $2, %lo(EdMoveCharaInfo + 0x90)($1)
/* 09DE74 0019DD74 20000224 */  addiu       $2, $0, 0x20
/* 09DE78 0019DD78 D201013C */  lui         $1, %hi(EdMoveCharaInfo + 0x94)
/* 09DE7C 0019DD7C 049722AC */  sw          $2, %lo(EdMoveCharaInfo + 0x94)($1)
/* 09DE80 0019DD80 D201013C */  lui         $1, %hi(EdMoveCharaInfo + 0xA0)
/* 09DE84 0019DD84 109720AC */  sw          $0, %lo(EdMoveCharaInfo + 0xA0)($1)
/* 09DE88 0019DD88 58A8050C */  jal         EdMoveChara__Fv
/* 09DE8C 0019DD8C 00000000 */   nop
/* 09DE90 0019DD90 408F828F */  lw          $2, -0x70C0($28)
/* 09DE94 0019DD94 13004010 */  beqz        $2, .L0019DDE4
/* 09DE98 0019DD98 00000000 */   nop
/* 09DE9C 0019DD9C CC01023C */  lui         $2, %hi(GamePad)
/* 09DEA0 0019DDA0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 09DEA4 0019DDA4 20000524 */  addiu       $5, $0, 0x20
/* 09DEA8 0019DDA8 1CAE040C */  jal         Down__8CGamePadFi
/* 09DEAC 0019DDAC 00000000 */   nop
/* 09DEB0 0019DDB0 0C004010 */  beqz        $2, .L0019DDE4
/* 09DEB4 0019DDB4 00000000 */   nop
/* 09DEB8 0019DDB8 A087828F */  lw          $2, -0x7860($28)
/* 09DEBC 0019DDBC 2B100200 */  sltu        $2, $0, $2
/* 09DEC0 0019DDC0 01004238 */  xori        $2, $2, 0x1
/* 09DEC4 0019DDC4 FF004230 */  andi        $2, $2, 0xFF
/* 09DEC8 0019DDC8 A08782AF */  sw          $2, -0x7860($28)
/* 09DECC 0019DDCC D501023C */  lui         $2, %hi(MainCamera__2)
/* 09DED0 0019DDD0 B03A4424 */  addiu       $4, $2, %lo(MainCamera__2)
/* 09DED4 0019DDD4 D501023C */  lui         $2, %hi(fix_pos$1123)
/* 09DED8 0019DDD8 40494524 */  addiu       $5, $2, %lo(fix_pos$1123)
/* 09DEDC 0019DDDC 9C91040C */  jal         GetPos__7CCameraFPf
/* 09DEE0 0019DDE0 00000000 */   nop
.L0019DDE4:
/* 09DEE4 0019DDE4 A087828F */  lw          $2, -0x7860($28)
/* 09DEE8 0019DDE8 07004010 */  beqz        $2, .L0019DE08
/* 09DEEC 0019DDEC 00000000 */   nop
/* 09DEF0 0019DDF0 D501023C */  lui         $2, %hi(MainCamera__2)
/* 09DEF4 0019DDF4 B03A4424 */  addiu       $4, $2, %lo(MainCamera__2)
/* 09DEF8 0019DDF8 C492040C */  jal         FollowOff__13CCameraFollowFv
/* 09DEFC 0019DDFC 00000000 */   nop
/* 09DF00 0019DE00 19000010 */  b           .L0019DE68
/* 09DF04 0019DE04 00000000 */   nop
.L0019DE08:
/* 09DF08 0019DE08 D501023C */  lui         $2, %hi(MainCamera__2)
/* 09DF0C 0019DE0C B03A4424 */  addiu       $4, $2, %lo(MainCamera__2)
/* 09DF10 0019DE10 C092040C */  jal         FollowOn__13CCameraFollowFv
/* 09DF14 0019DE14 00000000 */   nop
/* 09DF18 0019DE18 AC92848F */  lw          $4, -0x6D54($28)
/* 09DF1C 0019DE1C 2000A527 */  addiu       $5, $29, 0x20
/* 09DF20 0019DE20 A000998C */  lw          $25, 0xA0($4)
/* 09DF24 0019DE24 A000398F */  lw          $25, 0xA0($25)
/* 09DF28 0019DE28 09F82003 */  jalr        $25
/* 09DF2C 0019DE2C 00000000 */   nop
/* 09DF30 0019DE30 6041023C */  lui         $2, (0x41600000 >> 16)
/* 09DF34 0019DE34 00088244 */  mtc1        $2, $f1
/* 09DF38 0019DE38 2400A0C7 */  lwc1        $f0, 0x24($29)
/* 09DF3C 0019DE3C 400B0046 */  add.s       $f13, $f1, $f0
/* 09DF40 0019DE40 D501023C */  lui         $2, %hi(MainCamera__2)
/* 09DF44 0019DE44 B03A4424 */  addiu       $4, $2, %lo(MainCamera__2)
/* 09DF48 0019DE48 2000ACC7 */  lwc1        $f12, 0x20($29)
/* 09DF4C 0019DE4C 2800AEC7 */  lwc1        $f14, 0x28($29)
/* 09DF50 0019DE50 B892040C */  jal         SetFollow__13CCameraFollowFfff
/* 09DF54 0019DE54 00000000 */   nop
/* 09DF58 0019DE58 D501023C */  lui         $2, %hi(MainCamera__2)
/* 09DF5C 0019DE5C B03A4424 */  addiu       $4, $2, %lo(MainCamera__2)
/* 09DF60 0019DE60 2078060C */  jal         MoveCamera__FP13CCameraFollow__2
/* 09DF64 0019DE64 00000000 */   nop
.L0019DE68:
/* 09DF68 0019DE68 D201013C */  lui         $1, %hi(EdMoveCharaInfo + 0x9C)
/* 09DF6C 0019DE6C 0C97248C */  lw          $4, %lo(EdMoveCharaInfo + 0x9C)($1)
/* 09DF70 0019DE70 07008018 */  blez        $4, .L0019DE90
/* 09DF74 0019DE74 00000000 */   nop
/* 09DF78 0019DE78 D501023C */  lui         $2, %hi(MainCamera__2)
/* 09DF7C 0019DE7C B03A4524 */  addiu       $5, $2, %lo(MainCamera__2)
/* 09DF80 0019DE80 406F060C */  jal         RunSystemEvent__FiP7CCamera__2
/* 09DF84 0019DE84 00000000 */   nop
/* 09DF88 0019DE88 77000010 */  b           .L0019E068
/* 09DF8C 0019DE8C 00000000 */   nop
.L0019DE90:
/* 09DF90 0019DE90 D201013C */  lui         $1, %hi(EdMoveCharaInfo + 0x98)
/* 09DF94 0019DE94 0897248C */  lw          $4, %lo(EdMoveCharaInfo + 0x98)($1)
/* 09DF98 0019DE98 07008018 */  blez        $4, .L0019DEB8
/* 09DF9C 0019DE9C 00000000 */   nop
/* 09DFA0 0019DEA0 D501023C */  lui         $2, %hi(MainCamera__2)
/* 09DFA4 0019DEA4 B03A4524 */  addiu       $5, $2, %lo(MainCamera__2)
/* 09DFA8 0019DEA8 106F060C */  jal         RunEvent__FiP7CCamera__2
/* 09DFAC 0019DEAC 00000000 */   nop
/* 09DFB0 0019DEB0 6D000010 */  b           .L0019E068
/* 09DFB4 0019DEB4 00000000 */   nop
.L0019DEB8:
/* 09DFB8 0019DEB8 D201013C */  lui         $1, %hi(EdMoveCharaInfo + 0xA0)
/* 09DFBC 0019DEBC 1097238C */  lw          $3, %lo(EdMoveCharaInfo + 0xA0)($1)
/* 09DFC0 0019DEC0 69006014 */  bnez        $3, .L0019E068
/* 09DFC4 0019DEC4 00000000 */   nop
/* 09DFC8 0019DEC8 40000424 */  addiu       $4, $0, 0x40
/* 09DFCC 0019DECC 01000524 */  addiu       $5, $0, 0x1
/* 09DFD0 0019DED0 64A6050C */  jal         EdPadDown__Fii
/* 09DFD4 0019DED4 00000000 */   nop
/* 09DFD8 0019DED8 63004010 */  beqz        $2, .L0019E068
/* 09DFDC 0019DEDC 00000000 */   nop
/* 09DFE0 0019DEE0 2700023C */  lui         $2, %hi(LIT_1141)
/* 09DFE4 0019DEE4 70A64224 */  addiu       $2, $2, %lo(LIT_1141)
/* 09DFE8 0019DEE8 4000A327 */  addiu       $3, $29, 0x40
/* 09DFEC 0019DEEC 00004278 */  lq          $2, 0x0($2)
/* 09DFF0 0019DEF0 0000627C */  sq          $2, 0x0($3)
/* 09DFF4 0019DEF4 2700023C */  lui         $2, %hi(LIT_1142)
/* 09DFF8 0019DEF8 80A64224 */  addiu       $2, $2, %lo(LIT_1142)
/* 09DFFC 0019DEFC 5000A327 */  addiu       $3, $29, 0x50
/* 09E000 0019DF00 00004278 */  lq          $2, 0x0($2)
/* 09E004 0019DF04 0000627C */  sq          $2, 0x0($3)
/* 09E008 0019DF08 AC92848F */  lw          $4, -0x6D54($28)
/* 09E00C 0019DF0C 3000A527 */  addiu       $5, $29, 0x30
/* 09E010 0019DF10 A000998C */  lw          $25, 0xA0($4)
/* 09E014 0019DF14 A000398F */  lw          $25, 0xA0($25)
/* 09E018 0019DF18 09F82003 */  jalr        $25
/* 09E01C 0019DF1C 00000000 */   nop
/* 09E020 0019DF20 AC92848F */  lw          $4, -0x6D54($28)
/* 09E024 0019DF24 5000A527 */  addiu       $5, $29, 0x50
/* 09E028 0019DF28 A000998C */  lw          $25, 0xA0($4)
/* 09E02C 0019DF2C 5800398F */  lw          $25, 0x58($25)
/* 09E030 0019DF30 09F82003 */  jalr        $25
/* 09E034 0019DF34 00000000 */   nop
/* 09E038 0019DF38 3000A427 */  addiu       $4, $29, 0x30
/* 09E03C 0019DF3C 5000A527 */  addiu       $5, $29, 0x50
/* 09E040 0019DF40 7C78060C */  jal         SearchMapJump__FPfPf
/* 09E044 0019DF44 00000000 */   nop
/* 09E048 0019DF48 28864070 */  paddub      $16, $2, $0
/* 09E04C 0019DF4C 46004010 */  beqz        $2, .L0019E068
/* 09E050 0019DF50 00000000 */   nop
/* 09E054 0019DF54 F4A7050C */  jal         EdMoveCharaInit__Fv
/* 09E058 0019DF58 00000000 */   nop
/* 09E05C 0019DF5C 6C00A0AF */  sw          $0, 0x6C($29)
/* 09E060 0019DF60 8C000224 */  addiu       $2, $0, 0x8C
/* 09E064 0019DF64 A49282AF */  sw          $2, -0x6D5C($28)
/* 09E068 0019DF68 08000012 */  beqz        $16, .L0019DF8C
/* 09E06C 0019DF6C 00000000 */   nop
/* 09E070 0019DF70 2000048E */  lw          $4, 0x20($16)
/* 09E074 0019DF74 3000A527 */  addiu       $5, $29, 0x30
/* 09E078 0019DF78 5000A627 */  addiu       $6, $29, 0x50
/* 09E07C 0019DF7C 38908727 */  addiu       $7, $28, -0x6FC8
/* 09E080 0019DF80 6C00A827 */  addiu       $8, $29, 0x6C
/* 09E084 0019DF84 0879060C */  jal         GetDoorPos__FiPfPfPiPi
/* 09E088 0019DF88 00000000 */   nop
.L0019DF8C:
/* 09E08C 0019DF8C 6C00A28F */  lw          $2, 0x6C($29)
/* 09E090 0019DF90 AC92838F */  lw          $3, -0x6D54($28)
/* 09E094 0019DF94 680C62AC */  sw          $2, 0xC68($3)
/* 09E098 0019DF98 06000224 */  addiu       $2, $0, 0x6
/* 09E09C 0019DF9C 640C62AC */  sw          $2, 0xC64($3)
/* 09E0A0 0019DFA0 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 09E0A4 0019DFA4 600C62AC */  sw          $2, 0xC60($3)
/* 09E0A8 0019DFA8 D501023C */  lui         $2, %hi(fix_chara_pos__2)
/* 09E0AC 0019DFAC D0D54424 */  addiu       $4, $2, %lo(fix_chara_pos__2)
/* 09E0B0 0019DFB0 3000A527 */  addiu       $5, $29, 0x30
/* 09E0B4 0019DFB4 0C86040C */  jal         sceVu0CopyVector
/* 09E0B8 0019DFB8 00000000 */   nop
/* 09E0BC 0019DFBC D501023C */  lui         $2, %hi(fix_chara_rot__2)
/* 09E0C0 0019DFC0 E0D54424 */  addiu       $4, $2, %lo(fix_chara_rot__2)
/* 09E0C4 0019DFC4 5000A527 */  addiu       $5, $29, 0x50
/* 09E0C8 0019DFC8 0C86040C */  jal         sceVu0CopyVector
/* 09E0CC 0019DFCC 00000000 */   nop
/* 09E0D0 0019DFD0 AC92848F */  lw          $4, -0x6D54($28)
/* 09E0D4 0019DFD4 D501023C */  lui         $2, %hi(fix_chara_pos__2)
/* 09E0D8 0019DFD8 D0D54524 */  addiu       $5, $2, %lo(fix_chara_pos__2)
/* 09E0DC 0019DFDC A000998C */  lw          $25, 0xA0($4)
/* 09E0E0 0019DFE0 1400398F */  lw          $25, 0x14($25)
/* 09E0E4 0019DFE4 09F82003 */  jalr        $25
/* 09E0E8 0019DFE8 00000000 */   nop
/* 09E0EC 0019DFEC AC92848F */  lw          $4, -0x6D54($28)
/* 09E0F0 0019DFF0 D501013C */  lui         $1, %hi(fix_chara_rot__2)
/* 09E0F4 0019DFF4 E0D52CC4 */  lwc1        $f12, %lo(fix_chara_rot__2)($1)
/* 09E0F8 0019DFF8 D501013C */  lui         $1, %hi(fix_chara_rot__2 + 0x4)
/* 09E0FC 0019DFFC E4D52DC4 */  lwc1        $f13, %lo(fix_chara_rot__2 + 0x4)($1)
/* 09E100 0019E000 D501013C */  lui         $1, %hi(fix_chara_rot__2 + 0x8)
/* 09E104 0019E004 E8D52EC4 */  lwc1        $f14, %lo(fix_chara_rot__2 + 0x8)($1)
/* 09E108 0019E008 A000998C */  lw          $25, 0xA0($4)
/* 09E10C 0019E00C 3000398F */  lw          $25, 0x30($25)
/* 09E110 0019E010 09F82003 */  jalr        $25
/* 09E114 0019E014 00000000 */   nop
/* 09E118 0019E018 AC92848F */  lw          $4, -0x6D54($28)
/* 09E11C 0019E01C A000998C */  lw          $25, 0xA0($4)
/* 09E120 0019E020 0800398F */  lw          $25, 0x8($25)
/* 09E124 0019E024 09F82003 */  jalr        $25
/* 09E128 0019E028 00000000 */   nop
/* 09E12C 0019E02C AC92848F */  lw          $4, -0x6D54($28)
/* 09E130 0019E030 FFFF0524 */  addiu       $5, $0, -0x1
/* 09E134 0019E034 A000998C */  lw          $25, 0xA0($4)
/* 09E138 0019E038 9400398F */  lw          $25, 0x94($25)
/* 09E13C 0019E03C 09F82003 */  jalr        $25
/* 09E140 0019E040 00000000 */   nop
/* 09E144 0019E044 01000224 */  addiu       $2, $0, 0x1
/* 09E148 0019E048 949282AF */  sw          $2, -0x6D6C($28)
/* 09E14C 0019E04C 00608044 */  mtc1        $0, $f12
/* 09E150 0019E050 00000000 */  nop
/* 09E154 0019E054 46630046 */  mov.s       $f13, $f12
/* 09E158 0019E058 86630046 */  mov.s       $f14, $f12
/* 09E15C 0019E05C 64000424 */  addiu       $4, $0, 0x64
/* 09E160 0019E060 E425060C */  jal         EdFadeOut__Fifff
/* 09E164 0019E064 00000000 */   nop
.L0019E068:
/* 09E168 0019E068 1000BF7B */  lq          $31, 0x10($29)
/* 09E16C 0019E06C 0000B07B */  lq          $16, 0x0($29)
/* 09E170 0019E070 7000BD27 */  addiu       $29, $29, 0x70
/* 09E174 0019E074 0800E003 */  jr          $31
/* 09E178 0019E078 00000000 */   nop
/* 09E17C 0019E07C 00000000 */  nop
