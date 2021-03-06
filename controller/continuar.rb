# frozen_string_literal: true

require_relative 'base'

class Continuar < Base

  def deseja_continuar
    txt_continuar
    opcao = captura_input
    if valida_opcoes(opcao)
      opcao = ultima_chance(1)
      unless opcao
        txt_finalizando
        return false
      end
    end
    return opcao_tres if opcao == '3'
    return opcao_dois if opcao == '2'
    true
  end

  private

  def opcao_dois
    txt_finalizando_obrigado
    false
  end

  def opcao_tres
    txt_finalizando
    false
  end
end
