require 'pry'

class Definition
  attr_reader :id, :word_id
  attr_accessor :name

  @@definitions = {}
  @@total_rows = 0 

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @word_id = attributes.fetch(:word_id)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.find_by_word(word_id) 
    definitions = []
    @@defintions.values.each do |definition|
      if definition.word_id == word_id
        definitions.push(definition)
      end
    end
    definitions
  end

  def ==(definition_to_compare)
    (self.name == definition_to_compare.name) && (self.word_id == definition_to_compare.word_id)
  end

  def self.clear 
    @@definitions = {}
  end

  def save 
    @@definitions[self.id] = Definition.new({:name => self.name, :word_id => self.word_id, :id => self.id})
  end

  def self.all
    @@definitions.values
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(attributes)
    self.name = (attributes.fetch(:name) ? attributes.fetch(:name) : self.name) 
    @@definitions[self.id] = Definition.new({:name => name, :word_id => word_id, :id => self.id})
  end

  def delete
    @@definitions.delete(self.id)
  end
end