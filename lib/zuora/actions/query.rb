module Zuora
  module Actions
    class Query < Base
      def initialize(query_string)
        @xml_request = {:queryString => query_string}
      end
    end
  end
end
