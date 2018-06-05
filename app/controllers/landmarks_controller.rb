class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])

    erb :'/figures/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])

    erb :'landmarks/edit'
  end

  post '/landmarks' do
#create New Landmark
    @landmark = Landmark.new(params[@landmark])

#assign figure if needed
    if !params[:figures][:name].empty?
      @landmarks.figures << Figures.find_or_create_by(params[:figures])
    end

#assign title if needed
    if !params[:title][:name].empty?
      @landmarks.titles << Title.find_or_create_by(params[:title])
    end

    @landmark.save

    redirect to "landmarks/#{@landmark.id}"
  end

  patch '/landmark/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
    if !params[:figures][:name].empty?
      @landmarks.figures << Figure.find_or_create_by(params[:figure])
    end
    if !params[:title][:name].empty?
      @landmarks.titles << Title.find_or_create_by(params[:title])
    end

    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end

end
