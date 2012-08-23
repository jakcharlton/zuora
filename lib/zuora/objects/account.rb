module Zuora
  module Objects

    class Account
      attr_accessor :id, :account_number, :auto_pay, :batch,
                    :bill_cycle_day, :currency, :name, :allow_invoice_edit,
                    :payment_term, :status, :bill_to_id, :sold_to_id, :default_payment_method_id
    end
  end
end

