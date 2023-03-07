class Api::V1::GlossariesController < ApplicationController
    def index
        @glossaries = Glossary.all
        render json: @glossaries, status: 200
    end

    def show
        glossary = Glossary.find_by(id: params[:id])
        if glossary
            result_array = Hash[
                "id" => glossary.id,
                "source_language_code" => glossary.source_language_code,
                "target_laguage_code" => glossary.target_laguage_code,
                "terms" => glossary.terms
            ]
            render json: result_array, status: 200
        else
            render json: {
                error: "Glossary not found"
            }
        end
    end

    def create
        glossary = Glossary.new(
            source_language_code: glossary_params[:source_language_code],
            target_laguage_code: glossary_params[:target_laguage_code]
        )

        if glossary.save
            render json: glossary, status: :created
        else
            render json: {
                error: "Create Error"
            }
        end
    end

    private
    def glossary_params
        params.require(:glossary).permit([
            :source_language_code,
            :target_laguage_code
        ])
    end
end
