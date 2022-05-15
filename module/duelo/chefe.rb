# frozen_string_literal: true

require_relative 'duelo'

module Chefe
  include Modulo::Duelo
  def chefe_ganha_vida(chefe_no_duelo, monstro_no_duelo)
    chefe_no_duelo[:vida] = chefe_no_duelo[:vida] + 20
    retornar_criaturas(chefe_no_duelo, monstro_no_duelo)
  end

  def chefe_ganha_dano(chefe_no_duelo, monstro_no_duelo)
    chefe_no_duelo[:dano][:normal] = chefe_no_duelo[:dano][:normal] + 10
    chefe_no_duelo[:dano][:especial] = chefe_no_duelo[:dano][:especial] + 10
    retornar_criaturas(chefe_no_duelo, monstro_no_duelo)
  end

  def ataque_normal_chefe(chefe_no_duelo, monstro_no_duelo)
    txt_chefe_atacou(chefe_no_duelo, false)
    monstro_no_duelo[:vida] = monstro_no_duelo[:vida] - chefe_no_duelo[:dano][:normal]
    retornar_criaturas(chefe_no_duelo, monstro_no_duelo)
  end

  def ataque_especial_chefe(chefe_no_duelo, monstro_no_duelo)
    txt_chefe_atacou(chefe_no_duelo, true)
    monstro_no_duelo[:vida] = monstro_no_duelo[:vida] - chefe_no_duelo[:dano][:especial]
    retornar_criaturas(chefe_no_duelo, monstro_no_duelo)
  end

  def pode_usar_especial_chefe
    rand = rand(1...10)
    return true if rand.to_i == 5
  end
end
