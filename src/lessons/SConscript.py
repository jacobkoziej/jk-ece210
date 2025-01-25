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

targets += env.PDF("01-matlab-at-a-glance.tex")
env.Depends(targets[-1], SConscript("01-matlab-at-a-glance.d/SConscript.py"))

targets += env.PDF("02-vectorization.tex")
env.Depends(targets[-1], SConscript("02-vectorization.d/SConscript.py"))

targets += env.PDF("03-indexing.tex")
env.Depends(targets[-1], SConscript("03-indexing.d/SConscript.py"))

targets += env.PDF("04-functions.tex")
env.Depends(targets[-1], SConscript("04-functions.d/SConscript.py"))

targets += env.PDF("05-plotting.tex")
env.SideEffect(Glob("05-plotting.d/*-eps-converted-to.pdf"), targets[-1])
env.Depends(targets[-1], SConscript("05-plotting.d/SConscript.py"))

targets += env.PDF("06-filter-analysis.tex")
env.SideEffect(
    Glob("06-filter-analysis.d/*-eps-converted-to.pdf"), targets[-1]
)
env.Depends(targets[-1], SConscript("06-filter-analysis.d/SConscript.py"))

targets += env.PDF("07-filter-design.tex")
env.Depends(targets[-1], SConscript("07-filter-design.d/SConscript.py"))

targets += env.PDF("08-symbolic-math.tex")
env.Depends(targets[-1], SConscript("08-symbolic-math.d/SConscript.py"))

targets += env.PDF("09-fixed-point-arithmetic.tex")
env.Depends(
    targets[-1], SConscript("09-fixed-point-arithmetic.d/SConscript.py")
)

targets += env.PDF("10-image-compression.tex")
env.Depends(targets[-1], SConscript("10-image-compression.d/SConscript.py"))


Return("targets")
