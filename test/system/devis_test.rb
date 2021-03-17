require "application_system_test_case"

class DevisTest < ApplicationSystemTestCase
  setup do
    @devi = devis(:one)
  end

  test "visiting the index" do
    visit devis_url
    assert_selector "h1", text: "Devis"
  end

  test "creating a Devi" do
    visit devis_url
    click_on "New Devi"

    fill_in "Adresse", with: @devi.adresse
    fill_in "Decorateur", with: @devi.decorateur
    fill_in "Email", with: @devi.email
    fill_in "Nom", with: @devi.nom
    fill_in "Numero", with: @devi.numero
    fill_in "Prenom", with: @devi.prenom
    fill_in "Telephone", with: @devi.telephone
    fill_in "User", with: @devi.user_id
    click_on "Create Devi"

    assert_text "Devi was successfully created"
    click_on "Back"
  end

  test "updating a Devi" do
    visit devis_url
    click_on "Edit", match: :first

    fill_in "Adresse", with: @devi.adresse
    fill_in "Decorateur", with: @devi.decorateur
    fill_in "Email", with: @devi.email
    fill_in "Nom", with: @devi.nom
    fill_in "Numero", with: @devi.numero
    fill_in "Prenom", with: @devi.prenom
    fill_in "Telephone", with: @devi.telephone
    fill_in "User", with: @devi.user_id
    click_on "Update Devi"

    assert_text "Devi was successfully updated"
    click_on "Back"
  end

  test "destroying a Devi" do
    visit devis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Devi was successfully destroyed"
  end
end
