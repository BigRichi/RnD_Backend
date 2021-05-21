class QuestionsController < ApplicationController

    require 'net/http'

    def index
        @questions = Question.all 
        render json: @questions
    end 

    # def show
    #     byebug
    #     @question = Question.find_by(params[:category])
    #     render json: @question
    # end

    def choosegame
        form_answers = params.permit!()
        # byebug
        # [:difficulty, :num_of_questions, :category]
        uri = URI("https://opentdb.com/api.php?amount=#{form_answers["num_of_questions"]}&category=#{form_answers["category"]}&difficulty=#{form_answers["difficulty"]}")
        
        resp = Net::HTTP.get(uri)

        @questions = JSON.parse(resp)
        
        @questions["results"].each do |q|

            question = {
                category: q["category"],
                question_type: q["type"],
                difficulty: q["difficulty"],
                question: q["question"],
                correct_answer: q["correct_answer"],
                incorrect_answers: q["incorrect_answers"],
                points: 10
            }

            # Question.create(question)

            

        end 

        render json: @questions["results"]
        # byebug
    end 

    private

    # def choose_game_params
        

end
