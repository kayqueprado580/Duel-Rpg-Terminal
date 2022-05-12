require_relative './module/texto_module'
require './module/validacao_module'

require './model/chefe'
require './model/monstros'

class Duelo
	include Texto
	include Validacao
    def initialize(chefe, monstros)
			@chefe = chefe
			@monstros = monstros
			preparar_personagem
    end

		def preparar_personagem
			txt_pedir_nome
			jogador = captura_input
			
			if valida_input(jogador)
				jogador = ultima_chance
				unless jogador
					return txt_finalizando
				end
			end

			@jogador = jogador.capitalize
			
			txt_apresentar_game(@jogador, @chefe)
			
			@monstros.each_with_index { |monstro, key|
				posicao = key + 1
				txt_apresentar_monstros(posicao, monstro)
			}

			txt_escolha_monstro(@monstros)
			monstro = captura_input
			
			if valida_opcoes(monstro)
				monstro = ultima_chance(1)
				unless monstro
					return txt_finalizando
				end
			end

			@monstro = @monstros[(monstro.to_i-1)]
			duelo
		end

		def duelo
			## TO DO 
			# Após o 5° turno caso o chefe esteja com menos de 10% de vida terá uma cura de 10%, essa checagem terá intervalo de cada 3 turnos
			# será assim até o final. 
			# estilizar se ganhou ou perdeu
			# fazer um novo metodo onde você pode tentar duelar de novo
			# no novo metodo caso deseja lutar novamente perguntará se seŕa o mesmo monstro ou se será outro
			# no novo metodo caso ele decida sair do game, aplicação se encerra.
			txt_inicio_do_duelo(@jogador, @monstro, @chefe)

			@monstro_no_duelo = @monstro
			@chefe_no_duelo = @chefe
			turno = 1
			turno_jogador = 0
			proximo_ataque_jogador = false
			proximo_ataque_chefe = true

			loop do
				txt_turno_duelo_inicio(turno, @monstro_no_duelo, @chefe_no_duelo)

				if proximo_ataque_jogador
					##CASO SEJA A VEZ DO JOGADOR ATACAR CÓDIGO ABAIXO

					txt_opcoes_duelo if turno_jogador < 3
					txt_opcoes_duelo(true) if turno_jogador >= 3
						
					opcao = captura_input
					if valida_opcoes(opcao)
						opcao = ultima_chance(1)
						unless opcao
							return txt_finalizando
						end
					end

					case opcao.to_i
					when 1
						ataque_jogador
					when 2
						corre_jogador
					when 3
						if turno_jogador >= 3
							ataque_jogador_especial
						else
							nda_jogador
						end
					end

					turno_jogador = turno_jogador + 1
					proximo_ataque_jogador = false
					proximo_ataque_chefe = true

				else
					##CASO SEJA A VEZ DO CHEFE ATACAR CÓDIGO ABAIXO
					usou_especial = false
					if turno >= 2
						if pode_usar_especial_chefe && !usou_especial
							ataque_especial_chefe
							usou_especial = true
						end
					end
						
					ataque_normal_chefe unless usou_especial
					
					proximo_ataque_jogador = true
					proximo_ataque_chefe = false
				end

				turno = turno +1
				
				if @monstro_no_duelo[:vida] <= 0
					txt_perdeu
					break
				end
				
				if @chefe_no_duelo[:vida] <= 0
					txt_ganhou
					break
				end

				txt_turno_duelo_final(turno, @monstro_no_duelo, @chefe_no_duelo)
			end

		end

		def ultima_chance(chanceOpcao=false)
			txt_valor_invalido
			txt_pedir_nome unless chanceOpcao
			txt_escolha_opcao if chanceOpcao
			input = captura_input

			if chanceOpcao
				if valida_opcoes(input)
					txt_valor_invalido(true)
					return false
				end
				input
			else
				if valida_input(input)
					txt_valor_invalido(true)
					return false
				end
				input
			end
		end

		private

		def nda_jogador
			txt_recupera_vida_chefe
			chefe_ganha_vida
		end

		def corre_jogador
			txt_mostrou_medo(@chefe_no_duelo)
			chefe_ganha_dano
		end

		def chefe_ganha_vida
			@chefe_no_duelo[:vida] = @chefe_no_duelo[:vida] + 20
		end

		def chefe_ganha_dano
			@chefe_no_duelo[:dano][:normal] = @chefe_no_duelo[:dano][:normal] + 10
			@chefe_no_duelo[:dano][:especial] = @chefe_no_duelo[:dano][:especial] + 10
		end
		
		def ataque_jogador
			@chefe_no_duelo[:vida] =  @chefe_no_duelo[:vida] - @monstro_no_duelo[:dano][:normal]
			txt_monstro_atacou(@monstro_no_duelo)
		end
		
		def ataque_jogador_especial
			@chefe_no_duelo[:vida] =  @chefe_no_duelo[:vida] - @monstro_no_duelo[:dano][:especial]
			txt_monstro_atacou(@monstro_no_duelo, true)
		end

		def ataque_normal_chefe
			@monstro_no_duelo[:vida] =  @monstro_no_duelo[:vida] - @chefe_no_duelo[:dano][:normal]
			txt_chefe_atacou(@chefe_no_duelo)
		end

		def ataque_especial_chefe
			@monstro_no_duelo[:vida] =  @monstro_no_duelo[:vida] - @chefe_no_duelo[:dano][:especial]
			txt_chefe_atacou(@chefe_no_duelo,true)
		end

		def pode_usar_especial_chefe
			rand = rand(1...PORCENTAGEM.to_i)
			return true if rand.to_i == 5
		end

		def captura_input
			input = gets
			input = input.chomp
		end
end
puts 'Bem vindo ao Duelo'
Duelo.new(CHEFE, MONSTROS)