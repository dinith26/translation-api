require 'rails_helper'

RSpec.describe "Api::V1::Glossaries", type: :request do
  describe 'GET All glossaries' do
    it 'return all glossaries with terms' do
      FactoryBot.create(:glossary, source_language_code: 'en', target_laguage_code: 'English')
      FactoryBot.create(:glossary, source_language_code: 'bi', target_laguage_code: 'Bislama')

      get '/api/v1/glossaries'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST /glossaries' do
    it 'create a new glossariy' do
      expect {
        post '/api/v1/glossaries', params: {glossary: {source_language_code: 'eo', target_laguage_code: 'Esperanto'}}
      }.to change { Glossary.count }.from(0).to(1)


      expect(response).to have_http_status(:created)
    end
  end

end
