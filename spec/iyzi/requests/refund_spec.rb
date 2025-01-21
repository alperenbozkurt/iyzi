require 'spec_helper'

describe Iyzi::Requests::Refund do
  before { stub_random_string }
  
  let(:config) do
    Iyzi::Configuration.new(
      api_key:  ENV['IYZI_SANDBOX_API_KEY'] || 'x',
      secret:   ENV['IYZI_SANDBOX_SECRET'] || 'x',
      base_url: ENV['IYZI_SANDBOX_BASE_URL'] || 'https://sandbox-api.iyzipay.com/'
    )
  end

  describe '#refund' do
    let(:request) { described_class.new(config) }
    let(:params) do
      {
        locale: 'tr',
        conversationId: 'test_conversation_id',
        paymentId: '12345678',
        price: '100.0',
        ip: '85.34.78.112'
      }
    end

    context 'when successful' do
      before do
        stub_request(:post, "#{config.base_url}v2/payment/refund")
          .to_return(
            status: 200,
            body: {
              status: 'success',
              locale: 'tr',
              systemTime: 1458545234852,
              conversationId: 'test_conversation_id',
              paymentId: '12345678',
              paymentTransactionId: '123456789',
              price: '100.0',
              currency: 'TRY',
              hostReference: 'ref_123456789',
            }.to_json,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'returns success response' do
        response = request.refund(params)
        expect(response.status).to eq('success')
        expect(response.payment_id).to eq('12345678')
        expect(response.price).to eq('100.0')
        expect(response.currency).to eq('TRY')
      end
    end

    context 'when failed' do
      before do
        stub_request(:post, "#{config.base_url}v2/payment/refund")
          .to_return(
            status: 400,
            body: {
              status: 'failure',
              errorCode: '5001',
              errorMessage: 'Invalid payment id',
              locale: 'tr',
              systemTime: 1458545234852,
              conversationId: 'test_conversation_id'
            }.to_json,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'returns error response' do
        response = request.refund(params)
        expect(response.status).to eq('failure')
        expect(response.error_code).to eq('5001')
        expect(response.error_message).to eq('Invalid payment id')
      end
    end
  end
end
