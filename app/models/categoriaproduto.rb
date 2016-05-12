class Categoriaproduto < ActiveRecord::Base
 attr_accessor :filhos

 has_many :children, :class_name => "Categoriaproduto", :foreign_key => "father_id"
 belongs_to :father, :class_name => "Categoriaproduto", :foreign_key => "father_id"

 def filhos
   @filhos
 end

 # setter
 def filhos=(val)
   @filhos = val
 end

end
