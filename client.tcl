package require Tcl 8.4
package require Expect 5.40


while {1} {
 set chan [socket 127.0.0.1 12345]         ;# Open the connection
 puts $chan hello                         ;# Send a string
 flush $chan                              ;# Flush the output buffer
 puts "10.0.0.2:12345 says [gets $chan]"  ;# Receive a string
 close $chan  
 sleep 1
}
