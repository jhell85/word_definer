require('word')
require ('pry')
require ('rspec')

describe "#Word" do

  before(:each) do
    Word.clear
  end
  
  describe '#save' do
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
end