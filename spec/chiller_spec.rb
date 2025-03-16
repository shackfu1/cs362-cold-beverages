require_relative '../lib/chiller'

describe 'A chiller' do

  it 'turns off and on' do
    chiller = Chiller.new()
    expect(chiller.power).to eq(:off)
    chiller.turn_on()
    expect(chiller.power).to eq(:on)
    chiller.turn_off()
    expect(chiller.power).to eq(:off)
  end

  it 'can set the temperature' do
    chiller = Chiller.new()
    initial_temp = chiller.temperature
    chiller.set_level(10)
    expect(chiller.temperature).to eq(initial_temp - 50)
    chiller.set_level(5)
    expect(chiller.temperature).to eq(initial_temp - 25)
  end

  it 'can add items' do
    chiller = Chiller.new(100)
    test_item = Item.new('test', 5)
    test_item2 = Item.new('test2', 10)
    chiller.add(test_item)
    expect(chiller.remaining_capacity).to eq(100 - test_item.volume)
    chiller.add(test_item2)
    expect(chiller.remaining_capacity).to eq(100 - test_item.volume - test_item2.volume)
  end

end
