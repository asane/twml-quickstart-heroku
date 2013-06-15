# -*- coding: utf-8 -*-
require 'sinatra'
require 'haml'
require "sinatra/reloader" if development?

before do
  content_type 'xml'
end

get '/' do
  content_type 'html'
  haml :'index', {:layout => false}
end

get '/hello-monkey' do
  haml :'hello-monkey'
end

get '/hello-monkey-handle-key' do
  redirect '/' unless %W[1 2].include?(params[:Digits])
  haml :'hello-monkey-handle-key'
end

get '/hello-monkey-handle-recording' do
  haml :'hello-monkey-handle-recording'
end

__END__

@@ layout
!!! XML
= yield

@@ index
!!! HTML
%html
  %body
    %h4 有効なURLリスト
    %ul
      %li /hello-monkey
      %li /hello-monkey-handle-key
      %li /hello-monkey-handle-recording

@@ hello-monkey
%Response
  %Say
    = "Hello. #{@name}"
  %Gather(numDigits="1" action="hello-monkey-handle-key" method="GET")
    %Say To speak to a real monkey, press 1.  Press any other key to start over.

@@ hello-monkey-handle-key
%Response
  - if params[:Digits] == '1'
    %Dial +13105551212
    %Say The call failed or the remote party hung up. Goodbye.
  - elsif params[:Digits] == '2'
    %Say Record your monkey howl after the tone.
    %Record(maxLength="20" action="hello-monkey-handle-recording" method="GET" timeout="5")

@@ hello-monkey-handle-recording
%Response
  %Say Thanks for howling... take a listen to what you howled.
  %Play
    = params[:RecordingUrl]
  %Say Goodbye.
