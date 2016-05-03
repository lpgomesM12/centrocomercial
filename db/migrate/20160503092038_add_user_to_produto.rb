class AddUserToProduto < ActiveRecord::Migration
  def change
    add_reference :produtos, :user, index: true, foreign_key: true
  end
end
