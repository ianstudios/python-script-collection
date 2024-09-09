#!/usr/bin/env expect
set timeout 30
set hostName [lindex $argv 0]
set hostAlias [lindex $argv 1]

spawn nc -v $hostName 23

expect "User Access Verification"
expect "Password:"
send "ruijie\r"

#interact
expect -re "> ?$"
send "en\r"

expect "Password:"
send "apdebug\r"

expect -re "# ?$"
send "dir\r"

expect -re "# ?$"
send "copy flash:config.text tftp://10.4.231.96/backup/config-${hostAlias}.txt\r"
expect eof


