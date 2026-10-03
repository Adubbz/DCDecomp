#include <sys/wait.h>
#include <unistd.h>

#include <cstdlib>
#include <optional>
#include <string_view>
#include <thread>
#include <vector>

#include "data_fixture.hpp"
#include "exitcodes.hpp"
#include "gfx/gfx.hpp"
#include "platform/firstrun.hpp"
#include "platform/paths.hpp"
#include "platform/window.hpp"
#include "test.hpp"

using namespace datafix;

namespace {

fs::path WriteIso(const fs::path &dir, const Disc &disc) {
    WriteBytes(dir / "disc.iso", MakeIso("DATA.DAT;1", disc.dat, "DATA.HD2;1", disc.hd2));
    return dir / "disc.iso";
}

bool Extracted(const fs::path &root, const Disc &disc) {
    return dcdata::Mismatched(dcdata::ParseIndex(disc.hd2), root).empty() && !FirstRunDataMissing(root);
}

// The first-run flow against a temporary data and save root, the file selector replaced.
struct Flow {
    fs::path                    dir;
    std::vector<FirstRunSource> asked;

    explicit Flow(const char *tag)
        : dir(TempDir(tag)) {
        PathsSetDataRoot(dir / "data");
        PathsSetSaveRoot(dir / "save");
    }

    void Run(std::optional<fs::path> answer) {
        FirstRunSetChooser([this, answer](FirstRunSource source) {
            asked.push_back(source);
            return answer;
        });
        FirstRunIfNoData(true);
        DC_CHECK(WindowHandle() == nullptr);
        DC_CHECK(gfx::ValidationMessageCount() == 0);
    }

    ~Flow() { fs::remove_all(dir); }
};

} // namespace

DC_TEST(firstrun_data_missing_needs_a_regular_file) {
    fs::path dir = TempDir("firstrun_missing");
    DC_CHECK(FirstRunDataMissing(dir / "data"));
    fs::create_directories(dir / "data/dun/pack");
    DC_CHECK(FirstRunDataMissing(dir / "data"));
    WriteBytes(dir / "data/dun/pack/maindat.pac", Pattern(10, 1));
    DC_CHECK(!FirstRunDataMissing(dir / "data"));
    fs::remove_all(dir);
}

DC_TEST(firstrun_extract_progress_counts_every_file_and_byte) {
    fs::path                      dir = TempDir("firstrun_progress");
    Disc                          disc = StandardDisc();
    std::vector<dcdata::Progress> seen;
    dcdata::Extract(dcdata::OpenArchive(WriteIso(dir, disc)), dir / "data", nullptr,
                    [&](const dcdata::Progress &progress) {
                        seen.push_back(progress);
                        return true;
                    });
    DC_CHECK(!seen.empty());
    std::uint64_t total = 0;
    for (const File &file : disc.files) {
        total += file.data.size();
    }
    for (std::size_t i = 0; i < seen.size(); i++) {
        DC_CHECK(seen[i].total_files == kStandardReachable);
        DC_CHECK(seen[i].bytes <= seen[i].total_bytes && seen[i].files <= seen[i].total_files);
        if (i > 0) {
            DC_CHECK(seen[i].files >= seen[i - 1].files && seen[i].bytes >= seen[i - 1].bytes);
        }
    }
    DC_CHECK(seen.back().files == kStandardReachable);
    DC_CHECK(seen.back().bytes == seen.back().total_bytes);
    // The duplicate record is the one file the game never reaches.
    DC_CHECK(seen.back().total_bytes == total - 100);
    fs::remove_all(dir);
}

DC_TEST(firstrun_extract_progress_can_cancel) {
    fs::path dir = TempDir("firstrun_cancel");
    Disc     disc = StandardDisc();
    bool     threw = false;
    try {
        dcdata::Extract(dcdata::OpenArchive(WriteIso(dir, disc)), dir / "data", nullptr,
                        [](const dcdata::Progress &) { return false; });
    } catch (const dcdata::Error &error) {
        threw = std::string_view(error.what()) == "extraction cancelled";
    }
    DC_CHECK(threw);
    DC_CHECK(!Extracted(dir / "data", disc));
    fs::remove_all(dir);
}

