#!/bin/sh

echo "{\"text\": \"$(uptime --pretty | sed 's/up //' | sed 's/\ years\?,/a/' | sed 's/\ week\?,/sem/' | sed 's/\ days\?,/j/' | sed 's/\ hours\?,\?/h/' | sed 's/\ minutes\?/m/')\", \"class\": \"\"}"
