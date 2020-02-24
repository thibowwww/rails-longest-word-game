require "open-uri"
require "json"

class GamesController < ApplicationController
  def new
    @letter = []
    10.times do
      @letter << ('a'..'z').to_a.sample
    end
  end

  def score
    @answer = params[:question]
    @letters = params[:letters]
    @result = valid?(@letters, @answer)
  end

  private

  def letters_included
    if included?(attempt.upcase, grid)
      if english_word?(attempt)
        score = compute_score(attempt, time)
        [score, "well done"]
      else
        [0, "not an english word"]
      end
    else
      [0, "not in the grid"]
    end
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end

  def valid?(letters, answer)
    if included?(letters, answer)
      if english_word(answer)
        ‘you win’
      else
        ‘try again is not an english word’
      end
    else
      ‘try again your letters is not in the grid’
    end
  end


end

