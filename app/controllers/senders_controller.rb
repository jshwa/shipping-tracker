class SendersController < ApplicationController

  get '/senders' do
    if logged_in?
      @senders = current_user.senders
      erb :'/senders/index'
    else
      '/'
    end
  end

  get '/senders/:id' do
    if logged_in?
      @sender = Sender.find(params[:id])
      if current_user.senders.include?(@sender)
        erb :'/senders/show'
      else
        redirect to '/senders'
      end
    else
      redirect to '/'
    end
  end

end
