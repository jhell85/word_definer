require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words/new') do 
  erb(:new_word)
end

post('/words') do 
  name = params[:word_name]
  word = Word.new({:name => name, :id => nil})
  word.save
  redirect to ('/')
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i)
  erb(:word)
end

get('/words/edit-word/:id') do
  @word = Word.find(params[:id].to_i)
  erb(:edit_word)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i)
  @word.update(params[:word_name])
  @words = Word.all
  erb(:words)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i)
  @word.delete
  redirect to('/')
end

# Definitions routes 

post('/words/:id/definitions') do
  @word = Word.find(parms[:id].to_i)
  name = params[:name]
  definition = Definition.new({:name => name, :id => nil})
  definition.save
  erb(:word)
end
