#require 'rails_helper'
require 'rails/all'

RSpec.describe SubmissionsController, type:controller do
  let (:json){
    Json.parse(response.body)
  }

  describe 'POST /submissions/cerate' do

    it 'expect submission to return a positive status when everything goes well' do
      post :input, :params => {:code => "puts 123"}
      expect(json['status']).to eql('Code has run successfully :)')
      expect(json['output']).to eql('123')
    end

    it 'expect submission to return a positive status when everything went well-puts with double quotations' do
      post :input, :params => {:code => "\"puts 123\""}
      expect(json['status']).to eql('Code has run successfully :)')
      expect(json['output']).to eql('123')
    end     

    it 'ensure that puts with single quotations is running correctly' do
      post :input, :params => {:code => "\'puts 123\'"}
      expect(json['status']).to eql('Code has run successfully :)')
      expect(json['output']).to eql('123')
    end     

    it 'Synatx error case-1' do
      post :input, :params => {:code => "blablabla"}
      expect(json['status']).to eql('NameError ERROR_haha')
      expect(json['output']).to eql('No output, there\'s an error :(')
    end     

    it 'Synatx error case-2' do
      post :input, :params => {:code => "lala bubu 2"}
      expect(json['status']).to eql('NoMethodError ERROR_haha')
      expect(json['output']).to eql('No output, there\'s an error :(')
    end     


    it 'TLE case' do
      post :input, :params => {:code => "while true \n end"}
      expect(json['status']).to eql('SignalException ERROR_haha')
      expect(json['output']).to eql('No output, there\'s an error :(')
    end     

    it 'Division by zero' do
      post :input, :params => {:code => "puts 1 / 0"}
      expect(json['status']).to eql('ZeroDivisionError ERROR_haha')
      expect(json['output']).to eql('No output, there\'s an error :(')
    end     

  end
end
