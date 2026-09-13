# `CDungeonEventMan::SearchDataSlotPos2` matching status

`SearchDataSlotPos2__16CDungeonEventManFPf` remains in assembly at `0x1CCDE0` after three source shapes on refreshed head `eb8c0ba4`.

- Function-scope target vector plus a loop-scope event vector compiled to 340 bytes at 96.92941%.
- Hoisting the event vector before the target vector and using a conditional expression for the absolute height difference compiled to 340 bytes at 99.35294%.
- Extending the loop index lifetime across the initial vector copy compiled to 340 bytes at 97.05882% and moved the index initialization ahead of the call.

The best body differs only by a cycle among the registers holding `this`, the loop index and the current event pointer. Control flow, constants, stack slots and instruction count match. Resume with compiler register-allocation diagnostics.
