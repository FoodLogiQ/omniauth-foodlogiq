require 'spec_helper'

describe OmniAuth::Strategies::FoodLogiQ do
  subject do
    OmniAuth::Strategies::FoodLogiQ.new({})
  end

  context "client options" do
    it 'should have correct site' do
      subject.options.client_options.site.should eq("http://localhost:3000")
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_url.should eq('http://localhost:3000/oauth/authorize')
    end

    it 'should have correct token url' do
      subject.options.client_options.token_url.should eq('http://localhost:3000/oauth/access_token')
    end
  end

end
