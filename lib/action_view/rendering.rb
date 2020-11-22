module ActionView
  module Rendering
    def render(action)
      context = Base.new(view_assigns)
      path = template_path(action)

      content = Template.find(path).render(context)

      response.body = [content]
    end

    def view_assigns
      assigns = {}

      instance_variables.each do |name|
        assigns[name[1..-1]] = instance_variable_get(name)
      end

      assigns
    end

    def template_path(action)
      "#{Rails.root}/app/views/#{controller_name}/#{action}.html.erb"
    end

    def controller_name
      self.class.name.chomp('Controller').underscore
    end
  end
end
