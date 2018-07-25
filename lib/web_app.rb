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

post '/make-move' do
  puts params
  
end



get '/' do
  memory = FileMarkGateway.new

  SetMark.new(mark_gateway: memory).execute(type_of_mark: "X" , position_on_board: 1)
  SetMark.new(mark_gateway: memory).execute(type_of_mark: "O" , position_on_board: 2)
  SetMark.new(mark_gateway: memory).execute(type_of_mark: "X" , position_on_board: 3)
  
  response = ViewBoard.new(mark_gateway: memory).execute({})
  board = response[:board]
  erb :board, locals: { board: board }
end


