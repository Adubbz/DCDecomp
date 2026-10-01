#include "texture_port.hpp"

// Placeholder bodies until the texture phase lands.

PortTextureRef PortTextureFromTex0(u_long, u_long) {
    return {};
}

PortTextureRef PortTextureFromTex0(const sceGsTex0 &tex0, u_long tex1) {
    return PortTextureFromTex0(*reinterpret_cast<const u_long *>(&tex0), tex1);
}

PortTextureRef PortTextureFromHandle(int) {
    return {};
}

PortTextureRef PortTextureFromCTexture(const CTexture *) {
    return {};
}
