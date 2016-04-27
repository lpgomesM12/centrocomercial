class CreateCentroscomercials < ActiveRecord::Migration
  def change
    create_table :centroscomercials do |t|
      t.string :nome
      t.references :cidade, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
