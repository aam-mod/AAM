	Taw_Jarhead
	Zip rope script v1
	5/23/2014

	This is a simple zip rope script i put together as a future fast roping option
	its made to make easy and quick insert into enemy territory while minimizing exposure to enemy fire.

	

	usage:
		this addaction ["<t color='#00FFFF'>Zip-Rope</t>", "adf_heli\scripts\ziprope.sqf"]; // place that into the init field of any helo you would like to use script on

	

	you will also be required to put this in the description.ext file for the sounds:
	
	class CfgSounds
	{
   		sounds[] = {zipper};

		class zipper {name="zipper";sound[]={adf_heli\scripts\zipper.ogg,db-11,1.0};titles[] = {};};
	};
	



	*credits*

	i have to thank zealot111 his code really helped me out putting together this script. if you want normal fast rope script please check his out
	http://www.armaholic.com/page.php?id=23961
 