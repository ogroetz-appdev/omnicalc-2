class TranslateController < ApplicationController

  require "google/cloud/translate"

  def translate_form
    render({ :template => "/translate_form.html.erb" })
  end

  def translate_results
    @text_to_translate = params.fetch("text_to_translate")
    @target_lang = params.fetch("language_to")

    gt_client = Google::Cloud::Translate.new({ :version => :v2 })
    @translation = gt_client.translate(@text_to_translate, { :to => @target_lang })

    recipient_number = params.fetch("phone_number", false)
    @recipient_number = "+1" + recipient_number.gsub("-", "")
    
    # Translate into target language and SMS (if number provided).

    # Get your credentials from your Twilio dashboard, or from Canvas if you're using mine
    twilio_sid = ENV.fetch("TWILIO_ACCOUNT_SID")
    twilio_token = ENV.fetch("TWILIO_AUTH_TOKEN")
    twilio_sending_number = ENV.fetch("TWILIO_SENDING_NUMBER")

    # Create an instance of the Twilio Client and authenticate with your API key
    twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

    # Craft your SMS as a Hash literal with three keys
    sms_parameters = {
      :from => twilio_sending_number,
      :to => @recipient_number, # Put your own phone number here if you want to see it in action
      :body => @translation
    }

    # Send your SMS!
    twilio_client.api.account.messages.create(sms_parameters)


    render({ :template => "/translate_results.html.erb" })
  end


end