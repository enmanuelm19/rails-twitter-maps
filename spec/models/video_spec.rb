require 'rails_helper'

RSpec.describe Video, type: :model do
  describe "Validations" do
    it { should validate_presence_of :title }
    it { should validate_uniqueness_of :title }
  end
end
