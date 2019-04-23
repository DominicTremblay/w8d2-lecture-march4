require 'rails_helper'

RSpec.describe Model, type: :model do
  it { should validate_presence_of(:model) }
end
