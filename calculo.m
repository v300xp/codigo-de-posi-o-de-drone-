function [t0, estado] = calculo(ts, t0, estado, forsa, i)

%estado={x,y,z,vx,vy,vz,fi,teta,psi,p,q,r}';
%con=[torque 1 Torque2 torque3 torque 4};

m=2.24;
J=[0.0384 ;  0.0384 ;  0.0615];
l=0.332;
d=0.0179;
x_atual=estado(1,1);
y_atual=estado(2,1);
z_atual=estado(3,1);
vx_atual=estado(4,1);
vy_atual=estado(5,1);
vz_atual=estado(6,1);
fi_atual=estado(7,1);
teta_atual=estado(8,1);
psi_atual=estado(9,1);
p_atual=estado(10,1);
q_atual=estado(11,1);
r_atual=estado(12,1);
g=9.81;


prox_x= x_atual +ts*(vz_atual*(sin(fi_atual)*sin(psi_atual)+cos(fi_atual)*cos(psi_atual)*sin(teta_atual))-vy_atual*(cos(fi_atual)*sin(psi_atual)-cos(psi_atual)*sin(fi_atual)*sin(teta_atual))+vx_atual*(cos(psi_atual)*cos(teta_atual)));
prox_y= y_atual +ts*(vy_atual*(cos(fi_atual)*cos(psi_atual)+sin(fi_atual)*sin(psi_atual)*sin(teta_atual))-vz_atual*(sin(fi_atual)*cos(psi_atual)-sin(psi_atual)*cos(fi_atual)*sin(teta_atual))+vx_atual*(sin(psi_atual)*cos(teta_atual)));
prox_z= z_atual +ts*(vz_atual*(cos(fi_atual)*cos(teta_atual))-vx_atual*(sin(teta_atual))+ vy_atual*(cos(teta_atual)*sin(psi_atual)));

prox_fi= fi_atual +ts*(p_atual+r_atual*(cos(fi_atual)*tan(teta_atual))+q_atual*(sin(fi_atual)*tan(teta_atual)));
prox_teta= teta_atual +ts*(q_atual*(cos(fi_atual))-r_atual*(sin(fi_atual)));
prox_psi= psi_atual +ts*(r_atual*(cos(fi_atual)/cos(teta_atual))+q_atual*(sin(fi_atual)/cos(teta_atual)));

prox_vx= vx_atual+ ts*(-g*sin(teta_atual)-q_atual*vz_atual+r_atual*vy_atual);
prox_vy= vy_atual+ ts*(g*(cos(teta_atual)*sin(fi_atual))+p_atual*vz_atual-r_atual*vx_atual);
prox_vz= vz_atual+ ts*(g*(cos(teta_atual)*cos(fi_atual))-p_atual*vy_atual+q_atual*vx_atual-(forsa(1,i)+forsa(2,i)+forsa(3,i)+forsa(4,i))/m);

prox_p= p_atual+ ts*(l*(forsa(3,i)-forsa(1,i))/J(1,1)+q_atual*r_atual*(J(2,1)-J(3,1))/J(1,1));
prox_q= q_atual+ ts*(l*(forsa(4,i)-forsa(2,i))/J(2,1)+p_atual*r_atual*(J(3,1)-J(1,1))/J(2,1));
prox_r= r_atual+ ts*(d*(forsa(1,i)-forsa(2,i)+forsa(3,i)-forsa(4,i))/J(3,1)+q_atual*p_atual*(J(1,1)-J(2,1))/J(3,1));


estado=[prox_x;prox_y;prox_z;prox_vx;prox_vy;prox_vz;prox_fi;prox_teta;prox_psi;prox_p;prox_q;prox_r];
t0 = t0 + ts;
end


