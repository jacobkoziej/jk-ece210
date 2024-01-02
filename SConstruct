# SPDX-License-Identifier: GPL-3.0-or-later
#
# Copyright (C) 2023--2024  Jacob Koziej <jacobkoziej@gmail.com>

EnsureSConsVersion(4, 6)
EnsurePythonVersion(3, 12)


import os
import subprocess


license = 'GPL-3.0-or-later'

Export('license')


build = 'build'
src = 'src'


env = Environment()

if path := os.environ.get('PATH'):
    env['ENV']['PATH'] = path

if term := os.environ.get('TERM'):
    env['ENV']['TERM'] = term

env.Replace(PDFLATEX='lualatex')
env.AppendUnique(
    PDFLATEXFLAGS=[
        '--halt-on-error',
        '--shell-escape',
    ]
)

Export('env')


git = env.WhereIs('git')
git_hash = subprocess.run(
    [git, 'rev-parse', '--short', 'HEAD'],
    capture_output=True,
    encoding='utf-8',
).stdout.strip()
git_dirty = subprocess.run(
    [git, 'status', '--porcelain'], capture_output=True, encoding='utf-8'
).stdout.strip()

env['GIT_HASH'] = git_hash if not git_dirty else f'{git_hash}-dirty'
