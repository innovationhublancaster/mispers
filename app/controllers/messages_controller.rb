class MessagesController < ApplicationController

  def receive
    mobile = params['from']
    response = params['content']

    @user = User.find_by_mobile(mobile)

    if response.downcase == 'n' || response.downcase == "stop"
      Story.story_end(@user)
    else
      Story.continue(@user)
    end


    logger.debug("==============================")
    logger.debug(@user.inspect)
    logger.debug(response)
    logger.debug("==============================")

    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

end
