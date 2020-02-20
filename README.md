# debug-monitor-display

Epoch Debug Monitor (RscTitle)


![https://epochmod.com/forum/forum/1-arma-2/](http://puu.sh/FcyvV/d4766884bf.jpg)



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

**Install Complete**



## Acknowledgments

Everyone on [EpochMod Forums](https://epochmod.com/forum/forum/1-arma-2/), [OpenDayz](https://opendayz.net/), and anyone else who posted debugs before :)  
