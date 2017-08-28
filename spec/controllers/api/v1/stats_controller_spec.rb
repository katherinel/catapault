require 'rails_helper'
require 'faker'

RSpec.describe Api::V1::StatsController, type: :controller do

  resource_syms = [:tag, :breed]

  describe "GET #index" do
    let(:resources) { resource_syms.map{|sym| create(sym) } }
    it "assigns @resource_model as the class of the resource" do
      resources.each_with_index do |r, i|
        get :index, params: {:resource => r.class.to_s}
        expect(assigns(:resource_model)).to eq(r.class)
      end
    end

    it "assigns all resources as @resources" do
      resources.each_with_index do |r, i|
        get :index, params: {:resource => r.class.to_s}
        expect(assigns(:resources)).to eq([r])
      end
    end
  end

end
