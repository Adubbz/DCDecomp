#include <gtest/gtest.h>
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
        ASSERT_TRUE(WindowHandle() == nullptr);
        ASSERT_TRUE(gfx::ValidationMessageCount() == 0);
    }

    ~Flow() { fs::remove_all(dir); }
};

} // namespace

TEST(PlatformFirstrun, DataMissingNeedsARegularFile) {
    fs::path dir = TempDir("firstrun_missing");
    ASSERT_TRUE(FirstRunDataMissing(dir / "data"));
    fs::create_directories(dir / "data/dun/pack");
    ASSERT_TRUE(FirstRunDataMissing(dir / "data"));
    WriteBytes(dir / "data/dun/pack/maindat.pac", Pattern(10, 1));
    ASSERT_TRUE(!FirstRunDataMissing(dir / "data"));
    fs::remove_all(dir);
}

TEST(PlatformFirstrun, ExtractProgressCountsEveryFileAndByte) {
    fs::path                      dir = TempDir("firstrun_progress");
    Disc                          disc = StandardDisc();
    std::vector<dcdata::Progress> seen;
    dcdata::Extract(dcdata::OpenArchive(WriteIso(dir, disc)), dir / "data", nullptr,
                    [&](const dcdata::Progress &progress) {
                        seen.push_back(progress);
                        return true;
                    });
    ASSERT_TRUE(!seen.empty());
    std::uint64_t total = 0;
    for (const File &file : disc.files) {
        total += file.data.size();
    }
    for (std::size_t i = 0; i < seen.size(); i++) {
        ASSERT_TRUE(seen[i].total_files == kStandardReachable);
        ASSERT_TRUE(seen[i].bytes <= seen[i].total_bytes && seen[i].files <= seen[i].total_files);
        if (i > 0) {
            ASSERT_TRUE(seen[i].files >= seen[i - 1].files && seen[i].bytes >= seen[i - 1].bytes);
        }
    }
    ASSERT_TRUE(seen.back().files == kStandardReachable);
    ASSERT_TRUE(seen.back().bytes == seen.back().total_bytes);
    // The duplicate record is the one file the game never reaches.
    ASSERT_TRUE(seen.back().total_bytes == total - 100);
    fs::remove_all(dir);
}

TEST(PlatformFirstrun, ExtractProgressCanCancel) {
    fs::path dir = TempDir("firstrun_cancel");
    Disc     disc = StandardDisc();
    bool     threw = false;
    try {
        dcdata::Extract(dcdata::OpenArchive(WriteIso(dir, disc)), dir / "data", nullptr,
                        [](const dcdata::Progress &) { return false; });
    } catch (const dcdata::Error &error) {
        threw = std::string_view(error.what()) == "extraction cancelled";
    }
    ASSERT_TRUE(threw);
    ASSERT_TRUE(!Extracted(dir / "data", disc));
    fs::remove_all(dir);
}

TEST(PlatformFirstrun, ExtractOnAThreadFillsTheDataRoot) {
    fs::path dir = TempDir("firstrun_thread");
    Disc     disc = StandardDisc();
    fs::create_directories(dir / "data/empty");
    std::thread::id caller = std::this_thread::get_id();
    bool            on_caller = true;
    FirstRunOutcome outcome = FirstRunExtract(WriteIso(dir, disc), dir / "data", [&](const dcdata::Progress &) {
        on_caller = on_caller && std::this_thread::get_id() == caller;
        return true;
    });
    ASSERT_TRUE(outcome.ok && !outcome.cancelled && outcome.error.empty());
    ASSERT_TRUE(on_caller);
    ASSERT_TRUE(Extracted(dir / "data", disc));
    ASSERT_TRUE(!fs::exists(dir / "data.partial"));
    ASSERT_TRUE(!fs::exists(dir / "data/empty"));
    fs::remove_all(dir);
}

TEST(PlatformFirstrun, ExtractFailureLeavesTheDataRootAlone) {
    fs::path dir = TempDir("firstrun_fail");
    Disc     disc = StandardDisc();
    Bytes    iso = MakeIso("DATA.DAT;1", disc.dat, "DATA.HD2;1", disc.hd2);
    iso.resize(iso.size() - 4096);
    WriteBytes(dir / "short.iso", iso);
    FirstRunOutcome outcome = FirstRunExtract(dir / "short.iso", dir / "data", [](const dcdata::Progress &) {
        return true;
    });
    ASSERT_TRUE(!outcome.ok && !outcome.cancelled && !outcome.error.empty());
    ASSERT_TRUE(FirstRunDataMissing(dir / "data"));

    outcome = FirstRunExtract(dir / "nothing.iso", dir / "data", [](const dcdata::Progress &) { return true; });
    ASSERT_TRUE(!outcome.ok && outcome.error.find("nothing.iso") != std::string::npos);
    ASSERT_TRUE(FirstRunDataMissing(dir / "data"));
    fs::remove_all(dir);
}

TEST(PlatformFirstrun, FlowExtractsTheChosenDiscImage) {
    Flow flow("firstrun_flow_iso");
    Disc disc = StandardDisc();
    flow.Run(WriteIso(flow.dir, disc));
    ASSERT_TRUE(flow.asked.size() == 1 && flow.asked[0] == FirstRunSource::DiscImage);
    ASSERT_TRUE(Extracted(flow.dir / "data", disc));
    ASSERT_TRUE(fs::is_regular_file(flow.dir / "data/data.hd2"));
}

TEST(PlatformFirstrun, FlowAcceptsAFolderWithTheArchive) {
    Flow flow("firstrun_flow_dir");
    Disc disc = StandardDisc();
    WriteBytes(flow.dir / "disc/DATA.DAT", disc.dat);
    WriteBytes(flow.dir / "disc/DATA.HD2", disc.hd2);
    flow.Run(flow.dir / "disc");
    ASSERT_TRUE(Extracted(flow.dir / "data", disc));
}

TEST(PlatformFirstrun, FlowCancelLeavesNoData) {
    Flow flow("firstrun_flow_cancel");
    flow.Run(std::nullopt);
    ASSERT_TRUE(flow.asked.size() == 1);
    ASSERT_TRUE(FirstRunDataMissing(flow.dir / "data"));
}

TEST(PlatformFirstrun, FlowSkipsPresentDataAndHeadlessRuns) {
    Flow flow("firstrun_flow_skip");
    FirstRunIfNoData(true);
    ASSERT_TRUE(WindowHandle() == nullptr);

    WriteBytes(flow.dir / "data/file.bin", Pattern(4, 2));
    flow.Run(flow.dir / "unused.iso");
    ASSERT_TRUE(flow.asked.empty());
}

TEST(PlatformFirstrun, FlowFailureExitsWithStatus1) {
    Flow  flow("firstrun_flow_error");
    pid_t child = fork();
    if (child == 0) {
        flow.Run(flow.dir / "missing.iso");
        std::_Exit(0);
    }
    int status = 0;
    ASSERT_TRUE(waitpid(child, &status, 0) == child);
    ASSERT_TRUE(WIFEXITED(status) && WEXITSTATUS(status) == kExitFailure);
    ASSERT_TRUE(FirstRunDataMissing(flow.dir / "data"));
}
