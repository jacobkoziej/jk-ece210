% SPDX-License-Identifier: GPL-3.0-or-later
%
% Solution.m -- Assignment 03 solution
% Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>

clc;
clear;
close all;

ITERATIONS = 1e6;

CREWMATES = 6;
ROUNDS = 12;

CREWMATE_SIDES = 4;
IMPOSTER_ROLLS = 2;
IMPOSTER_SIDES = 2;

rng(0x73757300);

%% 1
crewmates = randi(CREWMATE_SIDES, CREWMATES, ITERATIONS);

sus = randi(IMPOSTER_SIDES, IMPOSTER_ROLLS, ITERATIONS);
sus = sum(sus);

targets = randi(CREWMATES, ROUNDS, ITERATIONS);

%% 2
kills = zeros(size(crewmates));

rows = targets(:);

cols = repmat(1:ITERATIONS, ROUNDS, 1);
cols = cols(:);

ind = sub2ind(size(kills), rows, cols);

kills(ind) = 1;

%% 3
survivors = (sus > crewmates) & kills;

%% 4
losses = sum(survivors) <= 1;
loss_rate = mean(losses);
