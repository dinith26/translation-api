require 'rails_helper'

RSpec.describe "Api::V1::Translations", type: :request do
  describe 'GET All Translations' do
    it 'return all translations' do
      FactoryBot.create(:translation, source_language_code: 'en', target_language_code: 'English', source_text: 'This is a recruitment task', glossary_id: 1)

      get '/api/v1/translations/show'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end
end
