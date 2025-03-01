module Iyzi
  module Resources
    def api_test
      Requests::ApiTest.new.response
    end

    def checkout_form(options, &block)
      Requests::CheckoutForm.new(options).response(&block)
    end

    def checkout_form_auth(options, &block)
      Requests::CheckoutFormAuth.new(options).response(&block)
    end

    def payment_auth(options, &block)
      Requests::PaymentAuth.new(options).response(&block)
    end

    def register_card(options, &block)
      Requests::CardStorage.add(options).response(&block)
    end

    def list_cards(options, &block)
      Requests::CardStorage.list(options).response(&block)
    end

    def delete_card(options, &block)
      Requests::CardStorage.delete(options).response(&block)
    end

    def bin_control(options, &block)
      Requests::BinControl.new(options).response(&block)
    end

    def installment_info(options, &block)
      Requests::InstallmentInfo.new(options).response(&block)
    end

    def threeds_initialize(options, &block)
      Requests::ThreedsInitialize.new(options).response(&block)
    end

    def threeds_payment_create(options, &block)
      Requests::ThreedsPaymentCreate.new(options).response(&block)
    end

    def refund(options, &block)
      Requests::Refund.new(options).response(&block)
    end

    def cancel(options, &block)
      Requests::Cancel.new(options).response(&block)
    end
  end
end
