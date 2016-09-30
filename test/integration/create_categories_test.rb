require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
  end

  test "get new category form and create category" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: {name: 'sports'}
      # necesitamos que pase algo que esta creado como el nombre de la categoria name => 'sports'
    end
    # Aqui decimos donde lo queremos enviar al cats/index page  y luego
    # queremos que esa categoria se display despues de crearse
    assert_template 'categories/index'
    # Esto se debe desplegar en el page que queremos
    assert_match 'sports', response.body # <- ene l body
  end

  test "invalid category submission results in failure" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template 'categories/new'
    # En este escenario no queiro un cambio
    assert_no_difference 'Category.count' do
      post categories_path, category: {name: ' '}
    #   Si fails simplemente render el new tempalte otra ves
    end
    assert_template 'categories/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  #   Estoy buscando la existencia de esas dos cosas
  #   Si estas dos cosas se presentas estoy probando que se esta renderisando
  end
end