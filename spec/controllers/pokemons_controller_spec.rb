require 'rails_helper'
require 'spec_helper'

RSpec.describe PokemonsController, type: :controller do
    let!(:pokemon) { FactoryBot.create(:pokemon) }
    let!(:trainer) { FactoryBot.create(:trainer) }

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


    describe "GET select_pokemon" do
        subject { get :select_pokemon, params: { trainer_id: 2 } }
        let(:template) { "select_pokemon" }

        it_should_behave_like 'pokemon controller actions'
    end


    describe "GET discover" do
        subject { get :discover }
        let(:template) { "discover" }

        it_should_behave_like 'pokemon controller actions'
    end


    describe "POST createPokemon" do
        context 'pokemon is added correctly' do
            subject { post :createPokemon, params: { guess_pokemon: {name: "pikachu"}, expected_name: "pikachu", order: 35 } }
        
            it 'should redirect to show path' do
                created_pokemon = Pokemon.find_by(name: "pikachu")
                expect(response).to redirect_to(pokemon_path(created_pokemon.id))
            end
        
            it 'should create new pokemon' do
                created_pokemon = Pokemon.find_by(name: "pikachu")
                expect(created_pokemon).not_to be_nil
            end
        end
    end


    # describe "POST add_pokemon" do
    #     context 'pokemon is added correctly' do
    #         subject { post :add_pokemon, params:{ trainer_id: 8, pokemon_id: 1 } }
        
    #         it 'should redirect to trainer path' do
    #             created_ownership = OwnsPokemon.find_by(trainer_id: 8, pokemon_id: 1)
    #             expect(response).to redirect_to(trainer_url(created_ownership.trainer_id))
    #         end
        
    #         it 'should create new ownership' do
    #             created_ownership = OwnsPokemon.find_by(trainer_id: 8, pokemon_id: 1)
    #             expect(created_ownership).not_to be_nil
    #         end
    #     end
    # end
end