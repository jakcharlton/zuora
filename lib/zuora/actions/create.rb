module Zuora
  module Actions
    class Create < Base
      def initialize(create_request)
        is_same! create_request
        @create_request = create_request
        to_xml
      end

      private
      def to_xml
        @xml_request = ''
        @create_request.each do |obj|
          obj_hash = obj_to_hash(obj)
          add_namespace(obj_hash)
          xml =  hash_to_xml(obj_hash)
          class_name = obj.class.name.split("::")[2]
          @xml_request += add_header(xml,'zObjects','ns2:'+class_name)
        end
      end

    end
  end
end
