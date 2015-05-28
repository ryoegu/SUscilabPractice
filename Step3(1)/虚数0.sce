//impulse response
s=%s;
// Variable
tau1=10;    tau2=10;    w0=1;
w11=2/5;  w12=1;    w21=1;    w22=1/5;
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
plot2d(t',[x1',x2'])
legend(["x1","x2"],1);
xtitle('Time courses of x1(t) and x2(t)','Time','x1(t),x2(t)');
