package require Tcl 8.4
package require Expect 5.40




while {1} {
    set chan [socket 127.0.0.1 12345]         ;# Open the connection
    puts -nonewline "Enter your name: "
    set name [gets stdin]
    flush stdout
    puts $chan $name
    flush $chan
    close $chan
    sleep 1
}



while {1} {
 set chan [socket 127.0.0.1 12345]         ;# Open the connection
 puts $chan hello                         ;# Send a string
 flush $chan                              ;# Flush the output buffer
 puts "server says [gets $chan]"  ;# Receive a string
 close $chan  
 sleep 1
}
