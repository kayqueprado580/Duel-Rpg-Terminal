# frozen_string_literal: true

require_relative 'base'

require './module/duelo/chefe'
require './module/duelo/jogador'

require './model/chefe'
require './model/monstro'

class Duelo < Base
  include Model::Monstro
  include Model::Chefe
  include Chefe
  include Jogador

  def duelo(chefe, monstro, jogador)
    chefe_no_duelo = captura_chefe_duelo(chefe)
    monstro_no_duelo = captura_monstro_duelo(monstro)
    jogador_no_duelo = jogador

    turno = 1
    proximo_ataque_jogador = false
    proximo_ataque_chefe = true

    txt_inicio_do_duelo(jogador_no_duelo, monstro_no_duelo, chefe_no_duelo)
    loop do
      txt_duelo_inicio_turno(turno, monstro_no_duelo, chefe_no_duelo)

      if proximo_ataque_jogador
        ok = turno_jogador(turno, chefe_no_duelo, monstro_no_duelo)
        return false unless ok

        proximo_ataque_jogador = false if ok
        proximo_ataque_chefe = true if ok
      else
        turno_chefe(turno, chefe_no_duelo, monstro_no_duelo)
        proximo_ataque_jogador = true
        proximo_ataque_chefe = false
      end

      turno += 1

      txt_perdeu if monstro_no_duelo[:vida] <= 0
      break if monstro_no_duelo[:vida] <= 0

      txt_ganhou if chefe_no_duelo[:vida] <= 0
      break if chefe_no_duelo[:vida] <= 0

      txt_duelo_final_turno(turno, monstro_no_duelo, chefe_no_duelo)
    end
    true
  end

  private

  def turno_jogador(turno, chefe_no_duelo, monstro_no_duelo)
    desbloqueia_especial = 5
    txt_opcoes_duelo(false) if turno < desbloqueia_especial
    txt_opcoes_duelo(true) if turno >= desbloqueia_especial

    opcao = captura_input
    if valida_opcoes(opcao)
      opcao = ultima_chance(true)
      unless opcao
        txt_finalizando
        return false
      end
    end
    opcoes_jogador(opcao, turno, chefe_no_duelo, monstro_no_duelo, desbloqueia_especial) if opcao
  end

  def opcoes_jogador(opcao, turno, chefe_no_duelo, monstro_no_duelo, desbloqueia_especial)
    case opcao.to_i
    when 1
      hash_retorno = ataque_jogador(chefe_no_duelo, monstro_no_duelo)
    when 2
      corre_jogador(chefe_no_duelo)
      hash_retorno = chefe_ganha_dano(chefe_no_duelo, monstro_no_duelo)
    when 3
      if turno >= desbloqueia_especial
        hash_retorno = ataque_jogador_especial(chefe_no_duelo, monstro_no_duelo)
      else
        nda_jogador
        hash_retorno = chefe_ganha_vida(chefe_no_duelo, monstro_no_duelo)
      end
    end
    hash_retorno
  end

  def turno_chefe(turno, chefe_no_duelo, monstro_no_duelo)
    usou_especial = false
    if turno >= 3
      if pode_usar_especial_chefe && !usou_especial
        hash_retorno = ataque_especial_chefe(chefe_no_duelo, monstro_no_duelo)
        usou_especial = true
      end
      usa_cura = false
      if turno >= 4 && !usa_cura
        hash_retorno = chefe_ganha_vida(chefe_no_duelo, monstro_no_duelo)
        usa_cura = true
      end
    end
    hash_retorno = ataque_normal_chefe(chefe_no_duelo, monstro_no_duelo) unless usou_especial
    hash_retorno
  end
end
