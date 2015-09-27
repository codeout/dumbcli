module Dumbcli
  module Device
    class Arista < Base
      def connect
        term = ENV['TERM']
        ENV['TERM'] = 'vt100'

        super
        flush
        execute 'terminal length 0'

        ENV['TERM'] = term
      end


      private

      def login_cmd
        "#{Dumbcli::Device.login_cmd('arista')} #{@host}"
      end
    end
  end
end
