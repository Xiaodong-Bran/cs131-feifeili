% Difference of Gaussion DoG Detector 
% with matlab symbol function
syms x sigma k
f = 1/(sqrt(2*pi)*(k*sigma))*exp(-x^2/(2*(k*sigma)^2));
f_dot=diff(f,x);
f_dotdot=diff(f_dot,x);
x1 = -10:0.1:10;
% ======================================
% use [subs][eval] to substitude the true value with the symbols
% ======================================
f2 = eval(subs(f_dotdot,{x,sigma,k},{x1,1,1}));
% Derivative of Gaussian
figure('Name','DoG');
plot(x1,f2);
hold on;
% Difference of Gaussian
fk=1/(sqrt(2*pi)*(k*sigma))*exp(-x^2/(2*(k*sigma)^2));
Dk = fk - f /(k*sigma-sigma);
for k_val = [1.2 1.4 1.6 1.8 2.0]
Dkv = eval(subs(Dk,{x,sigma,k},{x1,1,k_val}));
plot(x1,Dkv);
end
legend('Ori','1.2','1.4','1.6','1.8','2.0');