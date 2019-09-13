class Channel
  
  attr_reader :name, :slack_id, :topic, :member_count 
  
  #If inheriting from parent class, do I need to include inherited keyword arguments? 
  
  def initialize(name:, slack_id:, topic:, member_count:)
    
    if name.class != String
      raise ArgumentError.new, "wrong format for initiating name"
    end
    @name = name
    
    if slack_id.class != String 
      raise ArgumentError.new, "wrong format for initiating id"
    end
    @slack_id = slack_id
    
    if topic.class != String
      raise ArgumentError.new, "Wrong format for topic!"
    end 
    @topic = topic
    
    if member_count.class != Integer 
      raise ArgumentError.new, "Wrong format for member count!"
    end 
    @member_count = member_count
  end 
  
end