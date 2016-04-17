package require Tcl 8.4
package require Expect 5.40

puts -nonewline "> "

set host foo.com
set port 1234

puts $host
puts $port

while {1} {
    set chan [socket 127.0.0.1 7777]
    flush stdout
    puts -nonewline "> "
    set input [gets stdin]
    flush stdout
    puts $chan $input
    flush $chan
    close $chan
    sleep 1
}



