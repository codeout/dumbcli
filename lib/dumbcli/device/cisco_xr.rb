module Dumbcli
  module Device
    class CiscoXr < Base
      def connect
        super
        flush
        execute 'terminal length 0'
      end


      private

      def login_cmd
        "#{Dumbcli::Device.login_cmd('cisco-xr')} #{@host}"
      end
    end
  end
end
