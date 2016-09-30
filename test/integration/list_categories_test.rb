require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "books")
    @category2 = Category.create(name: "programming")
  end

  test "should show categories listing" do
    get categories_path
    assert_template 'categories/index'
  #   Necesito que teng aun link a category page
    assert_select "a[href=?]", category_path(@category), text: @category.name
  #   El link debe decir "sports"
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end

end