class ApplicationController < ActionController::Base
  def add_form
    render({ :template => "/add_form.html.erb" })
  end

  def add_results
    @first_num = params.fetch("first_num").to_f
    @second_num = params.fetch("second_num").to_f
    @added_nums = @first_num + @second_num
    render({ :template => "/add_results.html.erb" })
  end

  def subtract_form
    render({ :template => "/subtract_form.html.erb" })
  end

  def subtract_results
    @first_num = params.fetch("first_num").to_f
    @second_num = params.fetch("second_num").to_f
    @subtracted_nums = @second_num - @first_num
    render({ :template => "/subtract_results.html.erb" })
  end

  def multiply_form
    render({ :template => "/multiply_form.html.erb" })
  end

  def multiply_results
    @first_num = params.fetch("first_num").to_f
    @second_num = params.fetch("second_num").to_f
    @multiplied_nums = @first_num * @second_num
    render({ :template => "/multiply_results.html.erb" })
  end

  def divide_form
    render({ :template => "/divide_form.html.erb" })
  end

  def divide_results
    @first_num = params.fetch("first_num").to_f
    @second_num = params.fetch("second_num").to_f
    @divided_nums = @first_num / @second_num
    render({ :template => "/divide_results.html.erb" })
  end

  def address_form
    render({ :template => "/address_form.html.erb" })
  end

  def address_results
    @user_street_address = params.fetch("user_street_address")
    address_for_api = @user_street_address.gsub(" ", "%20")

    # booth_url = "https://www.chicagobooth.edu/"
    # @thing = open(booth_url).read.length ===> WEB SCRAPING

    # below now moved to Geocode class: (in Model directory)
    # geolocation = "https://maps.googleapis.com/maps/api/geocode/json?address=#{address_for_api}&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY"
    #               #  https://maps.googleapis.com/maps/api/geocode/json?address=2525%20Eliot%20Street&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY
    # data = open(geolocation).read
    # @parsed_data = JSON.parse(data)
    # @latitude = @parsed_data["results"][0]["geometry"]["location"]["lat"]
    # @longitude = @parsed_data["results"][0]["geometry"]["location"]["lng"]

    g = Geocoder.new
    coords = g.convert_to_coords(address_for_api)

    @latitude = coords[0]
    @longitude = coords[1]

    render({ :template => "/address_results.html.erb" })
  end
end
