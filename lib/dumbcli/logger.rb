require 'logger'

module Dumbcli
  class Logger < ::Logger
    CLEAR   = "\e[0m"
    COLORS = {
      'INFO'  => "\e[32m",  # green
      'WARN'  => "\e[33m",  # yellow
      'ERROR' => "\e[35m",  # magenta
      'FATAL' => "\e[31m",  # red
    }

    def initialize(logdev, shift_age = 0, shift_size = 1048576)
      super
      @level = INFO
    end

    def format_message(severity, datetime, progname, msg)
      if COLORS[severity]
        "#{COLORS[severity]}#{super}#{CLEAR}"
      else
        super
      end
    end
  end
end
