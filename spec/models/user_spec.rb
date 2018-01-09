require 'rails_helper'

RSpec.describe User, type: :model do

  let!(:user) {create(:user)}
  it { is_expected.to have_many(:followee_users) }
  it { is_expected.to have_many(:follower_users) }
  it { is_expected.to have_many(:followees).through(:followee_users) }
  it { is_expected.to have_many(:followers).through(:follower_users) }
  it { is_expected.to have_many(:notes) }
  it { is_expected.to have_many(:likes) }
  it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
  it { is_expected.to validate_presence_of (:username) }
  it { is_expected.to validate_presence_of (:email) }
end
