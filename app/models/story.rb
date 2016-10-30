class Story < ActiveRecord::Base
  has_many :messages
  has_many :users


  def self.start_story(id, user)
    s = Story.find(id)
    s.messages.find_by_order(1).send_message(user.mobile)
    user.update_attributes(story_progress: 1, story_id: id)

    if s.messages.find_by_order(1).continue == true
      sleep(2)
      Story.continue(user, "")
    end
  end

  def self.continue(user, msg_response)
    logger.debug(user.inspect)
    s = user.story
    sp = user.story_progress
    logger.debug(s.inspect)

    if s.messages.find_by_order(sp+1).present?
      msg = s.messages.find_by_order(sp+1)
      msg.send_message(user.mobile)
      user.update_attributes(story_progress: sp+1)

      if msg.continue == true
        sleep(2)
        Story.continue(user, "")
      end
    elsif s.messages.find_by_order(sp).branches == true

      msg = s.messages.find_by_order(sp)

      if msg_response == "a"
        s = Story.find(msg.branches_to_one)
        s.messages.find_by_order(1).send_message(user.mobile)
        user.update_attributes(story_progress: 1, story_id: s.id)

        if s.messages.find_by_order(1).continue == true
          sleep(2)
          Story.continue(user, "")
        end
      elsif msg_response == "b"
        s = Story.find(msg.branches_to_two)
        s.messages.find_by_order(1).send_message(user.mobile)
        user.update_attributes(story_progress: 1, story_id: s.id)

        if s.messages.find_by_order(1).continue == true
          sleep(2)
          Story.continue(user, "")
        end
      else
        Message.send_message(user.mobile, "Sorry, I could not understand please reply with 'A' or 'B'")
      end
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
