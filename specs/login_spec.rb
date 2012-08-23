require File.expand_path('spec_helper', File.dirname(__FILE__))

describe "Client" do
  context "#login" do
		it 'should login from defaults' do
			Zuora::Client.set_defaults do |client|
				client.username = ENV['ZUORA_USERNAME']
				client.password = ENV['ZUORA_PASSWORD']
				client.production = false
				client.proxy = 'https://proxy.int.f2.com.au:8080'
			end
			client = Zuora::Client.new
			client.authenticated?.should == true
		end
  end
end
