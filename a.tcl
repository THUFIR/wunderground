package require Tcl 8.4
package require Expect 5.40
package require Thread 2.5




set sock 12345
set host 127.0.0.1


package require Tcl 8.4
package require Thread 2.5
if {$argc > 0} {
set port [lindex $argv 0]
} else {
set port 9001
}


proc ClientConnect {sock host port} {
# Create the client thread and transfer the channel
}



socket -server _ClientConnect $port
proc _ClientConnect {sock host port} {


}




proc ClientConnect {sock host port} {

after 0 [list ClientConnect $sock $host $port]


set thread [thread::create {
proc ReadLine {sock} {
if {[catch {gets $sock line} len] || [eof $sock]} {
catch {close $sock}
thread::release
} elseif {$len >= 0} {
EchoLine $sock $line
}
}
proc EchoLine {sock line} {
if {[string equal -nocase $line quit]} {
SendMessage $sock \
"Closing connection to Echo server"
catch {close $sock}
thread::release
} else {
SendMessage $sock $line
}
}
proc SendMessage {sock msg} {
if {[catch {puts $sock $msg} error]} {
puts stderr "Error writing to socket: $error"
catch {close $sock}
thread::release
}
}
# Enter the event loop
thread::wait
}]
