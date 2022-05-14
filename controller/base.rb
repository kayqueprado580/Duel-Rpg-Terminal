# frozen_string_literal: true

require './module/base/texto_module'
require './module/base/validacao_module'

class Base
  include Texto
  include Validacao

  def captura_input
    txt_digita
    input = gets
    input = input.chomp
  end

  def ultima_chance(opcao = false)
    txt_valor_invalido(false)

    valor_recebido = false
    if opcao
      txt_escolha_opcao
      valor_recebido = verifica_chance_opcoes(captura_input)
    else
      txt_pedir_nome
      valor_recebido = verifica_chance_input(captura_input)
    end
  end

  private

  def verifica_chance_opcoes(opcoes)
    if valida_opcoes(opcoes)
      txt_valor_invalido(true)
      return false
    end
    opcoes
  end

  def verifica_chance_input(input)
    if valida_input(input)
      txt_valor_invalido(true)
      return false
    end
    input
  end
end
