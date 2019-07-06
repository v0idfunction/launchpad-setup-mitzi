var inputs = List.new;

m.apc_mini=();

i.midi.apc_mini.addControllerGroup(\note,\piano);
i.midi.apc_mini.groups.piano.addController(\piano,nil,0);



8.do{|index|

	var chanName;

	chanName=\chan;

	chanName=(chanName++(index+1)).asSymbol;

	m.apc_mini[chanName] = ();
	m.apc_mini[chanName].ctlGroup = i.midi.apc_mini.addControllerGroup(\cc,chanName);

	m.apc_mini[chanName].fader = m.apc_mini[chanName].ctlGroup.addController(\fader,c[index].ctlNum,[0,1]);

	inputs.add(m.apc_mini[chanName].fader);

};

m.apc_mini[\main] = ();
m.apc_mini[\main].ctlGroup = i.midi.apc_mini.addControllerGroup(\cc,\main);
m.apc_mini[\main].fader = m.apc_mini[\main].ctlGroup.addController(\fader,b[8].ctlNum,[0,1]);
inputs.add(m.apc_mini[\main].fader);




i.midiControllers.inputs = i.midiControllers.inputs ++ inputs;

m.apc_mini.piano=i.midi.apc_mini.groups.piano.controllers.piano;

m.apc_mini.postln;

( "Created Namespace:" ++ c[\name] ).postln;
