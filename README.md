# debug-monitor-display

Epoch Debug Monitor (RscTitle)


![GitHub Logo](http://puu.sh/H8GOm/f0cbc27956.png)



### Prerequisites

```
a custom compliles.sqf and keyboard.sqf
```




### Install

In your **description.ext** find

```
class RscTitles {
```

below that paste

```
#include "PATH_TO_YOUR\debug.hpp" 
```

Save and close.





In your **compiles.sqf** find

```
if (!isDedicated) then {
```

Below that paste

```
player_debug = compile preprocessFileLineNumbers "PATH_TO_YOUR\player_debug.sqf";
```

Save and close.




Next, open your **keyboard.sqf**, scroll to the bottom and above the last 
```
_handled
```

Paste

```
//-------------- debug monitor display 
	if (_dikCode == 0xD2) then {			// insert key
		if (isNil 'debugMonitor') then {
		9000 cutRsc ["DEBUG","PLAIN",0];	
		debugMonitor = [] spawn player_debug;
		} else {
		terminate debugMonitor;
		9000 cutFadeOut 0;		
		debugMonitor = nil;
		};
	};		
//--------------
```


Dont forget to amend **PATH_TO_YOUR**

Battleye is up to you.


```

	zupa_numberText= {
		private ["_number","_mod","_digots","_digitsCount","_modBase","_numberText"];
		_number = [_this,0,0,[0, ""]] call bis_fnc_param;
		_mod = [_this,1,3,[0]] call bis_fnc_param;
		if (typeName _number == "STRING") then {
			_number = parseNumber _number;
		};
		_digits = _number call BIS_fnc_numberDigits;
		_digitsCount = count _digits - 1;
		_modBase = _digitsCount % _mod;
		_numberText = "";
		{_numberText = _numberText + str _x;
			if ((_foreachindex - _modBase) % (_mod) == 0 && _foreachindex != _digitsCount) then {_numberText = _numberText + ",";};
		} foreach _digits;
		_numberText
		};
```




**Install Complete**



## Acknowledgments

Everyone on [EpochMod Forums](https://epochmod.com/forum/forum/1-arma-2/), [OpenDayz](https://opendayz.net/), and anyone else who posted debugs before :)  
