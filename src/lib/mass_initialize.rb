# module helper to allow attribute mass assignment on init 
module MassInitialize
  def initialize(attrs = {})
    attrs.each do |k,v|
      send("#{k}=", v) if self.respond_to?("#{k}=")
    end
  end
end