# Blocked cloth command bodies

Dayuppy's private export `1707723` supplies byte-exact bodies for the two cloth
commands below. They remain assembly-backed because their state lives in the
retail `main.sbss` run but is currently file-static in `src/main.cpp`.

## `CommandFRAME` at `0x0013FBE0`

```cpp
static void CommandFRAME(void **argv) {
    CFrame *frame = ParentFrame->SearchFrame((char *) argv[0]);

    pCloth->frame = frame;
    if (frame != 0) {
        frame->attr.draw_on = 2;
        CVisualVu1 *visual = ((CFrameVu1 *) frame)->GetVisual();
        MDT_HEADER *header = (MDT_HEADER *) visual->GetMDTDataAddress();
        pCloth->Initialize(header, DataBuffer);
    }
}
```

The body compiles after declaring `ParentFrame` and `DataBuffer`, but the link
cannot resolve them while their definitions retain file-static linkage in
`src/main.cpp`.

## `CommandBOUND` at `0x0013FDB0`

```cpp
static void CommandBOUND(void **argv) {
    sceVu0FVECTOR vec[4];
    CBound *bound;
    CFrame *frame;
    int n;
    int i;

    float w = 1.0f;
    float h = 1.0f;
    float d = 1.0f;
    bound = new ((u_long128 *) DataBuffer->Alloc(0x14)) CBound(w, h, d);
    if (bound == 0)
        return;
    n = 0;
    frame = ParentFrame->SearchFrame((char *) argv[n++]);
    if (frame == 0)
        return;
    i = 0;
    while (i < 4) {
        int t;
        vec[i][0] = *(float *) argv[n];
        t = n + 1;
        vec[i][1] = *(float *) argv[t];
        t = n + 2;
        vec[i][2] = *(float *) argv[t];
        n += 3;
        vec[i][3] = 1.0f;
        i++;
    }
    vec[0][3] = 0.0f;
    bound->SetDir(frame, vec[1], vec[2], vec[0], vec[3][0], vec[3][1]);
    bound->SetSize(vec[3][0], vec[3][1], vec[3][2]);
    bound->friction = *(float *) argv[n];
    if (pBound == 0) {
        pCloth->bound = bound;
    } else {
        pBound->next = bound;
    }
    pBound = bound;
}
```

It needs the same `ParentFrame` and `DataBuffer` linkage fix plus `pBound`.
The inline `CBound::SetSize` body from the private export writes `extent[0..2]`
and, for each positive extent, writes its reciprocal to `reciprocal[0..2]`.
