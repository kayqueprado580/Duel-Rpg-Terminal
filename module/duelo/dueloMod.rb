# frozen_string_literal: true

module DueloModule
  def retornar_criaturas(chefe_no_duelo, monstro_no_duelo)
    {
      monstro: monstro_no_duelo,
      chefe: chefe_no_duelo
    }
  end

  def captura_chefe_duelo(chefe)
    chefe_no_duelo = {
      :nome => chefe[:nome],
      :vida => chefe[:vida],
      :dano => {
        :normal => chefe[:dano][:normal],
        :especial => chefe[:dano][:especial]
      }
    }
  end

  def captura_monstro_duelo(monstro)
    monstro_no_duelo = {
      :nome => monstro[:nome],
      :resistencia => monstro[:resistencia],
      :vida => monstro[:vida],
      :dano => {
        :normal => monstro[:dano][:normal],
        :especial => monstro[:dano][:especial]
      }
    }
  end
end
