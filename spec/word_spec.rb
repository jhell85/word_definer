require('word')
require ('pry')
require ('rspec')

describe "#Word" do
  
  describe('#save') do
    it('saves a word') do
      word = Word.new({ :name => "banana", :id => nil})
      word.save
      word2 = Word.new({:name => "Ruby", :id => nil})
      word2.save
      expect(Word.all).to(eq([word, word2]))
    end
  end
end