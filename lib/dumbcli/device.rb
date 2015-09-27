require 'dumbcli/device/base.rb'
require 'dumbcli/device/a10.rb'
require 'dumbcli/device/arista.rb'
require 'dumbcli/device/cisco.rb'
require 'dumbcli/device/cisco_asa.rb'
require 'dumbcli/device/cisco_xr.rb'
require 'dumbcli/device/juniper.rb'

module Dumbcli
  module Device
    def self.login_cmd(platform)
      rancid_types = {
        'adtran'      => 'clogin',
        'alteon'      => 'alogin',
        'arbor'       => 'anlogin',
        'arista'      => 'clogin',
        'avocent'     => 'avologin',
        'baynet'      => 'blogin',
        'cat5'        => 'clogin',
        'cisco-nx'    => 'clogin',
        'cisco-wlc4'  => 'wlogin',
        'cisco-wlc5'  => 'wlogin',
        'cisco-xr'    => 'clogin',
        'cisco'       => 'clogin',
        'compass'     => 'complogin',
        'css'         => 'clogin',
        'dell'        => 'dllogin',
        'enterasys'   => 'rivlogin',
        'erx'         => 'clogin',
        'extreme'     => 'clogin',
        'ezt3'        => 'elogin',
        'f5'          => 'clogin',
        'force10'     => 'clogin',
        'fortigate'   => 'fnlogin',
        'foundry'     => 'flogin',
        'hitachi'     => 'htlogin',
        'hp'          => 'hlogin',
        'juniper-srx' => 'jlogin',
        'juniper'     => 'jlogin',
        'mikrotik'    => 'mtlogin',
        'mrtd'        => 'clogin',
        'mrv'         => 'mrvlogin',
        'netopia'     => 'tlogin',
        'netscaler'   => 'nslogin',
        'netscreen'   => 'nlogin',
        'paloalto'    => 'panlogin',
        'procket'     => 'clogin',
        'redback'     => 'clogin',
        'riverstone'  => 'rivlogin',
        'smc'         => 'hlogin',
        'xirrus'      => 'xilogin',
        'zebra'       => 'clogin',
      }

      rancid_types[platform]
    end
  end
end
