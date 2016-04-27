require 'rails_helper'

RSpec.describe Review, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:rating) }
  it { is_expected.to validate_presence_of(:movie_id) }
  it { is_expected.to belong_to(:movie) }
end
