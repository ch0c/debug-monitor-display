private ["_display","_stats","_time", "_hours", "_minutes", "_pic", "_coins","_dir","_d","_DebugText","_nearestCity","_textCity","_thirst ","_thirststat ","_hunger ","_hungerstat ","_servername","_spacer","_img","_primary","_symbol"];
disableSerialization;
//--------------------------------------------------------------------------------------------//
	_display = uiNameSpace getVariable "DEBUGDISPLAY";
	_stats = _display displayCtrl 9000;
//--------------------------------------------------------------------------------------------//
	_servername = "Dayz Epoch";
	_spacer = "------------------------------------------";
	_symbol = "°";
//--------------------------------------------------------------------------------------------//
while {1 == 1} do {
	_nearestCity = nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],800];
	_textCity = "Wilderness";
	if (count _nearestCity > 0) then {_textCity = text (_nearestCity select 0)};
	_img = (getText (configFile >> 'CfgVehicles' >> (typeOf vehicle player) >> 'picture'));
if(player == vehicle player)then{
	_img = (getText (configFile >> 'CfgWeapons' >> (currentWeapon player) >> 'picture'));
	}else{
	_img = (getText (configFile >> 'CfgVehicles' >> (typeOf vehicle player) >> 'picture'));	
	};
	_time = (round(150-(serverTime)/60));
	_hours = (floor(_time/60));
	_minutes = (_time - (_hours * 60));
	switch(_minutes) do	{
		case 9: {_minutes = "09"};
		case 8: {_minutes = "08"};
		case 7: {_minutes = "07"};
		case 6: {_minutes = "06"};
		case 5: {_minutes = "05"};
		case 4: {_minutes = "04"};
		case 3: {_minutes = "03"};
		case 2: {_minutes = "02"};
		case 1: {_minutes = "01"};
		case 0: {_minutes = "00"};
	};
	_d = getdir player;
	if (_d >= 337.5 || _d < 22.5) then {_dir = "North";};
	if (_d >= 292.5 && _d < 337.5) then {_dir = "NWest";};
	if (_d >= 247.5 && _d < 292.5) then {_dir = "West";};
	if (_d >= 202.5 && _d < 247.5) then {_dir ="SWest";};
	if (_d >= 157.5 && _d < 202.5) then {_dir ="South";};
	if (_d >= 112.5 && _d < 157.5) then {_dir ="SE";};
	if (_d >= 67.5 && _d < 112.5) then {_dir ="East";};
	if (_d >= 22.5 && _d < 67.5) then {_dir ="NEast";};

	_thirst = ceil ((1 - ((dayz_thirst min SleepFood) / SleepFood)) * 100);
	_thirststat = "";
	if (_thirst <= 19) then {_thirststat = "Dying"}; 
	if (_thirst <=39&& _thirst >20) then {_thirststat = "20%"};
	if (_thirst <=59&& _thirst >40) then {_thirststat = "40%"};
	if (_thirst <=79&& _thirst >50) then {_thirststat = "60%"};
	if (_thirst <=79&& _thirst >80) then {_thirststat = "80%"};
	if (_thirst <=100 && _thirst >80) then {_thirststat = "100%"};
	
	_hunger = ceil ((1 - ((dayz_hunger min SleepWater) / SleepWater)) * 100);
	_hungerstat = "";
	if (_hunger <= 19) then {_hungerstat = "Dying"}; 
	if (_hunger <=39&& _hunger >20) then {_hungerstat = "20%"};
	if (_hunger <=59&& _hunger >40) then {_hungerstat = "40%"};
	if (_hunger <=79&& _hunger >50) then {_hungerstat = "60%"};
	if (_hunger <=79&& _hunger >80) then {_hungerstat = "80%"};
	if (_hunger <=100 && _hunger >80) then {_hungerstat = "100%"};
	
	_thirststat = round(100 - (dayz_thirst / SleepWater) * 100);
	_hungerstat = round(100 - (dayz_hunger / SleepFood) * 100);
	
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	_DebugText = format ["<t size='1.3' font='Zeppelin33' align='center' color='#D9FF00'>%1</t><br/><br/>", _servername];
	_DebugText = _DebugText + format ["<t size='1.2' font='Zeppelin33' align='left' color='#E5E5E5'>Zombies Killed: </t><t size='1.2' font='Zeppelin33' align='right' color='#FFFFFF'>%1</t><br/>", player getVariable['zombieKills', 0]];
	_DebugText = _DebugText + format ["<t size='1.2' font='Zeppelin33' align='left' color='#E5E5E5'>Survivors Killed: </t><t size='1.2' font='Zeppelin33' align='right' color='#FFFFFF'>%1</t><br/>", player getVariable['humanKills', 0]];
	_DebugText = _DebugText + format ["<t size='1.2' font='Zeppelin33' align='left' color='#E5E5E5'>Bandits Killed: </t><t size='1.2' font='Zeppelin33' align='right' color='#FFFFFF'>%1</t><br/>", player getVariable['banditKills', 0]];
	_DebugText = _DebugText + format ["<t size='1.2' font='Zeppelin33' align='left' color='#A23DFF'>Humanity: </t><t size='1.2' font='Zeppelin33' align='right' color='#FFFFFF'>%1</t><br/>", round(player getVariable['humanity', 0])];
