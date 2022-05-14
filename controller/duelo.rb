require_relative 'base'

class Duelo < Base
  def initialize(chefe, monstro, jogador)
    @chefe_no_duelo = chefe
    @monstro_no_duelo = monstro
    @jogador = jogador
  end

  def duelo
    txt_inicio_do_duelo(@jogador, @monstro_no_duelo, @chefe_no_duelo)

    turno = 1
    turno_jogador = 0
    turno_chefe = 0
    proximo_ataque_jogador = false
    proximo_ataque_chefe = true

    loop do
      txt_turno_duelo_inicio(turno, @monstro_no_duelo, @chefe_no_duelo)

      if proximo_ataque_jogador
        # #CASO SEJA A VEZ DO JOGADOR ATACAR CÓDIGO ABAIXO
        turno_do_jogador(turno, turno_jogador)
        
        turno_jogador += 1
        proximo_ataque_jogador = false
        proximo_ataque_chefe = true

      else
        turno_chefe(turno, turno_chefe)

        proximo_ataque_jogador = true
        proximo_ataque_chefe = false
      end

      turno += 1

      if @monstro_no_duelo[:vida] <= 0
        txt_perdeu
        break
      end

      if @chefe_no_duelo[:vida] <= 0
        txt_ganhou
        break

      end

      txt_turno_duelo_final(turno, @monstro_no_duelo, @chefe_no_duelo)
    end
    true
  end

  private

  def turno_do_jogador(turno, turno_jogador)
    txt_opcoes_duelo if turno_jogador < 3
    txt_opcoes_duelo(true) if turno_jogador >= 3

    opcao = captura_input
    if valida_opcoes(opcao)
      opcao = ultima_chance(1)
      unless opcao
        txt_finalizando
        return false
      end
    end

    case opcao.to_i
    when 1
      ataque_jogador
    when 2
      corre_jogador
    when 3
      if turno_jogador >= 3
        ataque_jogador_especial
      else
        nda_jogador
      end
    end
  end

  def turno_chefe(turno, turno_chefe)
    usou_especial = false
        if turno >= 2
          if pode_usar_especial_chefe && !usou_especial
            ataque_especial_chefe
            usou_especial = true
          end
          usa_cura = false
          turno_chefe += 1
          if turno_chefe >= 3 && !usa_cura
            chefe_ganha_vida
            usa_cura = true
          end
        end

    ataque_normal_chefe unless usou_especial
  end

  def nda_jogador
    txt_recupera_vida_chefe
    chefe_ganha_vida
  end

  def corre_jogador
    txt_mostrou_medo(@chefe_no_duelo)
    chefe_ganha_dano
  end

  def chefe_ganha_vida
    @chefe_no_duelo[:vida] = @chefe_no_duelo[:vida] + 20
  end

  def chefe_ganha_dano
    @chefe_no_duelo[:dano][:normal] = @chefe_no_duelo[:dano][:normal] + 10
    @chefe_no_duelo[:dano][:especial] = @chefe_no_duelo[:dano][:especial] + 10
  end

  def ataque_jogador
    @chefe_no_duelo[:vida] = @chefe_no_duelo[:vida] - @monstro_no_duelo[:dano][:normal]
    txt_monstro_atacou(@monstro_no_duelo)
  end

  def ataque_jogador_especial
    @chefe_no_duelo[:vida] = @chefe_no_duelo[:vida] - @monstro_no_duelo[:dano][:especial]
    txt_monstro_atacou(@monstro_no_duelo, true)
  end

  def ataque_normal_chefe
    @monstro_no_duelo[:vida] = @monstro_no_duelo[:vida] - @chefe_no_duelo[:dano][:normal]
    txt_chefe_atacou(@chefe_no_duelo)
  end

  def ataque_especial_chefe
    @monstro_no_duelo[:vida] = @monstro_no_duelo[:vida] - @chefe_no_duelo[:dano][:especial]
    txt_chefe_atacou(@chefe_no_duelo, true)
  end

  def pode_usar_especial_chefe
    rand = rand(1...10)
    return true if rand.to_i == 5
  end
end
