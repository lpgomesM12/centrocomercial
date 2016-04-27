class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.string :endereco
      t.string :numero
      t.string :cep
      t.string :complemento
      t.references :cidade, index: true, foreign_key: true
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
end
