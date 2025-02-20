require_relative 'config/environment'

class App < Sinatra::Base
  get '/reversename/:name' do
    "#{params[:name].reverse}"
  end

  get '/square/:number' do
    "#{params[:number].to_i**2}"
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase]
    # binding.pry
    return_string= ''
    @number.times do 
      return_string << @phrase
    end
    return_string
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    number = 1
    return_string = ""
    while number <= params.count
      return_string << params["word#{number}"]
      return_string << " " if number != params.count
      number += 1
    end
    return_string + "."
  end

  get '/:operation/:number1/:number2' do
    num1 = params[:number1].to_i
    num2 = params[:number2].to_i
    case params[:operation]
      when "add"
        (num1 + num2).to_s
      when "subtract"
        (num1 - num2).to_s
      when "multiply"
        (num1 * num2).to_s
      when "divide"
        (num1 / num2).to_s
    end
  end

end