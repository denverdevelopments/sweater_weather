require 'rails_helper'

RSpec.describe 'ActivitiesFacade' do
  describe 'class methods' do
    describe '::get_all' do
      it 'returns a locations coordinates', :vcr do
        activity = "education"
        fun = ActivitiesFacade.get_all(activity)

        expect(fun).to be_a(Tasks)
      end
    end
  end
end
