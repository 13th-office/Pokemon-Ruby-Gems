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


    describe "GET new" do
        subject { get :new }
        let(:template) { "new" }
    
        it 'assigns instance variable' do
            expect(assigns(:trainer)).to be_instance_of(Trainer)
        end
    
        it 'renders the expected template' do
            expect(response).to render_template(template)
        end

        it_should_behave_like 'trainer controller actions'
    end


    describe "GET show" do
        subject { get :show, params: { id: trainer.id } }
        let(:template) { "show" }
    
        it 'assigns instance variable' do
            expect(assigns(:trainer)).to eq(trainer)
        end

        it_should_behave_like 'trainer controller actions'
    end


    describe "POST create" do
        context 'when trainer fails name validation' do
            subject { post :create, params: { trainer: { name: 'no'} } }
        
            it 'should render new view' do
                expect(response).to render_template(:new)
            end
        
            it 'should have unprocessable entity status' do
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end

        context 'when trainer is saved successfully' do
            subject { post :create, params: { trainer: { name: 'Trainer' } } }
    
            it 'should redirect to show path' do
                created_trainer = Trainer.find_by(name: 'Trainer')
                expect(response).to redirect_to(trainer_path(created_trainer.id))
            end
    
            it 'should create a new article' do
                created_trainer = Trainer.find_by(name: 'Trainer')
                expect(created_trainer).not_to be_nil
            end
        end
    end

end