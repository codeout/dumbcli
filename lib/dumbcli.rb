require 'dumbcli/device'
require 'dumbcli/logger'
require 'dumbcli/version'

module Dumbcli
  @logger = Dumbcli::Logger.new(STDOUT).tap {|l| l.level = Dumbcli::Logger::Severity::INFO }

  class << self
    attr_accessor :logger

    def Device(host, platform, options={})
      case platform
      when 'a10'
        Dumbcli::Device::A10.new(host, options)
      when 'arista'
        Dumbcli::Device::Arista.new(host, options)
      when 'cisco'
        Dumbcli::Device::Cisco.new(host, options)
      when 'cisco-asa'
        Dumbcli::Device::CiscoAsa.new(host, options)
      when 'cisco-xr'
        Dumbcli::Device::CiscoXr.new(host, options)
      when 'juniper'
        Dumbcli::Device::Juniper.new(host, options)
      else
        raise ArgumentError, %(Unknown device type: "#{platform}" for host "#{host}")
      end
    end
  end
end
