package require Tcl 8.4
package require Expect 5.40
package require cmdline

set timeout -1
set host rainmaker.wunderground.com
set port 3000
set env(TERM) vt100


spawn telnet $host $port


while 1 {
	expect "Press Return to continue:" {
		send "\r"
	}

	expect "WEATHER UNDERGROUND MAIN MENU" {
		send "1\r"
	}

	expect "CITY FORECAST MENU" {
		send "1\r"
	}

	expect "Press Return for menu" {
		send "\r"
	}
}







puts "\n\n\n************\ndone"
