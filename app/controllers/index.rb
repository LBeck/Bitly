
# let user create new short URL, display a list of shortened URLs
get '/' do
  erb :index
end

post '/urls' do
  @long_url= params[:long_url]
  url_row = Url.create(long_url: @long_url)
  @extension = url_row.shortened_url
  erb :display
end


get '/:short_url' do
  url_row = Url.find_by_shortened_url(params[:short_url])
  current = url_row.click_count + 1
  Url.update(url_row.id, :click_count => current) 
  long_url = url_row.long_url
  redirect "#{long_url}"
 
end


