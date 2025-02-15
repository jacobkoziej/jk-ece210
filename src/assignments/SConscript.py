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


targets = []

targets += env.PDF("01-rolling-in-the-mud.tex")

targets += env.PDF("02-a-new-way-of-thinking.tex")
env.SideEffect(Glob("_minted-02-a-new-way-of-thinking/*"), targets[-1])

targets += env.PDF("03-amogus.tex")
env.SideEffect(Glob("_minted-03-amogus/*"), targets[-1])

targets += env.PDF("04-func-off.tex")
env.SideEffect(Glob("_minted-04-func-off/*"), targets[-1])

targets += env.PDF("05-plotting-scheming-even.tex")

targets += env.PDF("06-four-year-transform.tex")
env.SideEffect(Glob("_minted-06-four-year-transform-off/*"), targets[-1])

targets += env.PDF("07-under-pressure.tex")
env.SideEffect(Glob("_minted-07-under-pressure/*"), targets[-1])
env.Depends(targets[-1], SConscript("07-under-pressure.d/SConscript.py"))

targets += env.PDF("08-must-be-easy.tex")


Return("targets")
