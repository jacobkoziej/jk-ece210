[sos, g] = zp2sos(z, p, k)

s_filt = g * sosfilt(sos, s);
