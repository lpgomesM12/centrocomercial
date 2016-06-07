class Empresa < ActiveRecord::Base
  belongs_to :centroscomercial
  belongs_to :endereco, dependent: :destroy
  has_many :telefones, dependent: :destroy
  accepts_nested_attributes_for :endereco, allow_destroy: true
  accepts_nested_attributes_for :telefones, allow_destroy: true


  def self.busca_empresas(nomepagina)
  	pagina = nomepagina.downcase
    where.("lower(nomepagina)LIKE ?", "%#{pagina}%")
  end

end
