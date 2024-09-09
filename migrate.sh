#!/usr/bin/expect
set timeout 70
set hostName [lindex $argv 0]
set rootpass [lindex $argv 1]
set debugpass [lindex $argv 2]

spawn telnet $hostName

expect "User Access Verification"
expect "Password:"
send "$rootpass\r"
#interact
expect -re "> ?$"
send "en\r"

expect "Password:"
send "$debugpass\r"

expect -re "# ?$"
send "sh version\r"

expect -re "# ?$"
send "conf t\r"

expect -re "# ?$"
send "acip ipv4 10.21.69.98\r"

expect -re "# ?$"
send "ex\r"

expect -re "# ?$"
send "wr mem\r"
expect eof
