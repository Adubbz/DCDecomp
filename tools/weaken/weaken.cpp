// Marks every defined external symbol of a 64-bit Mach-O object weak (N_WEAK_DEF), in place. The port's
// src/ps2 half is merged into one object whose definitions must all yield to src/port's (docs/PC.md); on
// Mach-O this is the fallback for llvm-objcopy --weaken. Only n_desc bytes change, so nothing else in the
// object can be disturbed.

#include <bit>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <filesystem>
#include <format>
#include <fstream>
#include <iterator>
#include <optional>
#include <span>
#include <string>
#include <string_view>
#include <system_error>
#include <variant>
#include <vector>

namespace {

enum Exit : int {
    kExitOk = 0,
    kExitUsage = 1,
    kExitIo = 2,
    kExitFormat = 3,
};

constexpr std::uint32_t kMagic64 = 0xFEEDFACF;
constexpr std::uint32_t kCigam64 = 0xCFFAEDFE;
constexpr std::uint32_t kMagic32 = 0xFEEDFACE;
constexpr std::uint32_t kCigam32 = 0xCEFAEDFE;
// Universal headers are big-endian; read little-endian they show up byte-swapped.
constexpr std::uint32_t kFatMagic = 0xCAFEBABE;
constexpr std::uint32_t kFatMagic64 = 0xCAFEBABF;
constexpr std::uint32_t kCpuTypeArm64 = 0x0100000C;
constexpr std::uint32_t kCpuTypeX86_64 = 0x01000007;
constexpr std::uint32_t kFileTypeObject = 1;
constexpr std::uint32_t kLoadSymtab = 0x2;

constexpr std::size_t kHeaderSize = 32;
constexpr std::size_t kLoadCommandSize = 8;
constexpr std::size_t kSymtabCommandSize = 24;
constexpr std::size_t kNlistSize = 16;

constexpr std::uint8_t  kTypeStab = 0xE0;
constexpr std::uint8_t  kTypeMask = 0x0E;
constexpr std::uint8_t  kTypeSect = 0x0E;
constexpr std::uint8_t  kTypeExt = 0x01;
constexpr std::uint16_t kDescWeakDef = 0x0080;

static_assert(std::endian::native == std::endian::little, "reads Mach-O fields in host order");

struct Error {
    Exit        code;
    std::string message;
};

template <class T>
T Load(std::span<const std::uint8_t> bytes, std::size_t offset) {
    T value;
    std::memcpy(&value, bytes.data() + offset, sizeof value);
    return value;
}

template <class T>
void Store(std::span<std::uint8_t> bytes, std::size_t offset, T value) {
    std::memcpy(bytes.data() + offset, &value, sizeof value);
}

bool Fits(std::size_t size, std::uint64_t offset, std::uint64_t length) {
    return offset <= size && length <= size - offset;
}

std::optional<Error> CheckHeader(std::span<const std::uint8_t> bytes) {
    if (bytes.size() < 4) {
        return Error{kExitFormat, "not a Mach-O file (too short)"};
    }
    std::uint32_t magic = Load<std::uint32_t>(bytes, 0);
    if (magic == std::byteswap(kFatMagic) || magic == std::byteswap(kFatMagic64)) {
        return Error{kExitFormat, "universal (fat) file: extract one architecture with lipo -thin first"};
    }
    if (magic == kMagic32 || magic == kCigam32) {
        return Error{kExitFormat, "32-bit Mach-O is not supported"};
    }
    if (magic == kCigam64) {
        return Error{kExitFormat, "big-endian Mach-O is not supported"};
    }
    if (magic != kMagic64) {
        return Error{kExitFormat, "not a Mach-O file"};
    }
    if (bytes.size() < kHeaderSize) {
        return Error{kExitFormat, "truncated Mach-O header"};
    }
    std::uint32_t cputype = Load<std::uint32_t>(bytes, 4);
    if (cputype != kCpuTypeArm64 && cputype != kCpuTypeX86_64) {
        return Error{kExitFormat, std::format("unsupported CPU type {:#x}", cputype)};
    }
    std::uint32_t filetype = Load<std::uint32_t>(bytes, 12);
    if (filetype != kFileTypeObject) {
        return Error{kExitFormat, std::format("file type {} is not MH_OBJECT", filetype)};
    }
    return std::nullopt;
}

// Returns the number of symbols weakened.
std::variant<std::size_t, Error> Weaken(std::span<std::uint8_t> bytes) {
    if (std::optional<Error> error = CheckHeader(bytes)) {
        return *error;
    }
    std::uint32_t ncmds = Load<std::uint32_t>(bytes, 16);
    std::uint32_t sizeofcmds = Load<std::uint32_t>(bytes, 20);
    if (!Fits(bytes.size(), kHeaderSize, sizeofcmds)) {
        return Error{kExitFormat, "load commands run past the end of the file"};
    }
    std::size_t end = kHeaderSize + sizeofcmds;
    std::size_t offset = kHeaderSize;
    std::size_t weakened = 0;
    bool        symtab_seen = false;
    for (std::uint32_t i = 0; i < ncmds; i++) {
        if (!Fits(end, offset, kLoadCommandSize)) {
            return Error{kExitFormat, std::format("load command {} runs past sizeofcmds", i)};
        }
        std::uint32_t cmd = Load<std::uint32_t>(bytes, offset);
        std::uint32_t cmdsize = Load<std::uint32_t>(bytes, offset + 4);
        if (cmdsize < kLoadCommandSize || !Fits(end, offset, cmdsize)) {
            return Error{kExitFormat, std::format("load command {} has a bad size {}", i, cmdsize)};
        }
        if (cmd == kLoadSymtab) {
            if (symtab_seen) {
                return Error{kExitFormat, "more than one LC_SYMTAB"};
            }
            symtab_seen = true;
            if (cmdsize < kSymtabCommandSize) {
                return Error{kExitFormat, "LC_SYMTAB is too short"};
            }
            std::uint32_t symoff = Load<std::uint32_t>(bytes, offset + 8);
            std::uint32_t nsyms = Load<std::uint32_t>(bytes, offset + 12);
            if (!Fits(bytes.size(), symoff, std::uint64_t{nsyms} * kNlistSize)) {
                return Error{kExitFormat, "symbol table runs past the end of the file"};
            }
            for (std::uint32_t s = 0; s < nsyms; s++) {
                std::size_t  entry = symoff + std::size_t{s} * kNlistSize;
                std::uint8_t type = bytes[entry + 4];
                if ((type & kTypeStab) || !(type & kTypeExt) || (type & kTypeMask) != kTypeSect) {
                    continue;
                }
                std::uint16_t desc = Load<std::uint16_t>(bytes, entry + 6);
                if (!(desc & kDescWeakDef)) {
                    Store<std::uint16_t>(bytes, entry + 6, desc | kDescWeakDef);
                    weakened++;
                }
            }
        }
        offset += cmdsize;
    }
    if (!symtab_seen) {
        return Error{kExitFormat, "no LC_SYMTAB"};
    }
    return weakened;
}

std::optional<Error> Process(const std::filesystem::path &path) {
    std::ifstream in(path, std::ios::binary);
    if (!in) {
        return Error{kExitIo, "cannot open for reading"};
    }
    std::vector<std::uint8_t> bytes{std::istreambuf_iterator<char>(in), std::istreambuf_iterator<char>()};
    if (in.bad()) {
        return Error{kExitIo, "read failed"};
    }
    in.close();

    std::variant<std::size_t, Error> result = Weaken(bytes);
    if (Error *error = std::get_if<Error>(&result)) {
        return *error;
    }
    if (std::get<std::size_t>(result) == 0) {
        return std::nullopt;
    }

    // Replace by rename so an interrupted write never leaves a half-patched object for the next link.
    std::filesystem::path temp = path;
    temp += ".weaken.tmp";
    {
        std::ofstream out(temp, std::ios::binary | std::ios::trunc);
        out.write(reinterpret_cast<const char *>(bytes.data()), static_cast<std::streamsize>(bytes.size()));
        out.close();
        if (!out) {
            std::error_code ignored;
            std::filesystem::remove(temp, ignored);
            return Error{kExitIo, "write failed"};
        }
    }
    std::error_code error;
    std::filesystem::rename(temp, path, error);
    if (error) {
        std::filesystem::remove(temp, error);
        return Error{kExitIo, "cannot replace the file"};
    }
    return std::nullopt;
}

} // namespace

int main(int argc, char **argv) {
    if (argc < 2 || std::string_view(argv[1]) == "-h" || std::string_view(argv[1]) == "--help") {
        std::fputs("usage: weaken OBJECT...\n"
                   "Sets N_WEAK_DEF on every defined external symbol of each 64-bit Mach-O object in place.\n"
                   "Exit status: 0 done, 1 usage, 2 I/O error, 3 not a supported Mach-O object.\n",
                   argc < 2 ? stderr : stdout);
        return argc < 2 ? kExitUsage : kExitOk;
    }
    int status = kExitOk;
    for (int i = 1; i < argc; i++) {
        if (std::optional<Error> error = Process(argv[i])) {
            std::fputs(std::format("weaken: {}: {}\n", argv[i], error->message).c_str(), stderr);
            if (status == kExitOk) {
                status = error->code;
            }
        }
    }
    return status;
}
