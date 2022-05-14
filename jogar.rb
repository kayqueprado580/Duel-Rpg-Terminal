# frozen_string_literal: true

require './controller/preparo'
require './controller/duelo'
require './controller/continuar'

require './model/chefes'
require './model/monstros'

duelo = 1

loop do
	puts 'Bem vindo ao Duelo'

	preparar = Preparo.new
	break unless preparar.personagem
	break unless preparar.chefe(CHEFES)
	break unless preparar.monstro(MONSTROS)

	confronto = Duelo.new
	break unless confronto.duelo(
		preparar.chefe_escolhido, 
		preparar.monstro_escolhido, 
		preparar.nome_jogador
	)

	continue = Continuar.new 
	break unless continue.deseja_continuar

	duelo += 1
end