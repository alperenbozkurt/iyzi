module Iyzi
  module PkiBuilders
    class Cancel < PkiBuilder
      ATTRIBUTES_ORDER = %w{        
        paymentId
        conversationId
        ip
        locale
      }.freeze

      def initialize(values = {})
        super(values, ATTRIBUTES_ORDER)
      end
    end
  end
end