# TODO:
# find out how to use include for multiple values
# OR find out how to use inlude to check the contents of an array
# make a small puzzle/clue for finding the secret room


def entrance
    puts "You are standing alone on a road and there is an intersection."
    puts "There are paths going left, right, and straight on."
    puts "Which path would you like to take?"

    print "> "
    choice = $stdin.gets.chomp

    if choice.include? "left"
        left_path
    elsif choice.include? "right"
        right_path
    elsif choice.include? "straight"
        straight_path
    else
        puts " ", "I don't know what that means.", " "
        entrance
    end
end

def left_path
    puts "There is a large boulder and a tree blocking your way."
    puts "You should probably head back the way you came."
    puts "What would you like to do?"

    print "> "
    choice = $stdin.gets.chomp

    if choice.include? "back"
        entrance
    elsif choice.include? "investigate" 
        puts "There is a srape of paper on the ground."
        puts "what do you want to do?"

        choice2 = $stdin.gets.chomp
        print "> "

        if choice2.include? "take"
            puts "There is something written on it..."
            puts "'The answer is 42, now you just have to find where the question is.'"
            puts " ", "... ... ...", " "
            puts "That sounds important, you should remember that..."
            puts " "
            left_path
        else puts "You leave the paper there."
            left_path
        end
    else puts "If you stay here it will get dark and you will get eaten by a bear."
        puts " "
        left_path
    end
end
    

def right_path
    puts "You see a house loom out of the fog ahead of you."
    puts "There is a somewhat omious vibe from it..."
    puts "What would you like to do? Go inside, or turn around?"

    print "> "
    choice = $stdin.gets.chomp

    if choice.include? "turn"
        entrance
    elsif choice.include? "inside"
        inside
    else
        puts "I don't know what that means."
        right_path
    end
end

def straight_path
    puts "It seems like this way is blocked, there is a number of debris on the path."
    puts "I guess you can't proceed this way, maybe you should head back."
    puts "What would you like to do?"

    print "> "
    choice = $stdin.gets.chomp

    if choice.include? "back"
        entrance
    elsif choice.include? "investigate"
        puts "Looks like you slipped on the debries while investigating."
        puts "You have broken your leg and can't move."
        puts "It's getting dark out here and you think you can hear bears."
        puts" "
        dead("Looks like you tried to crawl to safety but alas you have become a bears dinner!")
    else
        straight_path
    end
end

# refactor to have optional text for the first time you are here
# see ex36_test.rb for side work and possible solution
def inside
    puts "You are inside an old house, it looks like no one has been here for a while." 
    puts "It's a little dark and hard to see everything properly."
    puts "There is a thick layer of dust on most surfaces."
    puts "Looking around you can see a number of things in the room."
    puts "There is a bed, a small table with an oil lamp, and against one wall, an empty bookcase.", " "
    puts "What would you like to do?"

    print "> "
    choice = $stdin.gets.chomp

    # break this out to it's own method as well with the option for 2 paths
    # path 1: lamp not lit
    # path 2: lamp is lit
    # also, include 'bed_used = true/false' as an option 
    # this will allow for two versions depending on what the player has done
    if choice.include? "bed"
        inside_bed
        # see if we can have it return a value for lamp = true to be used for the room later on in the decision tree
    elsif choice.include? "table"
        inside_table
    elsif choice.include? "case"
        puts "You look more closely at the bookcase, but unfortunately it's too dark to make out much aside from the fact there is no books there.", " "
        inside
    else "I don't know what that means, what would you like to do?"
        inside
    end
end

def lit_room
    puts "Now that the lamp is lit you are able to see around the room a bit better."
    puts "The lamp light flickers as you look around the room."
    puts "You see the same bed and small table, as well as the empty bookcase."
    puts "What would you like to do?"

    print "> "
    choice = $stdin.gets.chomp

    puts choice
end

def inside_bed
    puts "You examine the bed, while dusty still seems confortable if you need a rest."
    puts "Do you want to use the bed, or continue to look around the room?"

    print "> "
    choice2 = $stdin.gets.chomp

    if choice2.include? "use"
        puts "You try to have a nice lie down, but you can't seem to relax enough in these strange surroundings to fall asleep."
        inside
    else 
        inside
    end
end

