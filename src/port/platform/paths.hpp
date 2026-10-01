#pragma once

#include <filesystem>

// Removes --data <dir>, --data=<dir>, --save <dir> and --save=<dir> from argv, keeping the order of
// the rest, and returns the new argc.
int PathsConsumeArgs(int argc, char **argv);

int PathsConsumeArgs(int argc, const char **argv);

void PathsSetDataRoot(const std::filesystem::path &root);

void PathsSetSaveRoot(const std::filesystem::path &root);

const std::filesystem::path &PathsDataRoot();

// Created on first use.
const std::filesystem::path &PathsSaveRoot();
