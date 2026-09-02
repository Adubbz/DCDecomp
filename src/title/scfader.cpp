#include "title/scfader.hpp"

int CScFader::In()
{
    if (value < 128) {
        value += 2;
        if (value > 128) value = 128;
        return 0;
    }
    return 1;
}

int CScFader::In2()
{
    if (value < 128) {
        value += 8;
        if (value > 128) value = 128;
        return 0;
    }
    return 1;
}

int CScFader::Out()
{
    if (value > -4) {
        value -= 2;
        if (value < -4) value = -4;
        return 0;
    }
    return 1;
}

int CScFader::Get(int max)
{
    if (value < max) {
        if (value < 0) return 0;
        return value;
    }
    return max;
}

void CScFader::Skip()
{
    value = 128;
}

