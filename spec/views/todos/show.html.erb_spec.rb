require 'rails_helper'

RSpec.describe "todos/show", type: :view do
  before(:each) do
    @todo = assign(:todo, Todo.create!(
      :task => "Task"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Task/)
  end
end
