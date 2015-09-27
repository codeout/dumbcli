module Dumbcli
  module Device
    class Cisco < Base
      def connect
        super
        flush
        execute 'terminal length 0'
      end

      def execute(cmd)
        super + flush
      end


      private

      def login_cmd
        "#{Dumbcli::Device.login_cmd('cisco')} #{@host}"
      end
    end
  end
end
