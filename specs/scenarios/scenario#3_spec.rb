require File.expand_path('../spec_helper', File.dirname(__FILE__))

#Create a subscription without a credit card, with a Other payment method, and raise an invoice and post the invoice

describe 'Scenario#3' do
   it 'should Create a subscription without specifying payment method, and raise an invoice and post the invoice' do
     client = login

     now = DateTime.now

     account = create_an_account
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
     #subscribe_request.payment_method = payment_method
     subscribe_request.bill_to_contact = contact
     subscribe_request.subscription_data = subscription_data

     subscribe_action = Zuora::Actions::Subscribe.new([subscribe_request])
     response = client.subscribe(subscribe_action)

     response[:subscribe_response][:result][:success].should == true
   end
end