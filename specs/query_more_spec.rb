require File.expand_path('spec_helper', File.dirname(__FILE__))

describe "Client" do
  context "#query_more" do
    client = login
    it 'should query more when response size is bigger than 2000' do
      query_action = Zuora::Actions::Query.new 'select AccountId, Amount, Balance, DueDate, InvoiceNumber, Status, TargetDate from Invoice'
      response = client.query query_action
      unless response[:query_response][:result][:done]
        query_locator = response[:query_response][:result][:query_locator]
        query_more_action = Zuora::Actions::QueryMore.new query_locator
        response = client.query_more query_more_action
        while !response[:query_more_response][:result][:done]
          query_locator = response[:query_more_response][:result][:query_locator]
          query_more_action = Zuora::Actions::QueryMore.new query_locator
          response = client.query_more query_more_action
        end
      end
      response[:query_more_response][:result][:done].should == true
    end

  end
end

