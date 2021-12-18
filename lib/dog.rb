require "pry"

class Dog

    attr_accessor :name, :breed, :id

    def initialize(name:, breed:, id: nil)
        @id = id
        @name = name
        @breed = breed
    end

    def self.create_table
        sql = <<-SQL
            CREATE TABLE IF NOT EXISTS dogs (
                id INTEGER PRIMARY KEY
                name TEXT,
                breed TEXT
            )
            SQL
        DB[:conn].execute(sql)
    end

    def self.drop_table

    end

    def self.save

    end

    def self.create
        self.save
    end

    def self.all

    end

    def self.find_by_name(name)

    end

    def self.find(id)

    end



end

binding.pry