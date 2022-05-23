%%Input



T06 =[ 0.297900,    -0.131600,    -0.945500,  -623.9747 ;
      -0.855100,     0.403400,    -0.325600,   365.0029 ;
       0.424200,     0.905500,     0.007700,   448.9377 ;
       0.000000,     0.000000,     0.000000,   1.000000 ];


%% DH
a_1=0;
a_2=0;
a_3=425;
a_4=392.25;
a_5=0;
a_6=0;
alpha_1=0;
alpha_2=pi/2;
alpha_3=0;
alpha_4=0;
alpha_5=-pi/2;
alpha_6=pi/2;
d_1=89.1590;
d_2=0;
d_3=0;
d_4=109.15;
d_5=94.65;
d_6=82.3;


%% Vektorerne fra T-matricen

P06 = [T06(1,4), T06(2,4), T06(3,4)];
X06 = [T06(1,1), T06(2,1), T06(3,1)];
Y06 = [T06(1,2), T06(2,2), T06(3,2)];
Z06 = [T06(1,3), T06(2,3), T06(3,3)];

%% calculation of theta_1

P05 = [P06-d_6*Z06];

phi_1 = vpa(atan2(P05(2), P05(1)));

phi_2 = acos((d_4)/(sqrt(P05(1)^2+P05(2)^2)));

phi_2 = [phi_2, - phi_2];

theta_1all=vpa((phi_1+phi_2+pi/2));

theta_1=theta_1all(1);
%%  calculation of theta_5

theta_5=vpa(acos(vpa((P06(1))*sin(theta_1)-P06(2)*cos(theta_1)-d_4)/d_6));

theta_5all=[theta_5, -theta_5];

%% calculation of theta_6

T60 = inv(T06);
X60x = T60(1,1);
X60y = T60(2,1);
Y60x = T60(1,2);
Y60y = T60(2,2);

theta6_arg1 = -X60y*sin(theta_1) + Y60y*cos(theta_1) / sin(theta_5);
theta6_arg2 =  X60x*sin(theta_1) - Y60x*cos(theta_1) / sin(theta_5);

 
theta_6 = vpa(atan2(theta6_arg1,theta6_arg2));

%% calculation of theta_3
T01 = TDH(alpha_1, a_1, d_1, theta_1);
T45 = TDH(alpha_5, a_5, d_5, theta_5);
T56 = TDH(alpha_6, a_6, d_6, theta_6+pi);
T16 = inv(T01) * T06;
T14 =T16*inv(T45*T56);
P14= T14(:,end);

LP14XZ=vpa(sqrt(P14(1)^2+P14(3)^2));


theta_3=vpa(-acos((LP14XZ^2-a_3^2-a_4^2)/(2*a_3*a_4)));


theta_3all=[theta_3, -theta_3];


%% calculation of theta 2

theta_2=atan2(-(P14(3)),-(P14(1)))- asin(a_4*sin(theta_3)/sqrt(P14(1)^2+P14(3)^2));

%%  calculation of theta 4

T12 = TDH(alpha_2, a_2, d_2, theta_2+pi);

T23 = TDH(alpha_3, a_3, d_3, theta_3);

T34 = inv(T12*T23)*(T14);

theta_4=atan2(T34(2,1),T34(1,1));
%% Final theta values in degrees
theta_1alldeg = vpa(rad2deg(theta_1all))
theta_2alldeg = vpa(rad2deg(theta_2))
theta_3alldeg = vpa(rad2deg(theta_3all ))
theta_4alldeg = vpa(rad2deg(theta_4 ))
theta_5alldeg = vpa(rad2deg(theta_5all ))
theta_6alldeg = vpa(rad2deg(theta_6 ))
