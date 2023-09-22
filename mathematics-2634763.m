function Example3(n,m)

n=301;m=300;

h=1/(n-1);
tau='exp(t)/(1+exp(t))'; tau=inline(tau);

% X=zeros(2,n+m*(n-1));
% for i=1:n
%         X(1,i)=0.6;X(2,i)=0.2;
% % end

% y=-30*rand(1,10000)+15;
% for k=1:9

X=zeros(4,n+m*(n-1));
for i=1:n
        X(1,i)=-2;X(2,i)=6;
        X(3,i)=-9.8;X(4,i)=12.1;
end

% for i=1:n
%         X(1,i)=y(4*k-3);X(2,i)=y(4*k-2);
%         X(3,i)=y(4*k-2);X(4,i)=y(4*k-1);
% end

for j=n+1:n+m*(n-1)
tb=tau((j-n)*h);
c=round(tb/h)+1;

    A11= 2;              A12= -0.1;
    B11= -1.5;            B12= -0.1;  

    A21= -5;               A22= 4.5;
    B21= -0.2;               B22= -4;
    
     r1=3.5;     r3=3;     theta=2;

% % 原系统
% X(1,j)=h*(-1*X(1,j-1)+A11*f(X(1,j-1))+A12*f(X(2,j-1))...
% +B11*f(X(1,j-c))+B12*f(X(2,j-c)))+X(1,j-1);
% X(2,j)=h*(-1*X(2,j-1)+A21*f(X(1,j-1))+A22*f(X(2,j-1))...
% +B21*f(X(1,j-c))+B22*f(X(2,j-c)))+X(2,j-1);

% % 加随机 
X(1,j)=h*(-1*X(1,j-1)+A11*f(X(1,j-1))+A12*f(X(2,j-1))...
+B11*f(X(1,j-c))+B12*f(X(2,j-c)))+X(1,j-1)+0.1*X(1,j-1)*sqrt(h)*randn;
X(2,j)=h*(-1*X(2,j-1)+A21*f(X(1,j-1))+A22*f(X(2,j-1))...
+B21*f(X(1,j-c))+B22*f(X(2,j-c)))+X(2,j-1)+0.1*X(2,j-1)*sqrt(h)*randn;

% % % % % 固定时间
% X(1,j)=h*(-1*X(1,j-1)+A11*f(X(1,j-1))+A12*f(X(2,j-1))...
% +B11*f(X(1,j-c))+B12*f(X(2,j-c)))+X(1,j-1) +0.05*X(1,j-1)*sqrt(h)*randn;
% 
% X(2,j)=h*(-1*X(2,j-1)+A21*f(X(1,j-1))+A22*f(X(2,j-1))...
% +B21*f(X(1,j-c))+B22*f(X(2,j-c)))+X(2,j-1) +0.05*X(2,j-1)*sqrt(h)*randn;
% 
% X(3,j)=h*(-1*X(3,j-1)+A11*f(X(3,j-1))+A12*f(X(4,j-1))...
% +B11*f(X(3,j-c))+B12*f(X(4,j-c))...
% -r1*tanh(50*(X(3,j-1)-X(1,j-1)))-r3*tanh(50*(X(3,j-1)-X(1,j-1)))*(abs((X(3,j-1)-X(1,j-1))))^theta...
% )+X(3,j-1) +0.05*X(3,j-1)*sqrt(h)*randn;
% 
% X(4,j)=h*(-1*X(4,j-1)+A21*f(X(3,j-1))+A22*f(X(4,j-1))...
% +B21*f(X(3,j-c))+B22*f(X(4,j-c))...
% -r1*tanh(50*(X(4,j-1)-X(2,j-1)))-r3*tanh(50*(X(4,j-1)-X(2,j-1)))*(abs((X(4,j-1)-X(2,j-1))))^theta...
% )+X(4,j-1) +0.05*X(4,j-1)*sqrt(h)*randn;

