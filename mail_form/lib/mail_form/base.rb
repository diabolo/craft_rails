module MailForm
  class Base
    include ActiveModel::AttributeMethods
    attribute_method_prefix 'clear_'

    def self.attributes(*names)
      attr_accessor(*names)
      define_attribute_methods(names)
    end

    protected

    def clear_attribute(attr)
      send("#{attr}=", nil)
    end
  end
end
