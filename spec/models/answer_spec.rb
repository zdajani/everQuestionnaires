require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should belong_to(:question) }
  it { should validate_presence_of(:question) }

  it { should validate_presence_of(:response) }

  it { should belong_to(:user) }
  it { should validate_presence_of(:user) }

  it { should belong_to(:questionnaire) }
  it { should validate_presence_of(:questionnaire) }
end
