.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMenuIconPos__FiPi
/* F4210 001F4110 01008624 */  addiu      $6, $4, 0x1
/* F4214 001F4114 00190600 */  sll        $3, $6, 4
/* F4218 001F4118 50006724 */  addiu      $7, $3, 0x50
/* F421C 001F411C 80180400 */  sll        $3, $4, 2
/* F4220 001F4120 21186400 */  addu       $3, $3, $4
/* F4224 001F4124 C0180300 */  sll        $3, $3, 3
/* F4228 001F4128 36006824 */  addiu      $8, $3, 0x36
/* F422C 001F412C 0500C128 */  slti       $at, $6, 0x5
/* F4230 001F4130 05002014 */  bnez       $at, .L001F4148
/* F4234 001F4134 00000000 */   nop
/* F4238 001F4138 FCFF8324 */  addiu      $3, $4, -0x4
/* F423C 001F413C 40190300 */  sll        $3, $3, 5
/* F4240 001F4140 10006324 */  addiu      $3, $3, 0x10
/* F4244 001F4144 2338E300 */  subu       $7, $7, $3
.L001F4148:
/* F4248 001F4148 0000A7AC */  sw         $7, 0x0($5)
/* F424C 001F414C 0400A8AC */  sw         $8, 0x4($5)
/* F4250 001F4150 0800E003 */  jr         $31
/* F4254 001F4154 00000000 */   nop
/* F4258 001F4158 00000000 */  nop
/* F425C 001F415C 00000000 */  nop