DC_TEST(firstrun_extract_on_a_thread_fills_the_data_root) {
    fs::path dir = TempDir("firstrun_thread");
    Disc     disc = StandardDisc();
    fs::create_directories(dir / "data/empty");
    std::thread::id caller = std::this_thread::get_id();
    bool            on_caller = true;
    FirstRunOutcome outcome = FirstRunExtract(WriteIso(dir, disc), dir / "data", [&](const dcdata::Progress &) {
        on_caller = on_caller && std::this_thread::get_id() == caller;
        return true;
    });
    DC_CHECK(outcome.ok && !outcome.cancelled && outcome.error.empty());
    DC_CHECK(on_caller);
    DC_CHECK(Extracted(dir / "data", disc));
    DC_CHECK(!fs::exists(dir / "data.partial"));
    DC_CHECK(!fs::exists(dir / "data/empty"));
    fs::remove_all(dir);
}

DC_TEST(firstrun_extract_failure_leaves_the_data_root_alone) {
    fs::path dir = TempDir("firstrun_fail");
    Disc     disc = StandardDisc();
    Bytes    iso = MakeIso("DATA.DAT;1", disc.dat, "DATA.HD2;1", disc.hd2);
    iso.resize(iso.size() - 4096);
    WriteBytes(dir / "short.iso", iso);
    FirstRunOutcome outcome = FirstRunExtract(dir / "short.iso", dir / "data", [](const dcdata::Progress &) {
        return true;
    });
    DC_CHECK(!outcome.ok && !outcome.cancelled && !outcome.error.empty());
    DC_CHECK(FirstRunDataMissing(dir / "data"));

    outcome = FirstRunExtract(dir / "nothing.iso", dir / "data", [](const dcdata::Progress &) { return true; });
    DC_CHECK(!outcome.ok && outcome.error.find("nothing.iso") != std::string::npos);
    DC_CHECK(FirstRunDataMissing(dir / "data"));
    fs::remove_all(dir);
}

DC_TEST(firstrun_flow_extracts_the_chosen_disc_image) {
    Flow flow("firstrun_flow_iso");
    Disc disc = StandardDisc();
    flow.Run(WriteIso(flow.dir, disc));
    DC_CHECK(flow.asked.size() == 1 && flow.asked[0] == FirstRunSource::DiscImage);
    DC_CHECK(Extracted(flow.dir / "data", disc));
    DC_CHECK(fs::is_regular_file(flow.dir / "data/data.hd2"));
}

DC_TEST(firstrun_flow_accepts_a_folder_with_the_archive) {
    Flow flow("firstrun_flow_dir");
    Disc disc = StandardDisc();
    WriteBytes(flow.dir / "disc/DATA.DAT", disc.dat);
    WriteBytes(flow.dir / "disc/DATA.HD2", disc.hd2);
    flow.Run(flow.dir / "disc");
    DC_CHECK(Extracted(flow.dir / "data", disc));
}

DC_TEST(firstrun_flow_cancel_leaves_no_data) {
    Flow flow("firstrun_flow_cancel");
    flow.Run(std::nullopt);
    DC_CHECK(flow.asked.size() == 1);
    DC_CHECK(FirstRunDataMissing(flow.dir / "data"));
}

DC_TEST(firstrun_flow_skips_present_data_and_headless_runs) {
    Flow flow("firstrun_flow_skip");
    FirstRunIfNoData(true);
    DC_CHECK(WindowHandle() == nullptr);

    WriteBytes(flow.dir / "data/file.bin", Pattern(4, 2));
    flow.Run(flow.dir / "unused.iso");
    DC_CHECK(flow.asked.empty());
}

DC_TEST(firstrun_flow_failure_exits_with_status_1) {
    Flow  flow("firstrun_flow_error");
    pid_t child = fork();
    if (child == 0) {
        flow.Run(flow.dir / "missing.iso");
        std::_Exit(0);
    }
    int status = 0;
    DC_CHECK(waitpid(child, &status, 0) == child);
    DC_CHECK(WIFEXITED(status) && WEXITSTATUS(status) == kExitFailure);
    DC_CHECK(FirstRunDataMissing(flow.dir / "data"));
}