def inside_table
    puts "Looking closer at the table it doesn't seem there is much on there of interest aside from the lamp and matchbook you didn't originally notice."
    puts "Do you want to look at the lamp closer, or continue to look around the room"

    print "> "
    choice2 = $stdin.gets.chomp

    if choice2.include? "lamp"
        puts "Examining the lamp more closely you can see there is still some oil left in it."
        puts "Picking up the lamp and matches you light it up, this doesn't quite fully illumiate the room, but definitely makes it easier to see around.", "\n"
        lit_room
    elsif choice2.include? "look"
        inside
    else 
        puts "I don't know what that means."
        inside
    end
end

def secret_room
    puts "Welcome to the secret room! Enter a number"

    print "> "
    choice = $stdin.gets.chomp

    if choice =~ /\d/
        number = choice.to_i
    else
        puts "Try again..."
        secret_room
    end

    cake(number)
end

def dead(why)
    puts why, "oof", " ", "Do you want to play again?", "Y/N?"

    print "> "
    dead_choice = $stdin.gets.chomp

    if dead_choice.include? "y"
        entrance
    else
        puts "Thanks for playing"
        exit(0)
    end
end

def cake(user_number)

cake_img = <<CAKE
                        (             ) 
                )      (*)           (*)      ( 
                (*)      |             |      (*) 
                |      |~|           |~|      |           
                |~|     | |           | |     |~| 
                | |     | |           | |     | | 
                ,| |a@@@@| |@@@@@@@@@@@| |@@@@a| |. 
        .,a@@@| |@@@@@| |@@@@@@@@@@@| |@@@@@| |@@@@a,. 
        ,a@@@@@@| |@@@@@@@@@@@@.@@@@@@@@@@@@@@| |@@@@@@@a, 
        a@@@@@@@@@@@@@@@@@@@@@' . `@@@@@@@@@@@@@@@@@@@@@@@@a 
        ;`@@@@@@@@@@@@@@@@@@'   .   `@@@@@@@@@@@@@@@@@@@@@'; 
        ;@@@`@@@@@@@@@@@@@'     .     `@@@@@@@@@@@@@@@@'@@@; 
        ;@@@;,.aaaaaaaaaa       .       aaaaa,,aaaaaaa,;@@@; 
        ;;@;;;;@@@@@@@@;@      @.@      ;@@@;;;@@@@@@;;;;@@; 
        ;;;;;;;@@@@;@@;;@    @@ . @@    ;;@;;;;@@;@@@;;;;;;; 
        ;;;;;;;;@@;;;;;;;  @@   .   @@  ;;;;;;;;;;;@@;;;;@;; 
        ;;;;;;;;;;;;;;;;;@@     .     @@;;;;;;;;;;;;;;;;@@a; 
    ,%%%;;;;;;;;@;;;;;;;;       .       ;;;;;;;;;;;;;;;;@@;;%%%, 
.%%%%%%;;;;;;;a@;;;;;;;;     ,%%%,     ;;;;;;;;;;;;;;;;;;;;%%%%%%, 
.%%%%%%%;;;;;;;@@;;;;;;;;   ,%%%%%%%,   ;;;;;;;;;;;;;;;;;;;;%%%%%%%, 
%%%%%%%%`;;;;;;;;;;;;;;;;  %%%%%%%%%%%  ;;;;;;;;;;;;;;;;;;;'%%%%%%%% 
%%%%%%%%%%%%`;;;;;;;;;;;;,%%%%%%%%%%%%%,;;;;;;;;;;;;;;;'%%%%%%%%%%%% 
`%%%%%%%%%%%%%%%%%,,,,,,,%%%%%%%%%%%%%%%,,,,,,,%%%%%%%%%%%%%%%%%%%%' 
`%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%' 
    `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%' 
            """"""""""""""`,,,,,,,,,'""""""""""""""""" 
                           `%%%%%%%' 
                            `%%%%%' 
                              %%% 
                            %%%%%%% 
                         .,%%%%%%%%%,. 
                     ,%%%%%%%%%%%%%%%%%%%, 
        ---------------------------------------------
CAKE

    if user_number == 42
        puts "Congrats, the cake is not a lie!", " ", "You should follow this link...", " "
        puts "\thttps://vimeo.com/1612411"
        puts " ", cake_img, " ", "Thanks for playing!"
        exit(0)
    else
        dead("The cake is a lie!")
    end
end

# Start the game!
inside