require 'test_helper'
require 'fixtures/sample_mail'

class MailFormTest < ActiveSupport::TestCase
  %w(name email).each do | attr |
    test "sample mail has attributes #{attr}" do
      sample = SampleMail.new
      sample.send("#{attr}=", 'value')
      assert_equal('value', sample.send("#{attr}"))
    end

    test "can clear #{attr} with clear_#{attr}" do
      sample = SampleMail.new
      sample.send("#{attr}=", 'value')
      sample.send "clear_#{attr}"
      assert_nil sample.send("#{attr}")
    end

    test "can query presence of #{attr} with #{attr}?" do
      sample = SampleMail.new
      assert !sample.send("#{attr}?")
      sample.send("#{attr}=", 'value')
      assert sample.send("#{attr}?")
    end

  end

  test "delivers an email with attributes" do
    sample = SampleMail.new
    sample.email = 'user@example.com'
    sample.deliver
    assert_equal 1, ActionMailer::Base.deliveries.size
  end

end
