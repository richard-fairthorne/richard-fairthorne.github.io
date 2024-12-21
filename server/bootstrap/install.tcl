#!/usr/bin/expect

#Usage install <host>
set timeout 300

# Get host from command line
set host [lindex $argv 0]
if {$host == ""} {
    puts "Usage: $argv0 <host>"
    exit 1
}

# Read the ipxe.sh file content
set ipxe_content [read [open "ipxe.sh" r]]

# Connect via SSH
spawn ssh $host

send "\n"

foreach command [split $ipxe_content "\n"] {
	expect "iPXE> "
	set timeout 15
	foreach char [split $command ""] {
		send -- $char
		sleep 0.1
	}
    send "\n"
}

set timeout 600
expect "iPXE> "
puts "Done"