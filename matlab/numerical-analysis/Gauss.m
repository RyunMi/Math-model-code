function [] = Gauss(A)
%A=randi([11,24],5);生成的随机矩阵
%L为生成的下三角矩阵，U为生成的上三角矩阵
n=size(A,1);L=eye(n);
%%
%判断A的各阶顺序主子式是否奇异
%for k = 1:n
%    if det(A(1:k,1:k)) == 0
%        error('A的顺序主子式有奇异');
%    end
%end
%%
%判断A是否为奇异矩阵
if det(A) == 0
    error('A为奇异矩阵，请输入非奇异矩阵');
end
%%
%判断A是否为对称阵
if A==A'
    error('A为对称阵');
end
%%
%LU分解
for i =2:n
    if A(i-1,i-1) == 0%做行变换使对角线元素不为0
        for j = i:n
            if A(j,j) ~= 0
                A([i-1,j],:) = A([j,i-1],:);
                break
            end
        end
    end
    m = A(i:n,i-1)./A(i-1,i-1);
    L(i:n,i-1)=m;
    A(i:n,:) = A(i:n,:) - m*A(i-1,:);
end
U=A;
%%
%输出信息
disp('L为:');disp(L);
disp('U为:');disp(U);
end