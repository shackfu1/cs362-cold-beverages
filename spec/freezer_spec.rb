require_relative '../lib/freezer'

describe 'A freezer' do

  it 'turns off and on' do
    freezer = Freezer.new()
    expect(freezer.power).to eq(:off)
    freezer.turn_on()
    expect(freezer.power).to eq(:on)
    freezer.turn_off()
    expect(freezer.power).to eq(:off)
  end

  it 'can set the temperature' do
    freezer = Freezer.new()
    initial_temp = freezer.temperature
    freezer.set_level(10)
    expect(freezer.temperature).to eq(initial_temp - 100)
    freezer.set_level(5)
    expect(freezer.temperature).to eq(initial_temp - 50)
  end

  it 'can add items' do
    freezer = Freezer.new(100)
    test_item = Item.new('test', 5)
    test_item2 = Item.new('test2', 10)
    freezer.add(test_item)
    expect(freezer.remaining_capacity).to eq(100 - test_item.volume)
    freezer.add(test_item2)
    expect(freezer.remaining_capacity).to eq(100 - test_item.volume - test_item2.volume)
  end

end
