module Model
  module Monstro
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
end