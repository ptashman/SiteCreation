class UserMailer < ActionMailer::Base
  default :from => "from@example.com"

  def contact_request(user, current_user)
    @user = user
    @current_user = current_user
    @greeting = "Hi #{@user.name}. One of our users would like to trade with you. If you're interested, please contact #{@current_user.email} to complete the trade. Have a great day!"

    mail(:from => @current_user.email, :to => @user.email, :subject => "Trade Request")
  end
end