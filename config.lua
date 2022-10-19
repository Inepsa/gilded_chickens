
Config = {}

Config.defaultlang = "en" -- Default language ("en" English, "es" Español)

Config.SearchTimeMin = 5000 						-- Minimum time, in milliseconds (1000 milliseconds = 1 second), taken to search a Chicken nest.
Config.SearchTimeMax = 7000 						-- Maximum time, in milliseconds (1000 milliseconds = 1 second), taken to search a Chicken nest.
Config.SearchDelay = 600				 			-- Time, in seconds, before a Chicken nest can be search again.
Config.SearchRewardCount = {1,3} 					-- How many Chicken eggs players can find per nest; Set this to a table like so {min,max} for random reward count per search; eg {0,3} will mean a random reward count between 0 and 3.

Config.NestGatherItem = "egg" 						-- The DB name of the item pulled from the nest
Config.NestGatherItemLabel = _U("nestgather_label") -- Item label of what is gathererd from the nest

Config.ChickenNests = { -- vector3(x,y,z)
	
	--Valentine chicken spots
	vector3(-426.33, 650.22, 112.61),
	vector3(-439.23, 660.4, 111.86),
	vector3(-250.37, 679.77, 113.53),
	vector3(-247.29, 673.25, 114.23),
	vector3(-225.27, 675.68, 113.58),
	vector3(-299.06, 841.76, 120.06),
	vector3(-403.66, 941.26, 117.97),

	--house between val and emerald ranch
	vector3(1134.67, 499.69, 96.29),
	vector3(1130.5, 505.69, 96.66),
	vector3(1111.33, 444.97, 96.31),
	vector3(1108.66, 448.29, 96.3),
	vector3(1117.85, 438.03, 96.3),
	vector3(1114.91, 440.92, 96.31),
	vector3(1120.7, 433.59, 96.4),
	vector3(1123.85, 430.95, 96.43),
	vector3(1184.0, 433.92, 92.97),

	--emerald ranch
	vector3(1386.61, 260.95, 89.71),
	vector3(1390.95, 264.83, 89.6),
	vector3(1389.81, 261.41, 90.36),
	vector3(1381.95, 265.13, 90.19),
	vector3(1452.17, 316.78, 89.52),
	vector3(1373.42, 354.83, 87.87),
	vector3(1376.8, 358.73, 88.09),

	--braithwaite 
	vector3(891.57, -1896.45, 45.45),

	--mcfarlanes
	vector3(-2417.49, -2429.31, 61.49),
	vector3(-2414.32, -2428.91, 60.97),
	vector3(-2414.54, -2431.69, 61.5),
	vector3(-2418.13, -2438.73, 60.43),
	vector3(-2427.16, -2433.61, 60.98),
	vector3(-2423.96, -2432.4, 60.98),
	vector3(-2424.98, -2434.79, 60.95),
	vector3(-2390.3, -2470.51, 60.22),
	vector3(-2396.29, -2472.76, 60.29),

	--armadillo area ranch
	vector3(-4753.15, -2707.46, -13.26),
	vector3(-4799.5, -2749.32, -14.22),
	vector3(-4754.59, -2721.66, -13.67),
	vector3(-4756.79, -2725.41, -13.86),
	vector3(-4788.03, -2712.19, -14.24),
	vector3(-4810.79, -2694.65, -12.57),
	vector3(-4822.2, -2684.43, -12.17),
	vector3(-4826.79, -2674.93, -12.3),
	
	--rathskeller ranch
	vector3(-5201.35, -2148.91, 12.03),
	vector3(-5197.61, -2165.98, 12.01),
	vector3(-5191.52, -2160.14, 12.16),
	vector3(-5163.96, -2125.37, 12.49),
	vector3(-5192.08, -2131.94, 12.23),
	vector3(-5233.87, -2125.68, 12.2),

	--NE heartland oilfield ranch
	vector3(821.47, 857.56, 117.04),
	vector3(820.56, 867.79, 116.79),
	vector3(812.28, 872.46, 117.18),
	vector3(767.57, 874.37, 121.89),
	vector3(770.33, 879.15, 121.89)

}
