state("sniperelite")
{
	byte Load : 0x003FF70, 0x0;
	byte Start : 0x02004FC, 0x0;
	byte AllLevels : 0x009F600, 0x0;
	byte End : 0x00912C4, 0x6D4;
}

startup
{
    settings.Add("am", true, "All Levels");
    settings.SetToolTip("am", "Choose which levels to split after (checking only the ones in brackets makes it split after every chapter)");
	
	settings.Add("level1", true, "(Karlshorst) Meet the Informant", "am");
	settings.Add("level2", true, "Supply Raid", "am");
	settings.Add("level3", true, "The Reichstag", "am");
	settings.Add("level4", true, "(Assassinate Bormann) Brandenburg Gate", "am");
	settings.Add("level5", true, "Missing Contact", "am");
	settings.Add("level6", true, "Meet the Courier", "am");
	settings.Add("level7", true, "Infiltrate the Square", "am");
	settings.Add("level8", true, "The French Cathedral", "am");
	settings.Add("level9", true, "(Extract the Agent) Exfiltrate the Square", "am");
	settings.Add("level10", true, "(Karlshorst Reprise) Destroy Fuel Dump", "am");
	settings.Add("level11", true, "Secure U-Bahn Station", "am");
	settings.Add("level12", true, "Prevent Reinforcement", "am");
	settings.Add("level13", true, "(The Scientists) Anhalter Station", "am");
	settings.Add("level14", true, "Via the U-Bahn", "am");
	settings.Add("level15", true, "Approach to Nordsig", "am");
	settings.Add("level16", true, "Eliminate Guardpost", "am");
	settings.Add("level17", true, "Nordsig HW Plant", "am");
	settings.Add("level18", true, "Assist OSS Team", "am");
	settings.Add("level19", true, "(Raid on Nordsig) Exfiltrate Nordsig", "am");
	settings.Add("level20", true, "Cut Communications", "am");
	settings.Add("level21", true, "Destroy Ammo Dump", "am");
	settings.Add("level22", true, "Disable Katyushas", "am");
	settings.Add("level23", true, "Holzmarkt Train Yard", "am");
	settings.Add("level24", true, "(Recover the V2 tech) The Schloss", "am");
	settings.Add("level25", true, "Extract the Pilot", "am");
	settings.Add("level26", true, "Journey to Tempelhof", "am");
	settings.Add("level27", true, "(Escape from Berlin) Tempelhof Airport", "am");		//sometimes works and sometimes doesn't
	
	settings.Add("option1", false, "Game Time");
	settings.SetToolTip("option1", "Enables loadless time, to see it switch livesplit comparison to Game Time");
}

start
{
	return current.Start == 5 && old.Start == 2 && current.AllLevels == 2;		//starts with other cutscenes aswell
}

split
{
	return(
	(settings["level1"] && current.AllLevels == 4 && old.AllLevels == 2)||
	(settings["level2"] && current.AllLevels == 6 && old.AllLevels == 4)||
	(settings["level3"] && current.AllLevels == 7 && old.AllLevels == 6)||
	(settings["level4"] && current.AllLevels == 8 && old.AllLevels == 7)||
	(settings["level5"] && current.AllLevels == 9 && old.AllLevels == 8)||
	(settings["level6"] && current.AllLevels == 10 && old.AllLevels == 9)||
	(settings["level7"] && current.AllLevels == 11 && old.AllLevels == 10)||
	(settings["level8"] && current.AllLevels == 12 && old.AllLevels == 11)||
	(settings["level9"] && current.AllLevels == 13 && old.AllLevels == 12)||
	(settings["level10"] && current.AllLevels == 14 && old.AllLevels == 13)||
	(settings["level11"] && current.AllLevels == 15 && old.AllLevels == 14)||
	(settings["level12"] && current.AllLevels == 16 && old.AllLevels == 15)||
	(settings["level13"] && current.AllLevels == 17 && old.AllLevels == 16)||
	(settings["level14"] && current.AllLevels == 18 && old.AllLevels == 17)||
	(settings["level15"] && current.AllLevels == 19 && old.AllLevels == 18)||
	(settings["level16"] && current.AllLevels == 20 && old.AllLevels == 19)||
	(settings["level17"] && current.AllLevels == 21 && old.AllLevels == 20)||
	(settings["level18"] && current.AllLevels == 22 && old.AllLevels == 21)||
	(settings["level19"] && current.AllLevels == 23 && old.AllLevels == 22)||
	(settings["level20"] && current.AllLevels == 24 && old.AllLevels == 23)||
	(settings["level21"] && current.AllLevels == 25 && old.AllLevels == 24)||
	(settings["level22"] && current.AllLevels == 26 && old.AllLevels == 25)||
	(settings["level23"] && current.AllLevels == 27 && old.AllLevels == 26)||
	(settings["level24"] && current.AllLevels == 31 && old.AllLevels == 27)||
	(settings["level25"] && current.AllLevels == 32 && old.AllLevels == 31)||
	(settings["level26"] && current.AllLevels == 34 && old.AllLevels == 32)
//	(settings["level27"] && current.AllLevels == 34 && current.End == 1 && old.End == 0 && current.Start == 2)||
//	(settings["level27"] && current.AllLevels == 34 && current.End == 1 && current.Start == 2 && old.Start == 5)||
//	(settings["level27"] && current.AllLevels == 34 && current.End == 1 && old.End == 0 && current.Start == 2 && old.Start == 5)
	);
}

isLoading
{
	return settings["option1"] && current.Load == 0;
}