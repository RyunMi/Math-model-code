function [X,FVAL]=AL_main(x_al,~)
	%N_inequ=1;
	pena=10;
	c_scale=0.5;
	e_al=1e-6;
	max_itera=100;
	out_itera=1;
	while out_itera<max_itera
		x_al0=x_al;
		[X,FVAL,exitflag1]=fminsearch(@AL_obj,x_al0);
		x_al=X;
		if abs(compare(x_al))<=e_al
            break;
        end
		pena=c_scale*pena;
		out_itera=out_itera+1;
	end
	X=x_al;
	FVAL=obj(X);
end