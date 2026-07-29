#include "savedata.hpp"
#include "mainselect.hpp"
#include "gamepad.hpp"
#include "dataalloc.hpp"
#include "mglib.hpp"

/* Global, GLOBAL-linkage per retail `nm` (0x1cbc9b0, `T`). Purpose beyond
 * being constructed here is unanalyzed -- out of scope for this pass. */
CRunScript RunScript;

/* Retail `nm`: 0x1cbca00, `t` -- LOCAL linkage (file-scope `static`) in
 * retail. Declared non-`static` (GLOBAL) here instead, same tradeoff as
 * `MapNo`/`OldMapNo`/etc. in mainselect.hpp: `LoadSystemMessage__Fv` (not yet
 * decompiled, still raw `ref/asm/split/main/LoadSystemMessage.s`)
 * references this symbol externally, which a `static` here (LOCAL,
 * visible only within main.cpp.o) cannot satisfy -- confirmed by the
 * exact link error this produced before making it non-static:
 * "undefined: SystemMesBuffer / Referenced from LoadSystemMessage() in
 * LoadSystemMessage.s.o". The cost is only symbol *binding* (global vs.
 * local), not code bytes -- true `static` linkage has to wait until
 * LoadSystemMessage (and any other referencing function) is decompiled
 * into this same translation unit, same as `save_data` did. */
CDataAlloc<1, 6000> SystemMesBuffer;

/* Touched briefly by main() near the top; purpose beyond that not
 * analyzed. LOCAL linkage in retail (`nm`: `t pBound`/`t ParentFrame`/
 * `t DataBuffer`, 0x2a2500-0x2a250c) -- moved here from src/mainselect.cpp, which
 * originally (incorrectly) declared these alongside GameClearFlag/MapNo/
 * etc.: retail's `main.sbss` interleaves them byte-for-byte with
 * `SaveData` immediately below and the rest of main()'s own globals, which
 * a *different* compiled object (mainselect.cpp.o) cannot reproduce (a single
 * object contributes one contiguous run to its output section) -- see
 * docs/RE/sbss_bss_layout.md. */
static s32 pBound;
static s32 ParentFrame;
static s32 DataBuffer;

/* The game's single global save-data instance, and the pointer the rest of
 * the game uses to reach it.
 *
 * Confirmed against the retail binary's own symbol table
 * (`readelf -s rom/extracted/iso/SCUS_971.11`):
 *     2433: 01cd4140 78272 OBJECT  LOCAL  DEFAULT  4 save_data
 *     11183: 002a250c     4 OBJECT  GLOBAL DEFAULT  4 SaveData
 *
 * `save_data` is 78272 bytes -- exactly `sizeof(CSaveData)` -- with LOCAL
 * linkage (file-scope `static`); `save_data` must live in the SAME
 * translation unit as whatever assigns `SaveData = &save_data;`, which
 * is main() itself (see below), so both now live here rather than in a
 * separate save_globals.cpp as an earlier pass of this file had them (that
 * required `save_data` to be non-static, since main() hadn't been
 * decompiled into the same file yet -- now that it has, `static` is
 * restored to match retail exactly). `SaveData` is unmangled (plain C++
 * globals aren't name-mangled, only overloadable functions are, under this
 * CFront-style ABI) and uninitialized (`main.sbss`, gp-relative offset
 * -0x72E4 from `_gp = 0x2A97F0`, confirmed against every
 * `lw $4, -0x72E4($28)` preamble before a CSaveData method call across
 * ref/asm/sections/dun/dun.text.s). */
static CSaveData save_data __attribute__((aligned(64)));
CSaveData *SaveData;

/* main()'s own top-level game-state globals -- moved here from
 * src/mainselect.cpp/include/mainselect.hpp for the same reason as `pBound` etc. above:
 * retail's `main.sbss` interleaves these (GLOBAL linkage) with `SaveData`
 * just above and `mode`/etc. just below, all in one contiguous run
 * (0x2a2510-0x2a2548) that must come from ONE compiled object. Still
 * *declared* `extern` in include/mainselect.hpp (in case another, not-yet-
 * decompiled TU needs them), just no longer *defined* there. Declaration
 * order here matches retail's exact main.sbss address order. */
s32 GameClearFlag;
s32 main_select_menu_no;
s32 MapNo;
s32 OldMapNo;
s32 LocalMapNo;
s32 StartEventNo;
s32 SystemMes;
char CSnd; /* 1 byte in retail, not 4 -- padded to a 4-byte slot in this globals group. */
s32 main_select_padrup;

