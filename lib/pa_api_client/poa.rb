# coding: utf-8

require 'xmlrpc/client'

module PaApiClient
  class POA
    attr_reader :client

    def initialize(host:, user: nil, password: nil, ssl: false, port: 8440)
      @host         = host
      @password     = password
      @port         = port
      @user         = user
      @client       = XMLRPC::Client.new2(url)
    end

    def call(method, argument_hash)
      begin
        @client.call(method, argument_hash)
      rescue => e
        "POA#call with method #{method} and argument hash " \
          "#{argument_hash.inspect} failed with error: #{e}"
      end
    end

    private

      def url
        result = 'http'
        result << 's' if @ssl
        result << '://'
        result << "#{@user}:#{@password}@" if @user
        result << "#{@host}:#{@port}"
        result
      end
  end
end
