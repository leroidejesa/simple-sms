class Message < ActiveRecord::Base
  before_create :send_message

private

  def send_message
    response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/AC7053b45d369df1c53b689ed788fe393b/Messages.json',
      :user => 'AC7053b45d369df1c53b689ed788fe393b',
      :password => '207d064714476a748028c1059db43b8e',
      :payload => { :Body => body,
                    :To => to,
                    :From => from }
    ).execute
  end
end
