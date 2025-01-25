# SPDX-License-Identifier: GPL-3.0-or-later
#
# Copyright (C) 2023--2025  Jacob Koziej <jacobkoziej@gmail.com>

import os
import subprocess

from SCons.Environment import Environment
from SCons.Script import (
    EnsurePythonVersion,
    EnsureSConsVersion,
    Export,
    SConscript,
)

EnsureSConsVersion(4, 7, 0)
EnsurePythonVersion(3, 12)


env = Environment(
    ENV={
        "PATH": os.environ["PATH"],
        "PYTHONPATH": os.environ.get("PYTHONPATH"),
        "TERM": os.environ.get("TERM"),
    },
    LICENSE="GPL-3.0-or-later",
)

env.Replace(
    PDFLATEX="lualatex",
)
env.AppendUnique(
    PDFLATEXFLAGS=[
        "--halt-on-error",
    ],
)

Export("env")


git = env.WhereIs("git")

env["GIT_DIRTY"] = (
    "-dirty"
    if subprocess.run(
        [git, "status", "--porcelain"],
        capture_output=True,
        encoding="utf-8",
    ).stdout.strip()
    else ""
)

env["GIT_HASH"] = subprocess.run(
    [git, "rev-parse", "--short", "HEAD"],
    capture_output=True,
    encoding="utf-8",
).stdout.strip()

env["GIT_HASH_LONG"] = subprocess.run(
    [git, "rev-parse", "HEAD"],
    capture_output=True,
    encoding="utf-8",
).stdout.strip()


build = "build"

src = SConscript(
    "src/SConscript.py",
    variant_dir=f"{build}/src",
)
