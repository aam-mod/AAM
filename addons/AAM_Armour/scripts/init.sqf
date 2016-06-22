private "_inwater";
_lav=_this select 0;
_count=3; 
sleep 0.5;
if ((getpos _lav select 2)<-0.1) then 
{
    _inwater=1;
    _lav animate ["front_panel", 1];
}
else{_inwater=0};

while {alive _lav} do 
{
	sleep 2.0;
         if ((getpos _lav select 2)>-0.1) then 
		 {
         	if (_inwater==1) then {_count=0;_inwater=0; };
                 if (_count<4) then {_count=_count+1}; 
         } 
         else
		 {
          	if (_inwater==0) then {_count=0;_inwater=1; };            
                 if (_count<4) then {_count=_count+1};                   
         }; 
		 if ((damage _lav) > 0.003) exitwith {};
         if (_count==3)then
		 {
			_lav animate ["front_panel", _inwater];
         };        
};
