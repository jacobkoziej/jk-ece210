# SPDX-License-Identifier: GPL-3.0-or-later
#
# Copyright (C) 2023--2024  Jacob Koziej <jacobkoziej@gmail.com>

EnsureSConsVersion(4, 7, 0)
EnsurePythonVersion(3, 12)


import os
import subprocess


license = 'GPL-3.0-or-later'

Export('license')


build = 'build'
src = 'src'


env = Environment(
    ENV={
        'PATH': os.environ['PATH'],
        'PYTHONPATH': os.environ.get('PYTHONPATH'),
        'TERM': os.environ.get('TERM'),
    },
)

env.Replace(PDFLATEX='lualatex')
env.AppendUnique(
    PDFLATEXFLAGS=[
        '--halt-on-error',
        '--shell-escape',
    ]
)

Export('env')


git = env.WhereIs('git')

env['GIT_DIRTY'] = (
    '-dirty'
    if subprocess.run(
        [git, 'status', '--porcelain'],
        capture_output=True,
        encoding='utf-8',
    ).stdout.strip()
    else ''
)

env['GIT_HASH'] = subprocess.run(
    [git, 'rev-parse', '--short', 'HEAD'],
    capture_output=True,
    encoding='utf-8',
).stdout.strip()

env['GIT_HASH_LONG'] = subprocess.run(
    [git, 'rev-parse', 'HEAD'],
    capture_output=True,
    encoding='utf-8',
).stdout.strip()


VariantDir(f'{build}/{src}', src)

SConscript(f'{build}/{src}/SConscript')
