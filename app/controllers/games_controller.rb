class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    initial_letters = params[:array_of_letters].split(" ")
    score_array = params[:score].upcase.chars
    url = "https://wagon-dictionary.herokuapp.com/#{params[:score]}"
    url_to_parse = open(url).read
    all_words = JSON.parse(url_to_parse)

    if all_words["found"] == true && (score_array - initial_letters).empty?
      @score = "Congratulations! #{params[:score].upcase} is a valid English word!"
    elsif all_words["found"] == false
      @score = "Sorry but #{params[:score].upcase} does not seem to be a valid English word..."
    else
      @score = "Sorry but #{params[:score].upcase} can't be built out of #{initial_letters}..."
    end
    @score
  end
end
