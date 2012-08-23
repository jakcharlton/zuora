module Zuora
  module Objects
    class SubscriptionOptions
      attr_accessor :generate_invoice, :process_payments

      def initialize
        @generate_invoice = true
        @process_payments = true
      end
    end
  end
end
