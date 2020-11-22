module ActionView
  module Rendering
    def render(action)
      context = Base.new(view_assigns)
    end

    def view_assigns
      assigns = {}

      instance_variables.each do |name|
        assigns[name[1..-1]] = instance_variable_get(name)
      end

      assigns
    end
  end
end
