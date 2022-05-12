
module Texto
		def txt_pedir_nome
			puts 'Por favor, digite seu nome:'
		end

		def txt_valor_invalido(flag = false)
			puts 'Valor invalido, ultima tentativa.' unless flag
			puts "Valor invalido. \n Por favor, tente novamente mais tarde!" if flag
		end

		def txt_finalizando
			puts 'Finalizando a aplicação...'
		end

		def txt_apresentar_game(jogador, chefe)
			system "clear"
			# sleep 0.5
			puts "Se prepare #{jogador}, essa luta não será facil."
			# sleep 0.5
			puts "O Chefe #{chefe[:nome]} que irá enfretar já dizimou centenas de guerreiros"
			# sleep 0.5
			puts "Não deixe que ele solte seu poder especial que causará #{chefe[:dano][:especial]} de dano"
			# sleep 0.5
			puts 'Para combater as forças malignas, você poderá escolher 1 entre 3 monstros para lutar ao seu lado'
		end

		def txt_apresentar_monstros(posicao, monstro)
			puts "O #{posicao}º, se chama #{monstro[:nome]} tem #{monstro[:vida]} de vida"
			puts "Resistente a #{monstro[:resistencia]}"
			puts "Seus ataques são: #{monstro[:dano][:normal]} normal e seu ataque especial #{monstro[:dano][:especial]}"
		end

		def txt_escolha_monstro(monstros)
			puts "Eai já decidiu, qual monstro escolherá ?"
			puts "1 - #{monstros[0][:nome]} || 2 - #{monstros[1][:nome]} || 3 - #{monstros[2][:nome]}"
		end

		def txt_escolha_opcao
			puts "Por favor, insira uma opcao válida..."
			puts "1, 2 ou 3"
		end

		def txt_inicio_do_duelo(jogador, monstro, chefe)
			system "clear"
			puts 'O Duelo começará...'
			puts "jogador #{jogador} com #{monstro[:nome]} contra o terrivel #{chefe[:nome]}"
		end
end