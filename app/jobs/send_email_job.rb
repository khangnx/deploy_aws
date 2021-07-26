class SendEmailJob < ApplicationJob
  queue_as :default

  def perform user
    puts "start sidekiq"
    NotifierMailer.user_register_email(user).deliver_now
    puts "end sidekiq"
    # Do something later
  end
end
