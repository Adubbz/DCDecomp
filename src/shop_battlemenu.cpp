#include "shop_battlemenu.hpp"

#include <cstring>

void MenuDataSwap(MAP_JUMP_COMPARE *first, MAP_JUMP_COMPARE *second) {
    MAP_JUMP_COMPARE temp;

    memcpy(&temp, first, sizeof(MAP_JUMP_COMPARE));
    memcpy(first, second, sizeof(MAP_JUMP_COMPARE));
    memcpy(second, &temp, sizeof(MAP_JUMP_COMPARE));
}
