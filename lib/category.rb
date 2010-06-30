class Category
  
  attr_reader :slug, :name

  def initialize(options={})
    options.each_pair { |key, value| instance_variable_set("@#{key}", value) if self.respond_to? key }
  end
  
  def permalink
    "/temata/#{slug}"
  end

  def self.all
    {
      "podnikani"=>"Podnikání",
      "praha-7"=>"Praha 7",
      "praha"=>"Praha",
      "opencard"=>"OpenCard"
    }.collect{|category| Category.new(:slug=>category[0], :name=>category[1]) }
  end

  def self.find(id)
    category = all.detect{|key,value| key==id}
    category ? Category.new(:slug=>id, :name=>category[1]) : nil
  end

end