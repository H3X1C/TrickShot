#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include _settings;

// ~~ Ninoush Remastered ~~
// Script cleanup
// By H3X1C & Ninoush
//

init()
{
	level thread onPlayerConnect();
}


onPlayerConnect()
{
	for(;;)
	{
		level waittill( "connected", player );
		player thread connectThreadHandler();
        player thread onPlayerSpawned();
	}
}


onPlayerSpawned()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill("spawned_player");
        self thread spawnThreadHandler();

		// REMOVE THIS ONCE YOU HAVE PUT YOUR GUIDS IN THE SETTINGS GSC
		self sayall(self.guid);
	}
}


connectThreadHandler()
{
	self thread ammoRegen();
	self thread adminList();
	self thread doMenuController();
	self thread doMenuReset();
	self thread doUFO();
	self thread MoveToCrosshair();
	self thread spawnBot();
	self thread randomGun();
	self thread spawnMP5K();
	self thread spawnWA2000();
	self thread spawnINTER();
	self thread spawnM21();
	self thread spawnFAL();
	self thread doSaveLocation();
	self thread doLoadLocation();
	self thread doDvars();
	self thread About();
	self.isEb = false;
}

spawnThreadHandler()
{
    self thread nightVisionFix();
    self thread onSpawnDvars();
}


nightVisionFix()
{
    self _SetActionSlot( 1, "" );
}

onSpawnDvars()
{
    self setClientDvar( "cg_scoreboardPingText", "0" );
    self setClientDvar( "cg_scoreboardPingGraph", "1" );
    self setClientDvar( "ui_allow_classchange", "1" );
}

doDvars()
{			
	setDvar("jump_height",45);
	setDvar("testclients_domove",0);
	setDvar("testclients_doattack",0);
	self setClientDvar("xblive_privatematch", 0);
    self setClientDvar( "xblive_rankedmatch", 1 );
    self setClientDvar( "onlinegame", 1 );  
}

ammoRegen()
{
	for(;;)
	{

		self notifyOnPlayerCommand( "am", "+ammo" );
		self waittill( "am" );

		wait 2;
		if (self.pers["rAmmo"] == "true") {
			currentWeapon = self getCurrentWeapon();
			self giveMaxAmmo( currentWeapon );
		}
	}
}


randomGun()
{
	self endon("disconnect");
	self endon("death");
	for(;;) {
		self notifyOnPlayerCommand("pw", "+dropw");
		self waittill("pw");

		if (self.guid == self.admin1 || self.guid == self.admin2 || self.guid == self.admin3 || self.guid == self.admin4 || self.guid == self.admin5 || self.guid == self.admin6)
		{
			self giveWeapon("barrett_fmj_mp", 5, false);
			wait .05;
			self switchToWeapon("barrett_fmj_mp");
			bronWyrzucana = self GetCurrentWeapon(); 
			self dropItem( bronWyrzucana ); 
			wait .05;
			weapList = self GetWeaponsListAll();
			weapListPrim = self GetWeaponsListPrimaries();

			while(self getCurrentWeapon() == "none") {
				//self switchToWeapon( self getLastWeapon() );
				if(weapListPrim.size){ 
					self switchToWeapon(weapListPrim[RandomInt(weapListPrim.size)]);
				}else{ 
					self switchToWeapon(weapList[RandomInt(weapList.size)]);
					wait .05; 
				}
			}	
			wait .05;
		}
	}
}


spawnMP5K(){
	self notifyOnPlayerCommand("mp5k", "+mp5k");
	
	while( 1 ){
		self waittill("mp5k");
		OriginalW = self GetCurrentWeapon();
		weapon = "mp5k_fmj_mp";
		self giveWeapon(weapon, 0);
		self giveMaxAmmo(weapon);
		self switchToWeapon(weapon);
		wait 0.1;
		self DropItem(weapon);
		wait 0.1;
		self giveWeapon(OriginalW, 0);
		self switchToWeapon(OriginalW);
	}
}


