require File.expand_path('../spec_helper', File.dirname(__FILE__))

#Cancel a subscription, with the current date as the end date
describe 'Scenario#2' do

  it 'should cancel a subscription with the current date as the end date' do
    client = login

    #create a subscription
    subscribe_request = create_an_subscribe_request
    subscribe_action = Zuora::Actions::Subscribe.new([subscribe_request])
    response = client.subscribe(subscribe_action)

    #account_id = response[:subscribe_response][:result][:account_id].to_s
    subscription_id = response[:subscribe_response][:result][:subscription_id].to_s
    #invoice_id = response[:subscribe_response][:result][:invoice_id].to_s


    #cancel the subscription
    amendments = Zuora::Objects::Amendments.new

    now = DateTime.now
    amendments.contract_effective_date = now
    amendments.customer_acceptance_date = now
    amendments.description = 'test'
    amendments.effective_date = now
    amendments.name = 'cancel a subscription'

    amendments.service_activation_date = now
    amendments.status = 'Completed'
    amendments.subscription_id = subscription_id
    amendments.type = 'Cancellation'

    amend_request = Zuora::Objects::AmendRequest.new
    amend_request.amendments = amendments
    amend_action = Zuora::Actions::Amend.new [amend_request]
    client.amend amend_action

    #double check the status of cancelled subscription
    query_action = Zuora::Actions::Query.new("select Status from Subscription where id = '#{subscription_id}'")
    response = client.query(query_action)
    response[:query_response][:result][:records][:status].should == 'Expired'

  end
end
