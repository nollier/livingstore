require 'test_helper'

class ProduitsControllerTest < ActionController::TestCase
  setup do
    @devi = devis(:one)
    @produit = produits(:one)
  end

  test "should get index" do
    get :index, params: { devi_id: @devi }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { devi_id: @devi }
    assert_response :success
  end

  test "should create produit" do
    assert_difference('Produit.count') do
      post :create, params: { devi_id: @devi, produit: @produit.attributes }
    end

    assert_redirected_to devi_produit_path(@devi, Produit.last)
  end

  test "should show produit" do
    get :show, params: { devi_id: @devi, id: @produit }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { devi_id: @devi, id: @produit }
    assert_response :success
  end

  test "should update produit" do
    put :update, params: { devi_id: @devi, id: @produit, produit: @produit.attributes }
    assert_redirected_to devi_produit_path(@devi, Produit.last)
  end

  test "should destroy produit" do
    assert_difference('Produit.count', -1) do
      delete :destroy, params: { devi_id: @devi, id: @produit }
    end

    assert_redirected_to devi_produits_path(@devi)
  end
end
