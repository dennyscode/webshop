## IMAGE-STUFFING
##
## The Product-Model column 'image_url' only keeps one image at a time.
## This script takes a text and slices it into elements by seperating
## names by prefix '#$#' and deleting the ', ' when needed.
##
##  MainFunction: img_api running on api_choice which is a while-loop menu.
##  Functions:    - R Read available Images
##                - C Count number of Images
##                - W Write / Add a new Image
##                - D Delete an Image
##
##
##  !!! -->
##  @test_string is used as the column-example and needs to be replaced!
##   by the model-entry (like Product.image_url)
##  => Read, Write Functionality in SQLite needs to be implemented
@test_string = "#$#img1, #$#img2, #$#img3, #$#img4, #$#img5, #$#img6, "
## <-- !!!

## This array is used for testing - within Reading function lays the
## corresponding push-function which needs to be activated
# @img_array = []


## Main Program
def img_api()
  @api_running = true
  puts "Welcome to IMG-API"
  api_choice
end

## Menu Loop
def api_choice()
  while @api_running == true
    puts "Image-Asset Modifier:\n\tR to read\n\tA to add\n\tC to count\n\tD to delete\n\tQ to quit"
    choice = gets.chomp
    choice = choice.capitalize!
    if @api_running == true
      unless choice == "R" || choice == "C" || choice == "A" || choice == "D" || choice == "Q"
        puts "Read Instructions carefully"
      else
        if choice === "R"
          img_reader(@test_string)
        elsif choice === "C"
          img_count(@test_string)
        elsif choice === "A"
          puts "Type in an Image-URL"
          input = gets.chomp
          img_add(input, @test_string)
        elsif choice === "D"
          puts "Type in Index-Nr of Image which will be deleted"
          input = gets.chomp.to_i
          img_del(input, @test_string)
        elsif choice === "Q"
          puts "Good Bye!"
          @api_running = false
          exit!
        end
      end
    end
  end
end

## Read-Function
def img_reader(img_str)
  # puts img_str
  counter = img_str.scan("#$#").count
  counter.times do
    img_pos_start = img_str.index("#$#") + 3
    img_str_length = img_str.length
    img_str = img_str[img_pos_start,img_str_length]
    img_pos_end = img_str.index("#$#")
    if img_pos_end == nil
      img_pos_end = img_str.length
    end
    img_pos_end -= 2
    img_single = img_str[0,img_pos_end]
    puts img_single
    # @img_array.push(img_single)
  end
end

## Write-Function
def img_add(input, img_str)
  # puts "Enter image URL"
  # img_add = gets.chomp
  input = " #$#" + input + ","
  @test_string << input
  puts "Adding Image with name #{input}"
end

## Count-Function
def img_count(img_str)
  counter = img_str.scan("#$#").count
  puts "Number of Images: #{counter}"
end

## Delete-Function
def img_del(image_to_del, img_str)
  if image_to_del == 0
    puts "Image-Index begins at 1!"
  elsif image_to_del > img_str.scan("#$#").count
    puts "Image-Index must be within range of available number of images"
    puts "Availabe Images: #{img_str.scan("#$#").count}"
  else
    image_to_del -= 1
    if img_str == ""
      puts "There is nothing to delete"
    else
      img_editstring = img_str
      img_newstring = ""
      counter = 1
      img_editstring = img_editstring.split("#$#")
      img_editstring = img_editstring[1..-1]
      img_counter = img_editstring.length
      # puts img_counter
      img_editstring.each_with_index do |img_name, idx|
        # puts counter
        if idx > img_counter
        else
          if idx == image_to_del
            puts "This dels IMG-NR: #{idx+=1} #{img_name}"
          else
            # puts "This adds IMG-NR: #{idx+=1} #{img_name}"
            img_newstring << "#$##{img_name}"
          end
        end
      end
      @test_string = img_newstring
    end
  end
end

# puts "Output-String is #{@test_string}"
# img_del(0,@test_string)
# img_del(1,@test_string)
# img_del(0,@test_string)
# img_del(0,@test_string)
# img_del(0,@test_string)
puts "Output-String is #{@test_string}"
img_api
