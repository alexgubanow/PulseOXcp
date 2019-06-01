close all
clear all
clc
fid=fopen('sig1.txt','rt');
f=fscanf(fid,'%f',[2,inf]);
t=f(1,:);
y=f(2,:);
fclose(fid);
y=y(end:-1:1);

Td=t(2)-t(1);
Fd=1/Td;
fN=Fd/2;

n=300;
fFIL=28;
b=fir1(n,fFIL/fN);
a=1;
[h,wn]=freqz(b,a);
Y=filtfilt(b,a,y);

dY=[0 diff(Y)];

figure(1);
% plot(t,Y);
xlabel('t,c');
hold on

for i=1:length(dY)
    if dY(i)>0
        dY(i)=(-1);
    else
        dY(i)=1;
    end
end

n=1;
first_point_positive_dY=zeros(1,length(dY));
k=1;
j=1;
for i=1:length(dY)-1
    if dY(i+1)==1&&dY(i)==-1
        if first_point_positive_dY(k)==0
            first_point_positive_dY(k)=i+1;
            t_first_point_positive_dY(j)=t(i+1);
            j=j+1;
        else
            k=k+1;
            first_point_positive_dY(k)=i+1;
            t_first_point_positive_dY(j)=t(i+1);
            j=j+1;
        end
    end
    
end

first_point_negative_dY=zeros(1,length(dY));
k=1;
j=1;
for i=1:length(dY)-1
    if dY(i+1)==-1&&dY(i)==1
        if first_point_negative_dY(k)==0
            first_point_negative_dY(k)=i+1;
            t_first_point_negative_dY(j)=t(i+1);
            j=j+1;
        else
            k=k+1;
            first_point_negative_dY(k)=i+1;
            t_first_point_negative_dY(j)=t(i+1);
            j=j+1;
        end
    end
end

first_point_positive_dY(~first_point_positive_dY)=[];
first_point_negative_dY(~first_point_negative_dY)=[];

figure(2)
hold on
axis([-1 15 -2 2]);
plot(t,dY)
plot(t_first_point_positive_dY,dY(first_point_positive_dY),'green*')
plot(t_first_point_negative_dY,dY(first_point_negative_dY),'black*')

n=1;
end_point_positive_dY=zeros(1,length(dY));
k=1;
j=1;
for i=1:length(dY)-1
    if dY(i+1)==1&&dY(i)==-1
        if end_point_positive_dY(k)==0
            end_point_positive_dY(k)=i;
            t_end_point_positive_dY(j)=t(i);
            j=j+1;
        else
            k=k+1;
            end_point_positive_dY(k)=i;
            t_end_point_positive_dY(j)=t(i);
            j=j+1;
        end
    end
    
end

end_point_negative_dY=zeros(1,length(dY));
k=1;
j=1;
for i=1:length(dY)-1
    if dY(i+1)==-1&&dY(i)==1
        if end_point_negative_dY(k)==0
            end_point_negative_dY(k)=i;
            t_end_point_negative_dY(j)=t(i);
            j=j+1;
        else
            k=k+1;
            end_point_negative_dY(k)=i;
            t_end_point_negative_dY(j)=t(i);
            j=j+1;
        end
    end
end

end_point_positive_dY(~end_point_positive_dY)=[];
end_point_negative_dY(~end_point_negative_dY)=[];
plot(t_end_point_positive_dY,dY(end_point_positive_dY),'black+')
plot(t_end_point_negative_dY,dY(end_point_negative_dY),'red+')
k=1;
% for i=1:length(t_end_point_negative_dY)
%     T_negative_dY(k)=t_end_point_negative_dY(i)-t_first_point_negative_dY(i);
%     k=k+1;
% end
% T_negative_dY
t_end_point_negative_dY
t_first_point_negative_dY
% for i=1:37
%     if (end_point_negative_dY(i)-first_point_negative_dY(i))<10
%         for m=first_point_negative_dY(i):end_point_negative_dY(i)
%             dY(m)=1;
%         end
%     end
% end

plot(t,dY,'red')

% % Нахождение минимумов и максимумов производной
% k=1;
% for i=1:length(dY)-1
%     if (dY(i)<0)&&(dY(i+1)>0)
%         tmin(k)=t(i);
%         nmin(k)=i;
%         k=k+1;
%     end
% end
% 
% k=1;
% for i=1:length(dY)-1
%     if (dY(i)>0)&&(dY(i+1)<0)
%         tmax(k)=t(i);
%         nmax(k)=i;
%         k=k+1;
%     end
% end
% 
% % Нахождение А1_A5 и A3
% k=1;
% for i=1:length(nmin)-1
%     if t(nmin(i+1))-t(nmin(i))>0.5
%         A1_A5_t(k)=t(nmin(i));
%         A1_A5_N(k)=nmin(i);
%         k=k+1;
%     end
% end
% 
% k=1;
% for i=1:length(nmin)-1
%     if t(nmin(i+1))-t(nmin(i))<0.5
%         A3_t(k)=t(nmin(i));
%         A3_N(k)=nmin(i);
%         k=k+1;
%     end
% end
% 
% % Нахождение А2 и А4
% k=1;
% for i=1:length(nmax)-1
%     if t(nmax(i+1))-t(nmax(i))>0.5
%         A2_t(k)=t(nmax(i));
%         A2_N(k)=nmax(i);
%         k=k+1;
%     end
% end
% 
% k=1;
% for i=1:length(nmax)-1
%     if t(nmax(i+1))-t(nmax(i))<0.5
%         A4_t(k)=t(nmax(i));
%         A4_N(k)=nmax(i);
%         k=k+1;
%     end
% end
% 
% %Проверка на ложное нахождение первых точек
% if A1_A5_t(1)<=0
%     A1_A5_t(1)=[];
%     A1_A5_N(1)=[];
% end
% 
% if A2_t(1)<=0
%     A2_t(1)=[];
%     A2_N(1)=[];
% end
% 
% if A3_t(1)<=0
%     A3_t(1)=[];
%     A3_N(1)=[];
% end
% if A4_t(1)<=0
%     A4_t(1)=[];
%     A4_N(1)=[];
% end
% 
% figure(1);
% plot(A1_A5_t,Y(A1_A5_N),'red+');
% plot(A2_t,Y(A2_N),'black+');
% plot(A3_t,Y(A3_N),'green*');
% plot(A4_t,Y(A4_N),'red*');
% title('Фотоплетизмограмма');
% legend('Фотоплетизмограмма','A1,A5','A2','A3','A4',-1)
% 
% %Расчет DPV
% DPV=A1_A5_t(2:end)-A1_A5_t(1:end-1)
% %Расчет Частоты сердечных сокращений
% CSS=60./DPV
% %Гистограмма VSR
% K=0.4:0.05:1.4;
% figure(2);
% hist(DPV,K);
% title('Гистограмма ВСР');
% ylabel('Количество ДПВ');
% xlabel('Длительность ДПВ');
% 
% %Скатерограмма VSR
% figure(3);
% hold on
% plot(DPV(1:end-1),DPV(2:end),'r*');
% axis([0 2 0 2]);
% title('Скатерограмма ВСР');
% ylabel('Длительность ДПВ');
% xlabel('Длительность ДПВ');
