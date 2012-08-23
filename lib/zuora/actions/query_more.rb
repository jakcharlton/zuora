module Zuora
  module Actions
    class QueryMore < Base
     def initialize(query_locator)
        @xml_request = {:queryLocator => query_locator}
      end
    end
  end
end
