class CreatePages < ActiveRecord::Migration[7.2]
  def change
    create_table :pages do |t|
      t.timestamps
    end
  end
end
