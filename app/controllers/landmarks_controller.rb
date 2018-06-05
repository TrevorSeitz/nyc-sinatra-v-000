class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
#create New Landmark
    @landmark = Landmark.create(params["landmark"])
#assign figure if needed
    if !params[:figure][:name].empty?
      @landmark.figures << Figure.create(params[:figures])
    end

#assign title if needed
    if !params[:title][:name].empty?
      @landmark.titles << Title.create(params[:title])
    end

    @landmark.save

    redirect to "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])

    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])

    erb :'landmarks/edit'
  end

  patch '/landmark/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    if !params[:figures][:name].empty?
      @landmark.figures << Figure.create(params[:figure])
    end
    if !params[:title][:name].empty?
      @landmark.titles << Title.create(params[:title])
    end

    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end

end
