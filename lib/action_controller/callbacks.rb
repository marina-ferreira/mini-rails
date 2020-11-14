module ActionController
  module Callbacks
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def before_action(method, options = {})
        before_actions << Callback.new(method, options)
      end

      def before_actions
        @before_action ||= []
      end
    end
  end
end
