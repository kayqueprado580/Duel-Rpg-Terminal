module Validacao
		def valida_input(input)
			true if input.nil? || input == ""
		end 

		def valida_opcoes(input)
			true if input != '1' && input != '2' && input != '3'
		end
end