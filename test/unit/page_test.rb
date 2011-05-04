require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "test_invalid_if_any_field_empty" do
    page = Page.new
    assert !page.valid?
    assert page.error.invalid?(:title)
    assert page.error.invalid?(:body)
  end
end
