module Iyzi
  module Requests
    class Cancel < Request
      def initialize(options = {})
        super(Endpoints::HTTP_POST, Endpoints::CANCEL, options)
      end

      def to_pki
        PkiBuilders::Cancel.new(iyzi_options).request_string
      end
    end
  end
end