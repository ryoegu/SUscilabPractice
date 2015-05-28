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



G21=w0*w12;
G22=(s-w11-1/tau1)*(s+w22+1/tau2)+w12*w21;
G2=G21/G12;
sys2=syslin('c',G2);


t=0:0.1:10;
x1=csim('impulse',t,sys1);
x2=csim('impulse',t,sys2);
plot2d(x1',x2')
xtitle('State transition in the state space','x1(t)','x2(t)');
