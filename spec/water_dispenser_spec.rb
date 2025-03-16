require_relative '../lib/water_dispenser'

describe 'A water dispenser' do

  it 'has a reservoir' do
    test_reservoir = WaterReservoir.new()
    dispenser = WaterDispenser.new(test_reservoir)
    expect(dispenser.reservoir).to be_a(WaterReservoir)
  end

  it 'decreases its reservoir volume after dispensing a vessel' do
    test_reservoir = WaterReservoir.new(10,10)
    dispenser = WaterDispenser.new(test_reservoir)
    test_vessel = Vessel.new('test', 6)
    dispenser.dispense(test_vessel)
    expect(dispenser.reservoir.current_water_volume).to eq(4)
  end

end
