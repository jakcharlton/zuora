module Zuora
  module Actions
    class Login  < Base
      def initialize(username, password)
        @username, @password = username, password
        to_xml
      end

      private
      def to_xml
        @xml_request = {:username => @username, :password => @password}
      end

    end
  end
end
