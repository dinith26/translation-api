class Api::V1::TermsController < ApplicationController
    def index
    end

    def create
        term = Term.new(
            source_term: term_params[:source_term],
            target_term: term_params[:target_term],
            glossary_id: params[:glossary_id]
        )

        if term.save
            render json: term, status: 200
        else
            render json: {
                error: "Create Error"
            }
        end
    end

    private
    def term_params
        params.require(:term).permit([
            :source_term,
            :target_term,
            :glossary_id
        ])
    end
end
