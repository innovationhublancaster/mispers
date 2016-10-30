class MessagesController < ApplicationController

  def receive
    mobile = params['from']
    response = params['content']

    @user = User.find_by_mobile(mobile)

    if response.to_s.downcase == 'n' || response.to_s.downcase == "stop"
      Story.story_end(@user)
    else
      Story.continue(@user, response.to_s.downcase)
    end


    logger.debug("==============================")
    logger.debug(@user.inspect)
    logger.debug(response)
    logger.debug("==============================")

    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

end
