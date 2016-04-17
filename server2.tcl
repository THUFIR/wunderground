package require Tcl 8.4
package require Expect 5.40
package require Thread



socket -server NewConnection 7777
proc NewConnection {channel peerhost peerport} {
    fconfigure $channel -buffering none
    set t [thread::create {
        proc HandleConnection {channel} {
            while {![eof $channel]} {
                if {[gets $channel line] < 0} {
                    continue
                }
                puts $channel $line
            }
            close $channel
            thread::exit
        }
        thread::wait
    }]
    after 0 [list HandOver $t $channel]
    return
}
proc HandOver {thread channel} {
    thread::transfer $thread $channel
    thread::send -async $thread [list HandleConnection $channel]
    return
}
vwait _dummy_variable_

