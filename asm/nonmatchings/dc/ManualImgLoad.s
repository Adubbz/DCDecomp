.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ManualImgLoad__Fv
/* 1336D0 002335D0 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 1336D4 002335D4 2000BF7F */  sq         $31, 0x20($sp)
/* 1336D8 002335D8 1000B17F */  sq         $17, 0x10($sp)
/* 1336DC 002335DC 0000B07F */  sq         $16, 0x0($sp)
/* 1336E0 002335E0 8CFB040C */  jal        ReadBGSync__Fv
/* 1336E4 002335E4 00000000 */   nop
/* 1336E8 002335E8 05004014 */  bnez       $2, .L00233600
/* 1336EC 002335EC 00000000 */   nop
/* 1336F0 002335F0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1336F4 002335F4 78A82284 */  lh         $2, -0x5788($at)
/* 1336F8 002335F8 03004010 */  beqz       $2, .L00233608
/* 1336FC 002335FC 00000000 */   nop
.L00233600:
/* 133700 00233600 B0FB040C */  jal        BreakReadBG__Fv
/* 133704 00233604 00000000 */   nop
.L00233608:
/* 133708 00233608 3000A427 */  addiu      $4, $sp, 0x30
/* 13370C 0023360C 94AE080C */  jal        GetPathReadDifferntLang__FPc
/* 133710 00233610 00000000 */   nop
/* 133714 00233614 3000A427 */  addiu      $4, $sp, 0x30
/* 133718 00233618 2A00023C */  lui        $2, %hi(_479_2)
/* 13371C 0023361C B8F24524 */  addiu      $5, $2, %lo(_479_2)
/* 133720 00233620 BC14040C */  jal        strcat
/* 133724 00233624 00000000 */   nop
/* 133728 00233628 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13372C 0023362C 80A8228C */  lw         $2, -0x5780($at)
/* 133730 00233630 01004324 */  addiu      $3, $2, 0x1
/* 133734 00233634 80100300 */  sll        $2, $3, 2
/* 133738 00233638 21104300 */  addu       $2, $2, $3
/* 13373C 0023363C 40180200 */  sll        $3, $2, 1
/* 133740 00233640 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133744 00233644 84A8228C */  lw         $2, -0x577C($at)
/* 133748 00233648 21804300 */  addu       $16, $2, $3
/* 13374C 0023364C 3000A427 */  addiu      $4, $sp, 0x30
/* 133750 00233650 282E8070 */  paddub     $5, $4, $0
/* 133754 00233654 28360072 */  paddub     $6, $16, $0
/* 133758 00233658 1614040C */  jal        sprintf
/* 13375C 0023365C 00000000 */   nop
/* 133760 00233660 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133764 00233664 A0A8318C */  lw         $17, -0x5760($at)
/* 133768 00233668 28262072 */  paddub     $4, $17, $0
/* 13376C 0023366C 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 133770 00233670 00000000 */   nop
/* 133774 00233674 288E4070 */  paddub     $17, $2, $0
/* 133778 00233678 30FB040C */  jal        StartReadBG__Fv
/* 13377C 0023367C 00000000 */   nop
/* 133780 00233680 3000A427 */  addiu      $4, $sp, 0x30
/* 133784 00233684 282E2072 */  paddub     $5, $17, $0
/* 133788 00233688 7C00A627 */  addiu      $6, $sp, 0x7C
/* 13378C 0023368C ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 133790 00233690 00000000 */   nop
/* 133794 00233694 7C00A28F */  lw         $2, 0x7C($sp)
/* 133798 00233698 03110200 */  sra        $2, $2, 4
/* 13379C 0023369C 01004224 */  addiu      $2, $2, 0x1
/* 1337A0 002336A0 00110200 */  sll        $2, $2, 4
/* 1337A4 002336A4 21882202 */  addu       $17, $17, $2
/* 1337A8 002336A8 28262072 */  paddub     $4, $17, $0
/* 1337AC 002336AC 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 1337B0 002336B0 00000000 */   nop
/* 1337B4 002336B4 288E4070 */  paddub     $17, $2, $0
/* 1337B8 002336B8 F5FF0226 */  addiu      $2, $16, -0xB
/* 1337BC 002336BC 0200412C */  sltiu      $at, $2, 0x2
/* 1337C0 002336C0 0B002014 */  bnez       $at, .L002336F0
/* 1337C4 002336C4 00000000 */   nop
/* 1337C8 002336C8 EBFF0226 */  addiu      $2, $16, -0x15
/* 1337CC 002336CC 0200412C */  sltiu      $at, $2, 0x2
/* 1337D0 002336D0 07002014 */  bnez       $at, .L002336F0
/* 1337D4 002336D4 00000000 */   nop
/* 1337D8 002336D8 1F000224 */  addiu      $2, $0, 0x1F
/* 1337DC 002336DC 04000212 */  beq        $16, $2, .L002336F0
/* 1337E0 002336E0 00000000 */   nop
/* 1337E4 002336E4 2A000224 */  addiu      $2, $0, 0x2A
/* 1337E8 002336E8 13000216 */  bne        $16, $2, .L00233738
/* 1337EC 002336EC 00000000 */   nop
.L002336F0:
/* 1337F0 002336F0 3000A427 */  addiu      $4, $sp, 0x30
/* 1337F4 002336F4 94AE080C */  jal        GetPathReadDifferntLang__FPc
/* 1337F8 002336F8 00000000 */   nop
/* 1337FC 002336FC 3000A427 */  addiu      $4, $sp, 0x30
/* 133800 00233700 2A00023C */  lui        $2, %hi(_480_2)
/* 133804 00233704 D0F24524 */  addiu      $5, $2, %lo(_480_2)
/* 133808 00233708 BC14040C */  jal        strcat
/* 13380C 0023370C 00000000 */   nop
/* 133810 00233710 3000A427 */  addiu      $4, $sp, 0x30
/* 133814 00233714 282E8070 */  paddub     $5, $4, $0
/* 133818 00233718 28360072 */  paddub     $6, $16, $0
/* 13381C 0023371C 1614040C */  jal        sprintf
/* 133820 00233720 00000000 */   nop
/* 133824 00233724 3000A427 */  addiu      $4, $sp, 0x30
/* 133828 00233728 282E2072 */  paddub     $5, $17, $0
/* 13382C 0023372C 7C00A627 */  addiu      $6, $sp, 0x7C
/* 133830 00233730 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 133834 00233734 00000000 */   nop
.L00233738:
/* 133838 00233738 38FB040C */  jal        ReadBG__Fv
/* 13383C 0023373C 00000000 */   nop
/* 133840 00233740 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133844 00233744 8CA820AC */  sw         $0, -0x5774($at)
/* 133848 00233748 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13384C 0023374C 90A820AC */  sw         $0, -0x5770($at)
/* 133850 00233750 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133854 00233754 78A820A4 */  sh         $0, -0x5788($at)
/* 133858 00233758 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13385C 0023375C 78A82284 */  lh         $2, -0x5788($at)
/* 133860 00233760 2000BF7B */  lq         $31, 0x20($sp)
/* 133864 00233764 1000B17B */  lq         $17, 0x10($sp)
/* 133868 00233768 0000B07B */  lq         $16, 0x0($sp)
/* 13386C 0023376C 8000BD27 */  addiu      $sp, $sp, 0x80
/* 133870 00233770 0800E003 */  jr         $31
/* 133874 00233774 00000000 */   nop
/* 133878 00233778 00000000 */  nop
/* 13387C 0023377C 00000000 */  nop
