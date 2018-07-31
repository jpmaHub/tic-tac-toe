#!/usr/bin/env ruby -I ../lib -I lib
# coding: utf-8
require 'sinatra'
require 'view_board'
require 'set_mark'
require 'mark'
require 'file_mark_gateway'

post '/make-move/:id' do
  gateway = FileMarkGateway.new
  SetMark.new(mark_gateway: gateway).execute(type_of_mark: params[:mark], position_on_board: params[:id])
  redirect '/'
end

get '/' do
  gateway = FileMarkGateway.new
  response = ViewBoard.new(mark_gateway: gateway).execute({})
  board = response[:board]
  erb :board, locals: { board: board }
end
 
