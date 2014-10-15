require 'net/ssh/gateway'

def new_gateway
  gateway_host = 'localhost'
  gateway_user = '<username>'
  options = {} # eg password: 'your-password'

  Net::SSH::Gateway.new gateway_host, gateway_user, options
end

def shutdown_gateway(gateway)
  begin
    gateway.shutdown!
  rescue Exception => e
    puts "Exception shutting down gateway: #{e.message}"
  end
end
