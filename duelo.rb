require './module/texto_module'
require './module/validacao_module'

require './model/chefe'
require './model/monstros'

class Duelo
	include Texto
	include Validacao
    def initialize(chefe, monstros)
			@chefe = chefe
			@monstros = monstros
			puts 'Bem vindo ao Duelo'
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
			txt_inicio_do_duelo(@jogador, @monstro, @chefe)

			## TO DO 
			# Incluir status de vida
			# Iniciar o processo de turnos, fazer um enquanto vida do chefe ou personagem estiverem maior que zero
			# O Chefe atacará primeiro
			# Sistema de opções para jogador
			# 1 - Corre, 2 - Atacar, 3 - Nada
			# após o primeiro turno do jogador, o CHEFE terá uma possibilidade de 10% de chance de utilizar especial
			# boss atck
			# 2° turno player (repete o primeiro)
			# Após o 3° turno do jogador a opção 3, de "nada" mudará para ataque especial do monstro escolhido.
			# Após o 5° turno caso o chefe esteja com menos de 10% de vida terá uma cura de 10%, essa checagem terá intervalo de cada 3 turnos
			# será assim até o final. 
			# caso chefe ganhar metodo perdeu
			# caso o jogador ganhar metodo ganhou
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

		def captura_input
			input = gets
			input = input.chomp
		end
end

Duelo.new(CHEFE, MONSTROS)