module Zuora
  VERSION = '0.2'


  autoload :Client, 'zuora/client'


  module Objects
    autoload :Base, 'zuora/objects/base'
    autoload :Invoice, 'zuora/objects/invoice'
    autoload :Account, 'zuora/objects/account'
    autoload :AmendOptions, 'zuora/objects/amend_options'
    autoload :AmendRequest, 'zuora/objects/amend_request'
    autoload :Amendments, 'zuora/objects/amendments'
    autoload :Contact, 'zuora/objects/contact'
    autoload :Payment, 'zuora/objects/payment'
    autoload :PreviewOptions, 'zuora/objects/preview_options'
    autoload :SubscribeOptions, 'zuora/objects/subscribe_options'
    autoload :SubscribeRequest, 'zuora/objects/subscribe_request'
    autoload :PaymentMethod, 'zuora/objects/payment_method'
    autoload :RatePlan, 'zuora/objects/rate_plan'
    autoload :RatePlanCharge, 'zuora/objects/rate_plan_charge'
    autoload :Subscription, 'zuora/objects/subscription'
    autoload :SubscriptionData, 'zuora/objects/subscription_data'
    autoload :RatePlanData, 'zuora/objects/rate_plan_data'
    autoload :Exception, 'zuora/objects/exception'
    autoload :RatePlanChargeData, 'zuora/objects/rate_plan_charge_data'
    autoload :InvoiceAdjustment, 'zuora/objects/invoice_adjustment'
  end

  module Actions
    autoload :Base, 'zuora/actions/base'
    autoload :Amend, 'zuora/actions/amend'
    autoload :Create, 'zuora/actions/create'
    autoload :Delete, 'zuora/actions/delete'
    autoload :Generate, 'zuora/actions/generate'
    autoload :Login, 'zuora/actions/login'
    autoload :Query, 'zuora/actions/query'
    autoload :QueryMore, 'zuora/actions/query_more'
    autoload :Subscribe, 'zuora/actions/subscribe'
    autoload :Update, 'zuora/actions/update'
  end

  class ZuoraException < ::Exception; end
  class InvalidRequestError < ZuoraException; end

end

