T = numerictype(true, 16, 14)

D = fdesign.lowpass(Fp, Fs, Rp, Rs, fs);
LPF = design(D, 'ellip', 'SystemObject', true);

LPF.Structure = 'Direct form I';
LPF.DenominatorAccumulatorDataType = T;
LPF.OutputDataType = T;

s_filtered = LPF(fi(s, T));

f = figure;
plot(t, s_filtered);
title('"Filtered" Data');
xlabel('Time [s]');
