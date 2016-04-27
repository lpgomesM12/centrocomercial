class Categoriaproduto < ActiveRecord::Base
	  has_many :children, :class_name => "Categoriaproduto", :foreign_key => "father_id"
      belongs_to :father, :class_name => "Categoriaproduto", :foreign_key => "father_id"

end
