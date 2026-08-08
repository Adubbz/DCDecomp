#include "texture.hpp"
/* @ 0x130EF0 (0x30 bytes) -- __ct__8CTextureFv */
CTexture::CTexture() {
    this->Initialize();
}

/* @ 0x130F20 (0x40 bytes) -- Initialize__8CTextureFv */
void CTexture::Initialize() {
    m_name[0] = 0;
    m_handle = 0;
    m_mip_data[3] = 0;
    m_mip_data[2] = 0;
    m_mip_data[1] = 0;
    m_mip_data[0] = 0;
    m_converted_data = 0;
    m_tex1 = 0;
    m_tex0 = 0;
    m_bytes_per_pixel = 0;
    m_height = 0;
    m_width = 0;
    m_is_converted = 0;
}

/* @ 0x130F60 (0x30 bytes) -- __ct__13CTextureBlockFv */
CTextureBlock::CTextureBlock() {
    this->Initialize();
}

/* @ 0x130F90 (0x30 bytes) -- Initialize__13CTextureBlockFv */
void CTextureBlock::Initialize() {
    m_name[0] = 0;
    m_gs_texture_end_addr = 0;
    m_gs_reserved_end_addr = 0;
    m_gs_reserved_start_addr = 0;
    m_texture_buffer_end = 0;
    m_texture_buffer_start = 0;
    m_is_fully_loaded = 0;
    m_is_extended = 0;
}

/* Retail `TextureData` (main.bss, 0x10 bytes, immediately before `WaterData`).
 * Field layout unconfirmed, so migrated as a same-sized placeholder array. */
char TextureData[0x10];

INCLUDE_ASM("main", Initialize__15CTextureManagerFi);
INCLUDE_ASM("main", SetBuffer__15CTextureManagerFP1i);
INCLUDE_ASM("main", SearchTextureName__15CTextureManagerFPci);
INCLUDE_ASM("main", GetTextureHandle__15CTextureManagerFPci);
INCLUDE_ASM("main", GetTexture__15CTextureManagerFi);
INCLUDE_ASM("main", GetTexture__15CTextureManagerFPci);
INCLUDE_ASM("main", SearchTexture__15CTextureManagerFPc);
INCLUDE_ASM("main", EnterTexture__15CTextureManagerFiPcPUciiiPUciiPUcPUcPUcUli);
INCLUDE_ASM("main", EnterTextureEX__15CTextureManagerFiPcPUciiiPUciiPUcPUcPUcUli);
INCLUDE_ASM("main", EnterFixTexture__15CTextureManagerFPcPUciiiPUciiPUcPUcPUcUli);
INCLUDE_ASM("main", EnterFixTextureZ__15CTextureManagerFPUc);
INCLUDE_ASM("main", EnterIMGFile__15CTextureManagerFPUciii);
INCLUDE_ASM("main", LoadImage__FPUiiiiP1iiiii);
INCLUDE_ASM("main", ReloadTexture__15CTextureManagerFP13sceVif1Packeti);
INCLUDE_ASM("main", BeginEnterTextureBlock__15CTextureManagerFi);
INCLUDE_ASM("main", EndEnterTextureBlock__15CTextureManagerFi);
INCLUDE_ASM("main", DeleteTextureBlock__15CTextureManagerFi);
INCLUDE_ASM("main", CleanUpBuffer__15CTextureManagerFv);
INCLUDE_ASM("main", CleanUpTextureList__15CTextureManagerFv);
INCLUDE_ASM("main", GetStr__FPcPc);
INCLUDE_ASM("main", GetDummyInfo__FPcPcPiPiPi);
INCLUDE_ASM("main", LoadTextureBlock__15CTextureManagerFiPUi);
INCLUDE_ASM("main", LoadTextureBlock__15CTextureManagerFiP16LOADTEXTURE_INFOPUi);
INCLUDE_ASM("main", LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2);
INCLUDE_ASM("main", LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2);
INCLUDE_ASM("main", EnterTextureFile__15CTextureManagerFP16LOADTEXTURE_INFO);
INCLUDE_ASM("main", PageConv8to32__FiiPUcPUc);
INCLUDE_ASM("main", BlockConv8to32__FPUcPUc);
INCLUDE_ASM("main", Conv8to32__FiiPUcPUc);
INCLUDE_ASM("main", print_buff_info__15CTextureManagerFv);