/* Scratch buffer for the "reset trial character names, keep everything
 * else" sequence below (ConvertConfig -> memset+Initialize -> InvertConfig
 * round-trip). Confirmed via the retail binary's own symbol table
 * (`readelf -s`: `config_data`, 64 bytes -- exactly `sizeof(SV_CONFIG_SYS)`
 * -- LOCAL linkage, `main.bss`) that this is a real, named `static` global,
 * NOT a stack-local temporary as an earlier pass of this file had it
 * (`SV_CONFIG_SYS tmp_config;` inside the switch case) -- that inflated
 * this function's stack frame by 64 bytes relative to retail, which
 * doesn't allocate any stack space for it at all.
 *
 * Declared BEFORE `mainCDataAlloc2` (moved here from directly after
 * `SaveData`) to match retail's real `.bss` address order: `nm` on retail
 * shows `config_data` at 0x1ce7300 and `mainCDataAlloc2` at 0x1ce7560 --
 * `config_data` first, `mainCDataAlloc2` last -- confirmed via
 * `docs/RE/sbss_bss_layout.md`'s whole-region layout investigation. This
 * doesn't disturb the sinit-thunk constructor-call order documented above
 * (`RunScript`, `SystemMesBuffer`, `save_data`, `mainCDataAlloc2`, in that
 * order): `config_data` is a plain POD `SV_CONFIG_SYS` with no constructor,
 * so it doesn't participate in sinit ordering at all -- only its *data*
 * position moves. */
static SV_CONFIG_SYS config_data;

/* Unidentified real retail global, `nm`: `DebugFont`, 0x1ce7340, LOCAL,
 * 0x21C bytes. The 4 bytes between its end and `mainCDataAlloc2` at
 * 0x1ce7560 are the linker's own alignment pad, not part of the object, so
 * they are left to the linker: declaring 0x220 here swallowed the pad and
 * made the symbol four bytes longer than retail's, the one thing
 * compare_build.py still reported once the code matched. Sits exactly
 * between `config_data` and `mainCDataAlloc2`
 * in retail's `.bss` layout -- without a same-sized stand-in here, main.cpp.o's
 * own `.bss` contribution would be short by 0x220 bytes and everything
 * after it (mainCDataAlloc2, then the raw dump's `msinCtx` etc.) would
 * land 0x220 bytes too early. TODO: identify the real type/usage (name
 * suggests a debug font glyph/texture table) and replace this placeholder.
 *
 * Declared non-`static` (GLOBAL) despite retail's real LOCAL linkage --
 * same tradeoff as `SystemMesBuffer` above: `MenuLoop__Fv` (not yet
 * decompiled, still raw `ref/asm/split/main/MenuLoop.s`) references this
 * symbol externally, which a `static` here cannot satisfy (confirmed by the
 * exact link error this produced before making it non-static: "undefined:
 * DebugFont / Referenced from MenuLoop() in MenuLoop.s.o"). True `static`
 * linkage has to wait until MenuLoop is decompiled into this same
 * translation unit. */
char DebugFont[0x21C];

/* Global, GLOBAL linkage per retail `nm` (0x1ce7560, `T`). Declared last,
 * after `save_data`/`SaveData`, since retail's sinit thunk constructs it
 * fourth (`SaveData` itself is a plain pointer with no constructor, so it
 * doesn't participate in sinit ordering either way). */
CDataAlloc2<1> mainCDataAlloc2;

/* Everything below is called from main() but not itself decompiled here
 * (out of scope for this pass -- each is its own subsystem). Declared with
 * their exact retail mangled/symbol names so the linker resolves them
 * against the existing reassembled .s files. Functions with no retained
 * retail name use this project's "func_ADDRESS" convention. */
