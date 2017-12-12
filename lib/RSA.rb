require 'prime'

class RSA
	def initialize n, e, d
		@n = n
		@e = e
		@d = d
	end

	def n
		@n
	end

	def e
		@e
	end

	def d
		@d
	end

	def new_key
		arr = Prime.first rand(1..50)
		p = arr[-1]
		arr2 = Prime.first rand(1..50)
		q = arr2[-1]
		nNum = p*q
		ld = (q-1)*(p-1)
		eNum = rand(1..ld)


		while true
			for i in 2..ld do
				if eNum%i == 0 and ld%i == 0
					eNum = rand(1..ld)
					break
				end
			end
			break
		end


		for dNum in 1..ld do
			if ((eNum*i)-1)%ld == 0
				break
			end
		end
		
		array = [nNum,eNum,dNum]
		return array	
	end

	def encrypt message
		msg = String.new
		message.each_char do |c|
			m = (c.ord**e)%n
			msg << m.to_s
			msg << '-'
		end
		msg
	end

	def decrypt message
		msg = String.new
		message.split('-').each do |num|
			p ((num.to_i)**d)%n
		end
		msg
	end
end
