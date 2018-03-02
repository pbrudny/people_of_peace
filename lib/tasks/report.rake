namespace :report do
  desc 'Send E-mail report'
  task send: :environment do
    if Date.today.friday?
      ::Users::SendReport.new.call
    else
      puts '[Nothing sent] Sorry. Report can be sent on fridays only!'
    end
  end
end
