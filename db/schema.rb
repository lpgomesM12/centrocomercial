# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160606175808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categoriaprodutos", force: :cascade do |t|
    t.string   "nome"
    t.string   "descricao"
    t.integer  "father_id"
    t.integer  "integer"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "centroscomercial_id"
  end

  add_index "categoriaprodutos", ["centroscomercial_id"], name: "index_categoriaprodutos_on_centroscomercial_id", using: :btree

  create_table "centroscomercials", force: :cascade do |t|
    t.string   "nome"
    t.integer  "cidade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "centroscomercials", ["cidade_id"], name: "index_centroscomercials_on_cidade_id", using: :btree

  create_table "cidades", force: :cascade do |t|
    t.string   "nome_cidade"
    t.string   "sigl_estado"
    t.boolean  "flag_ativo"
    t.integer  "estado_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id", using: :btree

  create_table "empresas", force: :cascade do |t|
    t.string   "nome"
    t.string   "cnpj"
    t.integer  "centroscomercial_id"
    t.string   "informacao"
    t.string   "fraseempresa"
    t.integer  "endereco_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "nomepagina"
  end

  add_index "empresas", ["centroscomercial_id"], name: "index_empresas_on_centroscomercial_id", using: :btree
  add_index "empresas", ["endereco_id"], name: "index_empresas_on_endereco_id", using: :btree

  create_table "enderecos", force: :cascade do |t|
    t.string   "endereco"
    t.string   "numero"
    t.string   "cep"
    t.string   "complemento"
    t.integer  "cidade_id"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "enderecos", ["cidade_id"], name: "index_enderecos_on_cidade_id", using: :btree

  create_table "estados", force: :cascade do |t|
    t.string   "nome_estado"
    t.string   "sigl_estado"
    t.boolean  "flag_ativo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "fotoprodutos", force: :cascade do |t|
    t.integer  "produto_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
  end

  add_index "fotoprodutos", ["produto_id"], name: "index_fotoprodutos_on_produto_id", using: :btree

  create_table "produtos", force: :cascade do |t|
    t.string   "nome"
    t.string   "tituloanuncio"
    t.decimal  "precoatacado"
    t.decimal  "precovarejo"
    t.text     "descricao"
    t.integer  "qtd_atacado"
    t.integer  "categoriaproduto_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "empresa_id"
    t.integer  "user_id"
  end

  add_index "produtos", ["categoriaproduto_id"], name: "index_produtos_on_categoriaproduto_id", using: :btree
  add_index "produtos", ["empresa_id"], name: "index_produtos_on_empresa_id", using: :btree
  add_index "produtos", ["user_id"], name: "index_produtos_on_user_id", using: :btree

  create_table "telefones", force: :cascade do |t|
    t.string   "numero"
    t.string   "tipo"
    t.integer  "empresa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "telefones", ["empresa_id"], name: "index_telefones_on_empresa_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nome"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "empresa_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["empresa_id"], name: "index_users_on_empresa_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "categoriaprodutos", "centroscomercials"
  add_foreign_key "centroscomercials", "cidades"
  add_foreign_key "cidades", "estados"
  add_foreign_key "empresas", "centroscomercials"
  add_foreign_key "empresas", "enderecos"
  add_foreign_key "enderecos", "cidades"
  add_foreign_key "fotoprodutos", "produtos"
  add_foreign_key "produtos", "categoriaprodutos"
  add_foreign_key "produtos", "empresas"
  add_foreign_key "produtos", "users"
  add_foreign_key "telefones", "empresas"
  add_foreign_key "users", "empresas"
end
