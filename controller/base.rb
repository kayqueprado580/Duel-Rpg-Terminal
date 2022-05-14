require './module/texto_module'
require './module/validacao_module'

class Base
  include Texto
  include Validacao

  def captura_input
    input = gets
    input = input.chomp
  end

  def ultima_chance(chanceOpcao = false)
    txt_valor_invalido
    txt_pedir_nome unless chanceOpcao
    txt_escolha_opcao if chanceOpcao
    input = captura_input

    if chanceOpcao
      if valida_opcoes(input)
        txt_valor_invalido(true)
        return false
      end
      input
    else
      if valida_input(input)
        txt_valor_invalido(true)
        return false
      end
      input
    end
  end
end
