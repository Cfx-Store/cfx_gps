fx_version "cerulean"

description "GPS Script"
author "CFXStore"
version "0.0.0"
repository "https://github.com/Cfx-Store/cfx_gps"

lua54 "yes"

games {
  "gta5"
}

dependencies {
  "es_extended"
}

shared_script {
  "@es_extended/imports.lua",
  "config.lua"
}

client_script "src/client.lua"
server_script "src/server.lua"