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