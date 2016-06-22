switch (side player) do
{
	case west:
	{
		SLMD_color = [0,0.3,0.6,1];
		SLMD_side = [west, 1, "CAManBase"];
	};
	
	case east: 
	{
		SLMD_color = [0.5,0,0,1]; 
		SLMD_side = [east, 0, "SoldierEB"];
	};
	
	case resistance: 
	{
		SLMD_color = [0,0.5,0,1]; 
		SLMD_side = [resistance, 2, "SoldierGB"];
	};
	
	case civilian: 
	{
		SLMD_color = [0.4,0,0.5,1]; 
		SLMD_side = [civilian, 3, "Civilian"];
	};
	
	default 
	{
		SLMD_color = [0,0,0,1];
		SLMD_side = [sideEnemy, 110, ""];
	};
};