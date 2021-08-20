function f=AL_obj(x)
	global pena N_equ N_inequ;
	h_equ=0;
	h_inequ=0;
	[h,g]=constrains(x);
	for i=1:N_equ
		h_equ=h_equ+h(i).^2;
	end
	for i=1:N_inequ
        h_inequ=h_inequ+(min(g(i),0)).^2;
	end
	f=obj(x)+pena*(h_equ+h_inequ);
end