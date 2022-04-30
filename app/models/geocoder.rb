class Geocoder

  def convert_to_coords(street_address)
    geolocation = "https://maps.googleapis.com/maps/api/geocode/json?address=#{street_address}&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY"
                  #  https://maps.googleapis.com/maps/api/geocode/json?address=2525%20Eliot%20Street&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY
    data = open(geolocation).read
    @parsed_data = JSON.parse(data)
    @latitude = @parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = @parsed_data["results"][0]["geometry"]["location"]["lng"]

    return [@latitude, @longitude]
  end

end
