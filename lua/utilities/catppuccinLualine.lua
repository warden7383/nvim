-- #macchiato colorscheme
-- rosewater: &rosewater "#f4dbd6"
-- flamingo: &flamingo "#f0c6c6"
-- pink: &pink "#f5bde6"
-- mauve: &mauve "#c6a0f6"
-- red: &red "#ed8796"
-- maroon: &maroon "#ee99a0"
-- peach: &peach "#f5a97f"
-- yellow: &yellow "#eed49f"
-- green: &green "#a6da95"
-- teal: &teal "#8bd5ca"
-- sky: &sky "#91d7e3"
-- sapphire: &sapphire "#7dc4e4"
-- blue: &blue "#8aadf4"
-- lavender: &lavender "#b7bdf8"
-- text: &text "#cad3f5"
-- subtext1: &subtext1 "#b8c0e0"
-- subtext0: &subtext0 "#a5adcb"
-- overlay2: &overlay2 "#939ab7"
-- overlay1: &overlay1 "#8087a2"
-- overlay0: &overlay0 "#6e738d"
-- surface2: &surface2 "#5b6078"
-- surface1: &surface1 "#494d64"
-- surface0: &surface0 "#363a4f"
-- base: &base "#24273a"
-- mantle: &mantle "#1e2030"
-- crust: &crust "#24283b" #181926"

local colors = {
rosewater = "#f4dbd6",
flamingo =  "#f0c6c6"   ,
pink =  &pink "#f5bde6"
mauve =  &mauve "#c6a0f6"      
red =  &red "#ed8796"          
maroon =  &maroon "#ee99a0"
peach: &peach "#f5a97f"        
yellow: &yellow "#eed49f"      
green: &green "#a6da95"
teal: &teal "#8bd5ca"          
sky: &sky "#91d7e3"            
sapphire: &sapphire "#7dc4e4"
blue: &blue "#8aadf4"          
lavender: &lavender "#b7bdf8"  
text: &text "#cad3f5"
subtext1: &subtext1 "#b8c0e0"  
subtext0: &subtext0 "#a5adcb" 
overlay2: &overlay2 "#939ab7"
overlay1: &overlay1 "#8087a2"  
overlay0: &overlay0 "#6e738d" 
surface2: &surface2 "#5b6078"
surface1: &surface1 "#494d64"  
surface0: &surface0 "#363a4f"  
base: &base "#24273a"
mantle: &mantle "#1e2030"

crust: &crust "#24283b" #181926"
}
-- return function(flavour)
-- 	local C = require("catppuccin.palettes").get_palette(flavour)
-- 	local O = require("catppuccin").options
-- 	local catppuccin = {}
--
-- 	local transparent_bg = O.transparent_background and "NONE" or C.mantle
--
-- 	catppuccin.normal = {
-- 		a = { bg = C.blue, fg = C.mantle, gui = "bold" },
-- 		b = { bg = C.surface0, fg = C.blue },
-- 		c = { bg = transparent_bg, fg = C.text },
-- 	}
--
-- 	catppuccin.insert = {
-- 		a = { bg = C.green, fg = C.base, gui = "bold" },
-- 		b = { bg = C.surface0, fg = C.green },
-- 	}
--
-- 	catppuccin.terminal = {
-- 		a = { bg = C.green, fg = C.base, gui = "bold" },
-- 		b = { bg = C.surface0, fg = C.green },
-- 	}
--
-- 	catppuccin.command = {
-- 		a = { bg = C.peach, fg = C.base, gui = "bold" },
-- 		b = { bg = C.surface0, fg = C.peach },
-- 	}
--
-- 	catppuccin.visual = {
-- 		a = { bg = C.mauve, fg = C.base, gui = "bold" },
-- 		b = { bg = C.surface0, fg = C.mauve },
-- 	}
--
-- 	catppuccin.replace = {
-- 		a = { bg = C.red, fg = C.base, gui = "bold" },
-- 		b = { bg = C.surface0, fg = C.red },
-- 	}
--
-- 	catppuccin.inactive = {
-- 		a = { bg = transparent_bg, fg = C.blue },
-- 		b = { bg = transparent_bg, fg = C.surface1, gui = "bold" },
-- 		c = { bg = transparent_bg, fg = C.overlay0 },
-- 	}
--
-- 	return catppuccin
-- end
