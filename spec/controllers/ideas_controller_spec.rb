require 'rails_helper'

RSpec.describe IdeasController, type: :controller do

  let(:user) {FactoryGirl.create(:user)}

  describe '#new' do
# pass
    context 'with no session' do
      it 'redirect to new session' do
        get :new
        expect(response).to redirect_to(new_session_path)
      end
    end

# pass
    context 'with session' do
      before do
        request.session[:user_id] = user.id
        get :new
      end
    end
  end

  describe '#create' do
# pass
    context 'without a signed in user' do
      it 'redirects to the sign in page' do
        post :create
        expect(response).to redirect_to(new_session_path)
      end
    end

    context 'with a signed in user' do
  # pass
      before { request.session[:user_id] = user.id }

      context 'with valid attributes' do
        it 'create a new idea' do
          count_before = Idea.count
          post :create, params: { idea: {title:'abc', description:'first description'}}
          count_after = Idea.count
          expect(count_after).to eq(count_before + 1)
        end


        it 'redirects to the idea show page' do
            post :create, params: { idea: attributes_for(:idea) }
            expect(response).to redirect_to(idea_path(Idea.last))
        end
      #
      # it 'associates the idea with the signed in user' do
      #   post :create, params: { idea: FactoryGirl.create(:idea)}
      #   expect(Idea.last.user).to eq(user)
      # end
    end

# pass
  context 'with invalid attributes' do
    it 'doesn\'t create a idea in the database' do
      count_before = Idea.count
      post :create, params: { idea: {title: "", description:""} }
      count_after = Idea.count
      expect(count_after).to eq(count_before)
    end
# pass
    it 'renders the new template' do
      post :create, params: { idea: {title: "", description:""} }
      expect(response).to render_template(:new)
    end
  end
  end
end


end
