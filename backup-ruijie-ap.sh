#!/usr/bin/env expect
set timeout 30
set hostName [lindex $argv 0]
set hostAlias [lindex $argv 1]
set tftpAddress [lindex $argv 2]

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
send "copy flash:config.text tftp://${tftpAddress}/backup/config-${hostAlias}.txt\r"
expect eof


