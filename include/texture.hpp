#pragma once

#include "common.h"

struct i {
  u8 r;
  u8 g;
  u8 b;
  u8 a;
};

class CTexture {
    private:
        s16 m_handle;
        s16 m_width;
        s16 m_height;
        u16 m_bytes_per_pixel;
        char m_name[32];
        u64 m_tex0;
        u64 m_tex1;
        u8 *m_mip_data[4];
        i *m_converted_data;
        u32 m_is_converted;
    public:
        CTexture();

        void Initialize();
};
STATIC_ASSERT(sizeof(CTexture) == 0x50);