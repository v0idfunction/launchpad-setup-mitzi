~z = {
	p=LFPulse.kr(~tempo.kr/8,1/[2,3],[3,5]/16);
	(
		Resonz.ar(
			WhiteNoise.ar,
			[60,62,67,74].midicps
			*
			p.linlin(0,1,1,[2,3]),p.linlin(0,1,0.01,[0.05,0.001])
		)
		*
		p.linlin(0,1,12,20)
	).tanh/4
};
