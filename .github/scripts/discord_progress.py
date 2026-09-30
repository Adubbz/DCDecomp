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


def payload(report, region="NTSC"):
    categories = {category["id"]: category for category in report["categories"]}
    units = report["units"]

    def category_units(category):
        return [
            unit
            for unit in units
            if category in unit.get("metadata", {}).get("progress_categories", ())
        ]

    def embed(release):
        prefix = f"{release.lower()}_" if region == "BOTH" else ""
        overall = release.lower() if region == "BOTH" else None
        sections = (
            ("Overall", categories[overall]["measures"] if overall else report["measures"],
             category_units(overall) if overall else units),
            ("Game", categories[prefix + "game"]["measures"],
             category_units(prefix + "game")),
            ("Title", categories[prefix + "title"]["measures"],
             category_units(prefix + "title")),
            ("DUN", categories[prefix + "dun"]["measures"],
             category_units(prefix + "dun")),
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
        "embeds": [embed(release) for release in
                   (("NTSC", "PAL") if region == "BOTH" else (region,))],
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--region", choices=("NTSC", "PAL", "BOTH"), default="NTSC")
    parser.add_argument("report", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()

    with args.report.open(encoding="utf-8") as report_file:
        report = json.load(report_file)
    with args.output.open("w", encoding="utf-8") as output_file:
        json.dump(payload(report, args.region), output_file, ensure_ascii=False)
        output_file.write("\n")


if __name__ == "__main__":
    main()
