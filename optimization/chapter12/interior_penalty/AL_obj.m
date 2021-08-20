function f=AL_obj(x)
	pena=10; N_inequ=1;
	h_inequ=0;
    g=constrains(x);
	for i=1:N_inequ
		h_inequ=h_inequ+log(g(i));
	end
	f=obj(x)-pena*(h_inequ);
end