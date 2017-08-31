require 'socket'


def p_open host, port
	socket = Socket.new(:INET, :STREAM)

	raw = Socket.sockaddr_in(port, host)

	puts "#{port} - open" if socket.connect(raw)

 rescue(Errno::ECONNREFUSED)
 rescue(Errno::ETIMEDOUT)

 	if socket != nil
 		puts "host down!"
 		socket.close
 	end
end

def main host, pstart, pend
	until pstart == pend do 
		p_open(host, pstart)
		pstart += 1
	end
end

main ARGV[0], ARGV[1].to_i, ARGV[2].to_i

