require 'qmin/qmin'
require 'qmin/core_ext/class'
require 'qmin/core_ext/string'
require 'qmin/strategy/inline'
require 'qmin/strategy/noop'

if defined? Resque
  require 'qmin/resque/background_call_job'
  require 'qmin/resque/base_job'
  require 'qmin/strategy/resque'
end

module Qmin
  MustDefineStrategyError = Class.new(StandardError)

  protected

  def self.method_name_for_instance(instance, method_name)
    if instance.respond_to? :"#{method_name}_without_qmin"
      :"#{method_name}_without_qmin"
    else
      method_name
    end
  end
end
