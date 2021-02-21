%This is the script for calculate the flow rate at a considered moment
run Reference_Temperature
T1=input('Enter the reference temperature(K) : ');
p=input('Enter the density of flow(kg/m^3) : ');
c=input('Enter the specific heat capacity at constant pressure of flow(kJ/kgK) : ');
I=0;
while I==0
    V1=analogRead(a,1);
    V2=analogRead(a,2);
    V3=analogRead(a,3);
    Vbd=(V1*5)/1024;
    Vcd=(V2*5)/1024;
    Vab=((V3-V1)*5)/1024;
    Vac=((V3-V2)*5)/1024;
    V=V1-V2;
    if V==0
        I=Vac/330;
        [y,Fs]=audioread('Beep.wav');   
        sound(y,Fs);
    else
        disp('Calibrate the variable resistor well.');
        I=0;
    end
end
R4=Vcd/I;
R=R4;
T=35691/(10*(log(R) + 926192819086730809/140737488355328000));
fprintf('The temperature is %.3f K.\n',T);
q=(Vcd*I)/(p*c*(T1-T));
fprintf('The flow rate is %d m^3/s.\n',q);