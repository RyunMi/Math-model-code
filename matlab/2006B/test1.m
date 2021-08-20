x=[2,2,-2;2,5,-4;-2,-4,5];
x = zscore(x); %standardized
[coeff,score,latent,~,explained,mu] = pca(x);