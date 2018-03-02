namespace :report do
  desc 'Send E-mail report'
  task send: :environment do
    ::Users::SendReport.new.call
  end
end
