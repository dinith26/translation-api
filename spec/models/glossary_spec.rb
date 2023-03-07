require 'rails_helper'

RSpec.describe Glossary, type: :model do
    context 'Validation Test' do
        it 'ensure source_language_code presence' do
            glossary = Glossary.new(source_language_code: 'en').save
            expect(glossary).to eq(false)
        end

        it 'ensure target_laguage_code presence' do
            glossary = Glossary.new(target_laguage_code: 'English').save
            expect(glossary).to eq(false)
        end
    end
end
