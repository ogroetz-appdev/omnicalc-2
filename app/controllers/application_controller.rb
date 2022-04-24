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
end
