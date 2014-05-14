require "test_helper"

class PdfDeliveryTest < ActionDispatch::IntegrationTest
  test "pdf sends request as a pdf" do
    get home_index_path(format: :pdf)

    assert_equal "binary", headers["Content-Transfer-Encoding"]
    assert_match "PDF", response.body
    assert_equal "attachment; filename=\"contents.pdf\"",
      headers["Content-Disposition"]
    assert_equal "application/pdf", headers["Content-Type"]
  end
end
