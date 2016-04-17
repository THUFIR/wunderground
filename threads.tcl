package require Tcl 8.4
package require Expect 5.40
package require Thread





set num 1

# Make the thread pool
set pool [tpool::create -initcmd {
    #source myProcedures.tcl
}]

# Sent the work into the pool as distinct jobs
set job1 [tpool::post $pool [list startMyProc $num]]
set job2 [tpool::post $pool [list startMyProc $num]]

# Wait for all the jobs in the pool to finish
set waitingfor [list $job1 $job2]
while {[llength $waitingfor] > 0} {
    tpool::wait $pool $waitingfor waitingfor
}

# Get results now with tpool::get

# Dispose of the pool
tpool::release $pool




 proc accept {chan addr port} {
     puts "$addr:$port > [gets $chan]"
     puts $chan goodbye
     close $chan
 }
 socket -server accept 12345
 vwait forever



thread::create{
     puts "in thread [thread::id]"
}


#	add telnet spawn here, and threads.
