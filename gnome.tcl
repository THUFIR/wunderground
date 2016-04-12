package require Tcl 8.4
package require Expect 5.40

spawn gnome-terminal

while {1} {
    puts -nonewline "Enter your name: "
    flush stdout
    set name [gets stdin]    
    puts "Hello $name"
}
