class AddEmpresaToProduto < ActiveRecord::Migration
  def change
    add_reference :produtos, :empresa, index: true, foreign_key: true
  end
end
