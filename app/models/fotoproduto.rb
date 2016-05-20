class Fotoproduto < ActiveRecord::Base
  belongs_to :produto

  has_attached_file :imagem, styles: { medium: "800x800>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :imagem, content_type: /\Aimage\/.*\Z/

end
