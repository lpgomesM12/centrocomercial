class CreateCategoriaprodutos < ActiveRecord::Migration
  def change
    create_table :categoriaprodutos do |t|
      t.string :nome
      t.string :descricao

      t.integer :father_id, :integer, :references => :categoriaprodutos 

      t.timestamps null: false
    end
  end
end
