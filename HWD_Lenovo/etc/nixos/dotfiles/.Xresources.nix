{
  home-manager.users.mudrii.home.file.".Xresources".text = ''
!--------------------------
! ROFI Color theme
! -------------------------
rofi.color-enabled: true
!rofi.color-window: argb:ee273238, #273238, argb:3a1e2529
rofi.color-window:	#000, #000, #000
rofi.color-normal: argb:00273238, #c1c1c1, argb:3a273238, #394249, #ffffff
rofi.color-active: argb:00273238, #80cbc4, argb:3a273238, #394249, #80cbc4
rofi.color-urgent: argb:00273238, #ff1844, argb:3a273238, #394249, #ff1844
rofi.hide-scrollbar:	true


!---------------------------------
! Xft settings
! --------------------------------
!Xft.dpi:        110
Xft.dpi:        109
Xft.antialias:  true
Xft.rgba:       rgb
Xft.hinting:    true
Xft.hintstyle:  hintslight
Xft.autohint:   false
Xft.lcdfilter:  lcddefault


!---------------------------------
! URXVT Terminal config
! --------------------------------
URxvt.depth:				32
URxvt*termName:  			screen-256color
URxvt*geometry:  			240x84
URxvt.loginShell:			true
URxvt*scrollColor:			#777777
URxvt.scrollStyle:			rxvt
URxvt*scrollTtyKeypress:	true
URxvt*scrollTtyOutput:  	false
URxvt*scrollWithBuffer:  	true
URxvt*skipScroll:  			true
URxvt*scrollBar:  			false
URxvt*fading:  				30
URxvt*urgentOnBell:			false
URxvt*visualBell:			true
URxvt*mapAlert:				true
URxvt*mouseWheelScrollPage:	true
URxvt.foreground: 			#eeeeee
URxvt.background: 			#000000
URxvt*colorUL:  			yellow
URxvt*underlineColor:  		yellow
URxvt.saveLines: 			65535
URxvt.cursorBlink:			false
URxvt.utf8: 				true
URxvt.locale: 				true	

!URxvt*background:			Black
!URxvt*foreground:			White

! Disable printing the terminal contents when pressing PrintScreen.
URxvt.print-pipe: "cat > /dev/null"

!Font spacing
!URxvt.letterSpace: 		-1

! Font declaration
!URxvt.font:             xft:monospace:pixelsize=16:style=regular
!URxvt.boldFont:         xft:monospace:pixelsize=14:style=bold

URxvt.font:  xft:FuraCode Nerd Font Mono:pixelsize=15
!URxvt.font: xft:Inconsolata Nerd Font Mono:size=15, xft:DejaVu Sans:size=12

!URxvt.letterSpace: 		-4

!URxvt.font:             xft:terminus:pixelsize=15:style=regular
!URxvt.boldFont:         xft:terminus:pixelsize=13:style=bold
!URxvt.italicFont:       xft:terminus:pixelsize=15:style=regular
!URxvt.boldItalicFont:   xft:terminus:pixelsize=13:style=bold

!URxvt*font:			xft:terminus:size=9:antialias=true
!URxvt*boldFont:		xft:terminus:bold:size=9:antialias=true

!URxvt.font: 			xft:monaco:size=10:antialias=true

!URxvt.font: -misc-dejavu sans mono-medium-r-normal-*-16-*-110-110-*-*-iso8859-*

! Perl extensions

!URxvt.perl-ext-common:     default,matcher
!URxvt.matcher.button:      1
!URxvt.urlLauncher:         chromium

!URxvt.perl-ext-common: ...,tabbed,...

! Changing font size on the fly
URxvt.perl-ext-common: 	 	default,font-size
URxvt.keysym.C-Up:     		perl:font-size:increase
URxvt.keysym.C-Down:   		perl:font-size:decrease
URxvt.keysym.C-S-Up:   		perl:font-size:incglobal
URxvt.keysym.C-S-Down: 		perl:font-size:decglobal

URxvt.keysym.Home: \033[1~
URxvt.keysym.End: \033[4~
URxvt.keysym.KP_Home: \033[1~
URxvt.keysym.KP_End:  \033[4~

! Colors
URxvt*background: #000000
URxvt*foreground: #B2B2B2
! black
URxvt*color0:  #000000
URxvt*color8:  #686868
! red
URxvt*color1:  #B21818
URxvt*color9:  #FF5454
! green
URxvt*color2:  #18B218
URxvt*color10: #54FF54
! yellow
URxvt*color3:  #B26818
URxvt*color11: #FFFF54
! blue
URxvt*color4:  #1818B2
URxvt*color12: #5454FF
! purple
URxvt*color5:  #B218B2
URxvt*color13: #FF54FF
! cyan
URxvt*color6:  #18B2B2
URxvt*color14: #54FFFF
! white
URxvt*color7:  #B2B2B2
URxvt*color15: #FFFFFF
'';
}
