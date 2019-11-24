namespace :notification do
  desc "Sends SMS notification to employees asking them to had over time or not"
  task sms: :environment do
    puts "i m in a rake task"
  end

end
