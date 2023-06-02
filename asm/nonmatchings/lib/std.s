.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel std
/* 1A28 00101928 1000023C */  lui        $2, %hi(__sread)
/* 1A2C 0010192C 1000033C */  lui        $3, %hi(__swrite)
/* 1A30 00101930 1000083C */  lui        $8, %hi(__sseek)
/* 1A34 00101934 1000093C */  lui        $9, %hi(__sclose)
/* 1A38 00101938 C8504224 */  addiu      $2, $2, %lo(__sread)
/* 1A3C 0010193C 30516324 */  addiu      $3, $3, %lo(__swrite)
/* 1A40 00101940 B0510825 */  addiu      $8, $8, %lo(__sseek)
/* 1A44 00101944 18522925 */  addiu      $9, $9, %lo(__sclose)
/* 1A48 00101948 540087AC */  sw         $7, 0x54($4)
/* 1A4C 0010194C 0C0085A4 */  sh         $5, 0xC($4)
/* 1A50 00101950 0E0086A4 */  sh         $6, 0xE($4)
/* 1A54 00101954 200082AC */  sw         $2, 0x20($4)
/* 1A58 00101958 240083AC */  sw         $3, 0x24($4)
/* 1A5C 0010195C 280088AC */  sw         $8, 0x28($4)
/* 1A60 00101960 2C0089AC */  sw         $9, 0x2C($4)
/* 1A64 00101964 000080AC */  sw         $0, 0x0($4)
/* 1A68 00101968 040080AC */  sw         $0, 0x4($4)
/* 1A6C 0010196C 080080AC */  sw         $0, 0x8($4)
/* 1A70 00101970 100080AC */  sw         $0, 0x10($4)
/* 1A74 00101974 180080AC */  sw         $0, 0x18($4)
/* 1A78 00101978 0800E003 */  jr         $31
/* 1A7C 0010197C 1C0084AC */   sw        $4, 0x1C($4)
