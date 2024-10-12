class CreateContatos < ActiveRecord::Migration[7.2]
  def change
    create_table :contatos do |t|
      t.string :nome
      t.string :email
      t.integer :telefone
      t.integer :whatsapp
      t.time :horario_preferencial

      t.timestamps
    end
  end
end
