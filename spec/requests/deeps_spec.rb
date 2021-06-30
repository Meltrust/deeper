require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/deeps', type: :request do
  # Deep. As you add validations to Deep, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Deep.create! valid_attributes
      get deeps_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      deep = Deep.create! valid_attributes
      get deep_url(deep)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_deep_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      deep = Deep.create! valid_attributes
      get edit_deep_url(deep)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Deep' do
        expect do
          post deeps_url, params: { deep: valid_attributes }
        end.to change(Deep, :count).by(1)
      end

      it 'redirects to the created deep' do
        post deeps_url, params: { deep: valid_attributes }
        expect(response).to redirect_to(deep_url(Deep.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Deep' do
        expect do
          post deeps_url, params: { deep: invalid_attributes }
        end.to change(Deep, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post deeps_url, params: { deep: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested deep' do
        deep = Deep.create! valid_attributes
        patch deep_url(deep), params: { deep: new_attributes }
        deep.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the deep' do
        deep = Deep.create! valid_attributes
        patch deep_url(deep), params: { deep: new_attributes }
        deep.reload
        expect(response).to redirect_to(deep_url(deep))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        deep = Deep.create! valid_attributes
        patch deep_url(deep), params: { deep: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested deep' do
      deep = Deep.create! valid_attributes
      expect do
        delete deep_url(deep)
      end.to change(Deep, :count).by(-1)
    end

    it 'redirects to the deeps list' do
      deep = Deep.create! valid_attributes
      delete deep_url(deep)
      expect(response).to redirect_to(deeps_url)
    end
  end
end
