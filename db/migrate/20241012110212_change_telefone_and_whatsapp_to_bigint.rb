class ChangeTelefoneAndWhatsappToBigint < ActiveRecord::Migration[7.2]
  def change
    change_column :contatos, :telefone, :bigint
    change_column :contatos, :whatsapp, :bigint
  end
end
