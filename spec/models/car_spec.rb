require 'rails_helper'

RSpec.describe Car, type: :model do
  it { should validate_presence_of(:make) }
  it { should validate_presence_of(:model) }
  it { should validate_presence_of(:style) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:colour) }
  it { should validate_presence_of(:trim) }
end
