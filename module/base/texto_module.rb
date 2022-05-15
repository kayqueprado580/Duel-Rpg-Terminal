# frozen_string_literal: true
require 'rainbow/refinement'

module Texto
  using Rainbow
  def txt_digita
    print 'Insira aqui: '
  end

  def txt_pedir_nome
    puts 'Por favor, digite seu nome'.green
  end

  def txt_valor_invalido(flag)
    puts "\nValor invalido, ultima tentativa.".red unless flag
    puts "Valor invalido. \n Por favor, tente novamente mais tarde!".red if flag
  end

  def txt_finalizando
    sleep  1.2
    system  'clear'
    puts 'Finalizando a aplicação...'.red
  end

  def txt_finalizando_obrigado
    sleep  1.2
    system  'clear'
    puts 'Muito obrigado por jogar :)'.green
    txt_finalizando
  end

  def txt_apresenta_nivel
    sleep  0.5
    system  'clear'
    puts 'Aguarde...'
    sleep 0.9
    system 'clear'
    puts 'Para iniciar o duelo, escolha o chefe que deseja enfrentar'.green
  end

  def txt_apresenta_chefes(posicao, chefe)
    sleep  0.5
    puts "\n#{posicao} - O Terrivel #{chefe[:nome]}".green if posicao == 1
    puts "\n#{posicao} - O Maligno #{chefe[:nome]}".green if posicao == 2
    puts "\n#{posicao} - O Abominável #{chefe[:nome]}".green if posicao == 3
    puts "Com sua vida de #{chefe[:vida]} e seus ataques".green
    puts "#{chefe[:dano][:normal]} base e seu ataque especial #{chefe[:dano][:especial]}".green
  end

  def txt_escolha_chefe(chefes)
    puts "\n\nEai já decidiu, qual chefe escolherá ?".green
    puts "1 - #{chefes[0][:nome]} || 2 - #{chefes[1][:nome]} || 3 - #{chefes[2][:nome]}".green.bright.underline
  end

  def txt_apresenta_chefe_escolhido(nome_jogador, chefe)
    system  "clear"
    sleep  0.5
    puts "Se prepare #{nome_jogador}, essa luta não será facil.".green
    sleep  1.2
    puts "O Chefe #{chefe[:nome]} que irá enfretar já dizimou centenas de guerreiros".green
    sleep  0.5
    puts "Não deixe que ele solte seu poder especial que causará #{chefe[:dano][:especial]} de dano".green
    sleep  0.5
    puts 'Para combater as forças malignas, você poderá escolher 1 entre 3 monstros para lutar ao seu lado'.green
  end

  def txt_apresentar_monstros(posicao, monstro)
    sleep  0.5
    puts "\nO #{posicao}º, se chama #{monstro[:nome]} tem #{monstro[:vida]} de vida".green
    puts "Resistente a #{monstro[:resistencia]}".green
    puts "Seus ataques são: #{monstro[:dano][:normal]} normal e seu ataque especial #{monstro[:dano][:especial]}".green
    sleep  0.5
  end

  def txt_escolha_monstro(monstros)
    puts "\n\nEai já decidiu, qual monstro escolherá ?".green
    puts "1 - #{monstros[0][:nome]} || 2 - #{monstros[1][:nome]} || 3 - #{monstros[2][:nome]}".green.bright.underline
  end

  def txt_escolha_opcao
    puts 'Por favor, insira uma opcao válida...'.red
    puts '1, 2 ou 3'.red
  end

  def txt_escolha_opcao_sem_tres
    puts 'Opção 3 foi desabilitada...'.red
    puts 'Por favor, insira uma opcao válida...'.red
    puts '1, 2'.red
  end

  def txt_inicio_do_duelo(jogador, monstro, chefe)
    system  "clear"
    puts 'O Duelo começará...'.green
    sleep  0.9
    puts "jogador #{jogador} com #{monstro[:nome]}[#{monstro[:vida]} - vida] CONTRA o terrivel #{chefe[:nome]}[#{chefe[:vida]} - vida]".green
    sleep  1.5
  end

  def txt_duelo_inicio_turno(turno, monstro, chefe)
    sleep  0.5
    system  "clear"
    puts "\nTurno: #{turno}° - #{monstro[:nome]}[#{monstro[:vida]}] VS #{chefe[:nome]}[#{chefe[:vida]}] \n\n".green
    sleep  0.5
  end

  def txt_duelo_final_turno(turno, monstro, chefe)
    sleep  1.2
    puts "\nPróximo turno: #{turno}° - #{monstro[:nome]}[#{monstro[:vida]}] VS #{chefe[:nome]}[#{chefe[:vida]}]".green
    puts "===================================================== \n\n\n".green
    sleep  1.9
  end

  def txt_chefe_atacou(chefe, ataque_especial)
    sleep  0.9
    puts "- O chefe #{chefe[:nome]}, atacou #{chefe[:dano][:normal]} de dano".green  unless ataque_especial
    puts "- O chefe #{chefe[:nome]}, atacou #{chefe[:dano][:especial]} de dano POWWWW".green if ataque_especial
  end

  def txt_opcoes_duelo(ataque_especial)
    sleep  0.5
    puts 'Você tem 3 opções, escolha com sabedoria!'.green
    sleep  0.5
    puts '1 - Atacar | 2 - Correr | 3 - Nada'.green.bright.underline unless ataque_especial
    puts '1 - Atacar | 2 - Correr | 3 - Especial(Desbloqueado)'.green.bright.underline if ataque_especial
  end

  def txt_monstro_atacou(monstro, ataque_especial)
    sleep  0.5
    puts "- Nosso aliado #{monstro[:nome]}, atacou #{monstro[:dano][:normal]} de dano".green unless ataque_especial
    puts "- Nosso aliado #{monstro[:nome]}, atacou #{monstro[:dano][:especial]} de dano Xabluuuu".green if ataque_especial
  end

  def txt_mostrou_medo(chefe)
    sleep  0.5
    puts "\nVocê saiu correndo, isso demonstrou medo".green
    sleep  0.5
    puts "O #{chefe[:nome]} fica mais forte com seu medo...\n".green
  end

  def txt_recupera_vida_chefe
    sleep  0.5
    puts "\nAo fazer nada ele se aproveita para ganhar mais vida...\n".green
  end

  def txt_ganhou
    sleep  0.5
    puts "\n\n===================================================== ".green
    sleep  0.9
    puts ':):):):):):):):):) VOCÊ GANHOU :):):):):):):):):)'.green
    puts "===================================================== \n\n".green
  end

  def txt_perdeu
    sleep  0.5
    puts "\n\n===================================================== ".red
    sleep  0.9
    puts ':/:/:/:/:/:/:/:/ VOCÊ PERDEU :/:/:/:/:/:/:/:/'.red
    puts "===================================================== \n\n".red
  end

  def txt_continuar
    sleep  0.9
    puts "\n - Deseja continuar ?"
    sleep  0.5
    puts "\n - 1(Sim) ou 2(Não)"
  end
end
