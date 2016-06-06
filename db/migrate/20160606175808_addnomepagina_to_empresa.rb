class AddnomepaginaToEmpresa < ActiveRecord::Migration
  def change
  	add_column :empresas, :nomepagina, :string
  end
end