extern "C" {
void *memset(void *dest, int value, u32 size);
void *memcpy(void *dest, const void *src, u32 size);
char *strcpy(char *dest, const char *src);
int mwInit(int argc, const char **argv, const char **envp);
void init_all__Fv();
int sceGsSyncV(int interlace);
void initialize_data__Fv();
void GlobalNameInit__Fv();
void InitReadBG__Fv();
void SndInit__Fv();
void LoadOverlay__Fi(int mode);
void MGSetRenderInfo__Ffff(float a1, float a2, float a3);
void sceGsSyncPath(int a1, int a2);
void FlushCache(int mode);
void sceDmaSend(int channel, void *tag);
void init_now_loading__Fi(int map_no);
void LoadSystemMessage__Fv();
void SndInitialize__Fiiii(int a1, int a2, int a3, int a4);
int InitExistData__Fv();
void MapJump__Fii(int map_no, int event_no);
void EditInit__FPv(void *param);
void func_01DAF1C0();
void MenuInit__Fv(int mode);
void func_01DC1420(int mode);
void MemCheckInit__Fv(int mode);
void TrialEndInit__Fv(int mode);
void InitSave__Fv(int mode);
void LangsetInit__Fv(int mode);
void func_01DAC1C0();
void func_01DD1AB0(int inited);
void func_01DC8C50();
/* Takes no arguments -- the mangled name is __Fv, and retail's call sites
 * (the `while (check_now_loading...) ` spin loop at 0x1415C0) set up no
 * argument registers at all. An earlier pass of this file passed a saved
 * copy of `mode` here, which forced an extra callee-saved register copy
 * (`paddub s4,a0`) retail doesn't have. */
int check_now_loading__Fv();
void MGInitVSyncCallBack__FPFi_i(void (*callback)(int));
void PlayTimeCount__Fi(int add);
void MGBeginFrame__Fv();
/* Retail passes Vif1Packet as the (pointer-typed, per the mangling) first
 * argument: `lw $4,Vif1Packet; paddub $20,$4; jal SetEnv...` -- the load
 * goes straight into $a0 and is copied to $s4 only to survive the call for
 * reuse by sceVif1PkCall below. An earlier pass declared this () and made
 * the copy direction come out backwards (lw s4 then paddub a0,s4). */
void SetEnv__FP13sceVif1Packet(int vif1_packet);
void sceVif1PkCall(int vif1_packet, void *vu_prog, int a3);
int func_01DD2220();
int func_01DC8EB0();
int EditLoop__Fv();
int func_01DAF970();
int MenuLoop__Fv();
int func_01DC1510();
int MemCheckLoop__Fv();
int TrialEndLoop__Fv();
int LoopSave__Fv();
int LangsetLoop__Fv();
int func_01DAD980(int mode);
void MGEndFrame__Fv();
int CheckTrialEnd__Fv();
/* No arguments (mangled __Fv); retail's spin loop at 0x141D10 sets up no
 * argument registers. An earlier pass passed `d2` here -- `d2` is in fact
 * never referenced by retail main() at all (no -0x72B4($gp) access
 * anywhere in ref/asm/split/main/main.s). */
int ReadBGSync__Fv();
void TrialStart__Fv();
}

/* File-scope statics of the original main translation unit. The retail
 * symbol table has these as *unsuffixed* LOCAL objects (`nm`: `t mode`,
 * `t d1`, `t d2`, `t d8`, `t mc_mode`, in that exact main.sbss address
 * order, 0x2a2534-0x2a2548) -- i.e. file-scope `static`, NOT function-local
 * statics (those get a `$NNN` suffix like `init$683`; an earlier pass of
 * this file wrongly had these inside main(), producing `mode$7`-style
 * symbols).
 *
 * Now defined here as real `static`s (a whole-tree grep of every
 * not-yet-decompiled ref/asm/split/main/*.s file confirms none of them
 * reference `mode`/`d1`/`d2`/`d8`/`mc_mode` by their main.sbss gp-offsets --
 * only main() itself does -- so, unlike `NextMapNo` just below, there's no
 * cross-TU raw-dump binding to preserve). `d2`/`d8` are never read/written
 * by main() itself either (confirmed against the full gp-relative access
 * list of ref/asm/split/main/main.s) but still need to be defined here,
 * unused, purely so main.cpp.o's `.sbss` layout includes their retail
 * byte range in the right position (between `d1` and `mc_mode`). See
 * docs/RE/sbss_bss_layout.md for the full derivation. */
static s32 mode;
static s32 d1;
static s32 d2;
static s32 d8;
static s32 mc_mode;

/* `PolyCount` (GLOBAL linkage) immediately follows `mc_mode` in retail's
 * main.sbss (0x2a2548) -- moved here from src/mainselect.cpp for the same reason
 * as `GameClearFlag` etc. above. Still declared `extern` in
 * include/mainselect.hpp. */
s32 PolyCount;

/* `NextMapNo` (main.sdata, initialized to -1) stays `extern`, binding to
 * the still-uncarved symbol in ref/asm/sections/main/main.sdata.s:
 * `MapJump__Fii` (same retail TU, not yet decompiled) writes it, and
 * defining a separate `static` copy in this file would break the
 * MapJump->main() communication that retail's shared TU-local gave them.
 * The cost is only symbol *binding* (global vs. local), which doesn't
 * affect main()'s code bytes; true `static` linkage has to wait until
 * MapJump__Fii and friends are decompiled into this same file. */
