class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
#create New Figure

    @figure = Figure.create(params["figure"])
#assign landmark if needed
    if !params[:landmark][:name].empty?
      binding.pry
      @figure.landmarks << Landmark.create(params[:landmark])
    end

#assign title if needed
    if !params[:title][:name].empty?
      binding.pry
      @figure.titles << Title.create(params[:title])
    end
    @figure.save

    redirect to "figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])

    erb :'figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:landmark].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    if !params[:title].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

end
