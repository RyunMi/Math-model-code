function [X,FVAL]=AL_main(x_al,N_equ,N_inequ)
	global pena N_equ N_inequ;
	pena=0.1;
	c_scale=2;
	e_al=1e-6;
	max_itera=100;
	out_itera=1;
	while out_itera<max_itera
		x_al0=x_al;
		%compareFlag=compare(x_al0);
		[X,FVAL]=fminunc(@AL_obj,x_al0);
		x_al=X;
		if compare(x_al)<=e_al
            break;
        end
		pena=c_scale*pena;
		out_itera=out_itera+1;
	end
	X=x_al;
	FVAL=obj(X);
end
	