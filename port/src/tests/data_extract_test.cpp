#include "data_fixture.hpp"
#include "test.hpp"

using namespace datafix;

namespace {

fs::path WriteStandardIso(const fs::path &dir, const Disc &disc) {
    fs::path iso = dir / "dark cloud.iso";
    WriteBytes(iso, MakeIso("DATA.DAT;1", disc.dat, "Data.Hd2;1", disc.hd2));
    return iso;
}

template <class F>
bool Throws(F f, std::string_view needle) {
    try {
        f();
    } catch (const dcdata::Error &error) {
        return std::string_view(error.what()).find(needle) != std::string_view::npos;
    }
    return false;
}

void CheckExtracted(const fs::path &out, const Disc &disc) {
    DC_CHECK(ReadBytes(out / "dun/pack/maindat.pac") == disc.files[0].data);
    DC_CHECK(ReadBytes(out / "img/title.img") == disc.files[1].data);
    DC_CHECK(ReadBytes(out / "sound/bgm/b01.snd") == disc.files[2].data);
    DC_CHECK(ReadBytes(out / "rmdat/rmdat1.pak") == disc.files[3].data);
    DC_CHECK(ReadBytes(out / "meswin/systeme.bin") == disc.files[4].data);
    DC_CHECK(fs::is_regular_file(out / "empty.bin") && fs::file_size(out / "empty.bin") == 0);
    DC_CHECK(ReadBytes(out / "data.hd2") == disc.hd2);
    DC_CHECK(!fs::exists(out / "DUN"));
}

} // namespace

DC_TEST(data_iso_reads_root_directory) {
    fs::path dir = TempDir("iso_root");
    Disc     disc = StandardDisc();
    fs::path iso = WriteStandardIso(dir, disc);

    dcdata::Iso9660               volume(iso);
    std::vector<dcdata::IsoEntry> entries = volume.List(volume.Root());
    DC_CHECK(entries.size() == 2);
    DC_CHECK(entries[0].name == "DATA.DAT;1" && entries[0].extent == 20);
    DC_CHECK(entries[0].size == disc.dat.size());
    DC_CHECK(entries[1].name == "Data.Hd2;1" && entries[1].size == disc.hd2.size());
    DC_CHECK(volume.Find(volume.Root(), "data.hd2").has_value());
    DC_CHECK(!volume.Find(volume.Root(), "DATA.HED").has_value());
    DC_CHECK(dcdata::Iso9660::StripVersion("SLES_123.45;1") == "SLES_123.45");
    DC_CHECK(dcdata::Iso9660::StripVersion("NOEXT.;1") == "NOEXT");

    dcdata::Archive archive = dcdata::OpenArchive(iso);
    DC_CHECK(archive.image);
    DC_CHECK(archive.dat.offset == 20 * dcdata::kSector && archive.dat.size == disc.dat.size());
    DC_CHECK(dcdata::ReadExtent(archive.hd2) == disc.hd2);
    fs::remove_all(dir);
}

DC_TEST(data_index_parses_as_pal) {
    Disc                        disc = StandardDisc();
    std::vector<dcdata::Record> records = dcdata::ParseIndex(disc.hd2);
    DC_CHECK(records.size() == 7);
    DC_CHECK(records[0].name == "DUN/PACK/MAINDAT.PAC" && records[0].path == "dun/pack/maindat.pac");
    DC_CHECK(records[0].size == 5000 && records[0].sector == 1 && records[0].sectors == 3);
    DC_CHECK(records[2].name == "/sound/bgm/b01.SND" && records[2].path == "sound/bgm/b01.snd");
    DC_CHECK(records[6].size == 0 && records[6].sectors == 0);
    DC_CHECK(records[1].offset == records[1].sector * dcdata::kSector);
}

DC_TEST(data_index_rejects_bad_records) {
    Disc disc = StandardDisc();

    Bytes short_index(disc.hd2.begin(), disc.hd2.begin() + 31);
    DC_CHECK(Throws([&] { dcdata::ParseIndex(short_index); }, "too short"));

    Bytes overcount = disc.hd2;
    Put32(overcount, 0, static_cast<std::uint32_t>(overcount.size() + 32));
    DC_CHECK(Throws([&] { dcdata::ParseIndex(overcount); }, "claims"));

    Bytes far_name = disc.hd2;
    Put32(far_name, 32, static_cast<std::uint32_t>(far_name.size()));
    DC_CHECK(Throws([&] { dcdata::ParseIndex(far_name); }, "record 1: name offset"));

    Bytes unterminated = disc.hd2;
    unterminated.pop_back();
    DC_CHECK(Throws([&] { dcdata::ParseIndex(unterminated); }, "not terminated"));

    Disc escaping = MakeDisc({
        {"dun\\..\\..\\etc\\passwd", Pattern(4, 0)}
    });
    DC_CHECK(Throws([&] { dcdata::ParseIndex(escaping.hd2); }, "unusable path"));

    Bytes negative = disc.hd2;
    Put32(negative, 32 + 20, 0xFFFFFFF0);
    DC_CHECK(Throws([&] { dcdata::ParseIndex(negative); }, "negative"));
}

