class AddCetrocomercialToCategoriaproduto < ActiveRecord::Migration
  def change
    add_reference :categoriaprodutos, :centroscomercial, index: true, foreign_key: true
  end
end
