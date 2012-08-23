require 'active_support/core_ext/object'
require 'active_support/inflector'

module Zuora
  module Actions
    class Base

      attr_reader :xml_request


      private

      def hash_to_xml(hash,*namespace)
        if namespace
          Gyoku.xml(hash, {:element_form_default => :qualified, :namespace => namespace[0]})
        else
          Gyoku.xml(hash, {:element_form_default => :qualified})
        end

      end

      def obj_to_hash(obj)
        h = Hash.new
        obj.instance_variables.each do |attribute|
          attribute = attribute.to_s.delete('@')
          instance = obj.send(attribute)
          unless instance.instance_variables.empty?
            h[attribute] = obj_to_hash(instance)
          else
            h[attribute] = instance
          end
        end
        h
      end

      def add_header(xml,*type)
        xml = '<wsdl:'+type[0]+' xsi:type="'+type[1]+'">' + xml + '</wsdl:'+type[0]+'>' if type
      end

      def add_namespace(hash)
        if hash.class.name == 'Hash'
          hash.keys.each do |k|
            if class_present?('Zuora::Objects::' + k.camelize)
              k2 = 'ns1:'+ k.camelize
            else
              k2 = 'ns2:'+ k.camelize
            end
            hash[k2] = hash[k]
            add_namespace(hash[k])
            hash.delete(k)
          end
        end
      end

      #check whether the name is a zobject or not
      def class_present?(name)
        name.split('::').inject(Object) {
            |o, x| o = o.const_get(x) if x.camelize==x && o.const_defined?(x)
        }.is_a? Class
      end

      #check whether there is same requests in one submit
      def is_same!(request)
        arr = []
        request.each do |o|
          raise Zuora::InvalidRequestError if arr.include?(o.instance_values)
          arr << o.instance_values
        end
      end

    end
  end
end
