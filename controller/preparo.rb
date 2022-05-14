# frozen_string_literal: true

require_relative 'base'

class Preparo < Base
  attr_accessor :nome_jogador, :chefe_escolhido, :monstro_escolhido

  def personagem
    txt_pedir_nome
    jogador = captura_input

    if valida_input(jogador)
      jogador = ultima_chance
      unless jogador
        txt_finalizando
        return false
      end
    end

    @nome_jogador = jogador.capitalize
  end

  def chefe(opcoes_chefes)
    txt_apresenta_nivel
    opcoes_chefes.each_with_index do |chefe, key|
      posicao = key + 1
      txt_apresenta_chefes(posicao, chefe)
    end

    txt_escolha_chefe(opcoes_chefes)
    id_chefe_escolhido = opcao_escolhe(captura_input)
    return false unless id_chefe_escolhido

    @chefe_escolhido = opcoes_chefes[(id_chefe_escolhido.to_i - 1)]
  end

  def monstro(opcoes_monstros)
    txt_apresenta_chefe_escolhido(@nome_jogador, @chefe_escolhido)

    opcoes_monstros.each_with_index do |monstro, key|
      posicao = key + 1
      txt_apresentar_monstros(posicao, monstro)
    end

    txt_escolha_monstro(opcoes_monstros)
    id_monstro_escolhido = opcao_escolhe(captura_input)
    return false unless id_monstro_escolhido

    @monstro_escolhido = opcoes_monstros[(id_monstro_escolhido.to_i - 1)]
  end

  private

  def opcao_escolhe(id)
    if valida_opcoes(id)
      id = ultima_chance(true)
      unless id
        txt_finalizando
        return false
      end
    end
    id
  end
end
