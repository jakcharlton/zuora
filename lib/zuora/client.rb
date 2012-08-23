require 'active_support/core_ext/object'
require 'active_support/core_ext/class'
require 'active_support/inflector'
require 'savon'

module Zuora
  class Client
    cattr_accessor :username, :password, :production, :proxy

    def initialize(username=nil, password=nil, production=false)
      @@username ||= username
      @@password ||= password
      @@production ||= production

      @endpoint = "https://apisandbox.zuora.com/apps/services/a/34.0"

      if @@production
        Savon.configure do |config|
          config.log = false
        end
        @endpoint = "https://www1.zuora.com/apps/services/a/34.0"
      end

      @server_url = @endpoint
      @session = nil

      if @@username && @@password
        login Zuora::Actions::Login.new @@username, @@password
      end
    end

    def self.set_defaults(&block)
      yield self
    end

    def self.define_action(name)
      define_method(name){ |action|
        begin
          post_action name, action
        rescue Savon::SOAP::Fault #to handle session timeout error
          repost name, action
        end
      }
    end

    define_action :amend
    define_action :create
    define_action :delete
    define_action :generate
    define_action :query
    define_action :query_more
    define_action :subscribe
    define_action :subscribe_with_existing_account
    define_action :update

    def login(login)
      response = client.request :login do
                   soap.body = login.xml_request
                 end.to_hash
      @server_url = response[:login_response][:result][:server_url]
      @session = response[:login_response][:result][:session]
      authenticated?
    end

    def authenticated?
      !@session.nil?
    end

    private
    def repost(name, action)
      #get new session
      login Zuora::Actions::Login.new @@username, @@password
      post_action(name, action)
    end

    def post_action(name, action)
      response = client.request name.to_sym do |soap|
        soap.namespaces["xmlns:ns1"] = "http://api.zuora.com/"
        soap.namespaces["xmlns:ns2"] = "http://object.api.zuora.com/"
        soap.header['SessionHeader'] = headers
        soap.body = action.xml_request
      end.to_hash
    end

    def client
      @client ||= Savon::Client.new do |wsdl, http|
        wsdl.document = File.expand_path("zuora.a.34.0.wsdl", File.dirname(__FILE__))
        wsdl.endpoint = @server_url
        http.auth.ssl.verify_mode = :none
        http.proxy = @@proxy if @@proxy
      end
    end

    def headers
      {:session => @session}
    end

  end
end
