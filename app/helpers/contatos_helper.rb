module ContatosHelper
  def formata_hora(datetime)
    datetime.strftime("%H:%M")
  end

  def formata_telefone(telefone)
    telefone=telefone.to_s
    if telefone.size == 11
      formatado = "(#{telefone[0..1]}) #{telefone[2]} #{telefone[3..6]} #{telefone[7..10]}"
    else
      formatado = "(#{telefone[0..1]}) #{telefone[2..5]} #{telefone[6..9]}"
    end
  
    formatado
  end
end
