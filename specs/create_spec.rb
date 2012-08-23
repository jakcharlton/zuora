require File.expand_path('spec_helper', File.dirname(__FILE__))

describe "Client" do
  context "#create" do

    client = login

    it 'should create an account' do
      account = Zuora::Objects::Account.new
      account.name = 'test'
      account.currency = 'AUD'
      account.bill_cycle_day = 1
      account.payment_term = 'Due Upon Receipt'
      account.status = 'Draft'
      account.allow_invoice_edit = 1
      account.auto_pay = 0
      account.batch = 'Batch1'
      create_action = Zuora::Actions::Create.new([account])
      response = client.create(create_action)
      response[:create_response][:result][:success].should == true
    end

    it 'should create a payment method' do
      payment_method = Zuora::Objects::PaymentMethod.new
      payment_method.account_id = '4028e696361e26af013638a9460240b5'
      payment_method.credit_card_holder_name = 'Tester McTest'      
      payment_method.credit_card_expiration_month = '10'
      payment_method.credit_card_expiration_year = '2013' # must be four digit
      payment_method.credit_card_number = '4111 3235 1611 1111'
      payment_method.credit_card_type = 'Visa' # must be title case
      payment_method.type = 'CreditCard'

      create_action = Zuora::Actions::Create.new [payment_method]
      response = client.create create_action
      response[:create_response][:result][:success].should == true
    end

    it 'should raise error if submit the same requests twice' do
      account = Zuora::Objects::Account.new
      account.name = 'test'
      account.currency = 'AUD'
      account.bill_cycle_day = 1
      account.payment_term = 'Due Upon Receipt'
      account.status = 'Draft'
      account.allow_invoice_edit = 1
      account.auto_pay = 0
      account.batch = 'Batch1'
      expect {Zuora::Actions::Create.new([account,account])}.to raise_error(Zuora::InvalidRequestError)
    end
  end
end
