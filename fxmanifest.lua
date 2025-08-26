fx_version 'cerulean'
game 'gta5'

title 'Sure Mailbox (Headless)'
description 'Free Open Source Mailbox'
author 'Sure'
version '1.0.1'

shared_scripts {
    '@es_extended/imports.lua',
    'config/**.lua'
}

client_scripts {
    'modules/**/client/*.lua'
}

server_scripts {
    'modules/**/server/*.lua'
}

files {
    'storage.json'
}

dependecies {
    'es_extended'
}