class CreatePages < ActiveRecord::Migration[7.2]
  def change
    create_table :pages do |t|
      t.decimal :valor, precision: 10, scale: 2
      t.timestamps
    end
  end
end
