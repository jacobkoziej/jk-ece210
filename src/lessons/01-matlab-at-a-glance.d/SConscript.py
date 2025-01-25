# SPDX-License-Identifier: GPL-3.0-or-later
#
# Copyright (C) 2024--2025  Jacob Koziej <jacobkoziej@gmail.com>

# ruff: noqa: F821

from SCons.Script import (
    Import,
    Return,
)

Import("env")


targets = []

targets += env.Glob("*.m")


Return("targets")
