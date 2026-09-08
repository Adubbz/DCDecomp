#!/usr/bin/env python3
import argparse
import json
from pathlib import Path


def percentage(measures, name):
    return f"{float(measures.get(name, 0.0)):.2f}%"


def function_count(count):
    count = int(count)
    suffix = "" if count == 1 else "s"
    return f"{count:,} function{suffix}"


def fuzzy_function_count(units):
    return sum(
        1
        for unit in units
        for function in unit.get("functions", ())
        if "fuzzy_match_percent" in function
        and function["fuzzy_match_percent"] != 100.0
    )


def progress_line(measures, units):
    return (
        f"Perfect **{percentage(measures, 'matched_code_percent')}** "
        f"({function_count(measures.get('matched_functions', 0))})"
        f" · Fuzzy **{percentage(measures, 'fuzzy_match_percent')}** "
        f"({function_count(fuzzy_function_count(units))})"
    )


def payload(report):
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
        "username": "Osmond",
        "allowed_mentions": {"parse": []},
        "embeds": [
            {
                "title": "Dark Cloud NTSC 1.02",
                "color": 0x5865F2,
                "fields": [
                    {
                        "name": name,
                        "value": progress_line(measures, section_units),
                        "inline": False,
                    }
                    for name, measures, section_units in sections
                ],
            }
        ],
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("report", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()

    with args.report.open(encoding="utf-8") as report_file:
        report = json.load(report_file)
    with args.output.open("w", encoding="utf-8") as output_file:
        json.dump(payload(report), output_file, ensure_ascii=False)
        output_file.write("\n")


if __name__ == "__main__":
    main()
