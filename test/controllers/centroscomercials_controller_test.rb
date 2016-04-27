require 'test_helper'

class CentroscomercialsControllerTest < ActionController::TestCase
  setup do
    @centroscomercial = centroscomercials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:centroscomercials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create centroscomercial" do
    assert_difference('Centroscomercial.count') do
      post :create, centroscomercial: { cidade_id: @centroscomercial.cidade_id, nome: @centroscomercial.nome }
    end

    assert_redirected_to centroscomercial_path(assigns(:centroscomercial))
  end

  test "should show centroscomercial" do
    get :show, id: @centroscomercial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @centroscomercial
    assert_response :success
  end

  test "should update centroscomercial" do
    patch :update, id: @centroscomercial, centroscomercial: { cidade_id: @centroscomercial.cidade_id, nome: @centroscomercial.nome }
    assert_redirected_to centroscomercial_path(assigns(:centroscomercial))
  end

  test "should destroy centroscomercial" do
    assert_difference('Centroscomercial.count', -1) do
      delete :destroy, id: @centroscomercial
    end

    assert_redirected_to centroscomercials_path
  end
end
