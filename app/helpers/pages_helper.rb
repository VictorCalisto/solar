module PagesHelper
  def formatar_valor(valor)
    valor.gsub("R$", "").gsub(".", "").gsub(",", "").strip.to_f / 100
  end

  def formatar_numero(numero)
    numero_formatado = numero.to_s.gsub('.', ',')
    partes = numero_formatado.split(',')
    partes[0] = partes[0].gsub(/(\d)(?=(\d{3})+(?!\d))/, '\\1.')
    partes.join(',')
  end
end
