.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MoveCharacter__Fv
/* 9DDF0 0019DCF0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 9DDF4 0019DCF4 1000BF7F */  sq         $31, 0x10($sp)
/* 9DDF8 0019DCF8 0000B07F */  sq         $16, 0x0($sp)
/* 9DDFC 0019DCFC B09280C7 */  lwc1       $f0, -0x6D50($gp)
/* 9DE00 0019DD00 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9DE04 0019DD04 709620E4 */  swc1       $f0, -0x6990($at)
/* 9DE08 0019DD08 D501023C */  lui        $2, %hi(MainCamera_2)
/* 9DE0C 0019DD0C B03A4224 */  addiu      $2, $2, %lo(MainCamera_2)
/* 9DE10 0019DD10 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9DE14 0019DD14 789622AC */  sw         $2, -0x6988($at)
/* 9DE18 0019DD18 D501023C */  lui        $2, %hi(ViewCamera_2)
/* 9DE1C 0019DD1C B0434224 */  addiu      $2, $2, %lo(ViewCamera_2)
/* 9DE20 0019DD20 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9DE24 0019DD24 7C9622AC */  sw         $2, -0x6984($at)
/* 9DE28 0019DD28 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9DE2C 0019DD2C 809620AC */  sw         $0, -0x6980($at)
/* 9DE30 0019DD30 AC92828F */  lw         $2, -0x6D54($gp)
/* 9DE34 0019DD34 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9DE38 0019DD38 749622AC */  sw         $2, -0x698C($at)
/* 9DE3C 0019DD3C 01000224 */  addiu      $2, $0, 0x1
/* 9DE40 0019DD40 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9DE44 0019DD44 889622AC */  sw         $2, -0x6978($at)
/* 9DE48 0019DD48 D501023C */  lui        $2, %hi(InteriorParts)
/* 9DE4C 0019DD4C F0D54224 */  addiu      $2, $2, %lo(InteriorParts)
/* 9DE50 0019DD50 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9DE54 0019DD54 909622AC */  sw         $2, -0x6970($at)
/* 9DE58 0019DD58 BC92828F */  lw         $2, -0x6D44($gp)
/* 9DE5C 0019DD5C D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9DE60 0019DD60 949622AC */  sw         $2, -0x696C($at)
/* 9DE64 0019DD64 9092828F */  lw         $2, -0x6D70($gp)
/* 9DE68 0019DD68 302B4224 */  addiu      $2, $2, 0x2B30
/* 9DE6C 0019DD6C D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9DE70 0019DD70 009722AC */  sw         $2, -0x6900($at)
/* 9DE74 0019DD74 20000224 */  addiu      $2, $0, 0x20
/* 9DE78 0019DD78 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9DE7C 0019DD7C 049722AC */  sw         $2, -0x68FC($at)
/* 9DE80 0019DD80 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9DE84 0019DD84 109720AC */  sw         $0, -0x68F0($at)
/* 9DE88 0019DD88 58A8050C */  jal        EdMoveChara__Fv
/* 9DE8C 0019DD8C 00000000 */   nop
/* 9DE90 0019DD90 408F828F */  lw         $2, -0x70C0($gp)
/* 9DE94 0019DD94 13004010 */  beqz       $2, .L0019DDE4
/* 9DE98 0019DD98 00000000 */   nop
/* 9DE9C 0019DD9C CC01023C */  lui        $2, %hi(GamePad)
/* 9DEA0 0019DDA0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 9DEA4 0019DDA4 20000524 */  addiu      $5, $0, 0x20
/* 9DEA8 0019DDA8 1CAE040C */  jal        Down__8CGamePadFi
/* 9DEAC 0019DDAC 00000000 */   nop
/* 9DEB0 0019DDB0 0C004010 */  beqz       $2, .L0019DDE4
/* 9DEB4 0019DDB4 00000000 */   nop
/* 9DEB8 0019DDB8 A087828F */  lw         $2, -0x7860($gp)
/* 9DEBC 0019DDBC 2B100200 */  sltu       $2, $0, $2
/* 9DEC0 0019DDC0 01004238 */  xori       $2, $2, 0x1
/* 9DEC4 0019DDC4 FF004230 */  andi       $2, $2, 0xFF
/* 9DEC8 0019DDC8 A08782AF */  sw         $2, -0x7860($gp)
/* 9DECC 0019DDCC D501023C */  lui        $2, %hi(MainCamera_2)
/* 9DED0 0019DDD0 B03A4424 */  addiu      $4, $2, %lo(MainCamera_2)
/* 9DED4 0019DDD4 D501023C */  lui        $2, %hi(fix_pos$1123)
/* 9DED8 0019DDD8 40494524 */  addiu      $5, $2, %lo(fix_pos$1123)
/* 9DEDC 0019DDDC 9C91040C */  jal        GetPos__7CCameraFPf
/* 9DEE0 0019DDE0 00000000 */   nop
.L0019DDE4:
/* 9DEE4 0019DDE4 A087828F */  lw         $2, -0x7860($gp)
/* 9DEE8 0019DDE8 07004010 */  beqz       $2, .L0019DE08
/* 9DEEC 0019DDEC 00000000 */   nop
/* 9DEF0 0019DDF0 D501023C */  lui        $2, %hi(MainCamera_2)
/* 9DEF4 0019DDF4 B03A4424 */  addiu      $4, $2, %lo(MainCamera_2)
/* 9DEF8 0019DDF8 C492040C */  jal        FollowOff__13CCameraFollowFv
/* 9DEFC 0019DDFC 00000000 */   nop
/* 9DF00 0019DE00 19000010 */  b          .L0019DE68
/* 9DF04 0019DE04 00000000 */   nop
.L0019DE08:
/* 9DF08 0019DE08 D501023C */  lui        $2, %hi(MainCamera_2)
/* 9DF0C 0019DE0C B03A4424 */  addiu      $4, $2, %lo(MainCamera_2)
/* 9DF10 0019DE10 C092040C */  jal        FollowOn__13CCameraFollowFv
/* 9DF14 0019DE14 00000000 */   nop
/* 9DF18 0019DE18 AC92848F */  lw         $4, -0x6D54($gp)
/* 9DF1C 0019DE1C 2000A527 */  addiu      $5, $sp, 0x20
/* 9DF20 0019DE20 A000998C */  lw         $25, 0xA0($4)
/* 9DF24 0019DE24 A000398F */  lw         $25, 0xA0($25)
/* 9DF28 0019DE28 09F82003 */  jalr       $25
/* 9DF2C 0019DE2C 00000000 */   nop
/* 9DF30 0019DE30 6041023C */  lui        $2, (0x41600000 >> 16)
/* 9DF34 0019DE34 00088244 */  mtc1       $2, $f1
/* 9DF38 0019DE38 2400A0C7 */  lwc1       $f0, 0x24($sp)
/* 9DF3C 0019DE3C 400B0046 */  add.s      $f13, $f1, $f0
/* 9DF40 0019DE40 D501023C */  lui        $2, %hi(MainCamera_2)
/* 9DF44 0019DE44 B03A4424 */  addiu      $4, $2, %lo(MainCamera_2)
/* 9DF48 0019DE48 2000ACC7 */  lwc1       $f12, 0x20($sp)
/* 9DF4C 0019DE4C 2800AEC7 */  lwc1       $f14, 0x28($sp)
/* 9DF50 0019DE50 B892040C */  jal        SetFollow__13CCameraFollowFfff
/* 9DF54 0019DE54 00000000 */   nop
/* 9DF58 0019DE58 D501023C */  lui        $2, %hi(MainCamera_2)
/* 9DF5C 0019DE5C B03A4424 */  addiu      $4, $2, %lo(MainCamera_2)
/* 9DF60 0019DE60 2078060C */  jal        MoveCamera__FP13CCameraFollow_2
/* 9DF64 0019DE64 00000000 */   nop
.L0019DE68:
/* 9DF68 0019DE68 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9DF6C 0019DE6C 0C97248C */  lw         $4, -0x68F4($at)
/* 9DF70 0019DE70 07008018 */  blez       $4, .L0019DE90
/* 9DF74 0019DE74 00000000 */   nop
/* 9DF78 0019DE78 D501023C */  lui        $2, %hi(MainCamera_2)
/* 9DF7C 0019DE7C B03A4524 */  addiu      $5, $2, %lo(MainCamera_2)
/* 9DF80 0019DE80 406F060C */  jal        RunSystemEvent__FiP7CCamera_2
/* 9DF84 0019DE84 00000000 */   nop
/* 9DF88 0019DE88 77000010 */  b          .L0019E068
/* 9DF8C 0019DE8C 00000000 */   nop
.L0019DE90:
/* 9DF90 0019DE90 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9DF94 0019DE94 0897248C */  lw         $4, -0x68F8($at)
/* 9DF98 0019DE98 07008018 */  blez       $4, .L0019DEB8
/* 9DF9C 0019DE9C 00000000 */   nop
/* 9DFA0 0019DEA0 D501023C */  lui        $2, %hi(MainCamera_2)
/* 9DFA4 0019DEA4 B03A4524 */  addiu      $5, $2, %lo(MainCamera_2)
/* 9DFA8 0019DEA8 106F060C */  jal        RunEvent__FiP7CCamera_2
/* 9DFAC 0019DEAC 00000000 */   nop
/* 9DFB0 0019DEB0 6D000010 */  b          .L0019E068
/* 9DFB4 0019DEB4 00000000 */   nop
.L0019DEB8:
/* 9DFB8 0019DEB8 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9DFBC 0019DEBC 1097238C */  lw         $3, -0x68F0($at)
/* 9DFC0 0019DEC0 69006014 */  bnez       $3, .L0019E068
/* 9DFC4 0019DEC4 00000000 */   nop
/* 9DFC8 0019DEC8 40000424 */  addiu      $4, $0, 0x40
/* 9DFCC 0019DECC 01000524 */  addiu      $5, $0, 0x1
/* 9DFD0 0019DED0 64A6050C */  jal        EdPadDown__Fii
/* 9DFD4 0019DED4 00000000 */   nop
/* 9DFD8 0019DED8 63004010 */  beqz       $2, .L0019E068
/* 9DFDC 0019DEDC 00000000 */   nop
/* 9DFE0 0019DEE0 2700023C */  lui        $2, %hi(_1141)
/* 9DFE4 0019DEE4 70A64224 */  addiu      $2, $2, %lo(_1141)
/* 9DFE8 0019DEE8 4000A327 */  addiu      $3, $sp, 0x40
/* 9DFEC 0019DEEC 00004278 */  lq         $2, 0x0($2)
/* 9DFF0 0019DEF0 0000627C */  sq         $2, 0x0($3)
/* 9DFF4 0019DEF4 2700023C */  lui        $2, %hi(_1142)
/* 9DFF8 0019DEF8 80A64224 */  addiu      $2, $2, %lo(_1142)
/* 9DFFC 0019DEFC 5000A327 */  addiu      $3, $sp, 0x50
/* 9E000 0019DF00 00004278 */  lq         $2, 0x0($2)
/* 9E004 0019DF04 0000627C */  sq         $2, 0x0($3)
/* 9E008 0019DF08 AC92848F */  lw         $4, -0x6D54($gp)
/* 9E00C 0019DF0C 3000A527 */  addiu      $5, $sp, 0x30
/* 9E010 0019DF10 A000998C */  lw         $25, 0xA0($4)
/* 9E014 0019DF14 A000398F */  lw         $25, 0xA0($25)
/* 9E018 0019DF18 09F82003 */  jalr       $25
/* 9E01C 0019DF1C 00000000 */   nop
/* 9E020 0019DF20 AC92848F */  lw         $4, -0x6D54($gp)
/* 9E024 0019DF24 5000A527 */  addiu      $5, $sp, 0x50
/* 9E028 0019DF28 A000998C */  lw         $25, 0xA0($4)
/* 9E02C 0019DF2C 5800398F */  lw         $25, 0x58($25)
/* 9E030 0019DF30 09F82003 */  jalr       $25
/* 9E034 0019DF34 00000000 */   nop
/* 9E038 0019DF38 3000A427 */  addiu      $4, $sp, 0x30
/* 9E03C 0019DF3C 5000A527 */  addiu      $5, $sp, 0x50
/* 9E040 0019DF40 7C78060C */  jal        SearchMapJump__FPfPf
/* 9E044 0019DF44 00000000 */   nop
/* 9E048 0019DF48 28864070 */  paddub     $16, $2, $0
/* 9E04C 0019DF4C 46004010 */  beqz       $2, .L0019E068
/* 9E050 0019DF50 00000000 */   nop
/* 9E054 0019DF54 F4A7050C */  jal        EdMoveCharaInit__Fv
/* 9E058 0019DF58 00000000 */   nop
/* 9E05C 0019DF5C 6C00A0AF */  sw         $0, 0x6C($sp)
/* 9E060 0019DF60 8C000224 */  addiu      $2, $0, 0x8C
/* 9E064 0019DF64 A49282AF */  sw         $2, -0x6D5C($gp)
/* 9E068 0019DF68 08000012 */  beqz       $16, .L0019DF8C
/* 9E06C 0019DF6C 00000000 */   nop
/* 9E070 0019DF70 2000048E */  lw         $4, 0x20($16)
/* 9E074 0019DF74 3000A527 */  addiu      $5, $sp, 0x30
/* 9E078 0019DF78 5000A627 */  addiu      $6, $sp, 0x50
/* 9E07C 0019DF7C 38908727 */  addiu      $7, $gp, -0x6FC8
/* 9E080 0019DF80 6C00A827 */  addiu      $8, $sp, 0x6C
/* 9E084 0019DF84 0879060C */  jal        GetDoorPos__FiPfPfPiPi
/* 9E088 0019DF88 00000000 */   nop
.L0019DF8C:
/* 9E08C 0019DF8C 6C00A28F */  lw         $2, 0x6C($sp)
/* 9E090 0019DF90 AC92838F */  lw         $3, -0x6D54($gp)
/* 9E094 0019DF94 680C62AC */  sw         $2, 0xC68($3)
/* 9E098 0019DF98 06000224 */  addiu      $2, $0, 0x6
/* 9E09C 0019DF9C 640C62AC */  sw         $2, 0xC64($3)
/* 9E0A0 0019DFA0 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 9E0A4 0019DFA4 600C62AC */  sw         $2, 0xC60($3)
/* 9E0A8 0019DFA8 D501023C */  lui        $2, %hi(fix_chara_pos_2)
/* 9E0AC 0019DFAC D0D54424 */  addiu      $4, $2, %lo(fix_chara_pos_2)
/* 9E0B0 0019DFB0 3000A527 */  addiu      $5, $sp, 0x30
/* 9E0B4 0019DFB4 0C86040C */  jal        sceVu0CopyVector
/* 9E0B8 0019DFB8 00000000 */   nop
/* 9E0BC 0019DFBC D501023C */  lui        $2, %hi(fix_chara_rot_2)
/* 9E0C0 0019DFC0 E0D54424 */  addiu      $4, $2, %lo(fix_chara_rot_2)
/* 9E0C4 0019DFC4 5000A527 */  addiu      $5, $sp, 0x50
/* 9E0C8 0019DFC8 0C86040C */  jal        sceVu0CopyVector
/* 9E0CC 0019DFCC 00000000 */   nop
/* 9E0D0 0019DFD0 AC92848F */  lw         $4, -0x6D54($gp)
/* 9E0D4 0019DFD4 D501023C */  lui        $2, %hi(fix_chara_pos_2)
/* 9E0D8 0019DFD8 D0D54524 */  addiu      $5, $2, %lo(fix_chara_pos_2)
/* 9E0DC 0019DFDC A000998C */  lw         $25, 0xA0($4)
/* 9E0E0 0019DFE0 1400398F */  lw         $25, 0x14($25)
/* 9E0E4 0019DFE4 09F82003 */  jalr       $25
/* 9E0E8 0019DFE8 00000000 */   nop
/* 9E0EC 0019DFEC AC92848F */  lw         $4, -0x6D54($gp)
/* 9E0F0 0019DFF0 D501013C */  lui        $at, (0x1D50000 >> 16)
/* 9E0F4 0019DFF4 E0D52CC4 */  lwc1       $f12, -0x2A20($at)
/* 9E0F8 0019DFF8 D501013C */  lui        $at, (0x1D50000 >> 16)
/* 9E0FC 0019DFFC E4D52DC4 */  lwc1       $f13, -0x2A1C($at)
/* 9E100 0019E000 D501013C */  lui        $at, (0x1D50000 >> 16)
/* 9E104 0019E004 E8D52EC4 */  lwc1       $f14, -0x2A18($at)
/* 9E108 0019E008 A000998C */  lw         $25, 0xA0($4)
/* 9E10C 0019E00C 3000398F */  lw         $25, 0x30($25)
/* 9E110 0019E010 09F82003 */  jalr       $25
/* 9E114 0019E014 00000000 */   nop
/* 9E118 0019E018 AC92848F */  lw         $4, -0x6D54($gp)
/* 9E11C 0019E01C A000998C */  lw         $25, 0xA0($4)
/* 9E120 0019E020 0800398F */  lw         $25, 0x8($25)
/* 9E124 0019E024 09F82003 */  jalr       $25
/* 9E128 0019E028 00000000 */   nop
/* 9E12C 0019E02C AC92848F */  lw         $4, -0x6D54($gp)
/* 9E130 0019E030 FFFF0524 */  addiu      $5, $0, -0x1
/* 9E134 0019E034 A000998C */  lw         $25, 0xA0($4)
/* 9E138 0019E038 9400398F */  lw         $25, 0x94($25)
/* 9E13C 0019E03C 09F82003 */  jalr       $25
/* 9E140 0019E040 00000000 */   nop
/* 9E144 0019E044 01000224 */  addiu      $2, $0, 0x1
/* 9E148 0019E048 949282AF */  sw         $2, -0x6D6C($gp)
/* 9E14C 0019E04C 00608044 */  mtc1       $0, $f12
/* 9E150 0019E050 00000000 */  nop
/* 9E154 0019E054 46630046 */  mov.s      $f13, $f12
/* 9E158 0019E058 86630046 */  mov.s      $f14, $f12
/* 9E15C 0019E05C 64000424 */  addiu      $4, $0, 0x64
/* 9E160 0019E060 E425060C */  jal        EdFadeOut__Fifff
/* 9E164 0019E064 00000000 */   nop
.L0019E068:
/* 9E168 0019E068 1000BF7B */  lq         $31, 0x10($sp)
/* 9E16C 0019E06C 0000B07B */  lq         $16, 0x0($sp)
/* 9E170 0019E070 7000BD27 */  addiu      $sp, $sp, 0x70
/* 9E174 0019E074 0800E003 */  jr         $31
/* 9E178 0019E078 00000000 */   nop
/* 9E17C 0019E07C 00000000 */  nop
