//impulse response
s=%s;
// Variable
tau1=10;    tau2=10;    w0=1;
w11=1;  w12=2;    w21=2;    w22=2;


G11=w0*(s+w22+1/tau2);
G12=(s-w11+1/tau1)*(s+w22+1/tau2)+w12*w21;
roots(G12)


G1=G11/G12;
sys1=syslin('c',G1);
clf();
square();
plzr(sys1)

G21=w0*w12;
G22=(s-w11+1/tau1)*(s+w22+1/tau2)+w12*w21;
G2=G21/G22;
sys2=syslin('c',G2);
clf();
square()
plzr(sys2)
xtitle("","実軸","虚軸")
