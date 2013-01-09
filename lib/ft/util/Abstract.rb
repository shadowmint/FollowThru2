# Simple abstract class
module Abstract
  def check
    local = self.methods - Object.methods
    templates = []
    methods = []
    local.each do |l|
      if l =~ /__(.*)/
        templates.push $1
      end
      methods.push l.to_s
    end
    if !((templates & methods) == templates)
      raise "Class #{self.class.name} does not implement the required interface #{templates}"
    end
  end
end
