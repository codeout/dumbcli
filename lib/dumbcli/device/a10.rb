module Dumbcli
  module Device
    class A10 < Base
      def connect
        super
        flush
        execute 'terminal length 0'
      end

      def execute(cmd)
        super
      end


      private

      def login_cmd
        "#{Dumbcli::Device.login_cmd('cisco')} #{@host}"
      end

      def execute_exit
        result = execute("exit\nexit\nY")
        sleep 1
        result << flush

        unless result =~ /connection closed|Connection to \S+ closed\./i
          sleep 1
          execute "exit\nexit\nY"
        end
      end
    end
  end
end
