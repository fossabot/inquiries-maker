require 'rails_helper'

RSpec.describe MovingInquiry, type: :model do
  before(:all) do
   @inquiry = build(:moving_inquiry)
  end

  context "request type" do
    it "should not have is_moving_request set nil" do
      expect(@inquiry.is_moving_request).to_not be_nil
    end
    it "should have is_moving_request set to true" do
      expect(@inquiry.is_moving_request).to be_truthy
    end
    it "should not have is_moving_request set to false" do
      expect(@inquiry.is_moving_request).to_not be_falsy
    end
    it "is not valid without is_moving_request" do
      inquiry2 = build(:moving_inquiry, is_moving_request: nil)
      expect(inquiry2).to_not be_valid
    end
    it "is not valid when is_moving_request with set to false" do
      inquiry2 = build(:moving_inquiry, is_moving_request: false)
      expect(inquiry2).to_not be_valid
    end
    it "should not have is_cleaning_request set nil" do
      expect(@inquiry.is_cleaning_request).to_not be_nil
    end
    it "should have is_cleaning_request set to false" do
      expect(@inquiry.is_cleaning_request).to be_falsy
    end
    it "should not have is_cleaning_request set to true" do
      expect(@inquiry.is_cleaning_request).to_not be_truthy
    end
    it "is not valid without is_cleaning_request" do
      inquiry2 = build(:moving_inquiry, is_cleaning_request: nil)
      expect(inquiry2).to_not be_valid
    end
    it "is not valid when is_cleaning_request with set to true" do
      inquiry2 = build(:moving_inquiry, is_cleaning_request: true)
      expect(inquiry2).to_not be_valid
    end
    it "is_cleaning_request & is_moving_request should both be booleans" do
      inquiry2 = build(:moving_inquiry, is_cleaning_request: "string",is_moving_request: "😇")
      expect(inquiry2).to_not be_valid
    end
    it "is_cleaning_request = false & is_moving_request = true" do
      inquiry2 = build(:moving_inquiry, is_cleaning_request: false , is_moving_request: true)
      expect(inquiry2).to be_valid
    end
    it "is_cleaning_request = true & is_moving_request = false" do
      inquiry2 = build(:moving_inquiry, is_cleaning_request: true, is_moving_request: false)
      expect(inquiry2).to_not be_valid
    end
    it "is not valid is_cleaning_request & is_moving_request are both true" do
      inquiry2 = build(:moving_inquiry, is_cleaning_request: true, is_moving_request: true)
      expect(inquiry2).to_not be_valid
    end
    it "is not valid is_cleaning_request & is_moving_request are both false" do
      inquiry2 = build(:moving_inquiry, is_cleaning_request: false, is_moving_request: false)
      expect(inquiry2).to_not be_valid
    end
  end

  context "client_salutation" do
    it "is within ['Mr','Mrs','Herr','Frau','M.','Mme']" do
      expect(@inquiry.client_salutation).to be_in(%w[Mr Mrs Herr Frau M. Mme])
    end
    it "is not valid without a client_salutation" do
      inquiry2 = build(:moving_inquiry, client_salutation: nil)
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts strings not integers" do
      inquiry2 = build(:moving_inquiry, client_salutation: 1)
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts strings not bools" do
      inquiry2 = build(:moving_inquiry, client_salutation: false)
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts strings not arrays" do
      inquiry2 = build(:moving_inquiry, client_salutation: ["Herr"])
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts strings not arrays with hashes" do
      inquiry2 = build(:moving_inquiry, client_salutation:[{}])
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts Mr, Mrs, Herr, Frau, M., Mme" do
      inquiry2 = build(:moving_inquiry, client_salutation: "Meneer")
      expect(inquiry2).to_not be_valid
    end
  end

  context "locale" do
    it "is within ['de','en','fr]" do
      expect(@inquiry.locale).to be_in(%w[de en fr])
    end
    it "is not valid without a locale" do
      inquiry2 = build(:moving_inquiry, locale: nil)
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts strings not integers" do
      inquiry2 = build(:moving_inquiry, locale: 1)
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts strings not bools" do
      inquiry2 = build(:moving_inquiry, locale: false)
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts strings not arrays" do
      inquiry2 = build(:moving_inquiry, locale: ["de"])
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts strings not arrays with hashes" do
      inquiry2 = build(:moving_inquiry, locale:[{}])
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts de, en, fr" do
      inquiry2 = build(:moving_inquiry, locale: "nl")
      expect(inquiry2).to_not be_valid
    end
  end

  context "client_first_name & client_last_name" do
    it "is not valid when empty" do
      inquiry2 = build(:moving_inquiry, client_first_name: "  ", client_last_name: "  ")
      expect(inquiry2).to_not be_valid
    end
    it "is not valid when nil" do
      inquiry2 = build(:moving_inquiry, client_first_name: nil, client_last_name: nil)
      expect(inquiry2).to_not be_valid
    end
  end
  # xit "is not valid without a description"
  # xit "is not valid without a start_date"
  # xit "is not valid without a end_date"
end
