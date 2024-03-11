fs = 44.1e3;
fn = fs / 2;

Wp = [1.0e3, 19.0e3] / fn;
Ws = [2.2e3, 16.8e3] / fn;
Rp = 4;
Rs = 40;

[n, Ws] = cheb2ord(Wp, Ws, Rp, Rs)
