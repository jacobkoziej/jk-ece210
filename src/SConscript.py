# SPDX-License-Identifier: GPL-3.0-or-later
#
# Copyright (C) 2024--2025  Jacob Koziej <jacobkoziej@gmail.com>

# ruff: noqa: F821

from SCons.Script import (
    Import,
    Return,
    SConscript,
)

Import("env")


env.PrependENVPath("TEXINPUTS", env.Dir(".").abspath)


targets = []

targets += env.Substfile(
    "git-hash.tex.in",
    SUBST_DICT={
        "@GIT_DIRTY@": env["GIT_DIRTY"],
        "@GIT_HASH@": env["GIT_HASH"],
        "@GIT_HASH_LONG@": env["GIT_HASH_LONG"],
    },
)

targets += env.PDF("submissions.tex")

targets += env.PDF("syllabus.tex")


targets += SConscript(
    [
        "assignments/SConscript.py",
        "lessons/SConscript.py",
    ],
)


Return("targets")
