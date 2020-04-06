class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: [:show]
  before_action :authenticate_user, only: [:create]

  # get all questionnaires
  def index
    @questionnaires = Questionnaire.all

    render json: @questionnaires
  end

  # a single questionnaire
  def show
    if @questionnaire.questions.exists?
      render json: @questionnaire.to_json(
        include: { questions: { only: %w[name label id] } }
      )
    else
      render json: @questionnaire
    end
  end

  # POST /questionnaires
  def create
    @questionnaire = current_user.questionnaires.build(questionnaire_params)

    if @questionnaire.save
      render json: @questionnaire, status: :created, location: @questionnaire
    else
      render json: @questionnaire.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def questionnaire_params
    params.require(:questionnaire).permit(
      :title,
      questions_attributes: %i[name label id]
    )
  end
end
