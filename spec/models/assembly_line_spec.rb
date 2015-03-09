require 'rails_helper'

RSpec.describe AssemblyLine, type: :model do

  it '.name' do
    name = 'Ford Focus'
    assembly_line = AssemblyLine.create name: name
    expect(assembly_line.name).to eq(name)
  end

  it '.stations' do
    assembly_line = AssemblyLine.create name: 'Ford Focus'
    station = Station.create name: 'Engine Setup', assembly_line_id: assembly_line.id
    expect(assembly_line.stations.to_a).to eq([ station ])
  end

  context 'accepts nested attributes for stations' do
    let(:station_name) { 'Engine Setup' }
    let(:stations_attributes) { [ { name: station_name } ] }
    let(:assembly_line) { AssemblyLine.create name: 'Ford Focus', stations_attributes: stations_attributes }

    it do
      expect(assembly_line.stations.count).to be(1)
    end

    it do
      expect(assembly_line.stations.first.name).to eq(station_name)
    end
  end

end
