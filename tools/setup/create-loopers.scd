i.data.loopers=Array.fill(8,{|index|
	var chan = 0;
	if( index > 3 ) {
		chan = 1;
	};

	(
			instrument: Looper(chan);
	)
});


i.data.lastChanThatUsedFX=IdentityDictionary.new;


"Created Loopers".postln;
