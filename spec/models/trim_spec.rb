require 'rails_helper'

RSpec.describe Trim, type: :model do
  it { should validate_presence_of(:trim_level) }
end
