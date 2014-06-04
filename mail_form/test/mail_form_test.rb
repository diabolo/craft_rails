require 'test_helper'
require 'fixtures/sample_mail'

class MailFormTest < ActiveSupport::TestCase
  %w(name email).each do | attr |
    test "sample mail has attributes #{attr}" do
      sample = SampleMail.new
      sample.send("#{attr}=", 'value')
      assert_equal('value', sample.send("#{attr}"))
    end
  end
end
