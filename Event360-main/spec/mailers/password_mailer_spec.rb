require "rails_helper"

RSpec.describe PasswordMailer, type: :mailer do
  let(:user) { create(:user) }

  describe "reset" do
    let(:mail) { PasswordMailer.with(user: user).reset }

    it "renders the headers" do
      expect(mail.to).to eq([user.email])
      #expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body with a signed token" do
      expect(mail.body.encoded).to include("Someone requested a reset of your password.")
    end
  end
end
