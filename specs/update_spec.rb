require File.expand_path('spec_helper', File.dirname(__FILE__))


describe "Client" do
  describe "#query" do

    client = login

    it 'should update account name' do
      account = create_an_account
      create_action = Zuora::Actions::Create.new([account])
      result = client.create(create_action)

      id = result[:create_response][:result][:id]

      acc = Zuora::Objects::Account.new
      acc.id = id.to_s
      acc.name = 'updated name'

      update_action = Zuora::Actions::Update.new [acc]
      response = client.update update_action
      response[:update_response][:result][:success].should == true
    end

  end
end

