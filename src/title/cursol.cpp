#include "title/cursol.hpp"

#include <cmath>

#include "mathutil.hpp"

CCursol::CCursol() {
    select = 0;
    y = 288.0f;
    target_y = 288.0f;
    alpha[0] = alpha[1] = alpha[2] = alpha[3] = alpha[4] = 0;
}

void CCursol::Init() {
    select = 0;
    y = 288.0f;
    target_y = 288.0f;
    alpha[0] = alpha[1] = alpha[2] = alpha[3] = alpha[4] = 0;
}

int CCursol::Move() {
    if (target_y > y) {
        y = y + (target_y - y) / 4.0f;
        if (target_y - y < 1.0f) {
            y = target_y;
            arrived = 1;
        } else {
            arrived = 0;
        }
    }
    if (target_y < y) {
        y = y - (y - target_y) / 4.0f;
        if (y - target_y < 1.0f) {
            y = target_y;
            arrived = 1;
        } else {
            arrived = 0;
        }
    }

    switch (select) {
        case 0:
            if (alpha[0] < 127)
                alpha[0] += 8;
            if (alpha[1] > 0)
                alpha[1] -= 8;
            if (alpha[2] > 0)
                alpha[2] -= 8;
            if (alpha[3] > 0)
                alpha[3] -= 8;
            if (alpha[4] > 0)
                alpha[4] -= 8;
            break;
        case 1:
            if (alpha[0] > 0)
                alpha[0] -= 8;
            if (alpha[1] < 127)
                alpha[1] += 8;
            if (alpha[2] > 0)
                alpha[2] -= 8;
            if (alpha[3] > 0)
                alpha[3] -= 8;
            if (alpha[4] > 0)
                alpha[4] -= 8;
            break;
        case 2:
            if (alpha[0] > 0)
                alpha[0] -= 8;
            if (alpha[1] > 0)
                alpha[1] -= 8;
            if (alpha[2] < 127)
                alpha[2] += 8;
            if (alpha[3] > 0)
                alpha[3] -= 8;
            if (alpha[4] > 0)
                alpha[4] -= 8;
            break;
        case 3:
            if (alpha[0] > 0)
                alpha[0] -= 8;
            if (alpha[1] > 0)
                alpha[1] -= 8;
            if (alpha[2] > 0)
                alpha[2] -= 8;
            if (alpha[3] < 127)
                alpha[3] += 8;
            if (alpha[4] > 0)
                alpha[4] -= 8;
            break;
        case 4:
            if (alpha[0] > 0)
                alpha[0] -= 8;
            if (alpha[1] > 0)
                alpha[1] -= 8;
            if (alpha[2] > 0)
                alpha[2] -= 8;
            if (alpha[3] > 0)
                alpha[3] -= 8;
            if (alpha[4] < 127)
                alpha[4] += 8;
            break;
    }

    if (target_y == y)
        return 1;
    return 0;
}

void CCursol::Set(float y) {
    target_y = y;
}

int CCursol::GetSelect() {
    return select;
}

int CCursol::GetPos() {
    return (int) y;
}
