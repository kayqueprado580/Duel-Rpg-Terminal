
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
			puts "jogador #{jogador} com #{monstro[:nome]}[#{monstro[:vida]} - vida] CONTRA o terrivel #{chefe[:nome]}[#{chefe[:vida]} - vida] "
		end

		def txt_turno_duelo_inicio(turno, monstro, chefe)
			# system "clear"
			puts "Turno: #{turno}° - #{monstro[:nome]}[#{monstro[:vida]}] VS #{chefe[:nome]}[#{chefe[:vida]}]"
		end

		def txt_turno_duelo_final(turno, monstro, chefe)
			puts "Próximo turno: #{turno}° - #{monstro[:nome]}[#{monstro[:vida]}] VS #{chefe[:nome]}[#{chefe[:vida]}]"
			puts "===================================================== \n\n\n"
		end

		def txt_chefe_atacou(chefe,ataqueEspecial=false)
			puts "O chefe #{chefe[:nome]}, atacou #{chefe[:dano][:normal]} de dano " unless ataqueEspecial
			puts "O chefe #{chefe[:nome]}, atacou #{chefe[:dano][:especial]} de dano POWWWW" if ataqueEspecial 
		end

		def txt_opcoes_duelo(ataqueEspecial=false)
			puts 'Você tem 3 opções, escolha com sabedoria!'
			puts "1 - Atacar | 2 - Correr | 3 - Nada" unless ataqueEspecial
			puts "1 - Atacar | 2 - Correr | 3 - Especial(Desbloqueado)" if ataqueEspecial 
		end

		def txt_monstro_atacou(monstro,ataqueEspecial=false)
			puts "Nosso aliado #{monstro[:nome]}, atacou #{monstro[:dano][:normal]} de dano" unless ataqueEspecial
			puts "Nosso aliado #{monstro[:nome]}, atacou #{monstro[:dano][:especial]} de dano Xabluuuu" if ataqueEspecial 
		end

		def txt_ganhou
			puts "você ganhou!!!"
		end

		def txt_perdeu
			puts "você perdeu!!!"
		end

		def txt_mostrou_medo(chefe)
			puts 'Você saiu correndo, isso demonstrou medo'
			puts "O #{chefe[:nome]} fica mais forte com seu medo..."
		end

		def txt_recupera_vida_chefe
			puts 'Ao fazer nada ele se aproveita para ganhar mais vida...'
		end
end