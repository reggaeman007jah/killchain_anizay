/*
Display settings for in-map GUI 
*/

class RscTitles {
 class Default {
       idd = -1;
       fadein = 0;
       fadeout = 0;
       duration = 0;
    };

	// ----- in-map labels and vlaues for mission 

	class SUPPLY_STATS_TOP_LABEL {
        idd = 1000003;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  2.5;
        fadeout      =  2;
        name = "SUPPLY_STATS_TOP_LABEL";
		onLoad = "with uiNameSpace do { SUPPLY_STATS_TOP_LABEL = _this select 0 }";
	
		class controls {
		    class structuredText {
                access = 0;
                type = 13;
                idc = 999100;
                style = 0x00;
                lineSpacing = 1;
				x = 0.120 * safezoneW + safezoneX;
				y = 0.000 * safezoneH + safezoneY;
				w = 0.100 * safezoneW;
				h = 0.100 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0.1};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
				
				class Attributes {
					font = "PuristaSemiBold";
					color = "#FFFFFF";
					align = "CENTER";
					valign = "TOP";
					shadow = false;
					shadowColor = "#000000";
					underline = false;
					size = "2";
				}; 
            };
		};
	};


	class BARRACKS_STATS_TOP_LABEL {
        idd = 1000003;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  2.5;
        fadeout      =  2;
        name = "BARRACKS_STATS_TOP_LABEL";
		onLoad = "with uiNameSpace do { BARRACKS_STATS_TOP_LABEL = _this select 0 }";
	
		class controls {
		    class structuredText {
                access = 0;
                type = 13;
                idc = 999101;
                style = 0x00;
                lineSpacing = 1;
				x = 0.220 * safezoneW + safezoneX;
				y = 0.000 * safezoneH + safezoneY;
				w = 0.100 * safezoneW;
				h = 0.100 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0.1};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
				
				class Attributes {
					font = "PuristaSemiBold";
					color = "#FFFFFF";
					align = "CENTER";
					valign = "TOP";
					shadow = false;
					shadowColor = "#000000";
					underline = false;
					size = "2";
				}; 
            };
		};
	};

	class MEDICAL_STATS_TOP_LABEL {
        idd = 1000003;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  2.5;
        fadeout      =  2;
        name = "MEDICAL_STATS_TOP_LABEL";
		onLoad = "with uiNameSpace do { MEDICAL_STATS_TOP_LABEL = _this select 0 }";
	
		class controls {
		    class structuredText {
                access = 0;
                type = 13;
                idc = 999102;
                style = 0x00;
                lineSpacing = 1;
				x = 0.320 * safezoneW + safezoneX;
				y = 0.000 * safezoneH + safezoneY;
				w = 0.100 * safezoneW;
				h = 0.100 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0.1};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
				
				class Attributes {
					font = "PuristaSemiBold";
					color = "#FFFFFF";
					align = "CENTER";
					valign = "TOP";
					shadow = false;
					shadowColor = "#000000";
					underline = false;
					size = "2";
				}; 
            };
		};
	};

	class WORKSHOP_STATS_TOP_LABEL {
        idd = 1000003;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  2.5;
        fadeout      =  2;
        name = "WORKSHOP_STATS_TOP_LABEL";
		onLoad = "with uiNameSpace do { WORKSHOP_STATS_TOP_LABEL = _this select 0 }";
	
		class controls {
		    class structuredText {
                access = 0;
                type = 13;
                idc = 999103;
                style = 0x00;
                lineSpacing = 1;
				x = 0.420 * safezoneW + safezoneX;
				y = 0.000 * safezoneH + safezoneY;
				w = 0.100 * safezoneW;
				h = 0.100 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0.1};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
				
				class Attributes {
					font = "PuristaSemiBold";
					color = "#FFFFFF";
					align = "CENTER";
					valign = "TOP";
					shadow = false;
					shadowColor = "#000000";
					underline = false;
					size = "2";
				}; 
            };
		};
	};

	class WELCOME_TEXT {
        idd = 1000003;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  25;
        fadein       =  2.5;
        fadeout      =  2;
        name = "WELCOME_TEXT";
		onLoad = "with uiNameSpace do { WELCOME_TEXT = _this select 0 }";
	
		class controls {
		    class structuredText {
                access = 0;
                type = 13;
                idc = 999500;
                style = 0x00;
                lineSpacing = 1;
				x = 0.100 * safezoneW + safezoneX;
				y = 0.200 * safezoneH + safezoneY;
				w = 0.300 * safezoneW;
				h = 0.300 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0.1};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
				
				class Attributes {
					font = "PuristaSemiBold";
					color = "#FFFFFF";
					align = "CENTER";
					valign = "TOP";
					shadow = false;
					shadowColor = "#000000";
					underline = false;
					size = "2";
				}; 
            };
		};
	};

	class WELCOME_IMAGE {
        idd = 1000003;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  3;
        fadein       =  2.5;
        fadeout      =  2;
        name = "WELCOME_IMAGE";
		onLoad = "with uiNameSpace do { WELCOME_IMAGE = _this select 0 }";
	
		class controls {
		    class structuredText {
                access = 0;
                type = 13;
                idc = 999501;
                style = 0x00;
                lineSpacing = 1;
				x = 0.1 * safezoneW + safezoneX;
				y = 0.25 * safezoneH + safezoneY;
				w = 0.2 * safezoneW;
				h = 0.2 * safezoneH;
                size = 0.020;
                colorBackground[] = {1,1,1,0.1};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
				
				class Attributes {
					font = "PuristaSemiBold";
					color = "#FFFFFF";
					align = "CENTER";
					valign = "TOP";
					shadow = false;
					shadowColor = "#000000";
					underline = false;
					size = "20";
				}; 
            };
		};
	};

	class GENERAL_MESSAGE {
        idd = 1000003;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  8;
        fadein       =  2.5;
        fadeout      =  2;
        name = "GENERAL_MESSAGE";
		onLoad = "with uiNameSpace do { GENERAL_MESSAGE = _this select 0 }";
	
		class controls {
		    class structuredText {
                access = 0;
                type = 13;
                idc = 999502;
                style = 0x00;
                lineSpacing = 1;
				x = 0.400 * safezoneW + safezoneX;
				y = 0.800 * safezoneH + safezoneY;
				w = 0.200 * safezoneW;
				h = 0.040 * safezoneH;
                size = 0.030;
                colorBackground[] = {1,1,1,0.1};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
				
				class Attributes {
					font = "PuristaSemiBold";
					color = "#FFFFFF";
					align = "CENTER";
					valign = "CENTER";
					shadow = false;
					shadowColor = "#000000";
					underline = false;
					size = "2";
				}; 
            };
		};
	};

	class GENERAL_MESSAGE_LL {
        idd = 1000003;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  8;
        fadein       =  2.5;
        fadeout      =  2;
        name = "GENERAL_MESSAGE_LL";
		onLoad = "with uiNameSpace do { GENERAL_MESSAGE_LL = _this select 0 }";
	
		class controls {
		    class structuredText {
                access = 0;
                type = 13;
                idc = 999503;
                style = 0x00;
                lineSpacing = 1;
				x = 0.100 * safezoneW + safezoneX;
				y = 0.800 * safezoneH + safezoneY;
				w = 0.100 * safezoneW;
				h = 0.040 * safezoneH;
                size = 0.030;
                colorBackground[] = {1,1,1,0.1};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
				
				class Attributes {
					font = "PuristaSemiBold";
					color = "#FFFFFF";
					align = "CENTER";
					valign = "CENTER";
					shadow = false;
					shadowColor = "#000000";
					underline = false;
					size = "1.5";
				}; 
            };
		};
	};

	class GENERAL_MESSAGE_MM {
        idd = 1000003;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  8;
        fadein       =  2.5;
        fadeout      =  2;
        name = "GENERAL_MESSAGE_MM";
		onLoad = "with uiNameSpace do { GENERAL_MESSAGE_MM = _this select 0 }";
	
		class controls {
		    class structuredText {
                access = 0;
                type = 13;
                idc = 999504;
                style = 0x00;
                lineSpacing = 1;
				x = 0.400 * safezoneW + safezoneX;
				y = 0.500 * safezoneH + safezoneY;
				w = 0.200 * safezoneW;
				h = 0.100 * safezoneH;
                size = 0.030;
                colorBackground[] = {1,1,1,0.1};
                colorText[] = {0,0,0,1};
                text = "";
                font = "PuristaSemiBold";
				
				class Attributes {
					font = "PuristaSemiBold";
					color = "#FFFFFF";
					align = "CENTER";
					valign = "CENTER";
					shadow = false;
					shadowColor = "#000000";
					underline = false;
					size = "2";
				}; 
            };
		};
	};

};


