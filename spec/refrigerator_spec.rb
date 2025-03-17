require_relative '../lib/refrigerator'

describe 'A refrigerator' do

  it 'plugs in and unplugs' do
    test_chiller = Chiller.new()
    test_freezer = Freezer.new()
    test_reservoir = WaterReservoir.new()
    test_dispenser = WaterDispenser.new(test_reservoir)
    refrigerator = Refrigerator.new(test_chiller, test_freezer, test_dispenser, test_reservoir)
    expect(refrigerator.freezer.power).to eq(:off)
    expect(refrigerator.power).to eq(:off)
    refrigerator.plug_in()
    expect(refrigerator.freezer.power).to eq(:on)
    expect(refrigerator.power).to eq(:on)
    refrigerator.unplug()
    expect(refrigerator.freezer.power).to eq(:off)
    expect(refrigerator.power).to eq(:off)
  end

  it 'can add items to Freezer and Chiller' do
    test_chiller = Chiller.new(50)
    test_freezer = Freezer.new(100)
    test_reservoir = WaterReservoir.new()
    test_dispenser = WaterDispenser.new(test_reservoir)
    test_item = Item.new("test", 5)
    test_item2 = Item.new("test2", 10)
    refrigerator = Refrigerator.new(test_chiller, test_freezer, test_dispenser, test_reservoir)
    refrigerator.freeze(test_item)
    refrigerator.chill(test_item2)
    expect(refrigerator.total_capacity).to eq(150)
    expect(refrigerator.remaining_capacity).to eq(135)
  end

  it 'can set Freezer and Chiller temperature' do
    test_chiller = Chiller.new()
    test_freezer = Freezer.new()
    test_reservoir = WaterReservoir.new()
    test_dispenser = WaterDispenser.new(test_reservoir)
    refrigerator = Refrigerator.new(test_chiller, test_freezer, test_dispenser, test_reservoir)
    initial_freezer_temp = refrigerator.freezer.temperature
    initial_chiller_temp = refrigerator.chiller.temperature
    refrigerator.set_chiller_level(5)
    expect(refrigerator.chiller.temperature).to eq(initial_chiller_temp - 25)
    refrigerator.set_freezer_level(5)
    expect(refrigerator.freezer.temperature).to eq(initial_freezer_temp - 50)
  end

  it 'can print its status' do
    test_chiller = Chiller.new()
    test_freezer = Freezer.new()
    test_reservoir = WaterReservoir.new()
    test_dispenser = WaterDispenser.new(test_reservoir)
    refrigerator = Refrigerator.new(test_chiller, test_freezer, test_dispenser, test_reservoir)
    expect(refrigerator.to_s).to be
  end
end
