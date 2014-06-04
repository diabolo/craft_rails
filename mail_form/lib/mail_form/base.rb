module MailForm
  class Base
    include ActiveModel::AttributeMethods
    attribute_method_prefix 'clear_'
    attribute_method_suffix '?'

    def self.attributes(*names)
      attr_accessor(*names)
      define_attribute_methods(names)
    end

    protected

    def clear_attribute(attr)
      send("#{attr}=", nil)
    end

    def attribute?(attr)
      send(attr).present?
    end
  end
end
