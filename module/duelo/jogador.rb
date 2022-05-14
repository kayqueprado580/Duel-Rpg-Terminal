# frozen_string_literal: true

require_relative 'dueloMod'

module Jogador
  include DueloModule
  def nda_jogador
    txt_recupera_vida_chefe
  end

  def corre_jogador(chefe_no_duelo)
    txt_mostrou_medo(chefe_no_duelo)
  end

  def ataque_jogador(chefe_no_duelo, monstro_no_duelo)
    chefe_no_duelo[:vida] = chefe_no_duelo[:vida] - monstro_no_duelo[:dano][:normal]
    txt_monstro_atacou(monstro_no_duelo, false)
    retornar_criaturas(chefe_no_duelo, monstro_no_duelo)
  end

  def ataque_jogador_especial(chefe_no_duelo, monstro_no_duelo)
    txt_monstro_atacou(monstro_no_duelo, true)
    chefe_no_duelo[:vida] = chefe_no_duelo[:vida] - monstro_no_duelo[:dano][:especial]
    retornar_criaturas(chefe_no_duelo, monstro_no_duelo)
  end
end
