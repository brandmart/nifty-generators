require 'rails/generators/base'
require "rails/generators/active_model"
 
module Nifty
  module Generators
    class Base < Rails::Generators::Base #:nodoc:
      def self.source_root
        @_nifty_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'nifty', generator_name, 'templates'))
      end
 
      def self.banner
        "#{$0} nifty:#{generator_name} #{self.arguments.map{ |a| a.usage }.join(' ')} [options]"
      end
    end
    
    class ActiveModel < ::Rails::Generators::ActiveModel #:nodoc:
      def self.all(klass)
        "#{klass}.all"
      end

      def self.find(klass, params=nil)
        "#{klass}.find(#{params})"
      end

      def self.build(klass, params=nil)
        if params
          "#{klass}.new(#{params})"
        else
          "#{klass}.new"
        end
      end

      def save
        "#{name}.save"
      end

      def update_attributes(params=nil)
        "#{name}.update_attributes(#{params})"
      end

      def errors
        "#{name}.errors"
      end

      def destroy
        "#{name}.destroy"
      end
    end    
  end
end

module Rails
  module Generators
    class GeneratedAttribute #:nodoc:
      def type_class
        return "Time" if type.to_s == "datetime"
        return "String" if type.to_s == "text"
        return type.to_s.camelcase
      end
    end
  end
end
