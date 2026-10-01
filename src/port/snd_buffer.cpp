#include <cstdint>

#include "snd.hpp"

extern unsigned int *snd_read_buf;

// Retail aligns through a 32-bit int, which truncates a buffer above 4 GiB.
void SndSetReadBuffer(unsigned int *buffer) {
    const auto address = reinterpret_cast<std::uintptr_t>(buffer);
    const auto misalign = address % 64;
    snd_read_buf = misalign != 0 ? reinterpret_cast<unsigned int *>(address + 64 - misalign) : buffer;
}
