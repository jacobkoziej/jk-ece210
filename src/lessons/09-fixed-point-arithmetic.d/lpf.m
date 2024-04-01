Fp = 35;
Fs = 45;
Rp = 1;
Rs = 40;

D = fdesign.lowpass(Fp, Fs, Rp, Rs, fs);
LPF = design(D, 'ellip', 'SystemObject', true);

LPF.Structure = 'Direct form I';
LPF.DenominatorAccumulatorDataType = T;
LPF.OutputDataType = T;
