# Dayuppy cloth-helper parks

`StretchBind2__FPfPfPf` and `vuabs__FPf` have byte-exact Dayuppy bodies, but
they cannot be integrated at the current translation-unit boundary. The retail
symbol table records both functions as local:

```text
2296: 0013b450  48 FUNC LOCAL DEFAULT 4 vuabs__FPf
2313: 0013b3e0 100 FUNC LOCAL DEFAULT 4 StretchBind2__FPfPfPf
```

Dayuppy's source defines the helpers as `static` in the same `cloth.cpp`
translation unit as their callers. This repository assigns the retail helper
addresses to `chararead.cpp`, while assembly still in `cloth.cpp` references
both helpers and `bound.cpp` references `vuabs`. Keeping the definitions local
therefore leaves these link errors:

```text
Symbol not found: vuabs__FPf referenced from cloth.cpp.o
Symbol not found: StretchBind2__FPfPfPf referenced from cloth.cpp.o
Symbol not found: vuabs__FPf referenced from bound.cpp.o
```

Removing `static` makes both bodies score 100.0, but emits global symbols and
contradicts the retail `FUNC LOCAL` bindings. Both helpers remain supplied by
`INCLUDE_ASM` until the translation-unit boundary is corrected.

The exact Dayuppy drafts are preserved below:

```cpp
static void StretchBind2(float *a, float *b, float *param) {
    register float *pa = a;
    register float *pb = b;
    register float *pp = param;

    asm {
        lqc2        vf10, 0(pa)
        lqc2        vf11, 0(pb)
        lqc2        vf12, 0(pp)
        vmulx.xyzw  vf1, vf0, vf0
        vsub.xyz    vf13, vf10, vf11
        vnop
        vnop
        vnop
        vaddy.x     vf5, vf1, vf13
        vaddz.x     vf6, vf1, vf13
        vmula.x     ACC, vf13, vf13
        vmadday.x   ACC, vf5, vf13
        vmaddz.x    vf7, vf6, vf13
        vrsqrt      Q, vf12x, vf7x
        vaddax.xyzw ACC, vf13, vf0
        vwaitq
        vmsubq.xyzw vf25, vf13, Q
        vaddax.xyzw ACC, vf10, vf0
        vmsuby.xyz  vf10, vf25, vf12
        vaddax.xyzw ACC, vf11, vf0
        vmaddz.xyz  vf11, vf25, vf12
        sqc2        vf10, 0(pa)
        sqc2        vf11, 0(pb)
    }
}

static float vuabs(float *v) {
    register float *p = v;
    register int q = 0;
    register float result = 0;

    asm {
        lqc2        vf4, 0(p)
        vmul.xyz    vf4, vf4, vf4
        vmr32.xy    vf5, vf4
        vmr32.x     vf6, vf5
        vadd.x      vf7, vf4, vf5
        vadd.x      vf5, vf6, vf7
        vsqrt       Q, vf5x
        vwaitq
        cfc2        q, $22
        mtc1        q, result
    }

    return result;
}
```

## `CCloth::Clear` typed-field review

Replacing its raw element-base arithmetic with `point[i][j]`, `speed[i][j]`,
`home[i][j]`, and `last[i][j]` compiled but scored 99.21875. The change altered
the allocation of `$s3` and `$s4` across eight instructions. The existing
matching body was restored without another spelling attempt.
