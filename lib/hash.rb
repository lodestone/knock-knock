class Hash
  
  def to_get
     c = "&" +self.collect { |k,v| "#{k.to_s.gsub('_','-')}=#{v}" }.join("&") 
  end
  
end