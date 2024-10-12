module PagesHelper
  def formatar_valor(valor)
    valor.gsub("R$", "").gsub(".", "").gsub(",", "").strip.to_f / 100
  end
end
