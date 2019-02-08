require './lib/exercise_4.rb'

describe EmailClient do
  it 'should return a new message' do
    @message_double = double(:message)
    @message_class_double = double(:message_class, new: @message_double)

    @email_client = EmailClient.new(@message_class_double)

    expect(@email_client.message).to eq(@message_double)
  end
end

describe SayHelloToMyLittleFriend do
  it 'should send an email' do
    @message_double = double(:message, send: '')
    @email_client_double = double(:email_client, message: @message_double)
    @email_client_class_double = double(:email_client_class_double, new: @email_client_double)

    SayHelloToMyLittleFriend.new(@email_client_class_double).run

    expect(@message_double).to have_received(:send).with("friend@example.com","HELLO!")
  end
end