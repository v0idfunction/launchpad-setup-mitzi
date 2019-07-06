i.autoMIDI(5);
(


	var synthNames = ['kick','hihat','snare'];
	var parameterNames = [\high,\middle,\low];
	i.drums=(
		kick: INSTRUMENT(\kickElectro),
		hihat: INSTRUMENT(\hihatElectro),
		snare: INSTRUMENT(\snareElectro),
		clap: INSTRUMENT(\clapElectro),
	);

	i.drums.kick.seq("1");
	i.drums.hihat.seq(" 1").speed(4);
	i.drums.snare.seq("   1xx  1 1 1xx 1  ").speed(3);
	i.drums.clap.seq("   1xx  1").speed(2);


	synthNames.collect({|synthName,snIndex|
		var chan;
		var chanName = 'chan'++(snIndex+1);
		chanName = chanName.asSymbol;


		i.map(
			m.midi_mix[chanName].fader,
			i.mixer.getChannels['drums'][synthName],
			\amp,
			[0,1]
		);

		parameterNames.collect{|parameterName,pnIndex|
			var ctlName = 'knob' ++ (pnIndex+1);
			ctlName = ctlName.asSymbol;

			i.map(
				m.midi_mix[chanName][ctlName],
				i.mixer.getChannels['drums'][synthName],
				parameterName,
				[0,1]
			);
		};


	});


	""


)
