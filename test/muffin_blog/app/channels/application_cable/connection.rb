module ApplicationCable
  class Connection < ActionCable::Connection::Base
    def connect
      close if request.params['token'] != 'valid'
    end
  end
end
