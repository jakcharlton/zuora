require File.expand_path('../spec_helper', File.dirname(__FILE__))


#Create a subscription, with an new account and credit card and raise an invoice and charge the account
describe 'Scenario#1' do

  client = login

  it 'should create a subscription with a new account and credit card and raise an invoice' do

    account = create_an_account
    create_aciton = Zuora::Actions::Create.new [account]
    response = client.create(create_aciton)
    account_id = response[:create_response][:result][:id].to_s


    #generate a contact
    contact = Zuora::Objects::Contact.new
    contact.account_id = account_id
    contact.first_name = 'shane'
    contact.last_name = 'niu'
    contact.country = 'China'

    create_action = Zuora::Actions::Create.new [contact]
    response = client.create(create_action)
    contact_id = response[:create_response][:result][:id].to_s


    #generate a subscription and bind it with the account
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
    payment_method.credit_card_number = '4111111111111111'
    payment_method.credit_card_type = 'Visa' # must be title case
    payment_method.type = 'CreditCard'

    rate_plan = Zuora::Objects::RatePlan.new
    rate_plan.amendment_type = 'NewProduct'
    rate_plan.product_rate_plan_id = '4028e6992385ecae012397261f767b34'

    rate_plan_charge = Zuora::Objects::RatePlanCharge.new
    rate_plan_charge.product_rate_plan_charge_id = '4028e6992385ecae01239727e9bd7b37'
    rate_plan_charge.description = 'Subscription'
    rate_plan_charge.quantity = 1
    rate_plan_charge.price = '1000.00'

    rate_plan_charge_data = Zuora::Objects::RatePlanChargeData.new
    rate_plan_charge_data.rate_plan_charge = rate_plan_charge

    # make subscription
    now = DateTime.now
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
    rate_plan_data.rate_plan_charge_data = rate_plan_charge_data

    subscription_data = Zuora::Objects::SubscriptionData.new
    subscription_data.subscription = subscription
    subscription_data.rate_plan_data = rate_plan_data

    subscribe_request = Zuora::Objects::SubscribeRequest.new
    subscribe_request.account = account
    subscribe_request.payment_method = payment_method
    subscribe_request.bill_to_contact = contact
    subscribe_request.subscription_data = subscription_data

    subscribe_action = Zuora::Actions::Subscribe.new([subscribe_request])
    response = client.subscribe(subscribe_action)

    response[:subscribe_response][:result][:success].should == true

  end

end