spawnWA2000(){
	self notifyOnPlayerCommand("wa2000", "+wa2000");
	
	while( 1 ){
		self waittill("wa2000");
		OriginalW = self GetCurrentWeapon();
		weapon = "wa2000_fmj_mp";
		self giveWeapon(weapon, 5);
		self giveMaxAmmo(weapon);
		self switchToWeapon(weapon);
		wait 0.1;
		self DropItem(weapon);
		wait 0.1;
		self giveWeapon(OriginalW, 0);
		self switchToWeapon(OriginalW);
	}
}


spawnINTER(){
	self notifyOnPlayerCommand("inter", "+inter");
	
	while( 1 ){
		self waittill("inter");
		OriginalW = self GetCurrentWeapon();
		weapon = "cheytac_fmj_mp";
		self giveWeapon(weapon, 1);
		self giveMaxAmmo(weapon);
		self switchToWeapon(weapon);
		wait 0.1;
		self DropItem(weapon);
		wait 0.1;
		self giveWeapon(OriginalW, 0);
		self switchToWeapon(OriginalW);
	}
}


spawnM21(){
	self notifyOnPlayerCommand("M21", "+M21");
	
	while( 1 ){
		self waittill("M21");
		OriginalW = self GetCurrentWeapon();
		weapon = "m21_fmj_mp";
		self giveWeapon(weapon, 2);
		self giveMaxAmmo(weapon);
		self switchToWeapon(weapon);
		wait 0.1;
		self DropItem(weapon);
		wait 0.1;
		self giveWeapon(OriginalW, 0);
		self switchToWeapon(OriginalW);
	}
}


spawnFAL(){
	self notifyOnPlayerCommand("fal", "+fal");
	
	while( 1 ){
		self waittill("fal");
		OriginalW = self GetCurrentWeapon();
		weapon = "fal_fmj_mp";
		self giveWeapon(weapon, 6);
		self giveMaxAmmo(weapon);
		self switchToWeapon(weapon);
		wait 0.1;
		self DropItem(weapon);
		wait 0.1;
		self giveWeapon(OriginalW, 0);
		self switchToWeapon(OriginalW);
	}
}


About()
{
 	self endon ( "disconnect" );
 	self endon ( "death" );
	
	setDvarIfUninitialized( "about", "commands" );
	self notifyOnplayerCommand( "about", "about");
	for(;;)
	{
        self waittill("about");
		
		self IPrintLnBold("^2NINOUSH ^7Simple Command:");
		wait 1.5;
		self IPrintLnBold("^2+mp5k^7: Drop mp5k");
		wait 1.5;
		self IPrintLnBold("^2+fal^7: Drop FAL");
		wait 1.5;
		self IPrintLnBold("^2+m21^7: Drop 21 EBR");
		wait 1.5;
		self IPrintLnBold("^2+inter^7: Drop intervention");
		wait 1.5;
		self IPrintLnBold("^2+ammo^7: give Max Ammo");
		wait 1.5;
		self IPrintLnBold("^2GUID ^7: " + self.guid);
		wait 1.5;
		self IPrintLnBold("^2HAVE A ^7GOOD DAY!");
 	}
}


doMenuController()
{
    if (self.guid == self.admin1 || self.guid == self.admin2 || self.guid == self.admin3 || self.guid == self.admin4 || self.guid == self.admin5 || self.guid == self.admin6)
	{

        self notifyOnPlayerCommand( "as1", "+actionslot 1" );

		for(;;)
		{
			self waittill( "as1" );

			if (self.menuOpen == true) {
				self.menuOpen = false;
				self freezeControls(false);
				self.curPos = 1;
				self.menuPos = 1;
				self.weaponStatus = 1;
			} else if (self.menuOpen == false && self.canOpenMenu == true) {
				self.menuOpen = true;
				self freezeControls(true);
				self.curPos = 1;
				self.menuPos = 1;
				self.weaponStatus = 1;
			}
		}
	}
}


doMenuReset()
{
	self.curPos = 1;
	self.menuPos = 1;
	self.weaponStatus = 1;
	self freezeControls(false);
	self.menuOpen = 0;
}


