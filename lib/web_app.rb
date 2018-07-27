#!/usr/bin/env ruby -I ../lib -I lib
# coding: utf-8
require 'sinatra'
require 'view_board'
require 'set_mark'
require 'mark'
require 'file_mark_gateway'

class InMemoryMarkGateway
  def initialize
    @mark_properties = []
    
  end

  def mark_properties
    @mark_properties
  end

  def mark_properties=(mark_properties)
    @mark_properties.push(mark_properties)
  end
end

post '/make-move/:id' do
  puts params
  memory = FileMarkGateway.new
  SetMark.new(mark_gateway: memory).execute(type_of_mark: params[:mark], position_on_board: params[:id])
  
  redirect '/'
end



get '/' do
  memory = FileMarkGateway.new
  puts params
  response = ViewBoard.new(mark_gateway: memory).execute({})
  board = response[:board]
  erb :board, locals: { board: board }
end