/*-----------*/	_DebugText = _DebugText + format ["<t size='1' font='Zeppelin33' align='left' color='#CCCCCC'>%1</t><br/>", _spacer];
	_DebugText = _DebugText + format ["<t size='1.2' font='Zeppelin33' align='left' color='#E5E5E5'>Zombies: </t><t size='1.2' font='Zeppelin33' align='left' color='#FFFFFF'>%1</t>", count entities "zZombie_Base"];
	_DebugText = _DebugText + format ["<t size='1.2' font='Zeppelin33' align='right' color='#E5E5E5'>Players: </t><t size='1.2' font='Zeppelin33' align='right' color='#FFFFFF'>%1</t><br/>", count playableUnits];
/*-----------*/	_DebugText = _DebugText + format ["<t size='1' font='Zeppelin33' align='left' color='#CCCCCC'>%1</t><br/>", _spacer];
	_DebugText = _DebugText + format ["<t size='1.3' font='Zeppelin33' align='center' color='#FA1A16'>Blood: %1</t><br/>", player getVariable['USEC_BloodQty', r_player_blood]];
	_DebugText = _DebugText + format ["<t size='1.2' font='Zeppelin33' align='left' color='#D6A24D'>Hunger: </t><t size='1.2' font='Zeppelin33' align='left' color='#FFFFFF'>%1 %</t>", _hungerstat];
	_DebugText = _DebugText + format ["<t size='1.2' font='Zeppelin33' align='right' color='#7FBDE3'>Thirst: </t><t size='1.2' font='Zeppelin33' align='right' color='#FFFFFF'>%1 %</t><br/>", _thirststat];
/*-----------*/	_DebugText = _DebugText + format ["<t size='1' font='Zeppelin33' align='left' color='#CCCCCC'>%1</t><br/>", _spacer];
	_DebugText = _DebugText + format ["<t size='1' font='Zeppelin33' align='left' color='#8CFA16'>%1</t>", _textcity];
	_DebugText = _DebugText + format ["<t size='1.1' font='Zeppelin33' align='right' color='#8CFA16'>%1%2 %3</t><br/>", round (getDir vehicle player),_symbol, _dir];
	_DebugText = _DebugText + format ["<img size='4' align='center'  image='%1' /><br/>", _img];
	_DebugText = _DebugText + format ["<t size='1.2' font='Zeppelin33' align='left' color='#8CFA16'>GPS: </t><t size='1.2' font='Zeppelin33' align='left' color='#FFFFFF'>%1 </t>", (mapGridPosition getPos player)];
	_DebugText = _DebugText + format ["<t size='1.2' font='Zeppelin33' align='right' color='#8CFA16'>FPS: </t><t size='1.2' font='Zeppelin33' align='right' color='#FFFFFF'>%1</t><br/>", round diag_fps];
/*-----------*/	_DebugText = _DebugText + format ["<t size='1' font='Zeppelin33' align='left' color='#CCCCCC'>%1</t><br/>", _spacer];
	_DebugText = _DebugText + format ["<t size='1.2' font='Zeppelin33' align='left' color='#D0F000'>Coins: </t><t size='1.2' font='Zeppelin33' align='right' color='#FFFFFF'>%1</t><br/>", [player getVariable["cashMoney",0]] call BIS_fnc_numberText];
	_DebugText = _DebugText + format ["<t size='1.2' font='Zeppelin33' align='left' color='#D0F000'>Bank: </t><t size='1.2' font='Zeppelin33' align='right' color='#FFFFFF'>%1</t><br/>", [player getVariable["bankMoney",0]] call BIS_fnc_numberText]; 
/*-----------*/	_DebugText = _DebugText + format ["<t size='1' font='Zeppelin33' align='left' color='#CCCCCC'>%1</t><br/>", _spacer];
	_DebugText = _DebugText + format ["<t size='1.1' font='Zeppelin33' align='center' color='#D9FF00'>Restart in: </t><t size='1.2' font='Zeppelin33' align='center' color='#FFFFFF'>%1:%2</t><br/>", _hours, _minutes];

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	_stats ctrlSetStructuredText parseText _DebugText;
	uiSleep 2;
};
