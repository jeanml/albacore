require "ostruct"
require "albacore/support/openstruct"

module Configuration
  module NUnit
    include Albacore::Configuration

    def self.nunitconfig
      @config ||= OpenStruct.new.extend(OpenStructToHash).extend(NUnit)
    end

    def nunit
      config ||= NUnit.nunitconfig
      yield(config) if block_given?
      config
    end
  end
end
