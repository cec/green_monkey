# coding: utf-8

module GreenMonkey
  module ModelHelpers
    extend ActiveSupport::Concern

    def html_schema_type
      self.class.html_schema_type
    end                                                                
    
    def has_html_schema_type?
      self.class.has_html_schema_type?
    end

    module ClassMethods
      def html_schema_type(value = nil, options = {})
        return @html_schema_type unless value

        value = /#{value}/ if value.is_a?(Symbol)
        if value.is_a?(Regexp)
          value = Mida::Vocabulary.vocabularies.find do |vocabulary|
            vocabulary.itemtype.to_s =~ value && vocabulary.itemtype.to_s
          end
        end

        @html_schema_type = value
        @html_schema_options = options
      end
      
      def has_html_schema_type?
         html_schema_type.present?
      end
    end
  end
end