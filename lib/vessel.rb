class Vessel
  attr_reader :volume, :name

  def initialize(name, volume)
    @name = name
    @volume = volume
    @full = false
  end

  def empty?
    return not(@full)
  end

  def fill
    @full = true
  end
end
