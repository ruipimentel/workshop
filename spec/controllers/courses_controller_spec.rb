require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:valid_course)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:invalid_course)
  }

  describe "GET #index" do
    it "assigns all courses as @courses" do
      course = Course.create! valid_attributes
      get :index
      expect(assigns(:courses)).to eq([course])
    end
  end

  describe "GET #show" do
    it "assigns the requested course as @course" do
      course = Course.create! valid_attributes
      get :show, {:id => course.to_param}
      expect(assigns(:course)).to eq(course)
    end
  end

  describe "GET #new" do
    it "assigns a new course as @course" do
      get :new
      expect(assigns(:course)).to be_a_new(Course)
    end
  end

  describe "GET #edit" do
    it "assigns the requested course as @course" do
      course = Course.create! valid_attributes
      get :edit, {:id => course.to_param}
      expect(assigns(:course)).to eq(course)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Course" do
        expect {
          post :create, {:course => valid_attributes}
        }.to change(Course, :count).by(1)
      end

      it "assigns a newly created course as @course" do
        post :create, {:course => valid_attributes}
        expect(assigns(:course)).to be_a(Course)
        expect(assigns(:course)).to be_persisted
      end

      it "redirects to the created course" do
        post :create, {:course => valid_attributes}
        expect(response).to redirect_to(Course.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved course as @course" do
        post :create, {:course => invalid_attributes}
        expect(assigns(:course)).to be_a_new(Course)
      end

      it "re-renders the 'new' template" do
        post :create, {:course => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { description: 'HTML5 e CSS3' }
      }

      it "updates the requested course" do
        course = Course.create! valid_attributes
        put :update, {:id => course.to_param, :course => new_attributes}
        course.reload

        expect(course.description).to eq('HTML5 e CSS3')
      end

      it "assigns the requested course as @course" do
        course = Course.create! valid_attributes
        put :update, {:id => course.to_param, :course => valid_attributes}

        expect(assigns(:course)).to eq(course)
      end

      it "redirects to the course" do
        course = Course.create! valid_attributes
        put :update, {:id => course.to_param, :course => valid_attributes}
        expect(response).to redirect_to(course)
      end
    end

    context "with invalid params" do
      it "assigns the course as @course" do
        course = Course.create! valid_attributes
        put :update, {:id => course.to_param, :course => invalid_attributes}
        expect(assigns(:course)).to eq(course)
      end

      it "re-renders the 'edit' template" do
        course = Course.create! valid_attributes
        put :update, {:id => course.to_param, :course => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested course" do
      course = Course.create! valid_attributes
      expect {
        delete :destroy, {:id => course.to_param}
      }.to change(Course, :count).by(-1)
    end

    it "redirects to the courses list" do
      course = Course.create! valid_attributes
      delete :destroy, {:id => course.to_param}
      expect(response).to redirect_to(courses_url)
    end
  end

end
