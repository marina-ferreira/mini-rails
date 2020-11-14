class Hash
  def symbolize_keys
    dup.symbollize_keys!
  end

  def symbollize_keys!
    keys.each do |key|
      self[(key.to_sym rescue key) || key] = delete(key)
    end

    self
  end
end
