#include "texture.hpp"

CTexture::CTexture() {
    this->Initialize();
}

void CTexture::Initialize() {
    /* Initialize members. */
    m_name[0] = NULL;
    m_handle = 0;
    m_mip_data[3] = NULL;
    m_mip_data[2] = NULL;
    m_mip_data[1] = NULL;
    m_mip_data[0] = NULL;
    m_converted_data = NULL;
    m_tex1 = 0;
    m_tex0 = 0;
    m_bytes_per_pixel = 0;
    m_height = 0;
    m_width = 0;
    m_is_converted = 0;
}