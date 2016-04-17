package require Tcl 8.4
package require Expect 5.40




 proc accept {chan addr port} {           ;# Make a proc to accept connections
     puts "$addr:$port > [gets $chan]" ;# Receive a string
     puts $chan goodbye                   ;# Send a string
     close $chan                          ;# Close the socket (automatically flushes)
 }                                        ;#
 socket -server accept 12345              ;# Create a server socket
 vwait forever                            ;# Enter the event loop



#	add telnet spawn here, and threads.
