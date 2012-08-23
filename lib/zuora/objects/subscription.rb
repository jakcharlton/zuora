module Zuora
  module Objects
    class Subscription
      attr_accessor :id, :account_id, :name, :notes, :status,
                    :initial_term, :renewal_term, :contract_acceptance_date,
                    :contract_effective_date, :service_activation_date,
                    :term_start_date,:currency, :auto_renew

    end
  end
end
