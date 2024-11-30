fx_version 'adamant'

game 'gta5'

author 'Abo Qaht'
description 'Hud Fights'
version '1.0'
lua54 'yes'

escrow_ignore {
	"client/client.lua"
}

client_scripts {
	'client/client.lua',
}
server_scripts {
	'server/sv_main.lua',
}
shared_scripts {
	'config.lua',
}

ui_page 'html/ui.html'

files {
	'html/*.*',
	'html/css/*.*',
	'html/images/*.*',
	'html/scripts/*.*',
	'html/images/weapons/*.*',
}