require 'test_helper'
require 'fixtures/sample_mail'

class ComplianceTest < ActiveSupport::TestCase
  include ActiveModel::Lint::Tests

  def setup
    @model = SampleMail.new
  end

  test "model has singuler and human name" do
    assert_equal 'sample_mail', @model.class.model_name.singular
    assert_equal 'Sample mail', @model.class.model_name.human
  end

  test "model name supports i18n" do
    i18n_name = 'wibble'
    begin
      I18n.backend.store_translations :en,
        activemodel: { models: { sample_mail: i18n_name } }
      assert_equal i18n_name,  @model.class.model_name.human
    ensure
      I18n.reload!
    end
  end
end
