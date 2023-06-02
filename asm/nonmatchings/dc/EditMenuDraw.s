.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EditMenuDraw__Fv
/* 1110B0 00210FB0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 1110B4 00210FB4 1000BF7F */  sq         $31, 0x10($sp)
/* 1110B8 00210FB8 0000B07F */  sq         $16, 0x0($sp)
/* 1110BC 00210FBC 4096848F */  lw         $4, -0x69C0($gp)
/* 1110C0 00210FC0 38B4080C */  jal        MenuTextureReload__Fi
/* 1110C4 00210FC4 00000000 */   nop
/* 1110C8 00210FC8 28260070 */  paddub     $4, $0, $0
/* 1110CC 00210FCC 046F050C */  jal        setbilinear__Fi
/* 1110D0 00210FD0 00000000 */   nop
/* 1110D4 00210FD4 58968487 */  lh         $4, -0x69A8($gp)
/* 1110D8 00210FD8 80000524 */  addiu      $5, $0, 0x80
/* 1110DC 00210FDC ACB4080C */  jal        FrameImageDraw__Fii
/* 1110E0 00210FE0 00000000 */   nop
/* 1110E4 00210FE4 5496848F */  lw         $4, -0x69AC($gp)
/* 1110E8 00210FE8 1600812C */  sltiu      $at, $4, 0x16
/* 1110EC 00210FEC 32002010 */  beqz       $at, .L002110B8
/* 1110F0 00210FF0 00000000 */   nop
/* 1110F4 00210FF4 2A00023C */  lui        $2, %hi(_536)
/* 1110F8 00210FF8 80E34324 */  addiu      $3, $2, %lo(_536)
/* 1110FC 00210FFC 80100400 */  sll        $2, $4, 2
/* 111100 00211000 21104300 */  addu       $2, $2, $3
/* 111104 00211004 0000428C */  lw         $2, 0x0($2)
/* 111108 00211008 08004000 */  jr         $2
/* 11110C 0021100C 00000000 */   nop
/* 111110 00211010 B044080C */  jal        EditMenuStart__Fv
/* 111114 00211014 00000000 */   nop
/* 111118 00211018 27000010 */  b          .L002110B8
/* 11111C 0021101C 00000000 */   nop
/* 111120 00211020 E045080C */  jal        EditMenuSelectDraw__Fv
/* 111124 00211024 00000000 */   nop
/* 111128 00211028 23000010 */  b          .L002110B8
/* 11112C 0021102C 00000000 */   nop
/* 111130 00211030 704A080C */  jal        ToAnalyzeEditDraw__Fv
/* 111134 00211034 00000000 */   nop
/* 111138 00211038 1F000010 */  b          .L002110B8
/* 11113C 0021103C 00000000 */   nop
/* 111140 00211040 3448080C */  jal        AtoraMoveDraw__Fv
/* 111144 00211044 00000000 */   nop
/* 111148 00211048 1B000010 */  b          .L002110B8
/* 11114C 0021104C 00000000 */   nop
/* 111150 00211050 584B080C */  jal        AnalyzeEditDraw__Fv
/* 111154 00211054 00000000 */   nop
/* 111158 00211058 17000010 */  b          .L002110B8
/* 11115C 0021105C 00000000 */   nop
/* 111160 00211060 E04B080C */  jal        FromAnalyzeEditDraw__Fv
/* 111164 00211064 00000000 */   nop
/* 111168 00211068 13000010 */  b          .L002110B8
/* 11116C 0021106C 00000000 */   nop
/* 111170 00211070 AC47080C */  jal        AtoraSelectDraw__Fv
/* 111174 00211074 00000000 */   nop
/* 111178 00211078 0F000010 */  b          .L002110B8
/* 11117C 0021107C 00000000 */   nop
/* 111180 00211080 204C080C */  jal        EditSaveDraw__Fv
/* 111184 00211084 00000000 */   nop
/* 111188 00211088 0B000010 */  b          .L002110B8
/* 11118C 0021108C 00000000 */   nop
/* 111190 00211090 784C080C */  jal        OptionDraw__Fv
/* 111194 00211094 00000000 */   nop
/* 111198 00211098 07000010 */  b          .L002110B8
/* 11119C 0021109C 00000000 */   nop
/* 1111A0 002110A0 144D080C */  jal        EdMenuManualDraw__Fv
/* 1111A4 002110A4 00000000 */   nop
/* 1111A8 002110A8 03000010 */  b          .L002110B8
/* 1111AC 002110AC 00000000 */   nop
/* 1111B0 002110B0 5047080C */  jal        EditMenuToExitDraw__Fv
/* 1111B4 002110B4 00000000 */   nop
.L002110B8:
/* 1111B8 002110B8 F896828F */  lw         $2, -0x6908($gp)
/* 1111BC 002110BC 01004224 */  addiu      $2, $2, 0x1
/* 1111C0 002110C0 F89682AF */  sw         $2, -0x6908($gp)
/* 1111C4 002110C4 F896838F */  lw         $3, -0x6908($gp)
/* 1111C8 002110C8 5F40023C */  lui        $2, (0x405F7E00 >> 16)
/* 1111CC 002110CC 007E4234 */  ori        $2, $2, (0x405F7E00 & 0xFFFF)
/* 1111D0 002110D0 2A106200 */  slt        $2, $3, $2
/* 1111D4 002110D4 02004014 */  bnez       $2, .L002110E0
/* 1111D8 002110D8 00000000 */   nop
/* 1111DC 002110DC F89680AF */  sw         $0, -0x6908($gp)
.L002110E0:
/* 1111E0 002110E0 DA01013C */  lui        $at, (0x1DA3A9C >> 16)
/* 1111E4 002110E4 9C3A248C */  lw         $4, (0x1DA3A9C & 0xFFFF)($at)
/* 1111E8 002110E8 38B4080C */  jal        MenuTextureReload__Fi
/* 1111EC 002110EC 00000000 */   nop
/* 1111F0 002110F0 2800A427 */  addiu      $4, $sp, 0x28
/* 1111F4 002110F4 2C00A527 */  addiu      $5, $sp, 0x2C
/* 1111F8 002110F8 F0B8080C */  jal        GetMainMenuRightHelpMsgLangOffset__FRiRi
/* 1111FC 002110FC 00000000 */   nop
/* 111200 00211100 80968427 */  addiu      $4, $gp, -0x6980
/* 111204 00211104 84968527 */  addiu      $5, $gp, -0x697C
/* 111208 00211108 88968627 */  addiu      $6, $gp, -0x6978
/* 11120C 0021110C 8C968727 */  addiu      $7, $gp, -0x6974
/* 111210 00211110 C4B8080C */  jal        GetMainMenuRightHelpWinLangOffset__FRfRfRfRf
/* 111214 00211114 00000000 */   nop
/* 111218 00211118 809681C7 */  lwc1       $f1, -0x6980($gp)
/* 11121C 0021111C 2800A0C7 */  lwc1       $f0, 0x28($sp)
/* 111220 00211120 20008046 */  cvt.s.w    $f0, $f0
/* 111224 00211124 000B0046 */  add.s      $f12, $f1, $f0
/* 111228 00211128 2C44040C */  jal        fptosi
/* 11122C 0021112C 00000000 */   nop
/* 111230 00211130 DA01013C */  lui        $at, (0x1DA2350 >> 16)
/* 111234 00211134 502322AC */  sw         $2, (0x1DA2350 & 0xFFFF)($at)
/* 111238 00211138 849681C7 */  lwc1       $f1, -0x697C($gp)
/* 11123C 0021113C 2C00A0C7 */  lwc1       $f0, 0x2C($sp)
/* 111240 00211140 20008046 */  cvt.s.w    $f0, $f0
/* 111244 00211144 000B0046 */  add.s      $f12, $f1, $f0
/* 111248 00211148 2C44040C */  jal        fptosi
/* 11124C 0021114C 00000000 */   nop
/* 111250 00211150 DA01013C */  lui        $at, (0x1DA2354 >> 16)
/* 111254 00211154 542322AC */  sw         $2, (0x1DA2354 & 0xFFFF)($at)
/* 111258 00211158 3C96828F */  lw         $2, -0x69C4($gp)
/* 11125C 0021115C 4D004010 */  beqz       $2, .L00211294
/* 111260 00211160 00000000 */   nop
/* 111264 00211164 5496838F */  lw         $3, -0x69AC($gp)
/* 111268 00211168 0F000224 */  addiu      $2, $0, 0xF
/* 11126C 0021116C 03006210 */  beq        $3, $2, .L0021117C
/* 111270 00211170 00000000 */   nop
/* 111274 00211174 0D000010 */  b          .L002111AC
/* 111278 00211178 00000000 */   nop
.L0021117C:
/* 11127C 0021117C 60968287 */  lh         $2, -0x69A0($gp)
/* 111280 00211180 F8FF4224 */  addiu      $2, $2, -0x8
/* 111284 00211184 609682A7 */  sh         $2, -0x69A0($gp)
/* 111288 00211188 60968287 */  lh         $2, -0x69A0($gp)
/* 11128C 0021118C 02004104 */  bgez       $2, .L00211198
/* 111290 00211190 00000000 */   nop
/* 111294 00211194 609680A7 */  sh         $0, -0x69A0($gp)
.L00211198:
/* 111298 00211198 60968287 */  lh         $2, -0x69A0($gp)
/* 11129C 0021119C DA01013C */  lui        $at, (0x1DA3A24 >> 16)
/* 1112A0 002111A0 243A22AC */  sw         $2, (0x1DA3A24 & 0xFFFF)($at)
/* 1112A4 002111A4 17000010 */  b          .L00211204
/* 1112A8 002111A8 00000000 */   nop
.L002111AC:
/* 1112AC 002111AC 60968287 */  lh         $2, -0x69A0($gp)
/* 1112B0 002111B0 08004224 */  addiu      $2, $2, 0x8
/* 1112B4 002111B4 609682A7 */  sh         $2, -0x69A0($gp)
/* 1112B8 002111B8 60968287 */  lh         $2, -0x69A0($gp)
/* 1112BC 002111BC 81004128 */  slti       $at, $2, 0x81
/* 1112C0 002111C0 03002014 */  bnez       $at, .L002111D0
/* 1112C4 002111C4 00000000 */   nop
/* 1112C8 002111C8 80000224 */  addiu      $2, $0, 0x80
/* 1112CC 002111CC 609682A7 */  sh         $2, -0x69A0($gp)
.L002111D0:
/* 1112D0 002111D0 DA01013C */  lui        $at, (0x1DA3A24 >> 16)
/* 1112D4 002111D4 243A228C */  lw         $2, (0x1DA3A24 & 0xFFFF)($at)
/* 1112D8 002111D8 08004224 */  addiu      $2, $2, 0x8
/* 1112DC 002111DC DA01013C */  lui        $at, (0x1DA3A24 >> 16)
/* 1112E0 002111E0 243A22AC */  sw         $2, (0x1DA3A24 & 0xFFFF)($at)
/* 1112E4 002111E4 DA01013C */  lui        $at, (0x1DA3A24 >> 16)
/* 1112E8 002111E8 243A228C */  lw         $2, (0x1DA3A24 & 0xFFFF)($at)
/* 1112EC 002111EC 81004128 */  slti       $at, $2, 0x81
/* 1112F0 002111F0 04002014 */  bnez       $at, .L00211204
/* 1112F4 002111F4 00000000 */   nop
/* 1112F8 002111F8 80000224 */  addiu      $2, $0, 0x80
/* 1112FC 002111FC DA01013C */  lui        $at, (0x1DA3A24 >> 16)
/* 111300 00211200 243A22AC */  sw         $2, (0x1DA3A24 & 0xFFFF)($at)
.L00211204:
/* 111304 00211204 90968487 */  lh         $4, -0x6970($gp)
/* 111308 00211208 8C43080C */  jal        GetDrawHelpWindow__Fi
/* 11130C 0021120C 00000000 */   nop
/* 111310 00211210 20004010 */  beqz       $2, .L00211294
/* 111314 00211214 00000000 */   nop
/* 111318 00211218 80968CC7 */  lwc1       $f12, -0x6980($gp)
/* 11131C 0021121C 2C44040C */  jal        fptosi
/* 111320 00211220 00000000 */   nop
/* 111324 00211224 28864070 */  paddub     $16, $2, $0
/* 111328 00211228 84968CC7 */  lwc1       $f12, -0x697C($gp)
/* 11132C 0021122C 2C44040C */  jal        fptosi
/* 111330 00211230 00000000 */   nop
/* 111334 00211234 60968687 */  lh         $6, -0x69A0($gp)
/* 111338 00211238 28260072 */  paddub     $4, $16, $0
/* 11133C 0021123C 282E4070 */  paddub     $5, $2, $0
/* 111340 00211240 88968CC7 */  lwc1       $f12, -0x6978($gp)
/* 111344 00211244 8C968DC7 */  lwc1       $f13, -0x6974($gp)
/* 111348 00211248 985E080C */  jal        MenuHelpWinDraw__Fiiffi
/* 11134C 0021124C 00000000 */   nop
/* 111350 00211250 6C96828F */  lw         $2, -0x6994($gp)
/* 111354 00211254 07004010 */  beqz       $2, .L00211274
/* 111358 00211258 00000000 */   nop
/* 11135C 0021125C DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 111360 00211260 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 111364 00211264 6896858F */  lw         $5, -0x6998($gp)
/* 111368 00211268 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 11136C 0021126C 00000000 */   nop
/* 111370 00211270 6C9682AF */  sw         $2, -0x6994($gp)
.L00211274:
/* 111374 00211274 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 111378 00211278 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 11137C 0021127C 6437050C */  jal        Step__6ClsMesFv
/* 111380 00211280 00000000 */   nop
/* 111384 00211284 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 111388 00211288 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 11138C 0021128C C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 111390 00211290 00000000 */   nop
.L00211294:
/* 111394 00211294 01000424 */  addiu      $4, $0, 0x1
/* 111398 00211298 046F050C */  jal        setbilinear__Fi
/* 11139C 0021129C 00000000 */   nop
/* 1113A0 002112A0 1000BF7B */  lq         $31, 0x10($sp)
/* 1113A4 002112A4 0000B07B */  lq         $16, 0x0($sp)
/* 1113A8 002112A8 3000BD27 */  addiu      $sp, $sp, 0x30
/* 1113AC 002112AC 0800E003 */  jr         $31
/* 1113B0 002112B0 00000000 */   nop
/* 1113B4 002112B4 00000000 */  nop
/* 1113B8 002112B8 00000000 */  nop
/* 1113BC 002112BC 00000000 */  nop