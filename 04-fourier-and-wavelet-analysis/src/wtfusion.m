function wave=wtfusion(x1,x2,N,wname)
x1=double(x1);x2=double(x2);

[C1,S1]=wavedec2(x1,N,wname);          %wname即是小波基的名称。
[C2,S2]=wavedec2(x2,N,wname);  

A1=appcoef2(C1,S1,wname,N);            %提取出小波分解的低频分量。
A2=appcoef2(C2,S2,wname,N);
A=0.5*A1+0.5*A2;                       %融合低频分量。

a=reshape(A,1,S1(1,1)*S1(1,2));        %将A转换成行向量
C=a;

for i=N:-1:1                           %循环从第N层到第1层    
    [H1,V1,D1]=detcoef2('all',C1,S1,i);    %提取出小波分解的各层细节分量
    [H2,V2,D2]=detcoef2('all',C2,S2,i);
    H=0.5*H1+0.5*H2;                   %融合高频分量。       
    D=0.5*D1+0.5*D2;  
    V=0.5*V1+0.5*V2;  
    h=reshape(H,1,S1(N+2-i,1)*S1(N+2-i,2));%分别将融合后的细节分量转成行向量，并存入行向量C中
    v=reshape(V,1,S1(N+2-i,1)*S1(N+2-i,2));
    d=reshape(D,1,S1(N+2-i,1)*S1(N+2-i,2));
    C=[C,h,v,d];
end

S=S1;
wave=waverec2(C,S,wname);      %重构原图像
end
