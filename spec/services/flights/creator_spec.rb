describe Flights::Creator do
  describe 'call' do
    let(:aircraft) { create(:aircraft) }

    let(:from) { create(:airport) }
    let(:destination) { create(:airport) }

    let(:params) do
      {
        number: '1233',
        aircraft_id: aircraft.id,
        from_id: from.id,
        destination_id: destination.id,
        departure: DateTime.now.to_s,
        arrival: (DateTime.now + 1.hour).to_s,
        gate_id: from.gates.first.id,
      }
    end

    subject { -> { described_class.call(Flight.new, params) } }

    before { allow(Rails.configuration).to receive(:airport_iata).and_return(from.iata) }

    it { is_expected.to change(Flight, :count).by(1) }
  end
end