DC_TEST(data_extract_from_iso) {
    fs::path dir = TempDir("extract_iso");
    Disc     disc = StandardDisc();
    fs::path iso = WriteStandardIso(dir, disc);
    fs::path out = dir / "data";

    dcdata::Summary summary = dcdata::Extract(dcdata::OpenArchive(iso), out, nullptr);
    DC_CHECK(summary.records == 7);
    DC_CHECK(summary.duplicates == 1);
    DC_CHECK(summary.written == kStandardReachable && summary.kept == 0);
    DC_CHECK(summary.warnings == 0);
    CheckExtracted(out, disc);
    DC_CHECK(dcdata::Mismatched(dcdata::ParseIndex(disc.hd2), out).empty());
    fs::remove_all(dir);
}

DC_TEST(data_extract_is_idempotent) {
    fs::path dir = TempDir("extract_again");
    Disc     disc = StandardDisc();
    fs::path iso = WriteStandardIso(dir, disc);
    fs::path out = dir / "data";

    dcdata::Extract(dcdata::OpenArchive(iso), out, nullptr);
    dcdata::Summary again = dcdata::Extract(dcdata::OpenArchive(iso), out, nullptr);
    DC_CHECK(again.written == 0 && again.kept == kStandardReachable);

    fs::resize_file(out / "img/title.img", 10);
    DC_CHECK(dcdata::Mismatched(dcdata::ParseIndex(disc.hd2), out).size() == 1);
    dcdata::Summary repaired = dcdata::Extract(dcdata::OpenArchive(iso), out, nullptr);
    DC_CHECK(repaired.written == 1 && repaired.kept == kStandardReachable - 1);
    CheckExtracted(out, disc);
    fs::remove_all(dir);
}

DC_TEST(data_extract_from_directory) {
    fs::path dir = TempDir("extract_dir");
    Disc     disc = StandardDisc();
    WriteBytes(dir / "iso/DATA.DAT", disc.dat);
    WriteBytes(dir / "iso/data.HD2", disc.hd2);
    WriteBytes(dir / "iso/SYSTEM.CNF", Pattern(10, 0));

    dcdata::Archive archive = dcdata::OpenArchive(dir / "iso");
    DC_CHECK(!archive.image);
    dcdata::Summary summary = dcdata::Extract(archive, dir / "data", nullptr);
    DC_CHECK(summary.written == kStandardReachable);
    CheckExtracted(dir / "data", disc);

    DC_CHECK(Throws([&] { dcdata::OpenArchive(dir / "data"); }, "holds no DATA.DAT"));
    fs::remove_all(dir);
}

DC_TEST(data_extract_rejects_truncation) {
    fs::path dir = TempDir("extract_cut");
    Disc     disc = StandardDisc();

    Bytes short_dat(disc.dat.begin(), disc.dat.end() - 2 * dcdata::kSector);
    WriteBytes(dir / "cut/DATA.DAT", short_dat);
    WriteBytes(dir / "cut/DATA.HD2", disc.hd2);
    DC_CHECK(Throws([&] { dcdata::Extract(dcdata::OpenArchive(dir / "cut"), dir / "data", nullptr); },
                    "DATA.DAT is truncated"));
    DC_CHECK(!fs::exists(dir / "data"));

    Bytes image = MakeIso("DATA.DAT;1", disc.dat, "DATA.HD2;1", disc.hd2);
    image.resize(image.size() - dcdata::kSector);
    WriteBytes(dir / "cut.iso", image);
    DC_CHECK(Throws([&] { dcdata::OpenArchive(dir / "cut.iso"); }, "truncated"));

    WriteBytes(dir / "tiny.iso", Bytes(100, 0));
    DC_CHECK(Throws([&] { dcdata::OpenArchive(dir / "tiny.iso"); }, "no ISO 9660 primary volume descriptor"));

    WriteBytes(dir / "junk.iso", Bytes(40 * dcdata::kSector, 0x55));
    DC_CHECK(Throws([&] { dcdata::OpenArchive(dir / "junk.iso"); }, "not an ISO 9660 image"));
    fs::remove_all(dir);
}
