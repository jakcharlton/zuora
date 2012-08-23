require File.expand_path('spec_helper', File.dirname(__FILE__))

describe "Client" do
  context "#delete" do

    client = login

    it 'should delete an account' do
      account = create_an_account
      create_aciton = Zuora::Actions::Create.new([account])
      response = client.create(create_aciton)
      id = response[:create_response][:result][:id]
      delete_action = Zuora::Actions::Delete.new('Account',id)
      response = client.delete(delete_action)
      response[:delete_response][:result][:success].should == true
    end

    it 'should delete a payment_method from an account' do
      account = create_an_account
      create_aciton = Zuora::Actions::Create.new([account])
      response = client.create(create_aciton)
      account_id = response[:create_response][:result][:id]

      payment_method = Zuora::Objects::PaymentMethod.new
      payment_method.account_id = account_id.to_s
      payment_method.credit_card_holder_name = 'Tester McTest'      
      payment_method.credit_card_expiration_month = '10'
      payment_method.credit_card_expiration_year = '2013' # must be four digit
      payment_method.credit_card_number = '4111 3235 1611 1111'
      payment_method.credit_card_type = 'Visa' # must be title case
      payment_method.type = 'CreditCard'
      create_action = Zuora::Actions::Create.new [payment_method]
      response = client.create create_action
      payment_method_id = response[:create_response][:result][:id]

      delete_action = Zuora::Actions::Delete.new 'PaymentMethod',payment_method_id
      response = client.delete delete_action
      response[:delete_response][:result][:success].should == true
    end

  end
end
