require 'spec_helper'

describe ActiveAdmin::CSVBuilder do

  describe '.default_for_resource using Post' do
    let(:csv_builder) { ActiveAdmin::CSVBuilder.default_for_resource(Post) }

    it 'returns a default csv_builder for Post' do
      expect(csv_builder).to be_a(ActiveAdmin::CSVBuilder)
    end

    it 'defines Id as the first column' do
      expect(csv_builder.columns.first.name).to eq 'Id'
      expect(csv_builder.columns.first.data).to eq :id
    end

    it "has Post's content_columns" do
      csv_builder.columns[1..-1].each_with_index do |column, index|
        expect(column.name).to eq Post.content_columns[index].name.humanize
        expect(column.data).to eq Post.content_columns[index].name.to_sym
      end
    end

    context 'when column has a localized name' do
      let(:localized_name) { 'Titulo' }

      before do
        Post.stub(:human_attribute_name).and_call_original
        Post.stub(:human_attribute_name).with(:title){ localized_name }
      end

      it 'gets name from I18n' do
        title_index = Post.content_columns.map(&:name).index('title') + 1 # First col is always id
        expect(csv_builder.columns[title_index].name).to eq localized_name
      end
    end
  end

  context 'when empty' do
    let(:builder){ ActiveAdmin::CSVBuilder.new }

    it "should have no columns" do
      expect(builder.columns).to eq []
    end
  end

  context "with a symbol column (:title)" do
    let(:builder) do
      ActiveAdmin::CSVBuilder.new do
        column :title
      end
    end

    it "should have one column" do
      expect(builder.columns.size).to eq 1
    end

    describe "the column" do
      let(:column){ builder.columns.first }

      it "should have a name of 'Title'" do
        expect(column.name).to eq "Title"
      end

      it "should have the data :title" do
        expect(column.data).to eq :title
      end
    end
  end

  context "with a block and title" do
    let(:builder) do
      ActiveAdmin::CSVBuilder.new do
        column "My title" do
          # nothing
        end
      end
    end

    it "should have one column" do
      expect(builder.columns.size).to eq 1
    end

    describe "the column" do
      let(:column){ builder.columns.first }

      it "should have a name of 'My title'" do
        expect(column.name).to eq "My title"
      end

      it "should have the data :title" do
        expect(column.data).to be_an_instance_of(Proc)
      end
    end
  end

  context "with a separator" do
    let(:builder) do
      ActiveAdmin::CSVBuilder.new :col_sep => ";"
    end

    it "should have proper separator" do
      expect(builder.options).to eq({:col_sep => ";"})
    end
  end

  context "with csv_options" do
    let(:builder) do
      ActiveAdmin::CSVBuilder.new :force_quotes => true
    end

    it "should have proper separator" do
      expect(builder.options).to eq({:force_quotes => true})
    end
  end

end
