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
