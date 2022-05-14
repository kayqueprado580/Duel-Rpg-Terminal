require './controller/preparo'
require './controller/duelo'
require './controller/continuar'

require './model/chefe'
require './model/monstros'

puts 'Bem vindo ao Duelo'

preparar = Preparo.new(CHEFE, MONSTROS)
return unless preparar.preparar_personagem
jogador = preparar.jogador
return unless preparar.preparar_monstro

confronto = Duelo.new(CHEFE, MONSTROS[(preparar.monstro_escolhido.to_i - 1)], jogador)
return unless confronto.duelo


##TO DO 
# Fazer as variaveis constante, utilizando freeze, em duelo ela não pode mudar as variaveis CHEFE e MONSTROS
# continuar o código de continue
# trabalhar em alguma forma de restart e assim reiniciar o game quantas vezes quiser.
# melhorar visibilidade textual
# votlar sleep
# utilizar da limpeza do terminal em momentos estrátegicos 


# código rascunho
# return unless Continuar.new
# return unless preparar.preparar_monstro
# monstro_no_duelo = MONSTROS[(preparar.monstro_escolhido.to_i - 1)]
# chefe_no_duelo = CHEFE
# confronto = Duelo.new(CHEFE, MONSTROS[(preparar.monstro_escolhido.to_i - 1)], jogador)
# return unless confronto.duelo
