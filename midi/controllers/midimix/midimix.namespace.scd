var inputs = List.new;

m.midi_mix=();

8.do{|index|

	var chanName;

	chanName=\chan;

	chanName=(chanName++(index+1)).asSymbol;



	m.midi_mix[chanName] = ();
	m.midi_mix[chanName].ctlGroup = i.midi.midi_mix.addControllerGroup(\cc,chanName);

	m.midi_mix[chanName].knob1 = m.midi_mix[chanName].ctlGroup.addController(\knob0,b[(4*index)+0].ctlNum,[0,1]);
	m.midi_mix[chanName].knob2 = m.midi_mix[chanName].ctlGroup.addController(\knob1,b[(4*index)+1].ctlNum,[0,1]);
	m.midi_mix[chanName].knob3 = m.midi_mix[chanName].ctlGroup.addController(\knob2,b[(4*index)+2].ctlNum,[0,1]);

	m.midi_mix[chanName].fader = m.midi_mix[chanName].ctlGroup.addController(\fader,b[(4*index)+3].ctlNum,[0,1]);

	inputs.add(m.midi_mix[chanName].fader);
};


m.midi_mix[\main] = ();
m.midi_mix[\main].ctlGroup = i.midi.midi_mix.addControllerGroup(\cc,\main);
m.midi_mix[\main].fader = m.midi_mix[\main].ctlGroup.addController(\fader,b[32].ctlNum,[0,1]);
inputs.add(m.midi_mix[\main].fader);

i.midiControllers.inputs = inputs;


( "Created Namespace:" ++ b[\name] ).postln;
