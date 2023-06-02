function Propellant_parameters = EquilibratePropellant(propellant)
%Equilibrate propellant finds the state of propellant equilibrium with
%frozen enthalpy and  pressure, and returns specified parameters necessary
Propellant_parameters.names=zeros(9,1);
Propellant_parameters.values=zeros(9,1);
Propellant_parameters.units=zeros(9,1);
Propellant_parameters.values(1)=density(propellant); %Returns density of propellant before combustion [kg/m3]
transport=Transport(propellant,'default');
equilibrate(propellant,'HP'); %Find state of equilibrium of propellant
Propellant_parameters.values(2)=temperature(propellant); %Return reached temperature [K]
Propellant_parameters.values(3)=cp_mass(propellant)/cv_mass(propellant); %Returns adiabatic constant
Propellant_parameters.values(4)=cp_mass(propellant)-cv_mass(propellant); %Returns gas constant 
Propellant_parameters.values(5)=meanMolecularWeight(propellant); %Returns molar weight of combustion products
Propellant_parameters.values(6)=soundspeed(propellant); %Returns sound speed in combustion products
Propellant_parameters.values(7)=viscosity(transport); %Dynamic viscosity of combustion products
Propellant_parameters.values(8)=thermalConductivity(transport); %Thermal conductivity coefficient of exhaust gases
Propellant_parameters.values(9)=cp_mass(propellant)*Propellant_parameters.values(7)/Propellant_parameters.values(8);
Propellant_parameters.names={'rho';'T';'kappa';'R';'m_mol';'a';'mu';'alpha';'Pr'};
Propellant_parameters.units={'kg/m3';'K';'';'J/kg/K';'kg/kmol';'m/s';'Pa*s';'W/m/K';''};
writetable(struct2table(Propellant_parameters),'Results/Propellant_parameters.txt','Delimiter','tab');
end

