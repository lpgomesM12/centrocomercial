require 'test_helper'

class CategoriaprodutosControllerTest < ActionController::TestCase
  setup do
    @categoriaproduto = categoriaprodutos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categoriaprodutos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categoriaproduto" do
    assert_difference('Categoriaproduto.count') do
      post :create, categoriaproduto: { descricao: @categoriaproduto.descricao, nome: @categoriaproduto.nome }
    end

    assert_redirected_to categoriaproduto_path(assigns(:categoriaproduto))
  end

  test "should show categoriaproduto" do
    get :show, id: @categoriaproduto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categoriaproduto
    assert_response :success
  end

  test "should update categoriaproduto" do
    patch :update, id: @categoriaproduto, categoriaproduto: { descricao: @categoriaproduto.descricao, nome: @categoriaproduto.nome }
    assert_redirected_to categoriaproduto_path(assigns(:categoriaproduto))
  end

  test "should destroy categoriaproduto" do
    assert_difference('Categoriaproduto.count', -1) do
      delete :destroy, id: @categoriaproduto
    end

    assert_redirected_to categoriaprodutos_path
  end
end
