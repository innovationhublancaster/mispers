class Story < ActiveRecord::Base
  has_many :messages
  has_many :users


  def self.start_story(id, user)
    s = Story.find(id)
    s.messages.find_by_order(1).send_message(user.mobile)
    user.update_attributes(story_progress: 1, story_id: id)
  end

  def self.continue(user)
    logger.debug(user.inspect)
    s = user.story
    sp = user.story_progress
    logger.debug(s.inspect)
    if s.messages.find_by_order(sp+1).present?
       s.messages.find_by_order(sp+1).send_message(user.mobile)
       user.update_attributes(story_progress: sp+1)
    else
      # end story
      Message.send_message(user.mobile, "Thanks you for playing....")
    end
  end

  def self.story_end(user)
    Message.send_message(user.mobile, "Thanks you for playing....")
    user.update_attributes(story_progress: nil, story_id: nil)
  end

end
