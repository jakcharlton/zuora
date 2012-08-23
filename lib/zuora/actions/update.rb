module Zuora
  module Actions
    class Update < Base
      def initialize(update_request)
        is_same! update_request
        @update_request = update_request
        to_xml
      end

      private
      def to_xml
        @xml_request = ''
        @update_request.each do |obj|
          obj_hash = obj_to_hash(obj)

          #need to reorder hash here
          #put <id/> in the first place
          id_hash = {'id' => obj_hash['id']}
          obj_hash.delete('id')
          obj_hash = id_hash.merge obj_hash

          add_namespace(obj_hash)
          xml =  hash_to_xml(obj_hash)
          class_name = obj.class.name.split("::")[2]
          @xml_request += add_header(xml,'zObjects','ns2:'+class_name)
        end
      end
    end
  end
end
