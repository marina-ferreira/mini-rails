module ActionController
  class Base < Metal
    include Callbacks
    include Redirecting
    include RequestForgeryProtection
    include ImplicitRender
    include ActionView::Rendering
  end
end
