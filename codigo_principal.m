inputs = importdata('out.txt')';
simulation = importdata('in.txt')';
%dados da simulação{
dados=simulation;
%\xi
x_s=dados(1,:);
y_s=dados(2,:);
z_s=dados(3,:);
%xi0=[x(1);y(1);z(1)]
%\xi_dot
vx_s=dados(13,:);
vy_s=dados(14,:);
vz_s=dados(15,:);

%Euler angles
fi_s=dados(6,:);
teta_s=dados(5,:);
psi_s=dados(4,:);
%omega
p_s=dados(16,:);
q_s=dados(17,:);
r_s=dados(18,:);
%}
%Vaiaveis de estado para simulação matematica
%estado{x,y,z,vx,vy,vz,fi,teta,psi,p,q,r}
estado_0=[0 0 0 0 0 0 0 0 0 0 0 0]'; % condição inicial
estado=estado_0; % vetor dos estado
estados=[]; %vetor que armazena os estados 
ts= 0.01; %[s] tempo de amostragem
iter=0; %intervalo de simulação
sim_tim=2; % tempo total de simulação
tempo=0; % tempo simulado
t0=0; %tempo auxiliar 
tempo_vec=[];%vetor com os tempos
%Parâmetros do quadrotor
%Massa(Kg)
m=2.24;g=9.81;
%distancia dos centros dos rotores ao centro de massa(m)
l=0.332;
%Constante de conversão empuxo-torque
d=0.0179;
J=[0.0384 ;  0.0384 ;  0.0615];% tensor de inercia
i=1; %auxiliar
forsa = inputs; %forças
%con=[torque 1 Torque2 torque3 torque 4}

while(iter < sim_tim / ts) % CondiÃ§Ã£o do loop
    estados=[estados,estado]; %a lÃ³gica de empilhar dados da simulaÃ§Ã£o 
    tempo=(iter)*ts; %valor do tempo simulado 
    tempo_vec=[tempo_vec;tempo];  
    
   iter=iter+1;
    
    [t0, estado] = calculo(ts, t0, estado, forsa, i);
   
        i= i + 1; 
   
    
end
figure()
plot(tempo_vec,x_s);
title('x simulado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Distância (m)') % eixo vertical
grid on

figure()
plot(tempo_vec,estados(1,:));
title('x calculado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Distância (m)') % eixo vertical
grid on

figure()
plot(tempo_vec,y_s);
title('y simulado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Distância (m)') % eixo vertical
grid on

figure()
plot(tempo_vec,estados(2,:));
title('y calculado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Distância (m)') % eixo vertical
grid on

figure()
plot(tempo_vec,z_s);
title('z simulado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Distância (m)') % eixo vertical
grid on

figure()
plot(tempo_vec,estados(3,:));
title('z calculado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Distância (m)') % eixo vertical
grid on

figure()
plot(tempo_vec,vx_s);
title('v_x simulado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Velocidade (m/s)') % eixo vertical
grid on

figure()
plot(tempo_vec,estados(4,:));
title('v_x calculado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Velocidade (m/s)') % eixo vertical
grid on

figure()
plot(tempo_vec,vy_s);
title('v_y simulado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Velocidade (m/s)') % eixo vertical
grid on

figure()
plot(tempo_vec,estados(5,:));
title('v_y calculado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Velocidade (m/s)') % eixo vertical
grid on

figure()
plot(tempo_vec,vz_s);
title('vz simulado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Velocidade (m/s)') % eixo vertical
grid on

figure()
plot(tempo_vec,estados(6,:));
title('v_z calculado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Velocidade (m/s)') % eixo vertical
grid on

figure()
plot(tempo_vec,fi_s);
title('fi simulado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Ângulo (rad)') % eixo vertical
grid on

figure()
plot(tempo_vec,estados(7,:));
title('fi calculado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Ângulo (rad)') % eixo vertical
grid on


figure()
plot(tempo_vec,teta_s);
title('teta simulado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Ângulo (rad)') % eixo vertical
grid on

figure()
plot(tempo_vec,estados(8,:));
title('teta calculado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Ângulo (rad)') % eixo vertical
grid on


figure()
plot(tempo_vec,psi_s);
title('psi simulado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Ângulo (rad)') % eixo vertical
grid on

figure()
plot(tempo_vec,estados(9,:));
title('psi calculado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Ângulo (rad)') % eixo vertical
grid on


figure()
plot(tempo_vec,p_s);
title('p simulado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Velocidade angular (rad/s)') % eixo vertical
grid on

figure()
plot(tempo_vec,estados(10,:));
title('p calculado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Velocidade angular (rad/s)') % eixo vertical
grid on

figure()
plot(tempo_vec,q_s);
title('q simulado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Velocidade angular (rad/s)') % eixo vertical
grid on

figure()
plot(tempo_vec,estados(11,:));
title('q calculado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Velocidade angular (rad/s)') % eixo vertical
grid on

figure()
plot(tempo_vec,r_s);
title('r simulado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Velocidade angular (rad/s)') % eixo vertical
grid on

figure()
plot(tempo_vec,estados(12,:));
title('r calculado por tempo')
xlabel('Tempo(s)') % eixo horizontal
ylabel('Velocidade angular (rad/s)') % eixo vertical
grid on

figure()
plot3(x_s,y_s,z_s, '-');
title('Distância 3D simulado por tempo')
xlabel('Distância_x (m)') % eixo vertical
ylabel('Distância_Y (m)') % eixo vertical
zlabel('Distância_z (m)') % eixo vertical
grid on

figure()
plot3(estados(1,:),estados(2,:),estados(3,:), '-');
title('Distância 3D calculada')
xlabel('Distância_x (m)') % eixo vertical
ylabel('Distância_Y (m)') % eixo vertical
zlabel('Distância_z (m)') % eixo vertical
grid on
