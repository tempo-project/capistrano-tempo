require 'spec_helper'

describe Tempo do
  before(:each) do
    Rake::Task['load:defaults'].invoke
  end
end