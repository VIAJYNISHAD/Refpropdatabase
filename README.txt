HOW TO WORK WITH FILES 

1. Save the MATLAB file with name "datamesh" or if you copy-paste the file then, save without changing the file name.
2. Downlaod refpropm.m files via link : https://trc.nist.gov/refprop/LINKING/Linking.htm#MatLabApplications
3. Make sure that datamesh.m saved in same folder as refpropm.m
4. Run the function datamesh(-25,25,1,'r32');
Where, 

t1=Starting temperature 
t2=ending temperature
diff=increments
ref is char vaule of refrigerant name

Example,
ref=['r32']
to execute the function 
TT=datamesh(-25,25,1,'r32');