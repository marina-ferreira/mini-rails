module ActionView
  class Base
    include CompiledTemplates

    def initialize(assigns = {})
      assigns.each_pair do |name, value|
        instance_variable_set "@#{name}", value
      end
    end
  end
end
