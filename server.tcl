package require Tcl 8.4
package require Expect 5.40
package require Thread




 proc accept {chan addr port} {
     puts "$addr:$port > [gets $chan]"
     puts $chan goodbye
     close $chan
 }
 socket -server accept 12345
 vwait forever



#	add telnet spawn here, and threads.
