clear;
close all;
clc;
oxid='NO2';
fuel='CH4';
of_ratio=8;
T0=300;
p0=1*10^5;
propellant=PropellantComposition(oxid,fuel,of_ratio,T0,p0);
d=density(propellant);
results=EquilibratePropellant(propellant);

