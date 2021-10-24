// timeMulti.sqf

_timeOfDay = dayTime;//check current time of day


//then set the time Multiplier for that time frame
switch (true) do {
                
        case ((_timeOfDay >= 8)&& (_timeOfDay < 18)):{setTimeMultiplier 23; };///between 8am & 6pm        
        case ((_timeOfDay >= 18)&& (_timeOfDay < 19)):{setTimeMultiplier 15; };///between 6pm & 7pm    
        case ((_timeOfDay >= 19)&& (_timeOfDay < 20)):{setTimeMultiplier 7; };///between 7pm & 8pm
        case ((_timeOfDay >= 20)or (_timeOfDay < 3)):{setTimeMultiplier 60; };///between 8pm & 3am
        case ((_timeOfDay >= 3)&& (_timeOfDay < 6)):{setTimeMultiplier 7; };///between 3am & 6am
        case ((_timeOfDay >= 6)&& (_timeOfDay < 8)):{setTimeMultiplier 15; };///between 6am & 8am
                
};

_timeOfDay = floor dayTime;////get hour without the minutes///     
    
_timeManager = true;      

while { _timeManager } do {

        while {(date select 3) == _timeOfDay} do {sleep 3;};////while the time is still within the same hour just wait///

        _timeOfDay = (date select 3);////get new hour///
            
        ///////check hour against each case and run code if it is the right time//////
            
            switch _timeOfDay do
                                {
    
                    case 18: { 
                                            ////decrease multi down to 15////
                                    for [{ _i = 0 }, { _i < 8 }, { _i = _i + 1 }] do { 

                                                _timeMulti = timeMultiplier;

                                                    _ModifyMulti = _timeMulti - 1;
                                                                
                                                        setTimeMultiplier _ModifyMulti; 
                                                    
                                                                sleep 5;

                                                                        };///end for
                    
                                                                        };///end case 6pm
                                                                        
                    case 19: { 
                                            ////decrease multi down to 7////
                                    for [{ _i = 0 }, { _i < 8 }, { _i = _i + 1 }] do { 

                                                _timeMulti = timeMultiplier;

                                                    _ModifyMulti = _timeMulti - 1;
                                                                
                                                        setTimeMultiplier _ModifyMulti; 
                                                    
                                                                sleep 8;

                                                                        };///end for
                    
                                                                        };///end case 7pm
                    
                    case 20: { 
                                                /////increase multi up to 60/////
                                    for [{ _i = 0 }, { _i < 53 }, { _i = _i + 1 }] do { 

                                                _timeMulti = timeMultiplier;

                                                    _ModifyMulti = _timeMulti + 1;
                                                                
                                                        setTimeMultiplier _ModifyMulti; 
                                                    
                                                                sleep 5;

                                                                        };///end for
                                                
                                                                        };///end case 8pm
                    
                    case 3: { 
                    
                                /////decrease multi down to 7/////
                                    for [{ _i = 0 }, { _i < 53 }, { _i = _i + 1 }] do { 

                                                _timeMulti = timeMultiplier;

                                                    _ModifyMulti = _timeMulti - 1;
                                                                
                                                        setTimeMultiplier _ModifyMulti; 
                                                    
                                                                sleep 1;

                                                                        };///end for
                                                            
                                                            };///end case 5am
                    
                    case 6: { 
                    
                                    /////increase multi up to 15/////
                                    for [{ _i = 0 }, { _i < 8 }, { _i = _i + 1 }] do { 

                                                _timeMulti = timeMultiplier;

                                                    _ModifyMulti = _timeMulti + 1;
                                                                
                                                        setTimeMultiplier _ModifyMulti; 
                                                    
                                                                sleep 5;

                                                                        };///end for
                    
                                                                };///end case 6am
                    
                    case 8: { 
                    
                                        /////increase multi up to 23/////
                                    for [{ _i = 0 }, { _i < 7 }, { _i = _i + 1 }] do { 

                                                _timeMulti = timeMultiplier;

                                                    _ModifyMulti = _timeMulti + 1;
                                                                
                                                        setTimeMultiplier _ModifyMulti; 
                                                    
                                                                sleep 5;

                                                                        };///end for
                                        
                    
                                                                };///end case 8am
    
    
    
    
                                    };////end switch

                            
    
                            };////end while loop