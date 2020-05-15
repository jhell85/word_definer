require('word')
require ('pry')
require ('rspec')

describe("#Word") do

  before(:each) do
    Word.clear
  end
  
  describe('#save') do
    it 'saves a word' do
      word = Word.new({ :name => "banana", :id => nil})
      word.save
      word2 = Word.new({:name => "Ruby", :id => nil})
      word2.save
      expect(Word.all).to(eq([word, word2]))
    end
  end
  describe('.all') do
    it 'returns an empty array when there are no words' do
      expect(Word.all).to(eq([]))
    end
  end
  describe('#update') do 
    it('updates a word by id') do 
      word = Word.new({:name => 'banana', :id => nil})
      word.save
      word.update('apple')
      expect(word.name).to(eq("apple"))
    end
  end
  describe('#delete') do 
    it('deletes a word by id') do
     word = Word.new({:name => 'pear', :id => nil})
     word.save
     word2 = Word.new({:name => 'banana', :id => nil})
     word2.save
     word.delete
     expect(Word.all).to(eq([word2])) 
    end
  end
  
end