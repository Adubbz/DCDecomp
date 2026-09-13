# CVisualVu1 initialization park

`Initialize__10CVisualVu1Fv` has a byte-exact Dayuppy1707723 body, adapted to
the established field names as follows:

```cpp
void CVisualVu1::Initialize() {
    CVisual::Initialize();
    vu_data = NULL;
    vu_size = 0;
    unk_00 = 0;
    unk_04 = 0;
}
```

The four stores correspond in retail order to offsets `0x18`, `0x1c`,
`0x10`, and `0x14`. The compiled function is `0x3c` bytes, matching retail.
Defining it also emits the class's key-function-owned 0x20-byte
`__vt__10CVisualVu1` section. The current residual data still defines that
vtable in `main.rdata.part4b.s`, so the link fails with:

```text
multiply-defined: "CVisualVu1::__vt" in main.rdata.part4b.s.o
Previously defined in visualvu1.cpp.o
```

The vtable occupies retail range `0x002a11c0-0x002a11e0`. Integrating this
body therefore requires ending the residual carve at `0x002a11c0` and placing
`visualvu1.cpp.o (.vtables)` after `main.rdata.part4b.s.o (.rdata)` in the
linker script. Those files are frozen for the current wave, so the assembly
body remains active.

The retail symbol table binds `Initialize__10CVisualVu1Fv` globally. It binds
the independently ported `SetShadowData__FPUiPA4_f` locally; its source
definition is consequently file-static and its built object retains `LOCAL`
binding.
