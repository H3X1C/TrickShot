doSettings()
{

/*
	// 0 = Off/D�sactiver
	// 1 = On/Activer

	CONTENTS:
	self.PubXP:		If this is 1, the experience you recieve each kill will be the same
				as if you were in a public SnD lobby (500 as opposed to 500).

	self.matchBonus:	If this is 1, then you will recieve match bonus.
				

	self.allowNuke:		If this is 1, then the player will be allowed to call in a Tactical Nuke.

	self.allowCL:		If this is 1, then the player will be allowed to be Instant Level 70 and
				be able to unlock all their stats.

*/

	// These two work, but I'm going to make a menu rather than a file.
	self.PubXP = 1;
	self.matchBonus = 1;


	// Bottom two aren't implemented yet.
	self.allowNuke = 1;
	self.allowCL = 1;
}

// H3X1C - Guid is the unique identifier for a player. 
adminList()
{
	self.admin1 = "GUID_HERE";			//ninoush
	self.admin2 = "GUID_HERE";			//[9] AE Hyzho
	self.admin3 = "GUID_HERE";			//Hyzho
	self.admin4 = "GUID_HERE";			//AE ninoush
	self.admin5 = "GUID_HERE";			//AE Hyzho
	self.admin5 = "ac86cb226ccf9a2c";	//
}