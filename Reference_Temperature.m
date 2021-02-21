%This is the script for calculate the reference temperature for the process
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
        disp('Calibrate the variable resistor well');
        I=0;
    end
end
R4=Vcd/I;
R=R4;
T1=35691/(10*(log(R) + 926192819086730809/140737488355328000));
fprintf('The reference temperature is %.3f K.\n',T1);