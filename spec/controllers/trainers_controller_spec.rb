require 'rails_helper'

RSpec.describe TrainersController, type: :controller do
    let!(:trainer) { FactoryBot.create(:trainer) }

    before{ subject }

    shared_examples_for 'trainer controller actions' do
        it 'renders the expected template' do
            expect(response).to render_template(template)
        end
    end

    describe "GET index" do
        subject { get :index }
        let(:template) { "index" }

        it_should_behave_like 'trainer controller actions'
    end


end