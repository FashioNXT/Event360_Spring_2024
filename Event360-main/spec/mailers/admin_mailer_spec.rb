require "rails_helper"

RSpec.describe AdminMailer, type: :mailer do
  describe "create" do
    let(:user) { FactoryBot.create(:user) }
    let(:mail) { AdminMailer.with(user: user).create }

    # it "renders the headers" do
    #   expect(mail.to).to eq(["crmnxt@gmail.com"])
    # end

    it "renders the body" do
      #expect(mail.body.encoded).to match("A new user has registered")
      expect(mail.body.encoded).to match("Hi Administrator")
    end
  end
end
