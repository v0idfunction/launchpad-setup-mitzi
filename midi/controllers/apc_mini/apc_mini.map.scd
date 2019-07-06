c = IdentityDictionary.new;
q = IdentityDictionary.new;

c[\name] = "APC MINI";

c[0] = (target: 0, ctlNum: 48);
c[1] = (target: 1, ctlNum: 49);
c[2] = (target: 2, ctlNum: 50);
c[3] = (target: 3, ctlNum: 51);
c[4] = (target: 4, ctlNum: 52);
c[5] = (target: 5, ctlNum: 53);
c[6] = (target: 6, ctlNum: 54);
c[7] = (target: 7, ctlNum: 55);
c[8] = (target: 8, ctlNum: 56);


64.do{|index|
	q[index] = ( target: nil, note: 0 );
};


// vertical bar right
8.do{|index|
	q[64+index] = ( target: index, note: 64+index );
	q[82+index] = ( target: index, note: 82+index );
};
q[90] = ( target: 9, note: 98 );




( "Loaded Map:" ++ c[\name] ).postln;
