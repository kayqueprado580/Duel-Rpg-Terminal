# frozen_string_literal: true

module Validacao
  def valida_input(input)
    true if input.nil? || input == ''
  end

  def valida_opcoes(opcoes)
    true if opcoes != '1' && opcoes != '2' && opcoes != '3'
  end
end
