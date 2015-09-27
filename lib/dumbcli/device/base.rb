require 'net/telnet'

module Dumbcli
  module Device
    class Base
      def initialize(host, options={})
        raise ArgumentError, 'host is required' unless host
        @host = host
        @options = options
      end

      def execute(cmd)
        raise ArgumentError, 'cmd is required' unless cmd

        connect unless established?

        Dumbcli.logger.info "Executing: #{cmd}"
        @connection.cmd(cmd).tap {|result|
          Dumbcli.logger.debug result
        }
      end
      alias exec execute

      def established?
        @connection && !@connection.sock.closed?
      end

      def connect
        return if established?

        Dumbcli.logger.info "Trying to connect #{@host}"
        @connection = Net::Telnet.new('Prompt' => prompt,
                                      'Proxy' => IO.popen(login_cmd, 'r+'),
                                      'Timeout' => @options[:timeout] || 30)

        begin
          result = @connection.waitfor(prompt)
          if result =~ error_code
            @connection.close
            raise $1
          end
        rescue
          @connection.close
          raise
        end
      end

      def close
        return unless established?

        execute_exit
      end


      private

      def login_cmd
        raise 'Not implemented yet'
      end

      def prompt
        p = /\S+(?:>|#)\s*/
        /#{p}(?:[\n\r]+#{p})*/
      end

      def error_code
        /^Error:\s*(.*)$/
      end

      def execute_exit
        unless execute('exit') =~ /connection closed|Connection to \S+ closed\./i  # see clogin
          sleep 1         # wait a bit until completely close
          execute 'exit'  # even from 'configure terminal' mode. see clogin
        end
      end

      def read
        return unless established?
        result = ''

        begin
          loop do
            result << @connection.sock.read_nonblock(1024)
          end
        rescue Errno::EAGAIN, Errno::EINTR, EOFError
        end

        result
      end

      def flush
        result = ''
        sleep 0.5

        until (remainder = read).empty?
          result << remainder
        end

        result
      end
    end
  end
end
