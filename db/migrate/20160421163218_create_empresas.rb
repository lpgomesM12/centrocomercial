class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nome
      t.string :cnpj
      t.references :centroscomercial, index: true, foreign_key: true
      t.string :informacao
      t.string :fraseempresa
      t.references :endereco, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
