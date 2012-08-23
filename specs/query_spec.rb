require File.expand_path('spec_helper', File.dirname(__FILE__))


describe "Client" do
  context "#query" do
    client = login

    it 'should return account name' do
      query_action = Zuora::Actions::Query.new("select Name from Account where id = '4028e696361e26af013638a9460240b5'")
      response = client.query(query_action)
      response[:query_response][:result][:records][:name].should == 'test'
    end

  end
end
