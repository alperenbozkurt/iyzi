module Iyzi
  module PkiBuilders
    class Refund < PkiBuilder
      ATTRIBUTES_ORDER = %w{
        ip
        price
        paymentId
        locale
        conversationId
      }.freeze

      def initialize(values = {})
        super(values, ATTRIBUTES_ORDER)
      end
    end
  end
end