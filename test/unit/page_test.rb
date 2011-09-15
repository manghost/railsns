#require 'test_helper'
require File.dirname(__FILE__) + '/../test_helper'

class PageTest < ActiveSupport::TestCase

  fixtures :pages
  
  # Replace this with your real tests.
  test "invalid_if_any_field_empty" do
    page = Page.new
    assert !page.valid?
    assert page.errors[:title].any?
#    assert page.errors.invalid?(:body)
    assert page.errors[:body].any?
  end
  
  test "valid_fields" do
    page = pages(:valid_page)
    assert page.valid?
  end

  test "invalid_short_title" do
    page = pages(:invalid_page_short_title)
     assert !page.valid?
  end

  test "auto_permalink" do
    page = pages(:valid_with_auto_permalink)
    assert page.valid?
  end
end
