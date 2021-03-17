require 'test_helper'

class DevisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @devi = devis(:one)
  end

  test "should get index" do
    get devis_url
    assert_response :success
  end

  test "should get new" do
    get new_devi_url
    assert_response :success
  end

  test "should create devi" do
    assert_difference('Devi.count') do
      post devis_url, params: { devi: { adresse: @devi.adresse, decorateur: @devi.decorateur, email: @devi.email, nom: @devi.nom, numero: @devi.numero, prenom: @devi.prenom, telephone: @devi.telephone, user_id: @devi.user_id } }
    end

    assert_redirected_to devi_url(Devi.last)
  end

  test "should show devi" do
    get devi_url(@devi)
    assert_response :success
  end

  test "should get edit" do
    get edit_devi_url(@devi)
    assert_response :success
  end

  test "should update devi" do
    patch devi_url(@devi), params: { devi: { adresse: @devi.adresse, decorateur: @devi.decorateur, email: @devi.email, nom: @devi.nom, numero: @devi.numero, prenom: @devi.prenom, telephone: @devi.telephone, user_id: @devi.user_id } }
    assert_redirected_to devi_url(@devi)
  end

  test "should destroy devi" do
    assert_difference('Devi.count', -1) do
      delete devi_url(@devi)
    end

    assert_redirected_to devis_url
  end
end
