class Book

  @@on_shelf = []
  @@on_loan = []


  def initialize(title, author, isbn)
    @due_date
    @title = title
    @author = author
    @isbn = isbn

  end

##----READERS----
  def due_date
    @due_date
  end



##----WRITERS----
  def due_date=(date)
  @due_date = Time.now
  end


##----INSTANCE----
  def borrow
    if @lent_out
      return false
        puts "the book is unavailable"
    else
    end
  end

  def return_to_library
    if @lent_out == false
      return false
    else
      @@on_shelf.delete(self)
      @@on_loan.delete(self)
      @due_date = nil
      return true
    end
  end

  def lent_out
    if @on_loan.include(self)
      return true
    else
      return false

    end
  end

  ##----CLASS----
  def self.create(title, author, isbn)
    new_book = Book.new(title, author, isbn)
    @@on_shelf << new_book
    return new_book
  end

  def self.current_due_date
      return @due_date + 604800
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end

  def self.browse
  return  @@on_shelf[rand(0..(@@on_shelf.length-1))]
  end

  def self.overdue
    overdue = []
    Books.borrowed.each do |book|
      if book.due_date < Time.now
        overdue << book
      end
    end
    overdue
  end

end

sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
# aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
# if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")

# puts Book.browse.inspect
# puts Book.available.inspect
# puts sister_outsider.lent_out
# puts sister_outsider.due_date
