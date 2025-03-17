require_relative '../lib/water_reservoir'

describe 'Has a capacity and water volume' do

  it 'has a capacity and water volume' do
    reservoir = WaterReservoir.new(10,5)
    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(5)
  end

  it 'current water volume is set to capacity when filled' do
    reservoir = WaterReservoir.new(10,5)
    reservoir.fill()
    expect(reservoir.current_water_volume).to eq(reservoir.capacity)
  end

  it 'is not empty after it is filled' do
    reservoir = WaterReservoir.new(10,0)
    expect(reservoir).to be_empty
    reservoir.fill()
    expect(reservoir).not_to be_empty
  end

  it 'loses the correct amount of water when it is drained' do
    reservoir = WaterReservoir.new(10,8)
    reservoir.drain(3)
    expect(reservoir.current_water_volume).to eq(5)
  end

  it 'cannot cause water volume to become negative through drain method' do
    reservoir = WaterReservoir.new(10,8)
    reservoir.drain(10)
    expect(reservoir.current_water_volume).to eq(0)
  end

end
