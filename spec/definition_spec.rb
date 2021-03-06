require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe '#definition' do
  before(:each) do
    Definition.clear
    Word.clear
    @word = Word.new({:name => "walk", :id => nil})
    @word.save
  end

  describe('#==') do
    it ('is the same definition if it has the same attributes as another definition') do
      definition = Definition.new({:name => "move at a regular pace by lifting and setting down each foot in turn, never having both feet off the ground at once.", :word_id => @word.id, :id => nil})
      definition.save
      definition2 = Definition.new({:name => "move at a regular pace by lifting and setting down each foot in turn, never having both feet off the ground at once.", :word_id => @word.id, :id => nil})
      definition2.save
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it('returns a list of all definitions') do 
      definition = Definition.new({:name => "move at a regular pace by lifting and setting down each foot in turn, never having both feet off the ground at once.", :word_id => @word.id, :id => nil})
      definition.save
      definition2 = Definition.new({:name => 'an act of traveling or an excursion on foot.', :id => nil, :word_id => @word.id})
      definition2.save
      expect(Definition.all).to(eq([definition, definition2])) 
    end
  end

  describe('#save') do
    it("saves a definition to a word") do
      definition = Definition.new({:name => "move at a regular pace by lifting and setting down each foot in turn, never having both feet off the ground at once.", :word_id => @word.id, :id => nil})
      definition.save
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it('finds a definition by id') do 
      definition = Definition.new({:name => "move at a regular pace by lifting and setting down each foot in turn, never having both feet off the ground at once.", :word_id => @word.id, :id => nil})
      definition.save
      definition2 = Definition.new({:name => 'an act of traveling or an excursion on foot.', :id => nil, :word_id => @word.id})
      definition2.save
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end
  
  describe('.clear') do 
    it('clears all definitions') do 
      definition = Definition.new({:name => "move at a regular pace by lifting and setting down each foot in turn, never having both feet off the ground at once.", :word_id => @word.id, :id => nil})
      definition.save
      definition2 = Definition.new({:name => 'an act of traveling or an excursion on foot.', :id => nil, :word_id => @word.id})
      definition2.save
      Definition.clear
      expect(Definition.all).to(eq([]))
    end
  end 
  
  describe('#update') do
    it('updates a definition by id') do
      definition = Definition.new({:name => "move at a regular pace by lifting and setting down each foot in turn, never having both feet off the ground at once.", :word_id => @word.id, :id => nil})
      definition.save
      definition.update({:name => 'an act of traveling or an excursion on foot.', :word_id => @word.id})
      expect(definition.name).to(eq('an act of traveling or an excursion on foot.'))
    end
  end

  describe('#delete') do 
    it("deletes a definition by id") do 
      definition = Definition.new({:name => "move at a regular pace by lifting and setting down each foot in turn, never having both feet off the ground at once.", :word_id => @word.id, :id => nil})
      definition.save
      definition2 = Definition.new({:name => 'an act of traveling or an excursion on foot.', :id => nil, :word_id => @word.id})
      definition2.save
      definition.delete
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('.find_by_word') do 
    it("finds a definitions for a word") do
      word2 = Word.new({:name => "fish", :id => nil})
      word2.save
      fish_definition = Definition.new({:name => 'a limbless cold-blooded vertebrate animal with gills and fins and living wholly in water.', :word_id => word2.id, :id => nil})
      fish_definition.save
      definition = Definition.new({:name => "move at a regular pace by lifting and setting down each foot in turn, never having both feet off the ground at once.", :word_id => @word.id, :id => nil})
      definition.save
      definition2 = Definition.new({:name => 'an act of traveling or an excursion on foot.', :id => nil, :word_id => @word.id})
      definition2.save
      expect(Definition.find_by_word(word2.id)).to (eq([fish_definition]))
    end
  end
end