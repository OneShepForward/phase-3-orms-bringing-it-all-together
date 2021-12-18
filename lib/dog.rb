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
                id INTEGER PRIMARY KEY,
                name TEXT,
                breed TEXT
            )
            SQL
        DB[:conn].execute(sql)
    end

    def self.drop_table
        sql = <<-SQL
        DROP TABLE IF EXISTS dogs
        SQL
        DB[:conn].execute(sql)
    end

    def self.save
        sql = <<-SQL
        INSERT INTO dogs (name, breed)
        VALUES (?, ?)
        SQL

        DB[:conn].execute(sql, self.name, self.breed)

        self.id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]

        self
    end

    # def self.create
    #     self.save
    # end

    # def self.all

    # end

    # def self.find_by_name(name)

    # end

    # def self.find(id)

    # end



end

# binding.pry