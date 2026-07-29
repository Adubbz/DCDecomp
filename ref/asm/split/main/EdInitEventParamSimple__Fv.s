.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdInitEventParamSimple__Fv
/* 097000 00196F00 E0FFBD27 */  addiu       $29, $29, -0x20
/* 097004 00196F04 1000BF7F */  sq          $31, 0x10($29)
/* 097008 00196F08 0000B07F */  sq          $16, 0x0($29)
/* 09700C 00196F0C FFFF0224 */  addiu       $2, $0, -0x1
/* 097010 00196F10 D401013C */  lui         $1, %hi(EdEventInfo + 0x444)
/* 097014 00196F14 14D622AC */  sw          $2, %lo(EdEventInfo + 0x444)($1)
/* 097018 00196F18 D401013C */  lui         $1, %hi(EdEventInfo + 0x440)
/* 09701C 00196F1C 10D622AC */  sw          $2, %lo(EdEventInfo + 0x440)($1)
/* 097020 00196F20 D401013C */  lui         $1, %hi(EdEventInfo + 0x2AC)
/* 097024 00196F24 7CD422AC */  sw          $2, %lo(EdEventInfo + 0x2AC)($1)
/* 097028 00196F28 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 09702C 00196F2C D401013C */  lui         $1, %hi(EdEventInfo + 0x3C)
/* 097030 00196F30 0CD222AC */  sw          $2, %lo(EdEventInfo + 0x3C)($1)
/* 097034 00196F34 D401013C */  lui         $1, %hi(EdEventInfo + 0x448)
/* 097038 00196F38 18D620AC */  sw          $0, %lo(EdEventInfo + 0x448)($1)
/* 09703C 00196F3C 249280AF */  sw          $0, -0x6DDC($28)
/* 097040 00196F40 289280AF */  sw          $0, -0x6DD8($28)
/* 097044 00196F44 D401013C */  lui         $1, %hi(CurrentDir__4)
/* 097048 00196F48 A0EE20A0 */  sb          $0, %lo(CurrentDir__4)($1)
/* 09704C 00196F4C 5C9280AF */  sw          $0, -0x6DA4($28)
/* 097050 00196F50 609280AF */  sw          $0, -0x6DA0($28)
/* 097054 00196F54 489280AF */  sw          $0, -0x6DB8($28)
/* 097058 00196F58 4C9280AF */  sw          $0, -0x6DB4($28)
/* 09705C 00196F5C 509280AF */  sw          $0, -0x6DB0($28)
/* 097060 00196F60 549280AF */  sw          $0, -0x6DAC($28)
/* 097064 00196F64 D401013C */  lui         $1, %hi(sync_camera_ref_offset)
/* 097068 00196F68 80EF20AC */  sw          $0, %lo(sync_camera_ref_offset)($1)
/* 09706C 00196F6C D401013C */  lui         $1, %hi(sync_camera_ref_offset + 0x4)
/* 097070 00196F70 84EF20AC */  sw          $0, %lo(sync_camera_ref_offset + 0x4)($1)
/* 097074 00196F74 D401013C */  lui         $1, %hi(sync_camera_ref_offset + 0x8)
/* 097078 00196F78 88EF20AC */  sw          $0, %lo(sync_camera_ref_offset + 0x8)($1)
/* 09707C 00196F7C D401013C */  lui         $1, %hi(EdEventInfo + 0x5C)
/* 097080 00196F80 2CD220AC */  sw          $0, %lo(EdEventInfo + 0x5C)($1)
/* 097084 00196F84 01000224 */  addiu       $2, $0, 0x1
/* 097088 00196F88 D401013C */  lui         $1, %hi(EdEventInfo + 0x60)
/* 09708C 00196F8C 30D222AC */  sw          $2, %lo(EdEventInfo + 0x60)($1)
/* 097090 00196F90 D401013C */  lui         $1, %hi(EdEventInfo + 0x64)
/* 097094 00196F94 34D222AC */  sw          $2, %lo(EdEventInfo + 0x64)($1)
/* 097098 00196F98 D401013C */  lui         $1, %hi(EdEventInfo + 0x68)
/* 09709C 00196F9C 38D222AC */  sw          $2, %lo(EdEventInfo + 0x68)($1)
/* 0970A0 00196FA0 D401013C */  lui         $1, %hi(EdEventInfo + 0x6C)
/* 0970A4 00196FA4 3CD220AC */  sw          $0, %lo(EdEventInfo + 0x6C)($1)
/* 0970A8 00196FA8 28860070 */  paddub      $16, $0, $0
/* 0970AC 00196FAC 1C000010 */  b           .L00197020
/* 0970B0 00196FB0 00000000 */   nop
.L00196FB4:
/* 0970B4 00196FB4 80201000 */  sll         $4, $16, 2
/* 0970B8 00196FB8 D401023C */  lui         $2, %hi(EdEventInfo + 0x74)
/* 0970BC 00196FBC 44D24224 */  addiu       $2, $2, %lo(EdEventInfo + 0x74)
/* 0970C0 00196FC0 21104400 */  addu        $2, $2, $4
/* 0970C4 00196FC4 000040AC */  sw          $0, 0x0($2)
/* 0970C8 00196FC8 01000324 */  addiu       $3, $0, 0x1
/* 0970CC 00196FCC D401023C */  lui         $2, %hi(EdEventInfo + 0xB4)
/* 0970D0 00196FD0 84D24224 */  addiu       $2, $2, %lo(EdEventInfo + 0xB4)
/* 0970D4 00196FD4 21104400 */  addu        $2, $2, $4
/* 0970D8 00196FD8 000043AC */  sw          $3, 0x0($2)
/* 0970DC 00196FDC D401023C */  lui         $2, %hi(EdEventInfo + 0xF4)
/* 0970E0 00196FE0 C4D24224 */  addiu       $2, $2, %lo(EdEventInfo + 0xF4)
/* 0970E4 00196FE4 21104400 */  addu        $2, $2, $4
/* 0970E8 00196FE8 000043AC */  sw          $3, 0x0($2)
/* 0970EC 00196FEC D401023C */  lui         $2, %hi(EdEventInfo + 0x134)
/* 0970F0 00196FF0 04D34224 */  addiu       $2, $2, %lo(EdEventInfo + 0x134)
/* 0970F4 00196FF4 21104400 */  addu        $2, $2, $4
/* 0970F8 00196FF8 000043AC */  sw          $3, 0x0($2)
/* 0970FC 00196FFC D401023C */  lui         $2, %hi(EdEventInfo + 0x174)
/* 097100 00197000 44D34224 */  addiu       $2, $2, %lo(EdEventInfo + 0x174)
/* 097104 00197004 21104400 */  addu        $2, $2, $4
/* 097108 00197008 000040AC */  sw          $0, 0x0($2)
/* 09710C 0019700C D401023C */  lui         $2, %hi(EdEventInfo + 0x1B4)
/* 097110 00197010 84D34224 */  addiu       $2, $2, %lo(EdEventInfo + 0x1B4)
/* 097114 00197014 21104400 */  addu        $2, $2, $4
/* 097118 00197018 000040AC */  sw          $0, 0x0($2)
/* 09711C 0019701C 01001026 */  addiu       $16, $16, 0x1
.L00197020:
/* 097120 00197020 1000022A */  slti        $2, $16, 0x10
/* 097124 00197024 E3FF4014 */  bnez        $2, .L00196FB4
/* 097128 00197028 00000000 */   nop
/* 09712C 0019702C 28860070 */  paddub      $16, $0, $0
/* 097130 00197030 0B000010 */  b           .L00197060
/* 097134 00197034 00000000 */   nop
.L00197038:
/* 097138 00197038 40191000 */  sll         $3, $16, 5
/* 09713C 0019703C D401023C */  lui         $2, %hi(asq_table)
/* 097140 00197040 10F04224 */  addiu       $2, $2, %lo(asq_table)
/* 097144 00197044 21104300 */  addu        $2, $2, $3
/* 097148 00197048 000040AC */  sw          $0, 0x0($2)
/* 09714C 0019704C D401023C */  lui         $2, %hi(asq_table + 0xC)
/* 097150 00197050 1CF04224 */  addiu       $2, $2, %lo(asq_table + 0xC)
/* 097154 00197054 21104300 */  addu        $2, $2, $3
/* 097158 00197058 000040AC */  sw          $0, 0x0($2)
/* 09715C 0019705C 01001026 */  addiu       $16, $16, 0x1
.L00197060:
/* 097160 00197060 0A01022A */  slti        $2, $16, 0x10A
/* 097164 00197064 F4FF4014 */  bnez        $2, .L00197038
/* 097168 00197068 00000000 */   nop
/* 09716C 0019706C 28860070 */  paddub      $16, $0, $0
/* 097170 00197070 0F000010 */  b           .L001970B0
/* 097174 00197074 00000000 */   nop
.L00197078:
/* 097178 00197078 40101000 */  sll         $2, $16, 1
/* 09717C 0019707C 21105000 */  addu        $2, $2, $16
/* 097180 00197080 80100200 */  sll         $2, $2, 2
/* 097184 00197084 21105000 */  addu        $2, $2, $16
/* 097188 00197088 00190200 */  sll         $3, $2, 4
/* 09718C 0019708C D401023C */  lui         $2, %hi(ActSeq)
/* 097190 00197090 50114224 */  addiu       $2, $2, %lo(ActSeq)
/* 097194 00197094 21204300 */  addu        $4, $2, $3
/* 097198 00197098 D401023C */  lui         $2, %hi(asq_table)
/* 09719C 0019709C 10F04524 */  addiu       $5, $2, %lo(asq_table)
/* 0971A0 001970A0 0A010624 */  addiu       $6, $0, 0x10A
/* 0971A4 001970A4 CC52050C */  jal         Initialize__10CActionSeqFP7ACT_SEQi
/* 0971A8 001970A8 00000000 */   nop
/* 0971AC 001970AC 01001026 */  addiu       $16, $16, 0x1
.L001970B0:
/* 0971B0 001970B0 0A00022A */  slti        $2, $16, 0xA
/* 0971B4 001970B4 F0FF4014 */  bnez        $2, .L00197078
/* 0971B8 001970B8 00000000 */   nop
/* 0971BC 001970BC D501023C */  lui         $2, %hi(SpriteTable)
/* 0971C0 001970C0 708E4424 */  addiu       $4, $2, %lo(SpriteTable)
/* 0971C4 001970C4 D501023C */  lui         $2, %hi(sprite_table)
/* 0971C8 001970C8 70874524 */  addiu       $5, $2, %lo(sprite_table)
/* 0971CC 001970CC 20000624 */  addiu       $6, $0, 0x20
/* 0971D0 001970D0 04000724 */  addiu       $7, $0, 0x4
/* 0971D4 001970D4 18B0040C */  jal         Initialize__12CSpriteTableFP12SPRITE_TABLEii
/* 0971D8 001970D8 00000000 */   nop
/* 0971DC 001970DC D501023C */  lui         $2, %hi(SpriteTable)
/* 0971E0 001970E0 708E4424 */  addiu       $4, $2, %lo(SpriteTable)
/* 0971E4 001970E4 3CB0040C */  jal         ClearPointer__12CSpriteTableFv
/* 0971E8 001970E8 00000000 */   nop
/* 0971EC 001970EC D501023C */  lui         $2, %hi(SpriteTableBack)
/* 0971F0 001970F0 108F4424 */  addiu       $4, $2, %lo(SpriteTableBack)
/* 0971F4 001970F4 D501023C */  lui         $2, %hi(sprite_table)
/* 0971F8 001970F8 70874524 */  addiu       $5, $2, %lo(sprite_table)
/* 0971FC 001970FC 20000624 */  addiu       $6, $0, 0x20
/* 097200 00197100 04000724 */  addiu       $7, $0, 0x4
/* 097204 00197104 18B0040C */  jal         Initialize__12CSpriteTableFP12SPRITE_TABLEii
/* 097208 00197108 00000000 */   nop
/* 09720C 0019710C D501023C */  lui         $2, %hi(SpriteTableBack)
/* 097210 00197110 108F4424 */  addiu       $4, $2, %lo(SpriteTableBack)
/* 097214 00197114 3CB0040C */  jal         ClearPointer__12CSpriteTableFv
/* 097218 00197118 00000000 */   nop
/* 09721C 0019711C 2D001024 */  addiu       $16, $0, 0x2D
/* 097220 00197120 07000010 */  b           .L00197140
/* 097224 00197124 00000000 */   nop
.L00197128:
/* 097228 00197128 C701023C */  lui         $2, %hi(TexManager)
/* 09722C 0019712C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 097230 00197130 282E0072 */  paddub      $5, $16, $0
/* 097234 00197134 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 097238 00197138 00000000 */   nop
/* 09723C 0019713C 01001026 */  addiu       $16, $16, 0x1
.L00197140:
/* 097240 00197140 3200012A */  slti        $1, $16, 0x32
/* 097244 00197144 F8FF2014 */  bnez        $1, .L00197128
/* 097248 00197148 00000000 */   nop
/* 09724C 0019714C D401023C */  lui         $2, %hi(ObjHandle)
/* 097250 00197150 20D64424 */  addiu       $4, $2, %lo(ObjHandle)
/* 097254 00197154 282E0070 */  paddub      $5, $0, $0
/* 097258 00197158 00070624 */  addiu       $6, $0, 0x700
/* 09725C 0019715C 5A0D040C */  jal         memset
/* 097260 00197160 00000000 */   nop
/* 097264 00197164 389280AF */  sw          $0, -0x6DC8($28)
/* 097268 00197168 3C9280AF */  sw          $0, -0x6DC4($28)
/* 09726C 0019716C 28860070 */  paddub      $16, $0, $0
/* 097270 00197170 07000010 */  b           .L00197190
/* 097274 00197174 00000000 */   nop
.L00197178:
/* 097278 00197178 80181000 */  sll         $3, $16, 2
/* 09727C 0019717C D401023C */  lui         $2, %hi(EdEventInfo + 0x25C)
/* 097280 00197180 2CD44224 */  addiu       $2, $2, %lo(EdEventInfo + 0x25C)
/* 097284 00197184 21104300 */  addu        $2, $2, $3
/* 097288 00197188 000040AC */  sw          $0, 0x0($2)
/* 09728C 0019718C 01001026 */  addiu       $16, $16, 0x1
.L00197190:
/* 097290 00197190 F9FF001A */  blez        $16, .L00197178
/* 097294 00197194 00000000 */   nop
/* 097298 00197198 D501023C */  lui         $2, %hi(SceneData)
/* 09729C 0019719C B08F4424 */  addiu       $4, $2, %lo(SceneData)
/* 0972A0 001971A0 74E6040C */  jal         Initialize__10CCharacterFv
/* 0972A4 001971A4 00000000 */   nop
/* 0972A8 001971A8 28860070 */  paddub      $16, $0, $0
/* 0972AC 001971AC 0A000010 */  b           .L001971D8
/* 0972B0 001971B0 00000000 */   nop
.L001971B4:
/* 0972B4 001971B4 28260072 */  paddub      $4, $16, $0
/* 0972B8 001971B8 5428060C */  jal         GetSprite__Fi
/* 0972BC 001971BC 00000000 */   nop
/* 0972C0 001971C0 08004010 */  beqz        $2, .L001971E4
/* 0972C4 001971C4 00000000 */   nop
/* 0972C8 001971C8 28264070 */  paddub      $4, $2, $0
/* 0972CC 001971CC 6428060C */  jal         InitSprite__FP9ED_SPRITE
/* 0972D0 001971D0 00000000 */   nop
/* 0972D4 001971D4 01001026 */  addiu       $16, $16, 0x1
.L001971D8:
/* 0972D8 001971D8 1000022A */  slti        $2, $16, 0x10
/* 0972DC 001971DC F5FF4014 */  bnez        $2, .L001971B4
/* 0972E0 001971E0 00000000 */   nop
.L001971E4:
/* 0972E4 001971E4 FFFF0424 */  addiu       $4, $0, -0x1
/* 0972E8 001971E8 8C28060C */  jal         ClearObjAnime__Fi
/* 0972EC 001971EC 00000000 */   nop
/* 0972F0 001971F0 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 0972F4 001971F4 D401013C */  lui         $1, %hi(EdEventInfo + 0x23C)
/* 0972F8 001971F8 0CD422AC */  sw          $2, %lo(EdEventInfo + 0x23C)($1)
/* 0972FC 001971FC D401013C */  lui         $1, %hi(EdEventInfo + 0x38)
/* 097300 00197200 08D220AC */  sw          $0, %lo(EdEventInfo + 0x38)($1)
/* 097304 00197204 01000224 */  addiu       $2, $0, 0x1
/* 097308 00197208 1000BF7B */  lq          $31, 0x10($29)
/* 09730C 0019720C 0000B07B */  lq          $16, 0x0($29)
/* 097310 00197210 2000BD27 */  addiu       $29, $29, 0x20
/* 097314 00197214 0800E003 */  jr          $31
/* 097318 00197218 00000000 */   nop
/* 09731C 0019721C 00000000 */  nop
