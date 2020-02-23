%{
t1=Starting temperature 
t2=ending temperature
diff=increments
ref is char vaule of refrigerant name
example,
ref=['r32']
to execute the function 
TT=datamesh(-25,25,1,'r32');
Credit:  VIJAY NISHAD,BE-MECH
%}
function TT=datamesh(t1,t2,diff,ref)

T1=273+t1;
T2=273+t2;
delt=T2-T1;

step=(delt/diff)+1;

temp=T1:diff:T2;

for i=1:step
   
muonv(i)=refpropm('$','T',temp(i),'Q',1,ref); 
muonL(i)=refpropm('$','T',temp(i),'Q',0,ref); 
p(i)=refpropm('P','T',temp(i),'Q',1,ref)/1000; 
hl(i)=refpropm('H','T',temp(i),'Q',0,ref)/1000;
hv(i)=refpropm('H','T',temp(i),'Q',1,ref)/1000; 
dl(i)=refpropm('D','T',temp(i),'Q',0,ref);
dv(i)=refpropm('D','T',temp(i),'Q',1,ref);
sl(i)=refpropm('D','T',temp(i),'Q',0,ref);
sv(i)=refpropm('D','T',temp(i),'Q',1,ref);

cpl(i)=refpropm('C','T',temp(i),'Q',0,ref);
cpv(i)=refpropm('C','T',temp(i),'Q',1,ref);


pl(i)=refpropm('^','T',temp(i),'Q',0,ref);
pv(i)=refpropm('^','T',temp(i),'Q',1,ref);

end  
TemperatureK=temp';
TemperatureC=TemperatureK-273;
Kine_Visco_Vap=muonv';
Kine_Visco_liq=muonL';
Pressure=p';
Entalphy_Vap=hv';
Entalphy_liq=hl';
density_liq=dl';
density_vap=dv';
Entropy_liq=sl';
Entropy_Vap=sv';
Cp_Liq=cpl';
Cp_Vap=cpv';
Prandtl_liq=pl';
Prandtl_Vap=pv';

TT = table(TemperatureC,Pressure,density_liq,density_vap,Entalphy_liq,Entalphy_Vap,Kine_Visco_liq,Kine_Visco_Vap,Entropy_liq,Entropy_Vap,Cp_Liq,Cp_Vap,Prandtl_liq,Prandtl_Vap);
 
end
