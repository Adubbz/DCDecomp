#include <algorithm>
#include <chrono>
#include <thread>
#include <vector>

#include "../platform/clock.hpp"
#include "test.hpp"

namespace {

int g_ticks;
int g_idles;
int g_pumps_inside;

int CountTick(int) {
    ++g_ticks;
    return 0;
}

void CountIdle() {
    ++g_idles;
}

int PumpFromTick(int) {
    ++g_ticks;
    ClockPump();
    ++g_pumps_inside;
    return 0;
}

void Start(double hertz, bool unbounded) {
    ClockSetTickRate(hertz);
    ClockSetUnbounded(unbounded);
    ClockSetTickCallback(CountTick);
    ClockSetIdleHook(CountIdle);
    ClockReset();
    g_ticks = 0;
    g_idles = 0;
}

} // namespace

DC_TEST(platform_clock_defaults_to_pal_rate) {
    DC_CHECK(ClockTickRate() == 50.0);
    DC_CHECK(!ClockUnbounded());
    ClockSetTickRate(-1.0);
    DC_CHECK(ClockTickRate() == 50.0);
}

DC_TEST(platform_clock_unbounded_advances_one_tick_per_pump) {
    Start(50.0, true);
    auto start = std::chrono::steady_clock::now();
    for (int i = 0; i < 100; ++i) {
        ClockWaitNextTick();
        DC_CHECK(ClockPump() == i + 1);
    }
    DC_CHECK(std::chrono::steady_clock::now() - start < std::chrono::milliseconds(500));
    DC_CHECK(ClockTickCount() == 100);
    DC_CHECK(g_ticks == 100);
    DC_CHECK(g_idles == 100);
}

DC_TEST(platform_clock_pump_runs_callback_per_elapsed_tick) {
    Start(1000.0, false);
    DC_CHECK(ClockPump() == 0);
    std::this_thread::sleep_for(std::chrono::milliseconds(30));
    std::int64_t count = ClockPump();
    DC_CHECK(count >= 30);
    DC_CHECK(count < 300);
    DC_CHECK(g_ticks == count);
    DC_CHECK(g_idles == 2);
    DC_CHECK(ClockPump() >= count);
}

DC_TEST(platform_clock_pump_is_not_reentrant) {
    Start(50.0, true);
    ClockSetTickCallback(PumpFromTick);
    g_pumps_inside = 0;
    DC_CHECK(ClockPump() == 1);
    DC_CHECK(g_ticks == 1);
    DC_CHECK(g_pumps_inside == 1);
    DC_CHECK(ClockGetTickCallback() == PumpFromTick);
}

DC_TEST(platform_clock_rate_change_keeps_count) {
    Start(1000.0, false);
    std::this_thread::sleep_for(std::chrono::milliseconds(10));
    std::int64_t before = ClockPump();
    ClockSetTickRate(10.0);
    DC_CHECK(ClockTickCount() == before);
    DC_CHECK(ClockPump() == before);
    auto start = std::chrono::steady_clock::now();
    DC_CHECK(ClockSyncV() == before + 1);
    auto waited = std::chrono::steady_clock::now() - start;
    DC_CHECK(waited >= std::chrono::milliseconds(99));
    DC_CHECK(waited < std::chrono::milliseconds(150));
}

// One SyncV per tick at 200 Hz: every wake must land on or just after its
// tick boundary, never before it.
DC_TEST(platform_clock_wait_accuracy) {
    constexpr double kHertz = 200.0;
    constexpr int    kTicks = 60;
    Start(kHertz, false);
    auto                anchor = std::chrono::steady_clock::now();
    std::vector<double> lateness;
    for (int i = 0; i < kTicks; ++i) {
        std::int64_t count = ClockSyncV();
        auto         now = std::chrono::steady_clock::now();
        double       due = static_cast<double>(count) / kHertz;
        lateness.push_back(std::chrono::duration<double>(now - anchor).count() - due);
    }
    DC_CHECK(ClockTickCount() >= kTicks);
    std::ranges::sort(lateness);
    double median = lateness[lateness.size() / 2];
    std::printf("wake lateness at %.0f Hz: min %.1f us, median %.1f us, max %.1f us\n", kHertz, lateness.front() * 1e6,
                median * 1e6, lateness.back() * 1e6);
    DC_CHECK(lateness.front() > -50e-6);
    DC_CHECK(median < 1e-3);
    DC_CHECK(lateness.back() < 20e-3);
}
