module Zuora
  module Objects
    class Invoice
      attr_accessor :id, :account_id, :adjustment_amount, :amount,  :amount_without_tax, :balance, :body,
                    :comments, :due_date, :includes_one_time, :includes_recurring, :includes_usage,
                    :invoice_date, :invoice_number, :last_email_date, :pay_amount, :refund_amount,
                    :source, :source_id, :status, :target_date
      end
    end
end
