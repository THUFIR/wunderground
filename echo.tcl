package require Tcl 8.4
package require Thread 2.5
if {$argc > 0} {
set port [lindex $argv 0]
} else {
set port 9001
}



socket -server _ClientConnect $port

proc _ClientConnect {sock host port} {

after 0 [list ClientConnect $sock $host $port]

}






proc ClientConnect {sock host port} {

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


thread::wait
}]




thread::detach $sock


thread::send -async $thread [list set sock $sock]


thread::send -async $thread {
thread::attach $sock
fconfigure $sock -buffering line -blocking 0
fileevent $sock readable [list ReadLine $sock]
SendMessage $sock "Connected to Echo server"
}

}


vwait forever
