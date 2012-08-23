module Zuora
  module Objects
    class PaymentMethod
      attr_accessor :account_id, :ach_aba_code, :ach_account_name, :ach_account_number, :ach_account_type,
                    :ach_bank_name, :active, :bank_branch_code, :bank_check_digit, :bank_city, :bank_code,
                    :bank_identification_number, :bank_name, :bank_postal_code, :bank_street_name, :bank_street_number,
                    :bank_transfer_account_name, :bank_transfer_account_number, :bank_transfer_account_type,
                    :bank_transfer_type, :business_identification_code, :city, :country,
                    :credit_card_address1, :credit_card_address2, :credit_card_city,
                    :credit_card_country, :credit_card_expiration_month, :credit_card_expiration_year,
                    :credit_card_holder_name, :credit_card_number, :credit_card_postal_code, :credit_card_state,
                    :credit_card_type, :device_session_id, :email, :first_name, :iban, :ip_address, :last_name,
                    :last_transaction_dateTime, :mandate_creation_date, :mandate_id, :mandate_received,
                    :mandate_update_date, :max_consecutive_payment_failures, :payment_method_status,
                    :payment_retry_window, :paypal_baid, :paypal_email, :paypal_preapproval_key, :paypal_type,
                    :phone, :postal_code, :skip_validation, :state, :street_name, :street_number,
                    :total_number_of_error_payments, :total_number_of_processed_payments, :type
    end
  end
end

