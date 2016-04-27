class Produto < ActiveRecord::Base
  belongs_to :categoriaproduto

  has_many :fotoproduto, dependent: :destroy
  accepts_nested_attributes_for :fotoproduto, allow_destroy: true, :reject_if => lambda { |t| t['imagem'].nil? }

end
