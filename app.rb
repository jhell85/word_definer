require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
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
  @word = word
  erb(:edit_word)
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



post('/words/:id/definitions/') do
  @word = Word.find(params[:id].to_i)
  name = params[:name]
  word_id = @word.id
  definition = Definition.new({name: name, id: nil, word_id: word_id})
  definition.save
  erb(:word)
end

get('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i)
  @word = Word.find(params[:id].to_i)
  erb(:edit_definitions)
end

delete('/words/:id/definitions/:definition_id') do 
  definition = Definition.find(params[:definition_id].to_i)
  definition.delete
  @word = Word.find(params[:id].to_i)
  erb(:word)
end

patch('/words/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i)
  name = params[:name]
  definition.update({name: name})
  @word = Word.find(params[:id].to_i)
  erb(:word)
end