% % 指定时间
% 
% %     kk=3.1;T=1.9395;Tp=0.5;
% %     r1p=r1+kk*((T/Tp)-1)
% %     r3p=(T/Tp)*r3
% % 
% % X(1,j)=h*(-1*X(1,j-1)+A11*f(X(1,j-1))+A12*f(X(2,j-1))...
% % +B11*f(X(1,j-c))+B12*f(X(2,j-c)))+X(1,j-1) +0.05*X(1,j-1)*sqrt(h)*randn;
% % 
% % X(2,j)=h*(-1*X(2,j-1)+A21*f(X(1,j-1))+A22*f(X(2,j-1))...
% % +B21*f(X(1,j-c))+B22*f(X(2,j-c)))+X(2,j-1) +0.05*X(2,j-1)*sqrt(h)*randn;
% % 
% % X(3,j)=h*(-1*X(3,j-1)+A11*f(X(3,j-1))+A12*f(X(4,j-1))...
% % +B11*f(X(3,j-c))+B12*f(X(4,j-c))...
% % -r1p*tanh(50*(X(3,j-1)-X(1,j-1)))-r3p*tanh(50*(X(3,j-1)-X(1,j-1)))*(abs((X(3,j-1)-X(1,j-1))))^theta...
% % )+X(3,j-1) +0.05*X(3,j-1)*sqrt(h)*randn;
% % 
% % X(4,j)=h*(-1*X(4,j-1)+A21*f(X(3,j-1))+A22*f(X(4,j-1))...
% % +B21*f(X(3,j-c))+B22*f(X(4,j-c))...
% % -r1p*tanh(50*(X(4,j-1)-X(2,j-1)))-r3p*tanh(50*(X(4,j-1)-X(2,j-1)))*(abs((X(4,j-1)-X(2,j-1))))^theta...
% % )+X(4,j-1) +0.05*X(4,j-1)*sqrt(h)*randn;



end

box on
t=linspace(-1,m,n+m*(n-1));
hold on

plot(X(1,:),X(2,:))
 xlabel({'$p_1(t)$'},'interpreter','latex','FontSize',16)
 ylabel({'$p_2(t)$'},'interpreter','latex','FontSize',16)
%  set(gca,'YTick',[-10:2:10]) %改变y轴坐标间隔显示 这里间隔为1
%  axis([0,2,-10,10])
%  

% plot(t,X(1,:),t,X(2,:))
%  xlabel({'$t/s$'},'interpreter','latex','FontSize',16)
%  ylabel({'$p_1(t), p_2(t)$'},'interpreter','latex','FontSize',16)
%  set(gca,'XLim',[0 300]) %改变y轴坐标间隔显示 这里间隔为1



% plot(t,X(3,:)-X(1,:),t,X(4,:)-X(2,:))
% hold on 
% %  point=plot(1.9395,0,'r.','MarkerSize',19);
% %  legend(point,{'$T_{max}=1.9395$'},'interpreter','latex','FontSize',16)
%  point=plot(0.5,0,'r.','MarkerSize',19);
%  legend(point,{'$T_{p}=0.5$'},'interpreter','latex','FontSize',16)
%  xlabel({'$t/s$'},'interpreter','latex','FontSize',16)
%  ylabel({'$e_1(t), e_2(t)$'},'interpreter','latex','FontSize',16)
% 
%  set(gca,'YLIM',[-30 30]) %改变y轴坐标间隔显示 这里间隔为1
%  set(gca,'XLim',[0 0.6]) %改变x轴坐标间隔显示 这里间隔为1


% plot(t,X(1,:),'--',t,X(3,:),'-.b')
% hold on 
% %  point=plot(1.9395,0,'r.','MarkerSize',19);
% %  legend(point,{'$T_{max}=1.9395$'},'interpreter','latex','FontSize',16)
% %  point=plot(1,0,'r.','MarkerSize',19);
% %  legend(point,{'$T_{p}=1$'},'interpreter','latex','FontSize',16)
%  xlabel({'$t/s$'},'interpreter','latex','FontSize',16)
%  ylabel({'$e_1(t), e_2(t)$'},'interpreter','latex','FontSize',16)
%  
%  set(gca,'YLIM',[-2 2]) %改变y轴坐标间隔显示 这里间隔为1
%  set(gca,'XLim',[0 50]) %改变x轴坐标间隔显示 这里间隔为1


end
% end