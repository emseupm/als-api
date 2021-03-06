require 'rails_helper'

RSpec.describe '/v1/assembly_lines.json', type: :request do

  it 'returns 200' do
    get '/v1/assembly_lines.json'
    expect(response.status).to be(200)
  end

  it 'returns application/json' do
    get '/v1/assembly_lines.json'
    expect(response.content_type).to be(Mime::JSON)
  end

  context 'returns all existing assembly lines' do
    let(:json) do
      get '/v1/assembly_lines.json'
      JSON.parse response.body
    end

    it do
      AssemblyLine.create name: 'Ford Focus'
      expect(json.count).to be(1)
    end

    it do
      AssemblyLine.create name: 'Ford Focus'
      AssemblyLine.create name: 'LG Watch'
      expect(json.count).to be(2)
    end
  end

  context 'returns the assembly line object' do
    let!(:assembly_line) do
      AssemblyLine.create name: 'Ford Focus'
    end
    let(:json) do
      get '/v1/assembly_lines.json'
      JSON.parse response.body, symbolize_names: true
    end
    let(:assembly_line_json) { json.first }

    it do
      expect(assembly_line_json.keys).to eq([ :id, :name, :stations ])
    end

    it ':id' do
      expect(assembly_line_json[:id]).to eq(assembly_line.id)
    end

    it ':name' do
      expect(assembly_line_json[:name]).to eq(assembly_line.name)
    end

    context ':stations' do
      context 'without stations' do
        it do
          expect(assembly_line_json[:stations].count).to be(0)
        end
      end

      context 'with stations' do
        let(:station_attributes) do
          { name: 'Engine Setup', estimated_time: '4' }
        end
        let!(:assembly_line) do
          AssemblyLine.create name: 'Ford Focus', stations_attributes: [ station_attributes ]
        end
        let(:station) { assembly_line.stations.first }
        let(:station_json) { assembly_line_json[:stations].first }

        it do
          expect(assembly_line_json[:stations].count).to be(1)
        end

        it do
          expect(station_json.keys).to eq([ :id, :name, :estimated_time ])
        end

        it ':id' do
          expect(station_json[:id]).to eq(station.id)
        end

        it ':name' do
          expect(station_json[:name]).to eq(station.name)
        end

        it ':estimated_time' do
          expect(station_json[:estimated_time]).to eq(station.estimated_time)
        end
      end
    end
  end

  context 'create assembly line' do
    let(:station_name) { 'Engine Setup' }
    let(:station_estimated_time) { 2 }
    let(:station_params) do
      { name: station_name, estimated_time: station_estimated_time }
    end
    let(:assembly_line_name) { 'Ford Focus' }
    let(:assembly_line_params) do
      { name: assembly_line_name, stations: [ station_params ] }
    end

    def make_request
      post '/v1/assembly_lines.json', assembly_line_params
    end

    it do
      make_request
      expect(response.status).to be(201)
    end

    context 'creates a new assembly line object' do
      let(:assembly_line) { AssemblyLine.last }

      it do
        expect { make_request }.to change(AssemblyLine, :count).by(1)
      end

      it '.name' do
        make_request
        expect(assembly_line.name).to eq(assembly_line_name)
      end

      context 'creates a new station object' do
        let(:station) { assembly_line.stations.first }

        it do
          expect { make_request }.to change(Station, :count).by(1)
        end

        it '.name' do
          make_request
          expect(station.name).to eq(station_name)
        end

        it '.estimated_time' do
          make_request
          expect(station.estimated_time).to eq(station_estimated_time)
        end
      end
    end
  end

end
