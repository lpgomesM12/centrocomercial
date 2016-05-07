class Produto < ActiveRecord::Base
  belongs_to :categoriaproduto
  belongs_to :empresa
  has_many :fotoproduto, dependent: :destroy
  accepts_nested_attributes_for :fotoproduto, allow_destroy: true, :reject_if => lambda { |t| t['imagem'].nil? }

end
