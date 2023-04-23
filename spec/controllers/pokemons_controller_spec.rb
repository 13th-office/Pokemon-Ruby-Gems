require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do
    let!(:pokemon) { FactoryBot.create(:pokemon) }

    before{ subject }

    shared_examples_for 'pokemon controller actions' do
        it 'renders the expected template' do
            expect(response).to render_template(template)
        end
    end

    describe "GET show" do
        subject { get :show, params: { id: pokemon.id } }
        let(:template) { "show" }
    
        it 'assigns instance variable' do
            expect(assigns(:pokemon)).to eq(pokemon)
        end

        it_should_behave_like 'pokemon controller actions'
    end


end