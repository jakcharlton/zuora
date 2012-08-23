#just an exmple to show how to do invoice adjustment
#not a real test

require File.expand_path('../spec_helper', File.dirname(__FILE__))

describe 'invoice adjustment' do

  client = login

  it 'should adjust a invoice' do
    invoice_adjustment = Zuora::Objects::InvoiceAdjustment.new
    invoice_adjustment.invoice_id = '4028e6962fd8ad12012fe6510eba3dc3'
    invoice_adjustment.amount = 0 #can be any amount you want
    invoice_adjustment.type = 'Charge'
    create_action = Zuora::Actions::Create.new [invoice_adjustment]
    client.create create_action

    query_action = Zuora::Actions::Query.new "select Balance from Invoice where Id = '4028e6962fd8ad12012fe6510eba3dc3'"
    client.query query_action
  end
end

