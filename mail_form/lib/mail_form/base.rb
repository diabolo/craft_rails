module MailForm
  class Base
    include ActiveModel::Conversion
    extend ActiveModel::Naming
    extend ActiveModel::Translation
    include ActiveModel::Validations


    include ActiveModel::AttributeMethods
    attribute_method_prefix 'clear_'
    attribute_method_suffix '?'

    def self.attributes(*names)
      attr_accessor(*names)
      define_attribute_methods(names)
    end

    def persisted?
      false
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
