#include <gtest/gtest.h>

#include <string>

#include "platform/clock.hpp"

namespace {

std::string g_trace;

void HookA() {
    g_trace += 'a';
}

void HookB() {
    g_trace += 'b';
}

void Idle() {
    g_trace += 'i';
}

void SelfRemoving() {
    g_trace += 's';
    ClockRemovePumpHook(SelfRemoving);
}

} // namespace

TEST(IntegrationClock, PumpHooksChainBeforeTheIdleHook) {
    ClockSetUnbounded(true);
    ClockSetIdleHook(nullptr);
    ClockAddPumpHook(HookA);
    ClockAddPumpHook(HookB);
    ClockAddPumpHook(HookA);
    ClockPump();
    ASSERT_TRUE(g_trace == "ab");

    g_trace.clear();
    ClockSetIdleHook(Idle);
    ASSERT_TRUE(ClockGetIdleHook() == Idle);
    ClockSyncV();
    ASSERT_TRUE(g_trace == "abi");

    // The loading screen clearing the idle hook leaves the host's hooks running.
    g_trace.clear();
    ClockSetIdleHook(nullptr);
    ClockPump();
    ASSERT_TRUE(g_trace == "ab");

    g_trace.clear();
    ClockRemovePumpHook(HookA);
    ClockAddPumpHook(SelfRemoving);
    ClockPump();
    ClockPump();
    ASSERT_TRUE(g_trace == "bsb");
    ClockRemovePumpHook(HookB);
}
