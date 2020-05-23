# frozen_string_literal: true

require 'test_helper'

class TestRenderer < Minitest::Test
  def setup
    @doc = Markly.render_doc('Hi *there*')
  end

  def test_html_renderer
    renderer = HtmlRenderer.new
    result = renderer.render(@doc)
    assert_equal "<p>Hi <em>there</em></p>\n", result
  end

  def test_multiple_tables
    content = <<~DOC
      | Input       | Expected         | Actual    |
      | ----------- | ---------------- | --------- |
      | One         | Two              | Three     |

      | Header   | Row  | Example |
      | :------: | ---: | :------ |
      | Foo      | Bar  | Baz     |
    DOC
    doc = Markly.render_doc(content, :DEFAULT, %i[autolink table tagfilter])
    results = Markly::HtmlRenderer.new.render(doc)
    assert_equal 2, results.scan(/<tbody>/).size
  end
end
