fx_version 'cerulean'
game 'gta5'

author 'OfficerMills'
description 'A Zippo Lighter that lights fires.'
version '1.0.0'

-- This line is required when using asset escrow
lua54 'yes'

-- This line tells FiveM to enforce encryption on scripts
escrow_enforce 'yes'

shared_script 'config.lua'
client_script 'client.lua'
server_script 'server.lua'

-- Anything you list here will be ignored and not encrypted
escrow_ignore {
    'config.lua',
    'IMAGES/*'
}