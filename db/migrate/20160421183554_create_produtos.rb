class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :tituloanuncio
      t.decimal :precoatacado
      t.decimal :precovarejo
      t.text :descricao
      t.integer :qtd_atacado
      t.references :categoriaproduto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
