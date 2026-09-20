clear all;
clc;
G1=[228	134	20	11
    245	134	10	40
    200	167	12	27
    170	150	7	8
    100	167	20	14];
G2=[225	125	7	14
    130	100	6	12
    150	117	7	6
    120	133	10	26
    160	100	5	10];
G3=[185	115	5	19
    170	125	6	4
    165	142	5	3
    135	108	2	12
    100	117	7	2];
mu1=mean(G1);
mu2=mean(G2);
mu3=mean(G3);
s1=0;s2=0;s3=0;
del1= G1-mu1;
del2= G2-mu2;
del3= G3-mu3;
for i=1:size(G1,1)
s1=s1+(G1(i,:)-mu1)'*(G1(i,:)-mu1);
s2=s2+(G2(i,:)-mu2)'*(G2(i,:)-mu2);
s3=s3+(G3(i,:)-mu3)'*(G3(i,:)-mu3);
end
sig1=1/(size(G1,1)-1)*s1;
sig2=1/(size(G2,1)-1)*s2;
sig3=1/(size(G3,1)-1)*s3;
NEWDATA=[200 124 9 12];
D1=(NEWDATA-mu1)*inv(sig1)*(NEWDATA-mu1)';
D2=(NEWDATA-mu2)*inv(sig2)*(NEWDATA-mu2)';
D3=(NEWDATA-mu3)*inv(sig3)*(NEWDATA-mu3)';
a = [D1 D2 D3];
[m index] = min(a); 