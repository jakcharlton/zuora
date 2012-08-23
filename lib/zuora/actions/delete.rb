module Zuora
  module Actions
    class Delete < Base
      def initialize(type, *ids)
        @type = type
        @ids = *ids
        to_xml
      end

      private
      def to_xml
        @xml_request = hash_to_xml({:type => @type}, 'ns1')
        @ids.each do |id|
          @xml_request += hash_to_xml({:ids => id}, 'ns1')
        end
      end

    end
  end
end
