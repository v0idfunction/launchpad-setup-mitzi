(

	var midi;
	var inMidiDevicesNames;
	var outMidiDevicesNames;
	var specs = IdentityDictionary.new;

	// e = ();
	//
	i.data.modeMatrix = ModeMatrix.new();


	// (thisProcess.nowExecutingPath.dirname ++ "/../../../midi/controllers/midimix/midimix.map.scd").load;
	// specs[ b[\name].asSymbol ] = b;

	// (thisProcess.nowExecutingPath.dirname ++ "/../../../midi/controllers/apc_mini/apc_mini.map.scd").load;
	// specs[ c[\name].asSymbol ] = c;

	(thisProcess.nowExecutingPath.dirname ++ "/../../../midi/controllers/launchpad/launchpad.map.scd").load;
	specs[ o[\name].asSymbol ] = o;

	Tdef(\MIDI, { 1.do {

		//i=INSTRUMENT();

		MIDIClient.init(verbose:false);
		CmdPeriod.add({MIDIClient.disposeClient;});

		4.wait;

		"----".postln;
		"MIDIClient: initializing...".postln;
		"----".postln;

		i.startMidi();

		midi = i.controllerManager.midi;

		3.wait;

		inMidiDevicesNames = (thisProcess.nowExecutingPath.dirname ++ "/../../../midi/devices-in.scd").load;

		outMidiDevicesNames = (thisProcess.nowExecutingPath.dirname ++ "/../../../midi/devices-out.scd").load;

		midi.addDevices( inMidiDevicesNames, specs );

		"MIDI: added devices.".postln;

		1.wait;

		m=();


		i.midi.launchpad.addControllerGroup(\note,\buttons);
		i.midi.launchpad.groups.buttons.addController(\buttons);

		i.data.modeMatrix.midiTarget = i.midi.launchpad;

		1.wait;

		i.map(
			i.midi.launchpad.groups.buttons.controllers.buttons,
			i.data.modeMatrix,
			\note
		);

		1.wait;

		if( i.midi.mpk_mini_mk_ii.notNil ) {
			(thisProcess.nowExecutingPath.dirname ++ "/../../../midi/controllers/mpk_mk2/mpk_mk2.namespace.scd").load;
		};

		if( i.midi.midi_mix.notNil ) {
			(thisProcess.nowExecutingPath.dirname ++ "/../../../midi/controllers/midimix/midimix.namespace.scd").load;
		};

		if( i.midi.apc_mini.notNil ) {
			i.midi.apc_mini.postln;
			(thisProcess.nowExecutingPath.dirname ++ "/../../../midi/controllers/apc_mini/apc_mini.namespace.scd").load;
		};

		1.wait;







		72.do{|j|
			i.midi.launchpad.send(j,90+24.rand+(j%32));
		};
		// 89.do{|j|
		// 	i.midi.apc_mini.send(j,90+24.rand+(j%32));
		// };
		Array.series(8,8,9).collect{|num|
			i.midi.launchpad.send(num,3);
		};


		"ModeMatrix: Lauchpad connected".postln;



		// Show READY status in post window:

		"".postln;
		"".postln;
		"-------------------------".warn;
		"".postln;
		"".postln;

		if( e.isKindOf(Environment), {
			e.readyMessage.postln;
		}, {
			"R E A D Y".postln;
		});

		"".postln;
		"".postln;
		"-------------------------".warn;
		"".postln;
		"".postln;






	}});

	Tdef(\MIDI).play;


)
