%% Sogol Goodarzi  810198467   HW#4
%% Part(a): Creating the Observations
fs = 1e6;
t = 0:1/fs:0.001-1/fs;
f1 = 20*1e3;   
f2 = 10*1e3;
fc = 150*1e6;
s1 = exp(1i*2*pi*f1*t);
s2 = exp(1i*2*pi*f2*t);
mu = 0;  Var = 1;
A = [];
M = 10;
d = 1;
C = 3*1e8;
k = 2*pi*fc/C;
theta1 = 10;
theta2 = 20;
for n=0:M-1
    dummy = [exp(-1i*k*n*d*sind(theta1)),exp(-1i*k*n*d*sind(theta2))];
    A = [A;dummy];
end
Noise = sqrt(Var)*randn(M,1000);
Noise = Noise-mean(Noise);
S = [s1;s2];
Y = A*S + Noise;
%% Part(b): Beamforming Method
[U,Sigma,V] = svd(Y);
U_sig = U(:,1:2);
n = [0:M-1]';
f_beam = [];
for theta=0:0.01:90
    a = exp(-1i*k*n*d*sind(theta));
    f_beam = [f_beam;norm(a'*U_sig)];
end

theta = 0:0.01:90;
plot(theta,f_beam);
xlabel("$\theta$",Interpreter="latex");
ylabel("$f(\theta)$",Interpreter="latex");
title("$f(\theta)$ for Beamforming Method",Interpreter="latex");
Theta1 = theta(find(f_beam==max(f_beam)));
Theta2 = theta(find(f_beam==max(f_beam(1200:end))));
fprintf('The angles of the two sources are: \n Theta1 = %.2f \n Theta2 = %.2f \n',Theta1,Theta2);
%% Part(c): MUSIC Method
U_null = U(:,3:end);
n = [0:M-1]';
f_MUSIC = [];
for theta=0:0.01:90
    a = exp(-1i*k*n*d*sind(theta));
    f_MUSIC = [f_MUSIC;1/norm(a'*U_null)];
end

theta = 0:0.01:90;
plot(theta,f_MUSIC);
xlabel("$\theta$",Interpreter="latex");
ylabel("$f(\theta)$",Interpreter="latex");
title("$f(\theta)$ for MUSIC Method",Interpreter="latex");
Theta1 = theta(find(f_beam==max(f_beam)));
Theta2 = theta(find(f_beam==max(f_beam(1200:end))));
fprintf('The angles of the two sources are: \n Theta1 = %.2f \n Theta2 = %.2f \n',Theta1,Theta2);
%% Part(d): Beamforming Method 
V_sig = V(:,1:2);
fs_beam = [];
for f=(1:0.1:50)*1e3
    S_T = exp(1i*2*pi*f*t);
    fs_beam = [fs_beam;norm(S_T*V_sig)];
end

f = (1:0.1:50)*1e3;
plot(f,fs_beam);
xlabel("$frequency$",Interpreter="latex");
ylabel("$F(f)$",Interpreter="latex");
title("$F(f)$ for Beamforming Method",Interpreter="latex");
f_1 = f(find(fs_beam==max(fs_beam(1:100))));
f_2 = f(find(fs_beam==max(fs_beam(50:end))));
fprintf('The frequencies of the two sources are: \n f1 = %d \n f2 = %d \n',f_1,f_2);
%% Part(e): MUSIC Method
V_null = V(:,3:end);
fs_MUSIC = [];
for f=(1:0.1:50)*1e3
    S_T = exp(1i*2*pi*f*t);
    fs_MUSIC = [fs_MUSIC;1/norm(S_T*V_null)];
end

f = (1:0.1:50)*1e3;
plot(f,fs_MUSIC);
xlabel("$frequency$",Interpreter="latex");
ylabel("$F(f)$",Interpreter="latex");
title("$F(f)$ for MUSIC Method",Interpreter="latex");
f_1 = f(find(fs_MUSIC==max(fs_MUSIC(1:100))));
f_2 = f(find(fs_MUSIC==max(fs_MUSIC(50:end))));
fprintf('The frequencies of the two sources are: \n f1 = %d \n f2 = %d \n',f_1,f_2);




