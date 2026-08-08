.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel two_over_pi
/* 198260 00298160 83F9A200 */ .word GlobalDataBuffer + 0x784903
/* 198264 00298164 444E6E00 */ .word GlobalDataBuffer + 0x439DC4
/* 198268 00298168 FC291500 */ .word 0x001529FC
/* 19826C 0029816C D1572700 */ .word ItemPutListTbl12 + 0x41
/* 198270 00298170 DD34F500 */ .word GlobalDataBuffer + 0xCA845D
/* 198274 00298174 62DBC000 */ .word GlobalDataBuffer + 0x962AE2
/* 198278 00298178 3C999500 */ .word GlobalDataBuffer + 0x6AE8BC
/* 19827C 0029817C 41904300 */ .word GlobalDataBuffer + 0x18DFC1
/* 198280 00298180 6351FE00 */ .word GlobalDataBuffer + 0xD3A0E3
/* 198284 00298184 BBDEAB00 */ .word GlobalDataBuffer + 0x812E3B
/* 198288 00298188 B761C500 */ .word GlobalDataBuffer + 0x9AB137
/* 19828C 0029818C 3A6E2400 */ .word 0x00246E3A
/* 198290 00298190 D24D4200 */ .word GlobalDataBuffer + 0x179D52
/* 198294 00298194 4906E000 */ .word GlobalDataBuffer + 0xB555C9
/* 198298 00298198 09EA2E00 */ .word GlobalDataBuffer + 0x43989
/* 19829C 0029819C 1C92D100 */ .word GlobalDataBuffer + 0xA6E19C
/* 1982A0 002981A0 EB1DFE00 */ .word GlobalDataBuffer + 0xD36D6B
/* 1982A4 002981A4 29B11C00 */ .word 0x001CB129
/* 1982A8 002981A8 E83EA700 */ .word GlobalDataBuffer + 0x7C8E68
/* 1982AC 002981AC F5358200 */ .word GlobalDataBuffer + 0x578575
/* 1982B0 002981B0 44BB2E00 */ .word GlobalDataBuffer + 0x40AC4
/* 1982B4 002981B4 9CE98400 */ .word GlobalDataBuffer + 0x5A391C
/* 1982B8 002981B8 B4267000 */ .word GlobalDataBuffer + 0x457634
/* 1982BC 002981BC 417E5F00 */ .word GlobalDataBuffer + 0x34CDC1
/* 1982C0 002981C0 D6913900 */ .word GlobalDataBuffer + 0xEE156
/* 1982C4 002981C4 53833900 */ .word GlobalDataBuffer + 0xED2D3
/* 1982C8 002981C8 9CF43900 */ .word GlobalDataBuffer + 0xF441C
/* 1982CC 002981CC 8B5F8400 */ .word GlobalDataBuffer + 0x59AF0B
/* 1982D0 002981D0 28F9BD00 */ .word GlobalDataBuffer + 0x9348A8
/* 1982D4 002981D4 F81F3B00 */ .word GlobalDataBuffer + 0x106F78
/* 1982D8 002981D8 DEFF9700 */ .word GlobalDataBuffer + 0x6D4F5E
/* 1982DC 002981DC 0F980500 */ .word 0x0005980F
/* 1982E0 002981E0 112FEF00 */ .word GlobalDataBuffer + 0xC47E91
/* 1982E4 002981E4 0A5A8B00 */ .word GlobalDataBuffer + 0x60A98A
/* 1982E8 002981E8 6D1F6D00 */ .word GlobalDataBuffer + 0x426EED
/* 1982EC 002981EC CF7E3600 */ .word GlobalDataBuffer + 0xBCE4F
/* 1982F0 002981F0 09CB2700 */ .word AttachList + 0xA9
/* 1982F4 002981F4 464FB700 */ .word GlobalDataBuffer + 0x8C9EC6
/* 1982F8 002981F8 9E663F00 */ .word GlobalDataBuffer + 0x14B61E
/* 1982FC 002981FC 2DEA5F00 */ .word GlobalDataBuffer + 0x3539AD
/* 198300 00298200 BA277500 */ .word GlobalDataBuffer + 0x4A773A
/* 198304 00298204 E5EBC700 */ .word GlobalDataBuffer + 0x9D3B65
/* 198308 00298208 3D7BF100 */ .word GlobalDataBuffer + 0xC6CABD
/* 19830C 0029820C F7390700 */ .word 0x000739F7
/* 198310 00298210 92528A00 */ .word GlobalDataBuffer + 0x5FA212
/* 198314 00298214 FB6BEA00 */ .word GlobalDataBuffer + 0xBFBB7B
/* 198318 00298218 1FB15F00 */ .word GlobalDataBuffer + 0x35009F
/* 19831C 0029821C 085D8D00 */ .word GlobalDataBuffer + 0x62AC88
/* 198320 00298220 30035600 */ .word GlobalDataBuffer + 0x2B52B0
/* 198324 00298224 7BFC4600 */ .word GlobalDataBuffer + 0x1C4BFB
/* 198328 00298228 F0AB6B00 */ .word GlobalDataBuffer + 0x40FB70
/* 19832C 0029822C 20BCCF00 */ .word GlobalDataBuffer + 0xA50BA0
/* 198330 00298230 36F49A00 */ .word GlobalDataBuffer + 0x7043B6
/* 198334 00298234 E3A91D00 */ .word 0x001DA9E3
/* 198338 00298238 5E619100 */ .word GlobalDataBuffer + 0x66B0DE
/* 19833C 0029823C 081BE600 */ .word GlobalDataBuffer + 0xBB6A88
/* 198340 00298240 85996500 */ .word GlobalDataBuffer + 0x3AE905
/* 198344 00298244 A0145F00 */ .word GlobalDataBuffer + 0x346420
/* 198348 00298248 8D406800 */ .word GlobalDataBuffer + 0x3D900D
/* 19834C 0029824C 80D8FF00 */ .word GlobalDataBuffer + 0xD52800
/* 198350 00298250 27734D00 */ .word GlobalDataBuffer + 0x22C2A7
/* 198354 00298254 06063100 */ .word GlobalDataBuffer + 0x65586
/* 198358 00298258 CA561500 */ .word 0x001556CA
/* 19835C 0029825C C9A87300 */ .word GlobalDataBuffer + 0x48F849
/* 198360 00298260 7BE26000 */ .word GlobalDataBuffer + 0x3631FB
/* 198364 00298264 6B8CC000 */ .word GlobalDataBuffer + 0x95DBEB
