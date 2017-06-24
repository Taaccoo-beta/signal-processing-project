function waveProducer(n)
duration = 0.8;
toneFreq = n;
Fs = 44100; % the bit rate of the tone

%change the amplification to make the wave sounds more really
A = linspace(0,0.9,round(0.2*duration*Fs));
B = linspace(0.9,0.8,round(0.05*duration*Fs));
C = linspace(0.8,0.8,round(0.4*duration*Fs));
D = linspace(0.8,0,round(0.35*duration*Fs));
changeAmplification = [A,B,C,D];

x = linspace(0,duration,round(duration*Fs));
t = linspace(0, duration * toneFreq * 2 * pi, round(duration * Fs));
y = changeAmplification.*sin(t); % the equation of the sound wave
plot(x,y);
axis([0,0.01,-0.5,0.5]);
title("Wave Shape");
sound(y,Fs);
end

