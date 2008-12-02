class Hash
  
  def to_get
    "?" + self.collect { |k,v| "#{k.to_s}=#{v}" }.join("&")
  end
  
end