feature 'The index page works' do
  scenario 'the index page shows content' do 
    visit('/')
    expect(page).to have_content("Hello, world")
  end 
end 