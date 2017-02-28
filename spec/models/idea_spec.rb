require 'rails_helper'

RSpec.describe Idea, type: :model do

describe "create" do
  it 'requires a title' do
        i = Idea.new
        i.valid?
        expect(i.errors).to have_key(:title)
  end

  it 'requires a description' do
    i = Idea.new
    i.valid?
    expect(i.errors).to have_key(:description)
  end
end

end
