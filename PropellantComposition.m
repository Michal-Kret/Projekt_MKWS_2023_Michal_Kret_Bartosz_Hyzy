function propellant=PropellantComposition(oxid,fuel,of_ratio,T0,p0)
%PropellantComposition() - function used to define composition of
%propellant and initial parameters
%ratios of analyzed propellant
%Michał Kret MKWS 2023
propellant=Solution('gri30.yaml'); %Initializing data file and gas solution from GRI30 library
n_sp=nSpecies(propellant); %Number of all the species in .yaml file
m_mole=molecularWeights(propellant); %Array of mollar weights [kg/kmol]
x=zeros(n_sp,1); %Array of molar fractions

i_fuel=speciesIndex(propellant,fuel); %Finding indices of fuel species
i_oxid=speciesIndex(propellant,oxid); %Finding indices of oxidizer species
m_mole_fuel=m_mole(i_fuel); %Assigning mollar weight to fuel
m_mole_oxid=m_mole(i_oxid); %Assigning mollar weight to oxidizer
x(i_fuel)=1; %Setting mole fraction to 1 for fuel
x(i_oxid)=of_ratio*m_mole_fuel/m_mole_oxid; %Setting mole fraction of oxidizer so it is equal to mass of_ratio
set(propellant,'P',p0,'Temperature',T0,'MoleFractions',x);
end

