#pragma once

#include "menu_draw.hpp"

inline int LoadFileMenuData(const char *name, unsigned int *buffer) {
    return LoadFileMenuData(const_cast<char *>(name), buffer);
}
