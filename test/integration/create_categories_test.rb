require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  test "get new category form and create category" do
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
end