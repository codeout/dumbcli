module Dumbcli
  module Device
    class Juniper < Base
      def connect
        super
        flush
        execute 'set cli screen-length 0'
      end

      def execute(cmd)
        super + flush
      end


      private

      def login_cmd
        "#{Dumbcli::Device.login_cmd('juniper')} #{@host}"
      end
    end
  end
end
