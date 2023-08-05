
 {
   "modules-left": ["custom/dwl_tag#0", "custom/dwl_tag#1", "custom/dwl_tag#2", "custom/dwl_tag#3", "custom/dwl_tag#4", "custom/dwl_tag#5", "custom/dwl_layout", "custom/dwl_title"],
   // The empty '' argument used in the following "exec": fields works for single-monitor setups
   // For multi-monitor setups, see https://github.com/Alexays/Waybar/wiki/Configuration
   //     and enter the monitor id (like "eDP-1") as the first argument to waybar-dwl.sh
   "custom/dwl_tag#0": {
     "exec": "/path/to/waybar-dwl.sh '' 0",
     "format": "{}",
     "return-type": "json"
   },
   "custom/dwl_tag#1": {
     "exec": "/path/to/waybar-dwl.sh '' 1",
     "format": "{}",
     "return-type": "json"
   },
   "custom/dwl_tag#2": {
     "exec": "/path/to/waybar-dwl.sh '' 2",
     "format": "{}",
     "return-type": "json"
   },
   "custom/dwl_tag#3": {
     "exec": "/path/to/waybar-dwl.sh '' 3",
     "format": "{}",
     "return-type": "json"
   },
   "custom/dwl_tag#4": {
     "exec": "/path/to/waybar-dwl.sh '' 4",
     "format": "{}",
     "return-type": "json"
   },
   "custom/dwl_tag#5": {
     "exec": "/path/to/waybar-dwl.sh '' 5",
     "format": "{}",
     "return-type": "json"
   },
   "custom/dwl_tag#6": {
     "exec": "/path/to/waybar-dwl.sh '' 6",
     "format": "{}",
     "return-type": "json"
   },
   "custom/dwl_tag#7": {
     "exec": "/path/to/waybar-dwl.sh '' 7",
     "format": "{}",
     "return-type": "json"
   },
   "custom/dwl_tag#8": {
     "exec": "/path/to/waybar-dwl.sh '' 8",
     "format": "{}",
     "return-type": "json"
   },
   "custom/dwl_tag#9": {
     "exec": "/path/to/waybar-dwl.sh '' 9",
     "format": "{}",
     "return-type": "json"
   },
   "custom/dwl_layout": {
     "exec": "/path/to/waybar-dwl.sh '' layout",
     "format": "{}",
     "return-type": "json"
   },
   "custom/dwl_title": {
     "exec": "/path/to/waybar-dwl.sh '' title",
     "format": "{}",
     "escape": true,
     "return-type": "json"
   }
 }