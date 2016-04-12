package require Tcl 8.4
package require Expect 5.40
package require cmdline


while {1} {
    puts -nonewline "Enter your name: "
    flush stdout
    set name [gets stdin]    
    puts "Hello $name"
}
