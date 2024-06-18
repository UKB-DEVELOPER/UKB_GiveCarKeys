fx_version 'adamant'
game 'gta5'

description 'UKB_GiveCarKeys'
author 'UKB - DEVELOPER (Unknowkubbrother)'

version '1.0.0'

server_scripts {
	'Config/base.config.lua',
	'@oxmysql/lib/MySQL.lua',
	'Config/notify.config.lua',
	'Config/command.config.lua',
	'Config/secret.config.lua',
	'Config/quries.config.lua',
	'Config/sync.config.lua',
	'Config/discord.config.lua',
	'Source/sync/GenaratePlate.lua',
	'Source/server/main.lua'
}

client_scripts {
	'Config/base.config.lua',
	'Config/notify.config.lua',
	'Source/client/main.lua'
}