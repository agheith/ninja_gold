class NinjasController < ApplicationController
  def index

      if !session[:gold]
          session[:gold] = 0
          session[:activities] = []
      end
      @gold = session[:gold]
      @activities = session[:activities]
  end

  def farm
      amount = rand(10..20)
    #   render json: amount
    session[:gold] += amount
    obj = {won:true, sentence:"You won #{amount} form farm"}
    session[:activities].push(obj)

    redirect_to '/'
  end


  def cave
      amount = rand(5..10)
    #   render json: amount
    session[:gold] += amount
    obj = {won:true, sentence:"You won #{amount} form cave"}
    session[:activities].push(obj)
    redirect_to '/'
  end


  def house
      amount = rand(2..5)
    #   render json: amount
    session[:gold] += amount
    obj = {won:true, sentence:"You won #{amount} form house"}
    session[:activities].push(obj)
    redirect_to '/'
  end

  def casino
    amount = rand(0..50)
    #   render json: amount
    gamble = rand(1..2)

    if gamble == 1
        session[:gold] += amount
        obj = {won:true, sentence:"You won #{amount} form casino"}
        session[:activities].push(obj)
    else
        session[:gold] -= amount
        obj = {won:false, sentence:"You lost #{amount} from casino"}
        session[:activities].push(obj)
    end

    redirect_to '/'
  end

  def reset
    #   session.delete(:count) //just the count, not the eniter session
      reset_session #wipe out entire session
      redirect_to '/'
  end

end

############################################################
#################### CodingDojo AnswerSheet ################
############################################################


# class RpgController < ApplicationController
#   def index
#     session[:gold] ||= 0
#     session[:activities] ||= []
#
#     @gold = session[:gold]
#     @activities = session[:activities]
#   end
#
#   def new
#     if params[:building] == 'farm'
#       gold = rand(10..20)
#     elsif params[:building] == 'cave'
#       gold = rand(5..10)
#     elsif params[:building] == 'house'
#       gold = rand(2..5)
#     elsif params[:building] == 'casino'
#       gold = rand(-50..50)
#     end
#
#     current_time = Time.now
#
#     if gold > 0
#       session[:activities] << "Earned #{gold} golds from the #{params[:building]}! (#{current_time.strftime('%Y/%m/%d %l:%M %P')})"
#     else
#       session[:activities] << "Entered a casino and lost #{gold} golds... Ouch. (#{current_time.strftime('%Y/%m/%d %l:%M %P')})"
#     end
#
#     session[:gold] += gold
#     redirect_to :root
#   end
# end
