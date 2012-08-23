require File.expand_path('spec_helper', File.dirname(__FILE__))

describe "Client" do
  describe "#subscribe" do

    client = login

    now = DateTime.now

    account = Zuora::Objects::Account.new
    account.name = 'test'
    account.currency = 'AUD'
    account.bill_cycle_day = 1
    account.payment_term = 'Due Upon Receipt'
    account.status = 'Draft'
    account.allow_invoice_edit = 1
    account.auto_pay = 0
    account.batch = 'Batch1'
    account.account_number = gen_random_numbers

    # make contact
    contact = Zuora::Objects::Contact.new
    contact.first_name = 'test'
    contact.last_name = 'test'
    contact.address1 = 'test'
    contact.address2 = 'test'
    contact.city = 'Sydney'
    contact.state = 'NSW'
    contact.country = 'Australia'
    contact.postal_code = '2070'
    contact.work_email = 'john.dagostino@gmail.com'

    payment_method = Zuora::Objects::PaymentMethod.new
    payment_method.credit_card_address1 = 'test'
    payment_method.credit_card_address2 = 'test'
    payment_method.credit_card_city = 'Sydney'
    payment_method.credit_card_country = 'Australia'
    payment_method.credit_card_postal_code = '2070'
    payment_method.credit_card_state = 'NSW'
    payment_method.credit_card_holder_name = 'Tester McTest'
    payment_method.credit_card_expiration_month = '10'
    payment_method.credit_card_expiration_year = '2013' # must be four digit
    payment_method.credit_card_number = '4111 3235 1611 1111'
    payment_method.credit_card_type = 'Visa' # must be title case
    payment_method.type = 'CreditCard'

    rate_plan = Zuora::Objects::RatePlan.new
    rate_plan.amendment_type = 'NewProduct'
    rate_plan.product_rate_plan_id = '4028e6992385ecae012397261f767b34'

    rate_plan_charge = Zuora::Objects::RatePlanCharge.new
    rate_plan_charge.product_rate_plan_charge_id = ''
    rate_plan_charge.description = 'test'
    rate_plan_charge.quantity = 1
    rate_plan_charge.price = '100.00'

    # make subscription
    subscription = Zuora::Objects::Subscription.new
    subscription.name = gen_random_names
    subscription.auto_renew = true
    subscription.contract_acceptance_date = now
    subscription.contract_effective_date = now
    subscription.service_activation_date = now
    subscription.term_start_date = now
    subscription.initial_term = 12
    subscription.renewal_term = 12
    subscription.term_start_date = now

    rate_plan_data = Zuora::Objects::RatePlanData.new
    rate_plan_data.rate_plan = rate_plan

    subscription_data = Zuora::Objects::SubscriptionData.new
    subscription_data.subscription = subscription
    subscription_data.rate_plan_data = rate_plan_data
    #subscription_data.rate_plan_charge = rate_plan_charge

    subscribe_request = Zuora::Objects::SubscribeRequest.new
    subscribe_request.account = account
    subscribe_request.payment_method = payment_method
    subscribe_request.bill_to_contact = contact
    subscribe_request.subscription_data = subscription_data

    it 'should get success response' do
      subscribe_action = Zuora::Actions::Subscribe.new([subscribe_request])
      response = client.subscribe(subscribe_action)
      response[:subscribe_response][:result][:success].should == true
    end


  end
end