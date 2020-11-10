module ActiveSupport
  module Dependencies
    extend self # all methods will be module/class methods

    attr_accessor :autoload_paths
    self.autoload_paths = []

    def search_for_file(name)
      autoload_paths.each do |path|
        file = File.join(path, "#{name}.rb")
        return file if File.file?(file)
      end
      nil
    end
  end
end

class Module
  def const_missing(name)
    file_name = name.to_s.underscore

    if file = ActiveSupport::Dependencies.search_for_file(file_name)
      require file.sub(/\.rb$/, '')
      const_get(name)
    else
      raise NameError, "Uninitialized constatnt #{name}"
    end
  end
end
