# frozen_string_literal: true

module DueloModule
  def retornar_criaturas(chefe_no_duelo, monstro_no_duelo)
    {
      monstro: monstro_no_duelo,
      chefe: chefe_no_duelo
    }
  end
end
