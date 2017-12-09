class SendersController < ApplicationController

  get '/senders' do
    if logged_in?
      @senders = current_user.senders
      erb :'/senders/index'
    else
      '/'
    end
  end

end
