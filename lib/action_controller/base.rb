module ActionController
  class Base < Metal
    include Callbacks
    include Redirecting
    include RequestForgeryProtection
  end
end
