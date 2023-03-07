class Api::V1::TranslationsController < ApplicationController
    def create
        @glossary_value = glossary
        if @glossary_value.nil?
            render json: {
                error: "Translation does not match the glossary."
            }
        else
            translation = Translation.new(
                source_language_code: trans_params[:source_language_code],
                target_language_code: trans_params[:target_language_code],
                source_text: trans_params[:source_text],
                glossary_id: @glossary_value,
            )
            if translation.save
                render json: translation, status: :created
            else
                render json: {
                    error: "Create Error"
                }
            end
        end
    end

    def show
        @translation = Translation.find_by(id: params[:id])
        if @translation
            @glossary = Glossary.find_by(id: @translation[:glossary_id])
            @source_text = @translation.source_text.split(" ")
            @glossary.terms.each do | glos |
                @new_string = ""
                @source_text.each do | val |
                    if val == glos.source_term
                        @new_string += " <HIGHLIGHT>" + val + "</HIGHLIGHT> "
                    else
                        @new_string += " "+val
                    end
                end
            end
            render json: @new_string, status: 200
        else
            render json: {
                error: "Translation not found"
            }
        end
    end

    private
    def trans_params
        params.require(:translation).permit([
            :source_language_code,
            :target_language_code,
            :source_text,
            :glossary_id
        ])
    end

    def glossary
        if params[:glossary_id]
            @glos = Glossary.where(
                source_language_code: trans_params[:source_language_code],
                target_laguage_code: trans_params[:target_language_code],
                id: trans_params[:glossary_id]
            ).count
            if @glos > 0
                return params[:glossary_id]
            end

            return nil
        end
        return nil
    end
end
