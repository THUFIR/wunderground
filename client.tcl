package require Tcl 8.4
package require Expect 5.40



puts -nonewline "> "


set connection(host) foo.com
set connection(port) 1234

while {1} {
    set chan [socket 127.0.0.1 12345]         ;# Open the connection
    flush stdout
    puts -nonewline "> "
    set input [gets stdin]
    flush stdout
    puts $chan $input
    flush $chan
    close $chan
    sleep 1
}