extern s32 NextMapNo;

/* Low byte of an EE DMA channel's CHCR register, as a bitfield. The "kick
 * this DMA channel" write in main() (`(*(vu8*)d1 & ~0x40) | 0x40`, setting
 * bit 6 = STR with TTE/MOD/DIR bits preserved) is a *bitfield store* in the
 * original source, not hand-written masking: a 1-bit field assignment is
 * the only source form found that makes MWCC materialize the OR operand
 * with `daddiu $3,$0,0x40` (its bitfield-insertion engine works in 64-bit)
 * instead of folding it into an `ori` immediate -- every hand-masked
 * variant tried (int/long/long long masks, named mask locals, u8 casts)
 * came out as `ori v0,v0,0x40`. The same 7-instruction lbu/daddiu/li/and/
 * or/sb sequence appears in MGEndFrame (twice) against DmaCH8, so this
 * struct is shared original-source vocabulary, not a one-off. */
typedef struct {
    u8 chcr_low : 6; /* DIR/MOD/ASP/TTE etc. -- untouched here */
    u8 str : 1;      /* channel start/busy */
    u8 chcr_top : 1;
} DMA_CHCR_BYTE;

/* Vif1Packet itself is declared in include/mglib.hpp (included above)
 * now that it lives in its own translation unit (src/mglib.cpp) --
 * see that header's comment for why. */
/* Labels (DMA tag chain / VU microprogram addresses), not pointer
 * variables: retail computes their address directly via lui+addiu at each
 * use site (e.g. `lui $v0,0x29; addiu $a1,$v0,0x6680` for My_dma_start0),
 * not by loading a stored pointer value -- confirmed by a GP-offset-
 * overflow linker error when these were first declared as `void *`
 * (which asked the compiler to treat them as small-data pointer
 * *variables* to be loaded, not address constants). Declaring them as
 * arrays makes every use below decay to the address directly, matching. */
extern char My_dma_start0[];
extern char Vu_progmain[];
extern char Vu_prog0f[];
extern char LIT_873[];
extern char LIT_874[];

