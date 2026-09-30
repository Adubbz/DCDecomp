#!/usr/bin/env python3
import argparse
import json
from pathlib import Path


def percentage(value):
    return f"{float(value):.2f}%"


def function_count(count):
    count = int(count)
    return f"{count:,}"


def fuzzy_function_count(units):
    return sum(
        1
        for unit in units
        for function in unit.get("functions", ())
        if "fuzzy_match_percent" in function
        and function["fuzzy_match_percent"] != 100.0
    )


def slices(measures, units):
    """Perfect, fuzzy and unmatched shares, exclusive of each other."""
    perfect = float(measures.get("matched_code_percent", 0.0))
    matched = float(measures.get("fuzzy_match_percent", 0.0))
    total_functions = int(measures.get("total_functions", 0))
    perfect_functions = int(measures.get("matched_functions", 0))
    fuzzy_functions = fuzzy_function_count(units)
    return (
        ("Perfect", perfect, perfect_functions),
        ("Fuzzy", matched - perfect, fuzzy_functions),
        (
            "Other",
            100.0 - matched,
            total_functions - perfect_functions - fuzzy_functions,
        ),
    )


def heading(name, measures):
    return (
        f"{name} — {percentage(measures.get('fuzzy_match_percent', 0.0))} "
        f" ({function_count(measures.get('total_functions', 0))} functions)"
    )


def progress_line(measures, units):
    return " · ".join(
        f"{label} **{percentage(share)}** ({function_count(count)})"
        for label, share, count in slices(measures, units)
    )


def payload(reports):
    """One embed per release, from each release's own objdiff report."""

    def embed(release, report):
        categories = {category["id"]: category for category in report["categories"]}
        units = report["units"]

        def category_units(category):
            return [
                unit
                for unit in units
                if category in unit.get("metadata", {}).get("progress_categories", ())
            ]

        sections = (
            ("Overall", report["measures"], units),
            ("Game", categories["game"]["measures"], category_units("game")),
            ("Title", categories["title"]["measures"], category_units("title")),
            ("DUN", categories["dun"]["measures"], category_units("dun")),
        )
        return {
            "title": ("Dark Cloud NTSC 1.02" if release == "NTSC"
                      else "Dark Cloud PAL prototype (12 July 2001)"),
            "color": 0x5865F2,
            "fields": [
                {
                    "name": heading(name, measures),
                    "value": progress_line(measures, section_units),
                    "inline": False,
                }
                for name, measures, section_units in sections
            ],
        }

    return {
        "username": "Osmond",
        "allowed_mentions": {"parse": []},
        "embeds": [embed(release, report) for release, report in reports],
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--ntsc", type=Path, help="the NTSC 1.02 report")
    parser.add_argument("--pal", type=Path, help="the PAL prototype report")
    parser.add_argument("output", type=Path)
    args = parser.parse_args()

    reports = []
    for release, path in (("NTSC", args.ntsc), ("PAL", args.pal)):
        if path is not None:
            with path.open(encoding="utf-8") as report_file:
                reports.append((release, json.load(report_file)))
    if not reports:
        parser.error("no report given; pass --ntsc, --pal or both")
    with args.output.open("w", encoding="utf-8") as output_file:
        json.dump(payload(reports), output_file, ensure_ascii=False)
        output_file.write("\n")


if __name__ == "__main__":
    main()