doUFO()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "gostand", "+gostand" );
		self waittill( "gostand" );
        

		if (self.menuOpen == 1) {
			if (self.menuPos == 1) {
				maps\mp\gametypes\_spectating::setSpectatePermissions();

				if (self.ufo == false) {

					self.ufo = true;
					self allowSpectateTeam( "freelook", true );
					self.sessionstate = "spectator";

				} else if (self.ufo == true) {

					self.ufo = false;
					self allowSpectateTeam( "freelook", false );
					self.sessionstate = "playing";

				}

				self thread doMenuReset();
			}
		}
	}
}


doSaveLocation()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "melee", "+melee" );
		self waittill( "melee" );

		if (self.menuOpen == 1) {

			if (self.menuPos == 1) {

				self iPrintLn( "" );
				self.pers["loc"] = true;

				self.pers["savePos"] = self.origin;
				self.pers["saveAng"] = self.angles;

			}
		}
	}
}


doLoadLocation()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "reload", "+reload" );
		self waittill( "reload" );

		if (self.menuOpen == 1) {

			if (self.menuPos == 1) {

				if (self.pers["loc"] == true) {

					self setOrigin( self.pers["savePos"] );
					self setPlayerAngles( self.pers["saveAng"] );

					self thread doMenuReset();
				}
			}
		}
	}
}


Spawnbot()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "frag", "+frag" );
		self waittill( "frag" );


		if (self.menuOpen == 1) {

			if (self.menuPos == 1) {

				if (self.pers["loc"] == true) {

					self.canSpawn = false;
					self thread initTestClients(1);
					wait 0.5;
					self.canSpawn = true;
					self thread doMenuReset();
				}
			}
		}
	}
}


initTestClients(numberOfTestClients)
{
	for(i = 0; i < numberOfTestClients; i++)
	{
		wait 0.2;
		ent[i] = addtestclient();

		if (!isdefined(ent[i]))
		{
			wait 1;
			continue;
		}

		ent[i].pers["useCustom"] = "true";
		ent[i].pers["isBot"] = true;
        ent[i] thread initIndividualBot();
	}
}


initIndividualBot()
{
	self endon( "disconnect" );
    self thread doPrestige();
    wait .05;
    self notify("menuresponse", game["menu_team"], "allies");
    wait 0.5;
    self notify("menuresponse", "changeclass", "class5" );
    self sayall("Entered");
    self waittill("spawned_player");
	wait 0.5;
    self thread doTitleEmblem();
}


doTitleEmblem()
{
	self thread maps\mp\gametypes\TitleEmblem::Title();
    self thread maps\mp\gametypes\TitleEmblem::Emblem();
}


MoveToCrosshair() 
{ 
	    self endon( "disconnect" );
        for(;;)
		{
            self notifyOnPlayerCommand( "as2", "+actionslot 2" );
            self waittill( "as2" );
		{
		
		if (self.guid == self.admin1 || self.guid == self.admin2 || self.guid == self.admin3 || self.guid == self.admin4 || self.guid == self.admin5 || self.guid == self.admin6)
		{
           forward = self getTagOrigin("j_head"); 
           end = self thread vector_Scal(anglestoforward(self getPlayerAngles()),1000000); 
           Crosshair = BulletTrace( forward, end, 0, self )[ "position" ]; 

			foreach( player in level.players )
			{
					if (player.pers["isBot"] == true)
					{
						if (isDefined( player.pers["isBot"] ) && player.pers["isBot"] )
						{
				        	player SetOrigin( Crosshair );
						}
					}
 
				{
					if (isDefined( player.pers["isBot"] ) && player.pers["isBot"] )
					{
				        player SetOrigin( Crosshair );
					}
				}
			}
		}
	}
  }
}


vector_scal(vec, scale) 
{ 
	vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale); 
	return vec; 
}


doPrestige()
{
	self setPlayerData( "prestige", randomInt( 10 ) );
	self setPlayerData( "experience", randomInt( 2516000 ) );
}
