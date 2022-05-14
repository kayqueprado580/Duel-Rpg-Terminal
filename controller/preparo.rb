require_relative 'base'

class Preparo < Base
  attr_accessor :jogador, :monstro_escolhido

  def initialize(chefe, monstros)
    @chefe = chefe
    @monstros = monstros
  end

  def preparar_personagem
    txt_pedir_nome
    jogador = captura_input

    if valida_input(jogador)
      jogador = ultima_chance
      unless jogador
        txt_finalizando
        return false
      end
    end

    @jogador = jogador.capitalize
  end

  def preparar_monstro
    txt_apresentar_game(@jogador, @chefe)

    @monstros.each_with_index do |monstro, key|
      posicao = key + 1
      txt_apresentar_monstros(posicao, monstro)
    end

    txt_escolha_monstro(@monstros)
    monstro_escolhido = captura_input

    if valida_opcoes(monstro_escolhido)
      monstro_escolhido = ultima_chance(1)
      unless monstro_escolhido
        txt_finalizando
        return false
      end
    end

    @monstro_escolhido = monstro_escolhido
  end
end
