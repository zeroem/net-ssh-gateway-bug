#!/usr/bin/env ruby

require 'net/http'
require_relative 'util'

gateway = new_gateway

begin
  puts 'Attempting to contact nonexistent service...'
  gateway.open 'localhost', 1234 do |local_port|
    puts "Local Port: #{local_port}"
    puts Net::HTTP.get('localhost', '/index.html', local_port)
  end
rescue Exception => e
  puts e.message
end

begin
  puts 'Attempting to contact real service...'
  gateway.open 'www.example.com', 80 do |local_port|
    puts "Local Port: #{local_port}"
    puts Net::HTTP.get('localhost', '/index.html', local_port)
  end
rescue Exception => e
  puts e.message
end

shutdown_gateway gateway
