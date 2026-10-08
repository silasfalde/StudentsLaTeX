#!/usr/bin/env python3
"""Generate latex-custom-classes.json (LaTeX Workshop) from the .cwl source.

Edit latex-custom-classes.cwl, then run:

    python3 intellisense/generate-json.py

Use `--check` to verify the JSON is up to date without writing it.

CWL line formats understood:
    \\name                      macro without arguments
    \\name[opt]{arg}|arg|       macro; the text inside each group is the
                               placeholder shown in the snippet
    \\begin{env}[opt]{arg}      environment, optionally with arguments
Lines starting with `#` and blank lines are ignored. When a name appears more
than once only the first entry is kept.
"""
import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
CWL = HERE / "latex-custom-classes.cwl"
OUT = HERE / "latex-custom-classes.json"

ARG = re.compile(r"\[([^\]]*)\]|\{([^}]*)\}|\|([^|]*)\|")


def parse_args(rest):
    """Return (format, snippet_tail) for the argument groups in `rest`."""
    fmt, snippet = "", ""
    for i, m in enumerate(ARG.finditer(rest), start=1):
        if m.group(1) is not None:
            fmt += "[]"
            snippet += "[${%d:%s}]" % (i, m.group(1))
        elif m.group(2) is not None:
            fmt += "{}"
            snippet += "{${%d:%s}}" % (i, m.group(2))
        else:
            fmt += "|"
            snippet += "|${%d:%s}|" % (i, m.group(3))
    return fmt, snippet


def build():
    macros, envs, seen = [], [], set()
    for raw in CWL.read_text().splitlines():
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        env = re.match(r"\\begin\{([^}]+)\}(.*)$", line)
        if env:
            name, rest = env.groups()
            kind, target = "env", envs
        else:
            mac = re.match(r"\\([A-Za-z]+)(.*)$", line)
            if not mac:
                raise SystemExit("Cannot parse line: %r" % raw)
            name, rest = mac.groups()
            kind, target = "macro", macros
        if (kind, name) in seen:
            continue
        seen.add((kind, name))
        entry = {"name": name}
        fmt, tail = parse_args(rest)
        if fmt:
            if name == "documentclass":
                # Generic on purpose: the .cwl lists one line per class.
                fmt, tail = "[]{}", "[${1:options}]{${2:class}}"
            snippet = tail if kind == "env" else name + tail
            entry["arg"] = {"format": fmt, "snippet": snippet}
        target.append(entry)
    return {"deps": [], "macros": macros, "envs": envs, "keys": {}, "args": []}


def main():
    text = json.dumps(build(), indent=4) + "\n"
    if "--check" in sys.argv:
        if OUT.read_text() != text:
            raise SystemExit("latex-custom-classes.json is out of date")
        print("latex-custom-classes.json is up to date")
        return
    OUT.write_text(text)
    print("Wrote %s" % OUT.name)


if __name__ == "__main__":
    main()
