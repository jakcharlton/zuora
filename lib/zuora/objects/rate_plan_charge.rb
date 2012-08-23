module Zuora
  module Objects
    class RatePlanCharge
      attr_accessor :accounting_code, :bill_cycle_day,
                    :bill_cycle_type, :billing_period,
                    :billing_period_alignment, :charge_model,
                    :charge_type, :quantity, :price,
                    :default_quantity, :description, :included_units,
                    :max_quantity, :min_quantity, :model,
                    :name, :number_of_period, :product_rate_plan_charge_id
    end
  end
end
