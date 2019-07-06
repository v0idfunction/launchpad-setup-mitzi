// First, boot SC and establish some variables
(

	e=Environment[

		'tempo' -> 192,
		'readyMessage' -> 'I N S T R U M E N T: ready'

	];

	e.know=true;

	s.options.memSize=1024*1024;
	s.options.maxNodes=128*1024;

	s.boot;

	s.volume=(-6);

)



(thisProcess.nowExecutingPath.dirname ++ "/tools/setup/setup.scd").load;

// MIDIClient.disposeClient
