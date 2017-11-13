class Zombie

@@horde = [] #contains collection of all zombies
@@plague_level = 10 #used to determing rate of zombie spawn
@@max_speed = 5 #max value for zombies unchanging
@@max_strength = 8 # max value for zombie strength unchanging
@@defualt_speed = 1 # unchanging value
@@defualt_strength = 3 #unchanging value


  def initialize(zombie_speed, zombie_strength)
    @strength = rand(10)
      if @strength > @@max_strength
         @strength = @@defualt_strength
       end

     @speed = rand(7)
      if @speed > @@max_speed
         @speed = @defualt_speed
      end
  end

##----CLASS----
#----READERS----
  def self.horde #total horde reader
    @@horde
  end

  def self.all
    @@horde
  end

  def self.plague_level  #plague amount reader
    @@plague_level
  end

  def self.max_speed #mx zombie speed
    @@max_speed
  end

  def self.max_strength #max zombie strength
    @@max_strength
  end
#----------------
  def self.feed #new zombie creator/saver
    zombie = Zombie.new(rand(@@max_speed), rand(@@max_strength))
      @@horde << zombie
      return zombie
  end

  def self.increase_plague_levels #plague count adder
    @@plague_level += rand(0..2)
  end

  def self.spawn #zombie spawn rate
    zombie_spawned = (rand(Zombie.plague_level / @@max_speed))
    zombie_spawned.times do
      Zombie.feed
    end
  end

  def self.some_die_off
    rand(10).times do
      @@horde.pop
    end
  end

  def self.new_day #a new day
    Zombie.some_die_off
    Zombie.spawn
    Zombie.increase_plague_levels
    puts "the sun rises and the horde grows closer"
  end
##----ClASS----




##----INSTANCE----

  def outrun_zombies? #dictates zombie speed by random
    @speed = rand(@@max_speed)
    if @speed > @zombie_speed
      return true
    else
      return false
    end
  end

  def encounter #prints outcome from outrun_zombies
    if outrun_zombies? == true
      puts " you got away... for now"
    else
      puts "you are being eaten"
    end
  end

  def survive_attack? # returns boolean if user stronger than zombie
    @strength = rand(@@max_strength)
      if @strength > @zombie_strength
        return true
      else
        return false
      end
  end
##----INSTANCE----
end

 puts Zombie.feed.inspect

 puts Zombie.all.inspect
 Zombie.new_day
 puts Zombie.all.inspect
