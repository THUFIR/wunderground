package require Tcl 8.4
package require Expect 5.40
package require cmdline

set timeout -1
set code "nyc"

spawn telnet rainmaker.wunderground.com 3000

while {1} {
	expect timeout {
		send_user "failed to contact weather server\n"
		exit
	} "Press Return to continue*" {
               # this prompt used sometimes, eg, upon opening connection
               send "\r"
	} "Press Return for menu*" {
               # this prompt used sometimes, eg, upon opening connection
               send "\r"
	} "M to display main menu*" {
		# sometimes ask this if there is a weather watch in effect
		send "M\r"
	} "Change scrolling to screen*Selection:" {
		break
	} eof {
		send_user "failed to telnet to weather server\n"
		exit
	}
}
send "C\r"
expect timeout timedout "Selection:"
send "4\r"
expect timeout timedout "Selection:"
send "1\r"
expect timeout timedout "Selection:"
send "1\r"
expect timeout timedout "city code:"
send "$code\r"
expect $code		;# discard this

while {1} {
	expect timeout {
		timedout
	} "Press Return to continue*:*" {
		send "\r"
	} "Press Return to display statement, M for menu:*" {
		send "\r"
	} -re "(.*)CITY FORECAST MENU.*Selection:" {
		break
	}
}

send "X\r"
expect

