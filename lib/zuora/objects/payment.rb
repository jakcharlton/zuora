module Zuora
  module Objects
    class Payment
      attr_accessor :account_id, :applied_invoice_amount,
                    :effective_date, :invoice_id, :payment_method_id,
                    :status, :type
    end
  end
end
