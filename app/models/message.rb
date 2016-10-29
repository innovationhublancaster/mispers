class Message < ActiveRecord::Base
  belongs_to :story

  def send_message(mobile)
    require 'clockwork'

    api = Clockwork::API.new( CLOCKWORK_API )
    message = api.messages.build( :to => mobile, :content => content, :from => '447860033589' )
    response = message.deliver

    if response.success
        puts response.message_id
    else
        puts response.error_code
        puts response.error_description
    end
  end
end