/* @ 0x1410B0 (0xC80 bytes) -- main */
int main(int argc, const char **argv, const char **envp) {
    /* Function-local statics: retail names ("depth$682", "init$683", ...)
     * confirmed via IDA's global list against this exact function; the
     * "$NNN" suffix is MWCC's disambiguation counter for function-local
     * statics (see CLAUDE.md), so these belong here, not in mainselect.hpp. */
    /* `bool` compiles to an unsigned byte load (`lbu`) for these checks;
     * retail uses a signed load (`lb`), confirmed by diffing against
     * retail -- so these are declared `s8`, not `bool`, matching every
     * other signed-byte flag in this codebase (see CLAUDE.md on `s8`
     * being plain `char`, signed by default on this target). */
    static s32 depth;
    static s8 init;
    static s32 wt;
    static s8 init2;
    static s32 init_flag;
    static s8 init3;

    /* Locals, in retail's callee-saved-register order (MWCC assigns
     * s0,s1,... to the top-level locals in declaration order -- confirmed
     * by the earlier pass of this file, whose different declaration order
     * shifted every assignment by one register):
     *   v4 -> s0: per-iteration loop-exit result.
     *   v5 -> s1: "skip the title demo, jump straight to map 800" flag,
     *             set in the first switch's case 1, consumed+cleared in
     *             the second switch's case 1.
     *   i  -> s2: the 60-frame warmup loop counter, then reused (same
     *             register in retail: both the `addiu $18,$18,1` counter
     *             and the case-0 `bnez $18` once-flag are $18) as the
     *             "first-switch case 0 already ran once" flag.
     *   inited -> s3: InitExistData() result, handed to func_01DD1AB0.
     *   j  -> s4: chara-name copy loop counter (both loops), sharing its
     *             register with the other short-lived do-loop temporaries
     *             (game_clear, vif1_packet), as retail does with $20.
     *   v3 -> s5: never written anywhere in the function (retail reads a
     *             genuinely uninitialized callee-saved register in the
     *             second switch's case 12) -- declared last so it takes
     *             the last callee-saved slot.
     */
    int v4;
    int v5;
    int i;
    int inited;
    int j;
    int v3;
    char chara_names[6][64];
    int valid;

    mwInit(argc, argv, envp);

    if (!init) {
        depth = 0;
        init = true;
    }

    if (!init2) {
        wt = 1;
        init2 = true;
    }

    /* Plain statements, not declaration initializers -- retail zeroes
     * s0/s1 here, *after* the two static-init blocks above (an
     * initializer at declaration gets scheduled before the mwInit call
     * instead). */
    v4 = 0;
    v5 = 0;

    mode = 7;
    main_select_menu_no = 0;

    strcpy(main_select_param, LIT_873);
    init_all__Fv();

    while (sceGsSyncV(0) == 0) {
    }

    GamePad.Init();

    SaveData = &save_data;
    NextMapNo = -1;
    MapNo = -1;
    OldMapNo = -1;
    StartEventNo = -1;
    GameClearFlag = 0;

    memset(&save_data, 0, sizeof(CSaveData));
    save_data.Initialize();
    GlobalNameInit__Fv();

    /* `(valid = ...) != 0` rather than a bare `i < 60`: the anonymous
     * form routes the slti result through $at, the named form through a
     * real register ($v0, as retail has) -- see CLAUDE.md's named-
     * variable register trick, applied throughout src/savedata.cpp. */
    for (i = 0; (valid = i < 60) != 0; i++) {
        sceGsSyncV(0);
        GamePad.UpDate();
        if (GamePad.On2(8) != 0 && GamePad.On2(2) != 0 && GamePad.On2(4) != 0) {
            GamePad.On2(1);
        }
    }

    MapNo = -1;
    mode = 10;
    GamePad.KeyLock2(1);

    i = 0;
    inited = 0;

    if (!init3) {
        init_flag = 0;
        init3 = true;
    }

    while (1) {
        if (mode != 12 && init_flag == 0) {
            initialize_data__Fv();
            init_flag = 1;
        }

        InitReadBG__Fv();
        SndInit__Fv();

        if (mode == 7) {
            MapNo = 801;
            mode = 1;
        }

        LoadOverlay__Fi(mode);
        /* The third argument is the int 65535 (0xFFFF) converted to float
         * at runtime -- retail: `ori $2,$0,0xFFFF; mtc1 $2,$f0; cvt.s.w
         * $f14,$f0` -- not a compile-time float constant (an earlier pass
         * had `(float)-1`, which the front end folds to a `lui 0xbf80`
         * -1.0f immediate). */
        MGSetRenderInfo__Ffff(800.0f, 10.0f, 65535);
        sceGsSyncPath(0, 0);

        /* A `switch`, not an `||` chain: as an `||` chain MWCC merges the
         * adjacent values 9 and 10 into a single unsigned range check
         * (`addiu v0,v1,-9; sltiu at,v0,2`), which retail doesn't have --
         * retail is four separate `beq`s to the store block plus an
         * unconditional `b` over it, which is exactly the comparison-chain
         * shape MWCC gives a sparse switch (no value merging). MWCC emits
         * a sparse switch's comparisons in *reverse* written case order,
         * so the cases are written 9,7,10,14 to get retail's compare
         * order 14,10,7,9. */
        switch (mode) {
            case 9:
            case 7:
            case 10:
            case 14:
                MapNo = -1;
                OldMapNo = -1;
                break;
        }

        FlushCache(0);
        sceDmaSend(d1, My_dma_start0);
        sceGsSyncPath(0, 0);
        FlushCache(0);
        sceDmaSend(d1, Vu_progmain);
        sceGsSyncPath(0, 0);

        if (mode != 12 && StartEventNo < 0) {
            init_now_loading__Fi(MapNo);
        }

        GamePad.StopVibration();

        /* Case bodies are deliberately NOT in numeric case-value order --
         * they're in the exact physical order retail's compiled switch-jump-
         * table target addresses appear in (confirmed against
         * ref/asm/sections/main/main.rodata.s's LIT_875 table: index N
         * -> the Nth case value's target address; sorting those addresses
         * gives this body order). MWCC lays out a switch's case bodies in
         * the order they were textually written in source, same as any
         * other code -- reordering these to match was required for a byte
         * match, since a jump table's *indices* are correct regardless of
         * body order but the bodies' own positions (and hence every
         * instruction's address within them) are not. */
        switch (mode) {
            case 9:
                func_01DC1420(mode);
                break;
            case 14:
                LangsetInit__Fv(mode);
                break;
            case 0:
                LoadSystemMessage__Fv();
                GlobalNameInit__Fv();
                SndInitialize__Fiiii(4, 30, 4, 5);
                /* `i` here is the warmup loop counter reused as a
                 * "ran once" flag (same register, $18/s2, in retail for
                 * both roles). Retail stores *GameClearFlag* = 1 here
                 * (gp-0x72E0, the same word zeroed at startup and copied
                 * into config+0x38 every frame below), NOT
                 * main_select_menu_no (gp-0x72DC) as an earlier pass had
                 * it -- and the 1 is emitted as a copy of the flag's own
                 * register (`paddub $2,$18`), which writing the literal 1
                 * reproduces via copy propagation. */
                if (i == 0) {
                    i = 1;
                    inited = InitExistData__Fv();
                    if (*(s32 *) &((SV_CONFIG_SYS *) SaveData->GetConfigData())->reserved_36[2] != 0) {
                        GameClearFlag = 1;
                    }
                }
                func_01DD1AB0(inited);
                break;
            case 1:
                SndInitialize__Fiiii(4, 30, 4, 5);
                func_01DC8C50();
                /* Sets v5 (the "skip title demo" flag consumed by the
                 * second switch's case 1 below), not v4 -- retail writes
                 * $17/s1 here, the same register case 1 below tests and
                 * clears. */
                if (GamePad.On(2048) != 0) {
                    MapJump__Fii(800, -1);
                    v5 = 1;
                }
                break;
            case 2:
                EditInit__FPv(0);
                break;
            case 7:
                MenuInit__Fv(mode);
                break;
            case 13:
                InitSave__Fv(mode);
                break;
            case 10:
                MemCheckInit__Fv(mode);
                break;
            case 11:
                TrialEndInit__Fv(mode);
                break;
            case 5:
                SndInitialize__Fiiii(4, 30, 4, 5);
                func_01DAF1C0();
                break;
            case 6:
            case 8:
            case 12:
                break;
            default:
                func_01DAC1C0();
                break;
        }

        NextMapNo = -1;
        while (check_now_loading__Fv() == 0) {
        }

        MGInitVSyncCallBack__FPFi_i(PlayTimeCount__Fi);
        FlushCache(0);
        sceDmaSend(d1, My_dma_start0);
        sceGsSyncPath(0, 0);
        FlushCache(0);
        sceDmaSend(d1, Vu_progmain);
        sceGsSyncPath(0, 0);

        *(volatile s32 *) 0x10000010 = 131;
        sceGsSyncV(0);

        /* Kick the DMA channel: set the STR bit via a volatile bitfield
         * store (see DMA_CHCR_BYTE above for why this exact source form
         * is required for the daddiu/li/and/or sequence to match). */
        ((volatile DMA_CHCR_BYTE *) d1)->str = 1;
        /* CSaveData::unk_1C8 is private; this matches retail's own raw
         * offset-based access to it (this call site can't be a member of
         * CSaveData -- it's main(), a totally different translation unit --
         * so it isn't going through a getter either, just direct pointer
         * arithmetic on the known field offset). Both the value and the
         * base pointer go through named locals, value first: that is the
         * only tried form whose temp numbering matches retail
         * (`lw v0,MapNo; lw v1,SaveData; sw v0,0x1c8(v1)`) -- the direct
         * one-liner, and every other local/cast permutation tried, either
         * swaps v0/v1 or swaps the two loads (see the session notes in
         * docs/RE/main.md). */
        {
            s32 map_no = MapNo;
            char *sd = (char *) SaveData;
            *(s32 *) (sd + 0x1C8) = map_no;
        }

        do {
            int game_clear = GameClearFlag;
            *(s32 *) &((SV_CONFIG_SYS *) SaveData->GetConfigData())->reserved_36[2] = game_clear;

            *(volatile s32 *) 0x10000000 = 0;
            MGBeginFrame__Fv();
            /* Discarded read of the same hardware register just written --
             * retail does this too (`lw v0,0(at)` with the result never
             * used again), confirmed missing by diffing against retail. */
            (void) *(volatile s32 *) 0x10000000;

            /* Exact retail shape (lw a0,Vif1Packet; paddub s4,a0; jal
             * SetEnv; lui/addiu a1; paddub a0,s4; paddub a2; jal PkCall)
             * requires all three of: (a) SetEnv taking the *global*
             * directly (so the load lands in $a0 with the local's def as
             * a copy *from* it -- writing SetEnv(vif1_packet) instead
             * flips the copy to lw s4 + paddub a0,s4), (b) a named local
             * capturing the pre-call value for sceVif1PkCall (retail
             * doesn't reload the global after SetEnv), and (c) the cast on
             * Vu_prog0f, which is what hoists the lui/addiu pair *before*
             * the first-argument copy. Without it the address is emitted
             * after, MWCC's argument evaluation being strictly
             * left-to-right; the cast node is enough to lift it out.
             * Routing it through a named local, which is what did this
             * under mwcc 2.3.1.01, no longer has any effect under 2.3.3. */
            int vif1_packet = Vif1Packet;
            SetEnv__FP13sceVif1Packet(Vif1Packet);
            sceVif1PkCall(vif1_packet, (void *) Vu_prog0f, 0);

            /* gp-0x72A8 here is PolyCount, not mc_mode (gp-0x72AC) -- an
             * earlier pass had the wrong global (off by one slot in the
             * sbss layout; verified against `nm` addresses vs. gp =
             * 0x2A97F0: PolyCount = 0x2A2548 = gp-0x72A8). */
            PolyCount = 0;
            /* Second discarded read of the VIF/DMA register block, present
             * in retail between the PolyCount clear and the old_main_mode
             * store (`lui $1,0x1000; lw $2,0($1)`, result unused). */
            (void) *(volatile s32 *) 0x10000000;
            old_main_mode = mode;

            /* Same "body order matches retail's compiled address order, not
             * case-value order" situation as the other switch above,
             * confirmed against the .L-label order in
             * ref/asm/split/main/main.s: 14 (0x141710), 0 (0x14173C),
             * 1 (0x141930), 2 (0x141984), 7 (0x1419D8), 13 (0x1419EC),
             * 12 (0x141A10), 10 (0x141A2C), 11 (0x141A58), 5 (0x141A80),
             * 9 (0x141AB8), default (0x141ADC). Cases 3 and 4 have no
             * distinct body in retail (their jump-table slot is the same
             * address as `default`), so they're deliberately not written
             * at all here -- a plain `switch` already sends unmatched
             * values to `default`. */
            switch (mode) {
                case 14:
                    v4 = LangsetLoop__Fv();
                    if (v4 != 0) {
                        MapNo = 801;
                        mode = 1;
                    }
                    break;
                case 0:
                    v4 = func_01DD2220();
                    if (v4 == 1) {
                        main_select_menu_no = 0;
                        strcpy(main_select_param, LIT_873);
                        mode = 2;
                    }
                    if (v4 == 2) {
                        main_select_menu_no = 1;
                        strcpy(main_select_param, LIT_873);
                        mode = 2;
                    }
                    if (v4 == 3) {
                        mode = 3;
                        main_select_menu_no = 0;
                    }
                    if (v4 == 5) {
                        mode = 5;
                    }
                    if (v4 == 1) {
                        MapJump__Fii(400, -1);

                        for (j = 0; (valid = j < 6) != 0; j++) {
                            memcpy(chara_names[j], save_data.GetCharaName(j), 64);
                        }

                        save_data.ConvertConfig(&config_data);
                        memset(&save_data, 0, sizeof(CSaveData));
                        save_data.Initialize();
                        save_data.InvertConfig(&config_data);

                        for (j = 0; (valid = j < 6) != 0; j++) {
                            memcpy(save_data.GetCharaName(j), chara_names[j], 64);
                        }

                        TrialStart__Fv();
                    }
                    if (v4 == 4) {
                        MapJump__Fii(801, -1);
                    }
                    if (v4 == 2) {
                        SndInitialize__Fiiii(4, 30, 4, 5);
                    }
                    break;
                case 1:
                    if (v5 != 0) {
                        v4 = 1;
                        MapJump__Fii(800, -1);
                        v5 = 0;
                    } else {
                        v4 = func_01DC8EB0();
                        if (v4 != 0) {
                            MapJump__Fii(800, -1);
                        }
                    }
                    break;
                case 2:
                    v4 = EditLoop__Fv();
                    if (v4 == 1) {
                        mode = 0;
                    }
                    if (v4 == 2) {
                        mode = 2;
                    }
                    if (v4 != 0) {
                        mode = 7;
                    }
                    if (v4 == 3) {
                        mode = 3;
                    }
                    break;
                case 7:
                    v4 = MenuLoop__Fv();
                    break;
                case 13:
                    v4 = LoopSave__Fv();
                    if (v4 != 0) {
                        mode = 7;
                    }
                    break;
                case 12:
                    v4 = v3;
                    if (v3 != 0) {
                        mode = 7;
                    }
                    break;
                case 10:
                    v4 = MemCheckLoop__Fv();
                    if (v4 != 0) {
                        MapNo = 801;
                        mode = 1;
                    }
                    break;
                case 11:
                    v4 = TrialEndLoop__Fv();
                    if (v4 != 0) {
                        MapNo = 800;
                        mode = 0;
                    }
                    break;
                case 5:
                    /* Two separate ifs, not one -- retail emits two
                     * back-to-back `beqz $16` tests (0x141A8C skipping only
                     * the `mode = 0` store, 0x141A98 skipping the MapJump),
                     * which a single merged if does not produce. */
                    v4 = func_01DAF970();
                    if (v4 != 0) {
                        mode = 0;
                    }
                    if (v4 != 0) {
                        MapJump__Fii(0, -1);
                    }
                    break;
                case 9:
                    v4 = func_01DC1510();
                    if (v4 != 0) {
                        mode = 3;
                    }
                    break;
                case 6:
                case 8:
                    break;
                default:
                    v4 = func_01DAD980(mode);
                    if (v4 != 0) {
                        mode = 7;
                    }
                    break;
            }

            GamePad.UpDate();
            SV_CONFIG_SYS *config = (SV_CONFIG_SYS *) SaveData->GetConfigData();
            /* `!x`, not `x == 0`: `!` compiles to sltu/xori/andi-0xff
             * (materialize x!=0, invert, truncate the bool) as retail has;
             * `== 0` compiles to a bare xor/sltiu instead (confirmed by
             * isolated compiles of both forms). */
            GamePad.VibrationEnable(!*(s32 *) &config->values_copy1[10]);
            GamePad.Step();
            MGEndFrame__Fv();

            if (GamePad.On2(8) != 0 && GamePad.On2(2) != 0 && GamePad.On2(4) != 0) {
                GamePad.On2(1);
            }
        } while (v4 == 0);

        MGBeginFrame__Fv();
        MGEndFrame__Fv();
        sceGsSyncPath(0, 0);

        /* A flat else-if chain in ascending range order, exactly as retail
         * branches it (slti 200 / slti 300 / bne 400 / slti 800, each
         * falling through to the next test) -- an earlier pass's nested
         * `>= 200 { >= 300 { ... } else ... } else ...` shape mirrored
         * the whole structure and couldn't match. */
        if (NextMapNo >= 0) {
            OldMapNo = MapNo;

            if (NextMapNo < 200) {
                mode = 2;
                MapNo = NextMapNo;
            } else if (NextMapNo < 300) {
                mode = 3;
                MapNo = NextMapNo;
                LocalMapNo = NextMapNo - 200;
                /* Written as a copy of LocalMapNo (retail stores then
                 * reloads it: `sw $2,LocalMapNo; lw $2,LocalMapNo; sw
                 * main_select_menu_no`), not a recomputed
                 * `NextMapNo - 200`. */
                main_select_menu_no = LocalMapNo;
            } else if (NextMapNo == 400) {
                mode = 5;
                MapNo = NextMapNo;
                LocalMapNo = 0;
                main_select_menu_no = 0;
            } else if ((valid = NextMapNo < 800) == 0) {
                /* Named-variable trick (see CLAUDE.md): retail's `>= 800`
                 * check is `slti $2,$3,0x320; bnez $2` -- a *real* register
                 * ($v0) where the two range checks above it use $at; only
                 * the named-assignment form (`valid = NextMapNo < 800`,
                 * tested `== 0` so no bool materialization is needed)
                 * reproduces that without adding an xori. */
                main_select_menu_no = 0;
                strcpy(main_select_param, LIT_874);
                if (NextMapNo == 800) {
                    mode = 0;
                }
                if (NextMapNo == 801) {
                    mode = 1;
                }
                MapNo = NextMapNo;
                LocalMapNo = 0;
            }

            if (NextMapNo == 1000) {
                MapNo = -1;
                LocalMapNo = 0;
                mode = 13;
                /* gp-0x72AC is mc_mode, not d8 (gp-0x72B0) -- same
                 * off-by-one-slot global mixup as the PolyCount store
                 * above, fixed against the retail nm addresses. */
                mc_mode = 2;
            }
        }

        if (CheckTrialEnd__Fv() != 0) {
            mode = 11;
            MapNo = -1;
            LocalMapNo = -1;
        }

        while (ReadBGSync__Fv() != 0) {
        }
    }
}
