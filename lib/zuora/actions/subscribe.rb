module Zuora
  module Actions
    class Subscribe < Base
      def initialize(subscribe_request)
        is_same! subscribe_request
        @subscribe_request = subscribe_request
        to_xml
      end

      private
      def to_xml
        @xml_request = ''
        @subscribe_request.each do |obj|
          obj_hash = obj_to_hash(obj)
          add_namespace(obj_hash)
          xml =  hash_to_xml(obj_hash)
          class_name = obj.class.name.split("::")[2]
          @xml_request += add_header(xml,'subscribes','ns1:'+class_name)
        end
      end
    end
  end
end
