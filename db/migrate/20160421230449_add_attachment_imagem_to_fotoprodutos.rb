class AddAttachmentImagemToFotoprodutos < ActiveRecord::Migration
  def self.up
    change_table :fotoprodutos do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :fotoprodutos, :imagem
  end
end
