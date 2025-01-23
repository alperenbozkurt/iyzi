module Iyzi
  module Requests
    class Refund < Request
      def initialize(options = {})
        super(Endpoints::HTTP_POST, Endpoints::REFUND, options)
      end

      def to_pki
        PkiBuilders::Refund.new(iyzi_options).request_string
      end
    end
  end
end