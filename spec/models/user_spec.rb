# frozen_string_literal: true

describe User, type: :model do
  def full_name
    "#{first_name} #{last_name}"
  end

  describe '#make_admin!' do
    let(:user) { create :user }

    subject { -> { user.make_admin! } }

    it { is_expected.to change(user, :admin).from(false).to(true) }
  end

  describe '#make_user!' do
    let(:user) { create :user, :admin }

    subject { -> { user.make_user! } }

    it { is_expected.to change(user, :admin).from(true).to(false) }
  end

  describe '#full_name' do
    let(:user) { create :user, first_name: 'John', last_name: 'Doe' }

    subject { user.full_name }

    it { is_expected.to eq 'John Doe' }
  end
end
