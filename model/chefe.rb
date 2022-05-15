module Model
  module Chefe
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
  end
end