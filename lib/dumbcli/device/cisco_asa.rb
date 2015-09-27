module Dumbcli
  module Device
    class CiscoAsa < Base
      def connect
        super
        flush
        execute 'terminal pager 0'
      end


      private

      def login_cmd
        "#{Dumbcli::Device.login_cmd('cisco')} #{@host}"
      end
    end
  end
end
