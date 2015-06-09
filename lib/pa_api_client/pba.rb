# coding: utf-8

require 'xmlrpc/client'
require 'base64'

module PaApiClient
  class PBA
    attr_reader :client

    def initialize(host:, user: nil, password: nil, ssl: false, port: 5224, verbose: false)
      @host       = host
      @password   = password
      @port       = 5224
      @ssl        = ssl
      @user       = user
      @verbose    = verbose
      @client     = XMLRPC::Client.new2(url)
    end

    def call(method, params, server: 'BM')
      begin
        @client.call(
          'Execute',
          {
            Server:     server,
            Method:     method,
            Params:     params
          }
        )
      rescue => e
        {
          error: Base64.decode64(e.faultString)
        }
      end
    end

    private

      def url
        result = 'http'
        result << 's' if @ssl
        result << '://'
        result << "#{@host}:#{@port}"
        result
      end
  end
end

